object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 638
  Width = 877
  object SPAddCustomer: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDCUSTOMER'
    Left = 232
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INFULLNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 45
      end
      item
        Position = 3
        Name = 'INPHONENUMBER'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object SPAddLoaderInfo: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDLOADERINFO'
    Left = 416
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INLOADERID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPAddLoader: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDLOADER'
    Left = 320
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INFULLNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object SPAddOperator: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDOPERATOR'
    Left = 512
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INFULLNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 45
      end>
  end
  object SPAddTruck: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDTRUCK'
    Left = 608
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INLICENSEPLATE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 3
        Name = 'INSIZE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelCargoOrder: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETECARGOORDER'
    Left = 136
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelCustomer: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETECUSTOMER'
    Left = 232
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelFromLI: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETEFROMLOADERINFO'
    Left = 416
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INLOADERID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelLoader: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETELOADER'
    Left = 320
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelOperator: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETEOPERATOR'
    Left = 512
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPDelTruck: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'DELETETRUCK'
    Left = 608
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object TCargoOrder: TFDTable
    IndexFieldNames = 'ORDER_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'CARGO_ORDER'
    TableName = 'CARGO_ORDER'
    Left = 520
    Top = 136
    object TCargoOrderORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
      Origin = 'ORDER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TCargoOrderORDER_NAME: TStringField
      FieldName = 'ORDER_NAME'
      Origin = 'ORDER_NAME'
      Size = 10
    end
    object TCargoOrderOPERATOR_ID: TIntegerField
      FieldName = 'OPERATOR_ID'
      Origin = 'OPERATOR_ID'
    end
    object TCargoOrderTRUCK_ID: TIntegerField
      FieldName = 'TRUCK_ID'
      Origin = 'TRUCK_ID'
    end
    object TCargoOrderLOADER_INFO_ID: TIntegerField
      FieldName = 'LOADER_INFO_ID'
      Origin = 'LOADER_INFO_ID'
    end
    object TCargoOrderCUSTOMER_ID: TIntegerField
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
    end
    object TCargoOrderSTART_ADDRESS: TStringField
      FieldName = 'START_ADDRESS'
      Origin = 'START_ADDRESS'
      Size = 100
    end
    object TCargoOrderEND_ADDRESS: TStringField
      FieldName = 'END_ADDRESS'
      Origin = 'END_ADDRESS'
      Size = 100
    end
    object TCargoOrderHOUSE_FLOOR: TIntegerField
      FieldName = 'HOUSE_FLOOR'
      Origin = 'HOUSE_FLOOR'
    end
    object TCargoOrderELEVATOR_EQUIPPED: TIntegerField
      FieldName = 'ELEVATOR_EQUIPPED'
      Origin = 'ELEVATOR_EQUIPPED'
    end
    object TCargoOrderAMOUNT_OF_SPACE: TIntegerField
      FieldName = 'AMOUNT_OF_SPACE'
      Origin = 'AMOUNT_OF_SPACE'
    end
    object TCargoOrderTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object TCargoOrderSTART_TIME: TSQLTimeStampField
      FieldName = 'START_TIME'
      Origin = 'START_TIME'
    end
    object TCargoOrderEND_TIME: TSQLTimeStampField
      FieldName = 'END_TIME'
      Origin = 'END_TIME'
    end
  end
  object TCustomer: TFDTable
    IndexFieldNames = 'CUSTOMER_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'CUSTOMER'
    TableName = 'CUSTOMER'
    Left = 616
    Top = 200
    object TCustomerCUSTOMER_ID: TIntegerField
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TCustomerFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 45
    end
    object TCustomerPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'PHONE_NUMBER'
      Size = 10
    end
  end
  object TLoader: TFDTable
    IndexFieldNames = 'LOADER_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'LOADER'
    TableName = 'LOADER'
    Left = 488
    Top = 200
    object TLoaderLOADER_ID: TIntegerField
      FieldName = 'LOADER_ID'
      Origin = 'LOADER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TLoaderFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 45
    end
    object TLoaderBUZY: TSmallintField
      FieldName = 'BUZY'
      Origin = 'BUZY'
    end
    object TLoaderSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
  object TState: TFDTable
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'STATE'
    TableName = 'STATE'
    Left = 584
    Top = 72
    object TStateORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
      Origin = 'ORDER_ID'
    end
  end
  object TOrderInfo: TFDTable
    IndexFieldNames = 'ORDER_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'ORDER_INFO'
    TableName = 'ORDER_INFO'
    Left = 456
    Top = 136
    object TOrderInfoORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
      Origin = 'ORDER_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOrderInfoSTATE: TSmallintField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
  end
  object TOperator: TFDTable
    IndexFieldNames = 'OPERATOR_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'OPERATOR'
    TableName = 'OPERATOR'
    Left = 424
    Top = 200
    object TOperatorOPERATOR_ID: TIntegerField
      FieldName = 'OPERATOR_ID'
      Origin = 'OPERATOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOperatorFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 45
    end
  end
  object TLoaderInfo: TFDTable
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'LOADER_INFO'
    TableName = 'LOADER_INFO'
    Left = 584
    Top = 136
    object TLoaderInfoLOADER_INFO_ID: TIntegerField
      FieldName = 'LOADER_INFO_ID'
      Origin = 'LOADER_INFO_ID'
    end
    object TLoaderInfoLOADER_ID: TIntegerField
      FieldName = 'LOADER_ID'
      Origin = 'LOADER_ID'
    end
  end
  object TTruck: TFDTable
    IndexFieldNames = 'TRUCK_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'TRUCK'
    TableName = 'TRUCK'
    Left = 552
    Top = 200
    object TTruckTRUCK_ID: TIntegerField
      FieldName = 'TRUCK_ID'
      Origin = 'TRUCK_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TTruckLICENSE_PLATE: TStringField
      FieldName = 'LICENSE_PLATE'
      Origin = 'LICENSE_PLATE'
      Size = 10
    end
    object TTruckTRUCK_SIZE: TSmallintField
      FieldName = 'TRUCK_SIZE'
      Origin = 'TRUCK_SIZE'
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\User\Documents\Embarcadero\Studio\Projects\car' +
        'go_transportation\database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1251'
      'DriverID=FB')
    Connected = True
    Left = 696
    Top = 64
  end
  object TruckQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from truck')
    Left = 144
    Top = 56
  end
  object TUOrders: TFDTable
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'UNCOMPLETED_ORDERS'
    TableName = 'UNCOMPLETED_ORDERS'
    Left = 456
    Top = 72
    object IntegerField1: TIntegerField
      FieldName = 'ORDER_ID'
      Origin = 'ORDER_ID'
    end
  end
  object TCOrders: TFDTable
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'COMPLETED_ORDERS'
    TableName = 'COMPLETED_ORDERS'
    Left = 520
    Top = 72
    object IntegerField2: TIntegerField
      FieldName = 'ORDER_ID'
      Origin = 'ORDER_ID'
    end
  end
  object SPCompleteOrder: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'CHANGEORDERSTATE'
    Left = 696
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SPConfirmOrder: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'CONFIRMORDER'
    Left = 696
    Top = 544
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INENDTIME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object CustomerQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from customer')
    Left = 64
    Top = 56
  end
  object LoaderQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from loader')
    Left = 224
    Top = 56
  end
  object UOrdersQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cargo_order where order_id in'
      '(select order_id from uncompleted_orders)')
    Left = 64
    Top = 128
  end
  object COrdersQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cargo_order where order_id in'
      '(select order_id from completed_orders)')
    Left = 144
    Top = 128
  end
  object CCOrdersQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cargo_order where order_id in'
      '(select order_id from state)')
    Left = 224
    Top = 128
  end
  object LoaderInfoQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from loader where loader_id in'
      '(select loader_id from loader_info where'
      'loader_info_id = :param)')
    Left = 144
    Top = 200
    ParamData = <
      item
        Name = 'PARAM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object SPAddCargoOrder: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'ADDCARGOORDER'
    Left = 136
    Top = 472
    ParamData = <
      item
        Position = 1
        Name = 'INID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'INNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 3
        Name = 'INOPERATORID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'INTRUCKID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'INLOADERID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'INCUSTOMERID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'INSTARTADDRESS'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 8
        Name = 'INENDADDRESS'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 9
        Name = 'INFLOOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'INELEVATOREQUIPPED'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'INAMOUNTOFSPACE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'INTOTAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'INSTARTTIME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 14
        Name = 'INEXTRALOADER1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'INEXTRALOADER2'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object OrderInfoQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select order_name, amount_of_space, start_address,'
      'end_address, house_floor, elevator_equipped, total'
      'from cargo_order where order_id = :param')
    Left = 104
    Top = 328
    ParamData = <
      item
        Name = 'PARAM'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object CustomerInfoQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select full_name, phone_number from customer'
      'where customer_id = '
      '(select customer_id from cargo_order'
      'where order_id = :param)')
    Left = 200
    Top = 328
    ParamData = <
      item
        Name = 'PARAM'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object TruckInfoQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select license_plate, truck_size from truck'
      'where truck_id = '
      '(select truck_id from cargo_order'
      'where order_id = :param)')
    Left = 296
    Top = 328
    ParamData = <
      item
        Name = 'PARAM'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object LoadersInfoQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select full_name from loader where loader_id in'
      '(select loader_id from loader_info where'
      'loader_info_id = '
      '(select loader_info_id from cargo_order'
      'where order_id = :param))'
      '')
    Left = 384
    Top = 328
    ParamData = <
      item
        Name = 'PARAM'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cargo_order')
    Left = 472
    Top = 328
  end
end
