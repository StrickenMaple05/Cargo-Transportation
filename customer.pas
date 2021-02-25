unit customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfCustomer = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eFIO: TEdit;
    ePhoneNumber: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure eFIOChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCustomer: TfCustomer;

implementation

{$R *.dfm}

uses login;

procedure TfCustomer.BitBtn1Click(Sender: TObject);
begin
  fLogin.AddCustomer(eFIO.Text, ePhoneNumber.Text);
end;

procedure TfCustomer.eFIOChange(Sender: TObject);
begin
  BitBtn1.Enabled:=(eFIO.Text<>'')and(ePhoneNumber.Text<>'');
end;

procedure TfCustomer.FormCreate(Sender: TObject);
var
 i : integer;
begin
for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Clear;
end;

end.
