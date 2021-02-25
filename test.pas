unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfTest = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTest: TfTest;

implementation

{$R *.dfm}

uses mydm;

procedure TfTest.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.BeginDrag(True);
end;

procedure TfTest.DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  DataSource2.DataSet.AppendRecord([
   DataSource1.DataSet.FieldByName('CUSTOMER_ID'),
   DataSource1.DataSet.FieldByName('FULL_NAME'),
   DataSource1.DataSet.FieldByName('PHONE_NUMBER')
  ]);
end;

procedure TfTest.DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  accept:= source is TDBGrid;
end;

procedure TfTest.FormActivate(Sender: TObject);
begin
  dm.tCustomer.Open;
  DataSource1.DataSet:=dm.tCustomer;
  dm.tCustomer2.Open;
  DataSource2.DataSet:=dm.tCustomer2;
end;

end.
