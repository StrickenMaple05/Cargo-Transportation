program ClientProj;

uses
  Vcl.Forms,
  operator_window in 'operator_window.pas' {fWindow},
  customer_list in 'customer_list.pas' {fCustomerList},
  customer in 'customer.pas' {fCustomer},
  truck_list in 'truck_list.pas' {fTruckList},
  truck in 'truck.pas' {fTruck},
  loader_list in 'loader_list.pas' {fLoaderList},
  loader in 'loader.pas' {fLoader},
  order in 'order.pas' {fOrder},
  order_info in 'order_info.pas' {fOrderInfo},
  login in 'login.pas' {fLogin},
  confirm_order in 'confirm_order.pas' {fConfirmOrder},
  order_select in 'order_select.pas' {fOrderSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfWindow, fWindow);
  Application.CreateForm(TfOrder, fOrder);
  Application.CreateForm(TfCustomerList, fCustomerList);
  Application.CreateForm(TfCustomer, fCustomer);
  Application.CreateForm(TfTruckList, fTruckList);
  Application.CreateForm(TfTruck, fTruck);
  Application.CreateForm(TfLoaderList, fLoaderList);
  Application.CreateForm(TfLoader, fLoader);
  Application.CreateForm(TfOrderInfo, fOrderInfo);
  Application.CreateForm(TfConfirmOrder, fConfirmOrder);
  Application.CreateForm(TfOrderSelect, fOrderSelect);
  Application.Run;
end.
