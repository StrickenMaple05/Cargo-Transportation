program server_app;

uses
  Vcl.Forms,
  server in 'server.pas' {ServerForm},
  data_module in 'data_module.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerForm, ServerForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
