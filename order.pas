unit order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfOrder = class(TForm)
    eCustomerFIO: TEdit;
    Label1: TLabel;
    BtnChooseCustomer: TButton;
    Label2: TLabel;
    eTruckNumber: TEdit;
    BtnChooseTruck: TButton;
    Button1: TButton;
    MemoInfo: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    eLoaderFIO1: TEdit;
    Button2: TButton;
    rbSelectLoader2: TRadioButton;
    Label5: TLabel;
    eLoaderFIO2: TEdit;
    Button3: TButton;
    rbSelectLoader3: TRadioButton;
    Label6: TLabel;
    eLoaderFIO3: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnChooseCustomerClick(Sender: TObject);
    procedure BtnChooseTruckClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rbSelectLoader2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure rbSelectLoader3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure eCustomerFIOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pos : boolean;

    selectCustomerFIO : String;
    selectTruckNumber : String;
    selectLoaderFIO1, selectLoaderFIO2, selectLoaderFIO3 : String;

    selectCustomerID, selectTruckID, selectLoaderID1, selectLoaderID2, selectLoaderID3 : int64;

    name, startAddress, endAddress : String;
    size, floor, elevator, price: integer;

  end;

var
  fOrder: TfOrder;

implementation

{$R *.dfm}

uses order_info, customer_list, truck_list, loader_list, login;

procedure TfOrder.BitBtn1Click(Sender: TObject);
begin

  fLogin.AddOrder(name, startAddress, endAddress, floor, elevator, size, price,
    fLogin.id_operator, selectCustomerID, selectTruckID, selectLoaderID1, selectLoaderID2, selectLoaderID3);

end;

procedure TfOrder.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TfOrder.BtnChooseCustomerClick(Sender: TObject);
begin
  fCustomerList:=tfCustomerList.Create(Application);

  fLogin.SelectCustomer;

  fCustomerList.ShowModal;
  fCustomerList.Release;

  eCustomerFIO.Text:= selectCustomerFIO;

  end;

procedure TfOrder.BtnChooseTruckClick(Sender: TObject);
begin
  fLogin.SelectTruck;

  fTruckList:=tfTruckList.Create(Application);
  fTruckList.ShowModal;
  eTruckNumber.Text:=selectTruckNumber;

  fTruckList.Release;
end;

procedure TfOrder.Button1Click(Sender: TObject);
begin
  fOrderInfo:= tfOrderInfo.Create(Application);
  fOrderInfo.ShowModal;
  fOrderInfo.Release;

  if fOrderInfo.ModalResult=mrOK then
    pos := true
  else
    pos := false;

  BitBtn1.Enabled:= (eCustomerFIO.Text <> 'Выбрать заказчика') and
    (eTruckNumber.Text <> 'Выбрать грузовик') and
    (eLoaderFIO1.Text <> 'Выбрать грузчика') and pos;

end;

procedure TfOrder.Button2Click(Sender: TObject);
begin
  fLogin.SelectLoader;

  fLoaderList:=tfLoaderList.Create(Application);
  fLoaderList.Tag:=0;
  fLoaderList.ShowModal;

  eLoaderFIO1.Text:=selectLoaderFIO1;

  fLoaderList.Release;
end;

procedure TfOrder.Button3Click(Sender: TObject);
begin
  fLogin.SelectLoader;

  fLoaderList:=tfLoaderList.Create(Application);
  fLoaderList.Tag:=1;
  fLoaderList.ShowModal;

  eLoaderFIO2.Text:=selectLoaderFIO2;

  fLoaderList.Release;
end;

procedure TfOrder.Button4Click(Sender: TObject);
begin
  fLogin.SelectLoader;

  fLoaderList:=tfLoaderList.Create(Application);
  fLoaderList.Tag:=2;
  fLoaderList.ShowModal;

  eLoaderFIO3.Text:=selectLoaderFIO3;

  fLoaderList.Release;
end;

procedure TfOrder.eCustomerFIOChange(Sender: TObject);
begin
  BitBtn1.Enabled:= (eCustomerFIO.Text <> 'Выбрать заказчика') and
    (eTruckNumber.Text <> 'Выбрать грузовик') and
    (eLoaderFIO1.Text <> 'Выбрать грузчика') and pos;
end;

procedure TfOrder.FormCreate(Sender: TObject);
var
  i : integer;
begin
  selectLoaderID2:=-1;
  selectLoaderID3:=-1;
  MemoInfo.Lines[0]:='';
  for i := 1 to 25 do
    MemoInfo.Lines.Add('');
  pos := false;
end;

procedure TfOrder.rbSelectLoader2Click(Sender: TObject);
begin
  rbSelectLoader2.Visible:=false;
  label4.Caption:='Грузчик 1';

  Label5.Visible:=True;
  eLoaderFIO2.Visible:=True;
  Button3.Visible:=True;
  rbSelectLoader3.Visible:=True;
end;

procedure TfOrder.rbSelectLoader3Click(Sender: TObject);
begin
  rbSelectLoader3.Visible:=False;

  Label6.Visible:=True;
  eLoaderFIO3.Visible:=True;
  Button4.Visible:=True;

  end;

end.
