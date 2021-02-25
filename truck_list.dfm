object fTruckList: TfTruckList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1075#1088#1091#1079#1086#1074#1080#1082#1086#1074
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 505
    Height = 231
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 168
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = N1Click
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 168
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object ClientDataSet1LICENSE_PLATE: TStringField
      FieldName = 'LICENSE_PLATE'
    end
    object ClientDataSet1SIZE: TSmallintField
      FieldName = 'TRUCK_SIZE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
    Top = 168
  end
end
