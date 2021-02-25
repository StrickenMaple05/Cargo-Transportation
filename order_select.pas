unit order_select;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfOrderSelect = class(TForm)
    Info: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrderSelect: TfOrderSelect;

implementation

{$R *.dfm}

end.
