unit confirm_order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Datasnap.DBClient;

type
  TfConfirmOrder = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsOrderCompleted: TDataSource;
    cdsOrderCompleted: TClientDataSet;
    dsOrderNewConfirmed: TDataSource;
    cdsOrderNewConfirmed: TClientDataSet;
    cdsOrderNewConfirmedID: TIntegerField;
    cdsOrderCompletedID: TIntegerField;
    cdsOrderCompletedNAME: TStringField;
    cdsOrderNewConfirmedNAME: TStringField;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfirmOrder: TfConfirmOrder;

implementation

{$R *.dfm}

uses login;

procedure TfConfirmOrder.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.BeginDrag(True);
end;



procedure TfConfirmOrder.DBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  cdsOrderNewConfirmed.AppendRecord([
    cdsOrderCompleted.FieldByName('ID'),
    cdsOrderCompleted.FieldByName('NAME')
  ]);
  //===================== перетаскивание записи между таблицами
end;

procedure TfConfirmOrder.DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  accept := source is TDBGrid;
end;

procedure TfConfirmOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsOrderCompleted.Close;
  cdsOrderCompleted.CreateDataSet;
end;

procedure TfConfirmOrder.FormCreate(Sender: TObject);
begin
  cdsOrderNewConfirmed.Close;
  cdsOrderNewConfirmed.CreateDataSet;
  fLogin.SelectOrderCompleted;

end;

procedure TfConfirmOrder.N1Click(Sender: TObject);
var
end_time : String;
begin
  while not cdsOrderNewConfirmed.eof do
    begin
      DateTimeToString(end_time, 'dd.mm.yyyy hh.mm.ss', now);
      fLogin.ChangeToConfirmed(cdsOrderNewConfirmedID.Value, end_time);
      cdsOrderNewConfirmed.Next;
    end;

  Close;
end;

procedure TfConfirmOrder.N2Click(Sender: TObject);
begin
  fLogin.SelectOrderCompleted;
end;

end.
