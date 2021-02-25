object dm: Tdm
  Left = 0
  Top = 0
  Caption = 'dm'
  ClientHeight = 514
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Users\User\Desktop\Delphinarium\FDB\TRANSPORTDB.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 96
    Top = 56
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 192
    Top = 56
  end
  object tCustomer: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CUSTOMER'
    UniDirectional = False
    Left = 80
    Top = 144
  end
  object spCustomerAdd: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADDCUSTOMER'
    Left = 80
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUTID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INFULLNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INPHONENUMBER'
        ParamType = ptInput
      end>
  end
  object tTruck: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TRUCK'
    UniDirectional = False
    Left = 144
    Top = 144
  end
  object tLoader: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'LOADER'
    UniDirectional = False
    Left = 200
    Top = 144
  end
  object tOrder: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDER_INFO'
    UniDirectional = False
    Left = 256
    Top = 144
  end
  object tCustomer2: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CUSTOMER2'
    UniDirectional = False
    Left = 464
    Top = 360
  end
end
