unit operator_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, System.JSON, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfWindow = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    customerAdd: TMenuItem;
    loaderAdd: TMenuItem;
    truckAdd: TMenuItem;
    orderAdd: TMenuItem;
    DBGrid1: TDBGrid;
    N2: TMenuItem;
    N3: TMenuItem;
    TabControl1: TTabControl;
    DBGrid2: TDBGrid;
    dsOrderUnCompleted: TDataSource;
    dsOrderCompleted: TDataSource;
    dsOrderHistory: TDataSource;
    cdsOrderCompleted: TClientDataSet;
    cdsOrderHistory: TClientDataSet;
    cdsOrderUnCompleted: TClientDataSet;
    cdsOrderUnCompletedID: TIntegerField;
    cdsOrderUnCompletedORDER_NAME: TStringField;
    cdsOrderCompletedID: TIntegerField;
    cdsOrderCompletedORDER_NAME: TStringField;
    cdsOrderCompletedSTART_ADDRESS: TStringField;
    cdsOrderCompletedEND_ADDRESS: TStringField;
    cdsOrderCompletedSIZE: TIntegerField;
    cdsOrderCompletedTOTAL: TIntegerField;
    cdsOrderHistoryID: TIntegerField;
    cdsOrderHistoryORDER_NAME: TStringField;
    cdsOrderHistorySTART_ADDRESS: TStringField;
    cdsOrderHistoryEND_ADDRESS: TStringField;
    cdsOrderHistorySIZE: TIntegerField;
    cdsOrderHistoryTOTAL: TIntegerField;
    cdsOrderUnCompletedSTART_ADDRESS: TStringField;
    cdsOrderUnCompletedEND_ADDRESS: TStringField;
    cdsOrderUnCompletedSIZE: TIntegerField;
    cdsOrderUnCompletedTOTAL: TIntegerField;
    cdsOrderUnCompletedSTART_TIME: TStringField;
    N4: TMenuItem;
    cdsOrderCompletedSTART_TIME: TStringField;
    cdsOrderHistorySTART_TIME: TStringField;
    cdsOrderHistoryEND_TIME: TStringField;
    procedure askData();
    procedure customerAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure truckAddClick(Sender: TObject);
    procedure loaderAddClick(Sender: TObject);
    procedure orderAddClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWindow: TfWindow;

implementation

{$R *.dfm}

uses customer, mydm, truck, loader, order, confirm_order, login, order_select;

procedure TfWindow.askData();
begin
  fLogin.SelectOrderUnCompleted;
  fLogin.SelectOrderCompleted;
  fLogin.SelectOrderConfirmed;
end;

procedure TfWindow.customerAddClick(Sender: TObject);
begin
  fCustomer:=TfCustomer.Create(Application);
  fCustomer.ShowModal;

  fCustomer.Release;
end;

procedure TfWindow.DBGrid1DblClick(Sender: TObject);
begin
  fOrderSelect:=TfOrderSelect.Create(Application);

  if TabControl1.TabIndex=0 then
    fLogin.SelectOrderFromID(cdsOrderCompleted.FieldByName('ID').Value)
  else
    fLogin.SelectOrderFromID(cdsOrderHistory.FieldByName('ID').Value);

  fOrderSelect.ShowModal;
  fOrderSelect.Release;
end;

procedure TfWindow.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Рисовалка чего то
end;

procedure TfWindow.DBGrid2DblClick(Sender: TObject);
begin
  fOrderSelect:=TfOrderSelect.Create(Application);

  fLogin.SelectOrderFromID(cdsOrderUnCompleted.FieldByName('ID').Value);

  fOrderSelect.ShowModal;
  fOrderSelect.Release;
end;

procedure TfWindow.FormActivate(Sender: TObject);
begin
  askData;
end;

procedure TfWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fLogin.Visible:=True;
end;

procedure TfWindow.FormCreate(Sender: TObject);
begin
  askData;
end;

procedure TfWindow.FormShow(Sender: TObject);
begin
  askData;
end;

procedure TfWindow.loaderAddClick(Sender: TObject);
begin
  fLoader:=tfLoader.Create(Application);
  fLoader.ShowModal;

  fLoader.Release;
end;

procedure TfWindow.N2Click(Sender: TObject);
begin
  askData;
end;

procedure TfWindow.N3Click(Sender: TObject);
begin
  fConfirmOrder:=tfConfirmOrder.Create(Application);



  fConfirmOrder.ShowModal;
  fConfirmOrder.Release;
end;

procedure TfWindow.N4Click(Sender: TObject);
begin
  fLogin.ChangeToCompleted(cdsOrderUnCompleted.FieldByName('ID').Value);
end;

procedure TfWindow.orderAddClick(Sender: TObject);
begin
  fOrder:=tfOrder.Create(Application);
  fOrder.ShowModal;

  fOrder.Release;
end;

procedure TfWindow.TabControl1Change(Sender: TObject);
begin
  if TabControl1.TabIndex=0 then
  begin
  DBGrid2.Visible:=True;
  DBGrid1.Align:=alTop;
  DBGrid1.DataSource:=dsOrderCompleted;
  DBGrid1.Height:=230;
  end
  else
  begin
  DBGrid2.Visible:=False;
  DBGrid1.Align:=alClient;
  DBGrid1.DataSource:=dsOrderHistory;
  end;
  askData;

end;

procedure TfWindow.truckAddClick(Sender: TObject);
begin
  fTruck:=tfTruck.Create(Application);
  fTruck.ShowModal;

  fTruck.Release;
end;

end.
