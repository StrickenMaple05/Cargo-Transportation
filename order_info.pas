unit order_info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfOrderInfo = class(TForm)
    eName: TEdit;
    Label1: TLabel;
    eStartAddress: TEdit;
    eEndAddress: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eFloor: TEdit;
    eSize: TEdit;
    rbElevator: TRadioButton;
    ePrice: TEdit;
    Label4: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrderInfo: TfOrderInfo;

implementation

{$R *.dfm}

uses order;

procedure TfOrderInfo.BitBtn1Click(Sender: TObject);
var
  i : integer;
begin

  fOrder.name:=eName.Text;
  fOrder.size:=integer(eSize.Text);
  fOrder.startAddress:=eStartAddress.Text;
  fOrder.endAddress:=eEndAddress.Text;
  fOrder.floor:=integer(eFloor.Text);
  if rbElevator.Checked then
    fOrder.elevator:=1
  else
    fOrder.elevator:=0;
  fOrder.price:=integer(ePrice.Text);


  i:=13;
  forder.MemoInfo.Lines[i]:='----- Информация о грузе -----';
  i:=i+1;
  forder.MemoInfo.Lines[i]:='Наименование груза: '+eName.Text;
  i:=i+1;
  forder.MemoInfo.Lines[i]:='Объем груза: '+eSize.Text;
  i:=i+2;
  forder.MemoInfo.Lines[i]:='----- Информация о доставке -----';
  i:=i+1;
  forder.MemoInfo.Lines[i]:='Откуда: '+eStartAddress.Text;
  i:=i+1;
  forder.MemoInfo.Lines[i]:='Куда: '+eEndAddress.Text;
  i:=i+1;
  forder.MemoInfo.Lines[i]:='Количество этажей: '+eFloor.Text;
  i:=i+1;
  if rbElevator.Checked then begin
      forder.MemoInfo.Lines[i]:='Имеется лифт';
      i:=i+1;
  end;

  i:=i+1;
  forder.MemoInfo.Lines[i]:='Итоговая сумма заказа = '+ePrice.Text;

end;

procedure TfOrderInfo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfOrderInfo.eNameChange(Sender: TObject);
begin
  BitBtn1.Enabled:= (eName.Text<>'') and (eSize.Text<>'') and
    (eStartAddress.Text<>'') and (eEndAddress.Text<>'') and
    (eFloor.Text<>'') and (ePrice.Text<>'');
end;

procedure TfOrderInfo.FormCreate(Sender: TObject);
var
  i : integer;
begin
for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;

end;

end.
