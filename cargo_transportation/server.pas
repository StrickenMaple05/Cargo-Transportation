unit server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client,
  System.Win.ScktComp, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, System.JSON,
  //IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext;


type
  TServerForm = class(TForm)
    test: TButton;
    operators: TComboBox;
    memo: TMemo;
    server_socket: TServerSocket;
    start: TButton;
    send: TButton;
    Button1: TButton;
    http_server: TIdHTTPServer;
    procedure testClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure sendClick(Sender: TObject);
    procedure ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure server_socketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure http_serverCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;
  query: TFDQuery;
  name: String;


implementation

{$R *.dfm}

uses data_module;

procedure TServerForm.server_socketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memo.Lines.Add('Connected');
end;

procedure TServerForm.startClick(Sender: TObject);
begin
  if (server_socket.Active = false) then
    begin
      //server_socket.Port := 23;
      server_socket.Active := true;
      start.caption := 'stop';
    end
  else
    begin
      server_socket.Active := false;
      start.Caption := 'start';
    end;
end;

procedure TServerForm.testClick(Sender: TObject);
begin
  DataModule1.CustomerQuery.Active := True;
  DataModule1.CustomerQuery.Open;
  for var i := 1 to DataModule1.CustomerQuery.RecordCount do
  begin
    DataModule1.CustomerQuery.RecNo := i;
    name := DataModule1.CustomerQuery.Fields[1].AsString;
    operators.AddItem(name, self);
    memo.Text := memo.Text + name + #13#10;
  end;
end;


procedure TServerForm.Button1Click(Sender: TObject);
var
  str, declare, s: String;
  json, answer, array_elem: TJSONObject;
  json_array: TJSONArray;
begin
  str := '{"type":"stored_proc","name":"add_customer","params":["3","K bl P bl Jl Jl","123213"]}';
  json := TJSONObject.ParseJSONValue(str) as TJSONObject;
  json_array := json.GetValue('params') as TJSONArray;
  for var i := 0 to 2 do
    DataModule1.SPAddCustomer.Params[i].Value := json_array.Items[i].Value;
  DataModule1.SPAddCustomer.ExecProc();
end;

procedure TServerForm.FormCreate(Sender: TObject);
begin
  http_server.Active := true;
end;

procedure TServerForm.http_serverCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  url: string;
  ip: string;
  requestStream : TStream;
  requestString : TStringList;
  responseJSON : TJSONObject;
begin
  url := ARequestInfo.URI;
  ip := ARequestInfo.RemoteIP;

  requestStream := ARequestInfo.PostStream;
  requestString := TStringList.Create;
  requestString.LoadFromStream(requestStream, TEncoding.UTF8);

  AResponseInfo.ContentType := 'text/plain';
  AResponseInfo.CharSet := 'utf-8';

  memo.Lines.Add(ip + ' ' + url + ' ' + requestString.Text);
  AResponseInfo.ContentText := 'we are winners';

end;

procedure TServerForm.sendClick(Sender: TObject);
begin
  for var I := 0 to server_socket.Socket.ActiveConnections - 1 do
    server_socket.Socket.Connections[i].SendText('test');

end;

procedure TserverForm.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  str, str_name: String;
  json, answer, array_elem: TJSONObject;
  json_array: TJSONArray;
Begin
  str := Socket.ReceiveText();
  memo.Lines.Add(str);
  json := TJSONObject.ParseJSONValue(str) as TJSONObject;
  if json.GetValue('type').Value = 'select' then
  begin
    str_name := json.GetValue('query').Value;
    answer := TJSONObject.Create() ;
    answer.AddPair('type', 'select');
    answer.AddPair('query', str_name);
    json_array := TJSONArray.Create();
    if str_name = 'customer' then
    begin
      DataModule1.CustomerQuery.Open();
      for var i := 1 to DataModule1.CustomerQuery.RecordCount do
      begin
        DataModule1.CustomerQuery.RecNo := i;
        json_array.addElement(TJsonObject.Create);
        array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
        for var J := 0 to 2 do
          array_elem.addPair(J.toString, DataModule1.CustomerQuery.Fields[J].asString);
      end;
    end
    else if str_name = 'loader' then
    begin
      DataModule1.LoaderQuery.Open();
      for var i := 1 to DataModule1.LoaderQuery.RecordCount do
      begin
        DataModule1.LoaderQuery.RecNo := i;
        json_array.addElement(TJsonObject.Create);
        array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
        for var J := 0 to 3 do
          array_elem.addPair(J.toString, DataModule1.LoaderQuery.Fields[J].asString);
      end;
    end
    else if str_name = 'truck' then
    begin
      DataModule1.TruckQuery.Open();
      for var i := 1 to DataModule1.TruckQuery.RecordCount do
      begin
        DataModule1.TruckQuery.RecNo := i;
        json_array.addElement(TJsonObject.Create);
        array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
        for var J := 0 to 2 do
          array_elem.addPair(J.toString, DataModule1.TruckQuery.Fields[J].asString);
      end;
    end
    else if str_name = 'order' then
    begin
      answer.AddPair('kind', json.GetValue('kind').Value);
      if json.GetValue('kind').Value = 'uncompleted' then
      begin
        DataModule1.UOrdersQuery.Open();
        for var i := 1 to DataModule1.UOrdersQuery.RecordCount do
        begin
          DataModule1.UOrdersQuery.RecNo := i;
          json_array.addElement(TJsonObject.Create);
          array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
          for var J := 0 to 13 do
            array_elem.addPair(J.toString, DataModule1.UOrdersQuery.Fields[J].asString);
        end;
      end
      else
      if json.GetValue('kind').Value = 'completed' then
      begin
        DataModule1.COrdersQuery.Open();
        for var i := 1 to DataModule1.COrdersQuery.RecordCount do
        begin
          DataModule1.COrdersQuery.RecNo := i;
          json_array.addElement(TJsonObject.Create);
          array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
          for var J := 0 to 13 do
            array_elem.addPair(J.toString, DataModule1.COrdersQuery.Fields[J].asString);
        end;
      end
      else
      if json.GetValue('kind').Value = 'confirmed' then
      begin
        DataModule1.CCOrdersQuery.Open();
        for var i := 1 to DataModule1.CCOrdersQuery.RecordCount do
        begin
          DataModule1.CCOrdersQuery.RecNo := i;
          json_array.addElement(TJsonObject.Create);
          array_elem := json_array.Items[json_array.Count - 1] as TJsonObject;
          for var J := 0 to 13 do
            array_elem.addPair(J.toString, DataModule1.CCOrdersQuery.Fields[J].asString);
        end;
      end;
    end
    else
    if str_name = 'order_from_id' then
    begin
      //TODO
      DataModule1.OrderInfoQuery.Open();
      for var j := 0 to 6 do
        json_array.Add(DataModule1.OrderInfoQuery.Fields[J].asString);
        
      DataModule1.CustomerInfoQuery.Open();
      for var j := 0 to 1 do
        json_array.Add(DataModule1.CustomerInfoQuery.Fields[J].AsString);

      DataModule1.TruckInfoQuery.Open();
      for var j := 0 to 1 do
        json_array.Add(DataModule1.TruckInfoQuery.Fields[J].AsString);

      DataModule1.LoadersInfoQuery.Open();
      for var i := 1 to DataModule1.LoadersInfoQuery.RecordCount do
      begin
        json_array.Add(DataModule1.LoadersInfoQuery.Fields[0].AsString);
      end;
    end;

    answer.AddPair('rows', json_array);
    socket.sendText(answer.toString);
    memo.Lines.Add(answer.toString);
  end
  else if json.GetValue('type').Value = 'stored_proc' then
  begin
    str_name := json.GetValue('name').Value;
    json_array := json.GetValue('params') as TJSONArray;
    if str_name = 'add_customer' then
    begin
      DataModule1.SPAddCustomer.Params[0].Value := '-1';
      for var i := 0 to 1 do
        DataModule1.SPAddCustomer.Params[i + 1].Value := json_array.Items[i].Value;
      DataModule1.SPAddCustomer.ExecProc();
    end
    else
    if str_name = 'add_loader' then
    begin
      DataModule1.SPAddLoader.Params[0].Value := '-1';
      DataModule1.SPAddLoader.Params[1].Value := json_array.Items[0].Value;
      DataModule1.SPAddLoader.ExecProc();
    end
    else
    if str_name = 'add_truck' then
    begin
      DataModule1.SPAddTruck.Params[0].Value := '-1';
      for var i := 0 to 1 do
        DataModule1.SPAddTruck.Params[i + 1].Value := json_array.Items[i].Value;
      DataModule1.SPAddTruck.ExecProc();
    end
    else
    if str_name = 'add_order' then
    begin
      memo.Lines.Add(json.ToString);
      DataModule1.SPAddCargoOrder.Params[0].Value := '-1';
      for var i := 0 to 13 do
        DataModule1.SPAddCargoOrder.Params[i+1].Value := json_array.Items[i].Value;
      DataModule1.SPAddCargoOrder.ExecProc();
    end
    else
    if str_name = 'change_to_completed' then
    begin
      memo.Lines.Add(json.ToString);
      DataModule1.SPCompleteOrder.Params[1].Value := json_array.Items[0].Value;
      DataModule1.SPCompleteOrder.ExecProc();
    end
    else
    if str_name = 'change_to_confirmed' then
    begin
      memo.Lines.Add(json.ToString);
      for var i := 0 to 1 do
        DataModule1.SPConfirmOrder.Params[i+1].Value := json_array.Items[i].Value;
      DataModule1.SPConfirmOrder.ExecProc();
    end;
  end;
end;

end.
