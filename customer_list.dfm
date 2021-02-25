object fCustomerList: TfCustomerList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1095#1080#1082#1086#1074
  ClientHeight = 257
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 629
    Height = 257
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
    Left = 544
    Top = 184
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = N1Click
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 184
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object ClientDataSet1FULL_NAME: TStringField
      FieldName = 'FULL_NAME'
    end
    object ClientDataSet1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 456
    Top = 184
  end
end
