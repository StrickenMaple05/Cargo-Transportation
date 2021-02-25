unit loader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfLoader = class(TForm)
    eFIO: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure eFIOChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLoader: TfLoader;

implementation

{$R *.dfm}

uses login;

procedure TfLoader.BitBtn1Click(Sender: TObject);
begin
  fLogin.AddLoader(eFIO.Text);
end;

procedure TfLoader.eFIOChange(Sender: TObject);
begin
  BitBtn1.Enabled:=eFIO.Text<>'';
end;

procedure TfLoader.FormCreate(Sender: TObject);
var
  i : integer;
begin
for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;
end;

end.
