unit client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TClientForm = class(TForm)
    add_order: TButton;
    add_customer: TButton;
    add_loader: TButton;
    add_truck: TButton;
    connect: TButton;
    client_socket: TClientSocket;
    procedure connectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.dfm}

procedure TClientForm.connectClick(Sender: TObject);
begin
  client_socket.Port := 23;
  client_socket.Address := '127.0.0.1';
  client_socket.Active := True;
end;

end.
