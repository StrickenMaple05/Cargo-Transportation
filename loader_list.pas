unit loader_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient;

type
  TfLoaderList = class(TForm)
    MainMenu1: TMainMenu;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1FULL_NAME: TStringField;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLoaderList: TfLoaderList;

implementation

{$R *.dfm}

uses mydm, order;

procedure TfLoaderList.N1Click(Sender: TObject);
begin
  fOrder.MemoInfo.Lines[8]:='----- Информация о грузчиках -----';
  fOrder.MemoInfo.Lines[9+Tag]:='ФИО: '+DataSource1.DataSet.FieldByName('FULL_NAME').AsString;

  if Tag=0 then begin
    fOrder.selectLoaderFIO1:=DataSource1.DataSet.FieldByName('FULL_NAME').Value;
    fOrder.selectLoaderID1:=DataSource1.DataSet.FieldByName('ID').Value;
  end;
  if Tag=1 then begin
    fOrder.selectLoaderFIO2:=DataSource1.DataSet.FieldByName('FULL_NAME').Value;
    fOrder.selectLoaderID2:=DataSource1.DataSet.FieldByName('ID').Value;
  end;
  if Tag=2 then begin
    fOrder.selectLoaderFIO3:=DataSource1.DataSet.FieldByName('FULL_NAME').Value;
    fOrder.selectLoaderID3:=DataSource1.DataSet.FieldByName('ID').Value;
  end;
  Close;
end;

end.
