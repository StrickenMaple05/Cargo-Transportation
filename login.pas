unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.JSON, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPServer, System.Win.ScktComp, IdGlobal,
  IdSocketHandle, Vcl.Samples.Spin, IdUDPClient, IdThreadComponent;

type
  TfLogin = class(TForm)
    Label1: TLabel;
    eHost: TEdit;
    Port: TLabel;
    Button1: TButton;
    Label2: TLabel;
    ClientSocket1: TClientSocket;
    ePort: TSpinEdit;
    eID: TSpinEdit;
    UDPClient: TIdUDPClient;
    UDPServer: TIdUDPServer;
    LabelCon: TLabel;
    Memo1: TMemo;

    procedure SendMess(mess : String);

    //=== �������
    procedure SelectCustomer();
    procedure SelectTruck();
    procedure SelectLoader();
    procedure SelectOrderUnCompleted();
    procedure SelectOrderCompleted();
    procedure SelectOrderConfirmed();

    //=== �����
    procedure ReadCustomerTable(json : TJSONObject);
    procedure ReadTruckTable(json : TJSONObject);
    procedure ReadLoaderTable(json : TJSONObject);
    procedure ReadOrderUnCompletedTable(json : TJSONObject);
    procedure ReadOrderCompletedTable(json : TJSONObject);
    procedure ReadOrderConfirmedTable(json : TJSONObject);

    //=== ����������
    procedure AddCustomer(fullName, phoneNumber : String);
    procedure AddLoader(fullName : String);
    procedure AddTruck(licensePlate : String; size : integer);
    procedure AddOrder(
        name, start_address, end_address : String;
        floor, elevator, size, price:integer;
        id_operator, id_customer, id_truck,
        id_loader1, id_loader2, id_loader3 : integer);

    procedure ChangeToConfirmed(id : integer; end_time : String);
    procedure ChangeToCompleted(id : integer);


    //
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure UDPClientConnected(Sender: TObject);
    procedure UDPClientDisconnected(Sender: TObject);
    procedure UDPServerUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
    id_operator : Integer;
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses operator_window, customer_list, customer, truck_list, loader_list,
  confirm_order;

procedure TfLogin.SendMess(mess: string);
begin
  ClientSocket1.Socket.SendText(mess);
  //=========
  {
  UDPClient.Connect;
  if UDPClient.Connected then
    begin
      UDPClient.Send(mess);
    end;
   }
end;



procedure TfLogin.Button1Click(Sender: TObject);
begin

  ClientSocket1.Address := eHost.Text;
  ClientSocket1.Port := ePort.Value;
  ClientSocket1.Active := True;

  id_operator:=eID.Value;

  UDPClient.Host:=eHost.Text;
  UDPClient.Port:=ePort.Value;

  UDPServer.Active:=false;
  UDPServer.Bindings.Clear;
  UDPServer.Bindings.Add.Port:=ePort.Value;
  UDPServer.Active:=false;    //--------------------

  SelectOrderUnCompleted();

  //fWindow.Visible:=True;
  //Visible:=False;
end;

procedure TfLogin.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  LabelCon.Caption:='CONNECTED';
  //fWindow:=TfWindow.Create(Application);

  SelectOrderUnCompleted;
  SelectOrderCompleted;
  SelectOrderConfirmed;

  fWindow.Visible:=true;
  //Visible:=false;

  //fWindow.ShowModal;
  //fWindow.Release;



  
end;

procedure TfLogin.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  LabelCon.Caption:='DISCONNECTED';
  ClientSocket1.Active:=false;
  LabelCon.Visible:=false;
  Visible:=True;
  fWindow.Visible:=false;
end;

//========= ����������� ��������

procedure TfLogin.ChangeToCompleted(id: Integer);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess : string;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'change_to_completed');
  jsonAr.Add(id);
  json.AddPair('params', jsonAr);

  mess:=json.ToString;
  SendMess(mess);
  end;

procedure TfLogin.SelectCustomer();
var
json : TJSONObject;
mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'customer');

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.SelectTruck();
var
  json : TJSONObject;
  mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'truck');

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.SelectLoader;
var
  json : TJSONObject;
  mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'loader');

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.SelectOrderUnCompleted();
var
  json : TJSONObject;
  mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'order');
  json.AddPair('kind', 'uncompleted');

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.SelectOrderCompleted;
var
  json : TJSONObject;
  mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'order');
  json.AddPair('kind', 'completed');

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.SelectOrderConfirmed;
var
  json : TJSONObject;
  mess : String;
begin
  json:=TJSONObject.Create;
  json.AddPair('type', 'select');
  json.AddPair('query', 'order');
  json.AddPair('kind', 'confirmed');

  mess:=json.ToString;
  SendMess(mess);
end;


//========= ���������� ������
procedure TfLogin.ReadCustomerTable(json : TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
     (json.GetValue('query').ToString='"customer"') then
  begin
    fCustomerList.ClientDataSet1.Close;
    fCustomerList.ClientDataSet1.CreateDataSet;

    jsonAr:=json.GetValue('rows') as TJSONArray;
    for i := 0 to Pred(jsonAr.Count) do begin
      fCustomerList.ClientDataSet1.AppendRecord([
        jsonAr.Items[i].FindValue('0').Value.ToInteger,
        jsonAr.Items[i].FindValue('1').Value,
        jsonAr.Items[i].FindValue('2').Value
      ]);
    end;

  end;
end;

procedure TfLogin.ReadTruckTable(json: TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
      (json.GetValue('query').ToString='"truck"') then
      begin
      fTruckList.ClientDataSet1.Close;
      fTruckList.ClientDataSet1.CreateDataSet;

      jsonAr:=json.GetValue('rows') as TJSONArray;
      for i := 0 to Pred(jsonAr.Count) do begin
        fTruckList.ClientDataSet1.AppendRecord([
          jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value,
          jsonAr.Items[i].FindValue('2').Value.ToInteger
        ]);
      end;

  end;

end;

procedure TfLogin.ReadLoaderTable(json: TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
      (json.GetValue('query').ToString='"loader"') then
      begin
      fLoaderList.ClientDataSet1.Close;
      fLoaderList.ClientDataSet1.CreateDataSet;

      jsonAr:=json.GetValue('rows') as TJSONArray;
      for i := 0 to Pred(jsonAr.Count) do begin
        fLoaderList.ClientDataSet1.AppendRecord([
          jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value
        ]);
      end;

  end;

end;

procedure TfLogin.ReadOrderUnCompletedTable(json : TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
     (json.GetValue('query').ToString='"order"') and
     (json.GetValue('kind').ToString='"uncompleted"') then
      begin

      fWindow.cdsOrderUnCompleted.Close;
      fWindow.cdsOrderUnCompleted.CreateDataSet;

      jsonAr:=json.GetValue('rows') as TJSONArray;
      for i := 0 to Pred(jsonAr.Count) do begin
        fWindow.cdsOrderUnCompleted.AppendRecord([
          jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value,
          jsonAr.Items[i].FindValue('2').Value.ToInteger,
          jsonAr.Items[i].FindValue('3').Value.ToInteger,
          jsonAr.Items[i].FindValue('4').Value.ToInteger,
          jsonAr.Items[i].FindValue('5').Value.ToInteger,
          jsonAr.Items[i].FindValue('6').Value,
          jsonAr.Items[i].FindValue('7').Value,
          jsonAr.Items[i].FindValue('8').Value.ToInteger,
          jsonAr.Items[i].FindValue('9').Value.ToInteger,
          jsonAr.Items[i].FindValue('10').Value.ToInteger,
          jsonAr.Items[i].FindValue('11').Value.ToInteger,
          jsonAr.Items[i].FindValue('12').Value
        ]);
      end;
  end;
end;

procedure TfLogin.ReadOrderCompletedTable(json: TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
     (json.GetValue('query').ToString='"order"') and
     (json.GetValue('kind').ToString='"completed"') then
      begin

      if fConfirmOrder.Visible then begin
        fConfirmOrder.cdsOrderCompleted.Close;
        fConfirmOrder.cdsOrderCompleted.CreateDataSet;
      end
      else begin
        fWindow.cdsOrderCompleted.Close;
        fWindow.cdsOrderCompleted.CreateDataSet;
      end;

      jsonAr:=json.GetValue('rows') as TJSONArray;
      for i := 0 to Pred(jsonAr.Count) do begin
        if fConfirmOrder.Visible then begin
        fConfirmOrder.cdsOrderCompleted.AppendRecord([
               jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value
        ]);
        end
        else begin
          fWindow.cdsOrderCompleted.AppendRecord([
          jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value,
          jsonAr.Items[i].FindValue('2').Value.ToInteger,
          jsonAr.Items[i].FindValue('3').Value.ToInteger,
          jsonAr.Items[i].FindValue('4').Value.ToInteger,
          jsonAr.Items[i].FindValue('5').Value.ToInteger,
          jsonAr.Items[i].FindValue('6').Value,
          jsonAr.Items[i].FindValue('7').Value,
          jsonAr.Items[i].FindValue('8').Value.ToInteger,
          jsonAr.Items[i].FindValue('9').Value.ToInteger,
          jsonAr.Items[i].FindValue('10').Value.ToInteger,
          jsonAr.Items[i].FindValue('11').Value.ToInteger,
          jsonAr.Items[i].FindValue('12').Value
        ]);
        end;
      end;

  end;
end;

procedure TfLogin.ReadOrderConfirmedTable(json: TJSONObject);
var
  jsonAr : TJSONArray;
  i : integer;
begin
  if (json.GetValue('type').ToString='"select"') and
     (json.GetValue('query').ToString='"order"') and
     (json.GetValue('kind').ToString='"confirmed"') then
      begin
      fWindow.cdsOrderHistory.Close;
      fWindow.cdsOrderHistory.CreateDataSet;

      jsonAr:=json.GetValue('rows') as TJSONArray;
      for i := 0 to Pred(jsonAr.Count) do begin
        fWindow.cdsOrderHistory.AppendRecord([
          jsonAr.Items[i].FindValue('0').Value.ToInteger,
          jsonAr.Items[i].FindValue('1').Value,
          jsonAr.Items[i].FindValue('2').Value.ToInteger,
          jsonAr.Items[i].FindValue('3').Value.ToInteger,
          jsonAr.Items[i].FindValue('4').Value.ToInteger,
          jsonAr.Items[i].FindValue('5').Value.ToInteger,
          jsonAr.Items[i].FindValue('6').Value,
          jsonAr.Items[i].FindValue('7').Value,
          jsonAr.Items[i].FindValue('8').Value.ToInteger,
          jsonAr.Items[i].FindValue('9').Value.ToInteger,
          jsonAr.Items[i].FindValue('10').Value.ToInteger,
          jsonAr.Items[i].FindValue('11').Value.ToInteger,
          jsonAr.Items[i].FindValue('12').Value,
          jsonAr.Items[i].FindValue('13').Value
        ]);
      end;

  end;
end;

//========= ���������� � ��
procedure TfLogin.AddCustomer(fullName: string; phoneNumber: string);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess : String;
begin
  json:=TJSONObject.Create;
  jsonAr:=TJSONArray.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'add_customer');
  jsonAr.Add(fullName).Add(phoneNumber);
  json.AddPair('params', jsonAr);

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.AddLoader(fullName: string);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess : String;
begin
  json:=TJSONObject.Create;
  jsonAr:=TJSONArray.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'add_loader');
  jsonAr.Add(fullName);
  json.AddPair('params', jsonAr);

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.AddTruck(licensePlate: string; size: Integer);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess : String;
begin
  json:=TJSONObject.Create;
  jsonAr:=TJSONArray.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'add_truck');
  jsonAr.Add(licensePlate).Add(size);
  json.AddPair('params', jsonAr);

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.AddOrder(
  name: string; start_address: string; end_address: string;
  floor: Integer; elevator: Integer; size: Integer; price: Integer;
  id_operator: Integer; id_customer: Integer; id_truck: Integer;
  id_loader1, id_loader2, id_loader3: Integer);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess, start_time : String;
begin
  json:=TJSONObject.Create;
  jsonAr:=TJSONArray.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'add_order');
  DateTimeToString(start_time, 'dd.mm.yyyy hh.mm.ss', now);
  jsonAr.Add(name).Add(id_operator).Add(id_truck).
      Add(id_loader1).Add(id_customer).
      Add(start_address).Add(end_address).Add(floor).Add(elevator).
      Add(size).Add(price).Add(start_time).Add(id_loader2).Add(id_loader3);
  json.AddPair('params', jsonAr);



  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.ChangeToConfirmed(id: Integer; end_time : String);
var
  json : TJSONObject;
  jsonAr : TJSONArray;
  mess : String;
begin
  json:=TJSONObject.Create;
  jsonAr:=TJSONArray.Create;
  json.AddPair('type', 'stored_proc');
  json.AddPair('name', 'change_to_confirmed');
  jsonAr.Add(id).Add(end_time);
  json.AddPair('params', jsonAr);

  mess:=json.ToString;
  SendMess(mess);
end;

procedure TfLogin.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
Str, test: String;
json : TJSONObject;

begin
  Memo1.Lines.Add(Str);
  Memo1.Lines.Add('=========');

  Str:=Socket.ReceiveText;
  json:=TJSONObject.ParseJSONValue(Str) as TJSONObject;

  ReadCustomerTable(json);
  ReadTruckTable(json);
  ReadLoaderTable(json);
  ReadOrderUnCompletedTable(json);
  ReadOrderCompletedTable(json);
  ReadOrderConfirmedTable(json);



end;

procedure TfLogin.UDPClientConnected(Sender: TObject);
begin
labelCon.Caption:='CONNECTED';
//=======conectrd
end;

procedure TfLogin.UDPClientDisconnected(Sender: TObject);
begin
labelCon.Caption:='DISCONNECTED';
//===============disconencet
end;

procedure TfLogin.UDPServerUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  json : TJSONObject;
  str : string;
begin
  str:=BytesToString(AData, en7bit);
  json:=TJSONObject.ParseJSONValue(Str) as TJSONObject;

  ReadCustomerTable(json);
  ReadTruckTable(json);
  ReadLoaderTable(json);
  ReadOrderUnCompletedTable(json);
  ReadOrderCompletedTable(json);
  ReadOrderConfirmedTable(json);

end;

end.
