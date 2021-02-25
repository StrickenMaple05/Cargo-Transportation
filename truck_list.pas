unit truck_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Datasnap.DBClient;

type
  TfTruckList = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1LICENSE_PLATE: TStringField;
    ClientDataSet1SIZE: TSmallintField;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTruckList: TfTruckList;

implementation

{$R *.dfm}

uses mydm, order;

procedure TfTruckList.N1Click(Sender: TObject);
begin
  fOrder.MemoInfo.Lines[4]:='----- Информация о транспорте -----';
  fOrder.MemoInfo.Lines[5]:='Номер грузовика: '+DataSource1.DataSet.FieldByName('LICENSE_PLATE').AsString;
  fOrder.MemoInfo.Lines[6]:='Объем кузова: '+DataSource1.DataSet.FieldByName('TRUCK_SIZE').AsString;

  fOrder.selectTruckNumber:=DataSource1.DataSet.FieldByName('LICENSE_PLATE').Value;
  fOrder.selectTruckID:=DataSource1.DataSet.FieldByName('ID').Value;
  Close;
end;

end.
