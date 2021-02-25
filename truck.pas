unit truck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin;

type
  TfTruck = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eNumber: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    eSize: TSpinEdit;
    procedure eNumberChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTruck: TfTruck;

implementation

{$R *.dfm}

uses login;

procedure TfTruck.BitBtn1Click(Sender: TObject);
begin
  fLogin.AddTruck(eNumber.Text, eSize.Value);
end;

procedure TfTruck.eNumberChange(Sender: TObject);
begin
  BitBtn1.Enabled:=(eNumber.Text<>'')and(eSize.Value<>0);
end;

procedure TfTruck.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;
end;

end.
