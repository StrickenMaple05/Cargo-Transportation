object fWindow: TfWindow
  Left = 0
  Top = 0
  Caption = #1054#1082#1085#1086' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
  ClientHeight = 427
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 595
    Height = 427
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      #1040#1082#1090#1080#1074#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
      #1047#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099)
    TabIndex = 0
    OnChange = TabControl1Change
    object DBGrid1: TDBGrid
      Left = 4
      Top = 24
      Width = 587
      Height = 177
      Align = alTop
      DataSource = dsOrderCompleted
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
    end
    object DBGrid2: TDBGrid
      Left = 4
      Top = 207
      Width = 587
      Height = 216
      Align = alBottom
      DataSource = dsOrderUnCompleted
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 528
    Top = 368
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1086#1074
      OnClick = N3Click
    end
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object customerAdd: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082#1072
        OnClick = customerAddClick
      end
      object truckAdd: TMenuItem
        Caption = #1043#1088#1091#1079#1086#1074#1080#1082
        OnClick = truckAddClick
      end
      object loaderAdd: TMenuItem
        Caption = #1043#1088#1091#1079#1095#1080#1082#1072
        OnClick = loaderAddClick
      end
      object orderAdd: TMenuItem
        Caption = #1047#1072#1082#1072#1079
        OnClick = orderAddClick
      end
    end
    object N4: TMenuItem
      Caption = #1058#1045#1057#1058
      OnClick = N4Click
    end
  end
  object dsOrderUnCompleted: TDataSource
    DataSet = cdsOrderUnCompleted
    Left = 64
    Top = 336
  end
  object dsOrderCompleted: TDataSource
    DataSet = cdsOrderCompleted
    Left = 64
    Top = 104
  end
  object dsOrderHistory: TDataSource
    DataSet = cdsOrderHistory
    Left = 440
    Top = 192
  end
  object cdsOrderCompleted: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 104
    object cdsOrderCompletedID: TIntegerField
      FieldName = 'ID'
    end
    object cdsOrderCompletedORDER_NAME: TStringField
      FieldName = 'ORDER_NAME'
    end
    object cdsOrderCompletedSTART_ADDRESS: TStringField
      FieldName = 'START_ADDRESS'
    end
    object cdsOrderCompletedEND_ADDRESS: TStringField
      FieldName = 'END_ADDRESS'
    end
    object cdsOrderCompletedSIZE: TIntegerField
      FieldName = 'SIZE'
    end
    object cdsOrderCompletedTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object cdsOrderCompletedSTART_TIME: TStringField
      FieldName = 'START_TIME'
    end
  end
  object cdsOrderHistory: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 192
    object cdsOrderHistoryID: TIntegerField
      FieldName = 'ID'
    end
    object cdsOrderHistoryORDER_NAME: TStringField
      FieldName = 'ORDER_NAME'
    end
    object cdsOrderHistorySTART_ADDRESS: TStringField
      FieldName = 'START_ADDRESS'
    end
    object cdsOrderHistoryEND_ADDRESS: TStringField
      FieldName = 'END_ADDRESS'
    end
    object cdsOrderHistorySIZE: TIntegerField
      FieldName = 'SIZE'
    end
    object cdsOrderHistoryTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object cdsOrderHistorySTART_TIME: TStringField
      FieldName = 'START_TIME'
    end
    object cdsOrderHistoryEND_TIME: TStringField
      FieldName = 'END_TIME'
    end
  end
  object cdsOrderUnCompleted: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 336
    object cdsOrderUnCompletedID: TIntegerField
      FieldName = 'ID'
    end
    object cdsOrderUnCompletedORDER_NAME: TStringField
      FieldName = 'ORDER_NAME'
    end
    object cdsOrderUnCompletedSTART_ADDRESS: TStringField
      FieldName = 'START_ADDRESS'
    end
    object cdsOrderUnCompletedEND_ADDRESS: TStringField
      FieldName = 'END_ADDRESS'
    end
    object cdsOrderUnCompletedSIZE: TIntegerField
      FieldName = 'SIZE'
    end
    object cdsOrderUnCompletedTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object cdsOrderUnCompletedSTART_TIME: TStringField
      FieldName = 'START_TIME'
    end
  end
end
