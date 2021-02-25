unit data_module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    SPAddCustomer: TFDStoredProc;
    SPAddLoaderInfo: TFDStoredProc;
    SPAddLoader: TFDStoredProc;
    SPAddOperator: TFDStoredProc;
    SPAddTruck: TFDStoredProc;
    SPDelCargoOrder: TFDStoredProc;
    SPDelCustomer: TFDStoredProc;
    SPDelFromLI: TFDStoredProc;
    SPDelLoader: TFDStoredProc;
    SPDelOperator: TFDStoredProc;
    SPDelTruck: TFDStoredProc;
    TCargoOrder: TFDTable;
    TCargoOrderORDER_ID: TIntegerField;
    TCargoOrderOPERATOR_ID: TIntegerField;
    TCargoOrderTRUCK_ID: TIntegerField;
    TCargoOrderLOADER_INFO_ID: TIntegerField;
    TCargoOrderCUSTOMER_ID: TIntegerField;
    TCargoOrderSTART_ADDRESS: TStringField;
    TCargoOrderEND_ADDRESS: TStringField;
    TCargoOrderHOUSE_FLOOR: TIntegerField;
    TCargoOrderELEVATOR_EQUIPPED: TIntegerField;
    TCargoOrderAMOUNT_OF_SPACE: TIntegerField;
    TCargoOrderTOTAL: TIntegerField;
    TCustomer: TFDTable;
    TCustomerCUSTOMER_ID: TIntegerField;
    TCustomerFULL_NAME: TStringField;
    TCustomerPHONE_NUMBER: TStringField;
    TLoader: TFDTable;
    TLoaderLOADER_ID: TIntegerField;
    TLoaderFULL_NAME: TStringField;
    TLoaderBUZY: TSmallintField;
    TLoaderSTATUS: TSmallintField;
    TState: TFDTable;
    TStateORDER_ID: TIntegerField;
    TOrderInfo: TFDTable;
    TOrderInfoORDER_ID: TIntegerField;
    TOrderInfoSTATE: TSmallintField;
    TOperator: TFDTable;
    TOperatorOPERATOR_ID: TIntegerField;
    TOperatorFULL_NAME: TStringField;
    TLoaderInfo: TFDTable;
    TLoaderInfoLOADER_INFO_ID: TIntegerField;
    TLoaderInfoLOADER_ID: TIntegerField;
    TTruck: TFDTable;
    TTruckTRUCK_ID: TIntegerField;
    TTruckLICENSE_PLATE: TStringField;
    TTruckTRUCK_SIZE: TSmallintField;
    FDConnection: TFDConnection;
    TCargoOrderORDER_NAME: TStringField;
    TruckQuery: TFDQuery;
    TCargoOrderSTART_TIME: TSQLTimeStampField;
    TCargoOrderEND_TIME: TSQLTimeStampField;
    TUOrders: TFDTable;
    IntegerField1: TIntegerField;
    TCOrders: TFDTable;
    IntegerField2: TIntegerField;
    SPCompleteOrder: TFDStoredProc;
    SPConfirmOrder: TFDStoredProc;
    CustomerQuery: TFDQuery;
    LoaderQuery: TFDQuery;
    UOrdersQuery: TFDQuery;
    COrdersQuery: TFDQuery;
    CCOrdersQuery: TFDQuery;
    LoaderInfoQuery: TFDQuery;
    SPAddCargoOrder: TFDStoredProc;
    OrderInfoQuery: TFDQuery;
    CustomerInfoQuery: TFDQuery;
    TruckInfoQuery: TFDQuery;
    LoadersInfoQuery: TFDQuery;
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



end.
