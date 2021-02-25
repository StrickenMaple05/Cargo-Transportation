unit customer_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient;

type
  TfCustomerList = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1FULL_NAME: TStringField;
    ClientDataSet1PHONE_NUMBER: TStringField;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCustomerList: TfCustomerList;

implementation

{$R *.dfm}

uses mydm, customer, order;

procedure TfCustomerList.N1Click(Sender: TObject);
begin
  fOrder.MemoInfo.Lines[0]:='----- Информация о заказчике -----';
  fOrder.MemoInfo.Lines[1]:='ФИО: '+DataSource1.DataSet.FieldByName('FULL_NAME').Value;
  fOrder.MemoInfo.Lines[2]:='Номер телефона: '+DataSource1.DataSet.FieldByName('PHONE_NUMBER').Value;

  fOrder.selectCustomerFIO:= DataSource1.DataSet.FieldByName('FULL_NAME').Value;
  fOrder.selectCustomerID:=DataSource1.DataSet.FieldByName('ID').Value;
  Close;
end;

end.
