unit mydm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IBX.IBStoredProc, Data.DB,
  IBX.IBCustomDataSet, IBX.IBTable, IBX.IBDatabase;

type
  Tdm = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tCustomer: TIBTable;
    spCustomerAdd: TIBStoredProc;
    tTruck: TIBTable;
    tLoader: TIBTable;
    tOrder: TIBTable;
    tCustomer2: TIBTable;
  private
    { Private declarations }
  public
    { Public declarations }
    function CustomerAdd(fName, fPhoneNumber: String):int64;
    procedure CustomerEdit(fID: int64; fName, fPhoneNumber: String);

  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

function tdm.CustomerAdd(fName,fPhoneNumber: String):int64;
  begin
    spCustomerAdd.Params[1].Value := 0;
    spCustomerAdd.Params[2].Value := fName;
    spCustomerAdd.Params[3].Value := fPhoneNumber;
    if not spCustomerAdd.Transaction.InTransaction then
        spCustomerAdd.Transaction.StartTransaction;
    spCustomerAdd.ExecProc;
    result:=spCustomerAdd.Params[0].Value;
    if spCustomerAdd.Transaction.InTransaction then
        spCustomerAdd.Transaction.Commit;

  end;

  procedure tdm.CustomerEdit(fID: int64; fName, fPhoneNumber: String);
  begin
    spCustomerAdd.Params[1].Value := fID;
    spCustomerAdd.Params[2].Value := fName;
    spCustomerAdd.Params[3].Value := fPhoneNumber;
    if not spCustomerAdd.Transaction.InTransaction then
        spCustomerAdd.Transaction.StartTransaction;
    spCustomerAdd.ExecProc;
    if spCustomerAdd.Transaction.InTransaction then
        spCustomerAdd.Transaction.Commit;
  end;

end.
