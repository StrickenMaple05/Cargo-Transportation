object fConfirmOrder: TfConfirmOrder
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 426
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 534
    Height = 209
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 208
    Width = 534
    Height = 218
    Align = alBottom
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDragDrop = DBGrid2DragDrop
    OnDragOver = DBGrid2DragOver
  end
  object MainMenu1: TMainMenu
    Left = 472
    Top = 360
    object N1: TMenuItem
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      OnClick = N2Click
    end
  end
  object dsOrderCompleted: TDataSource
    Left = 360
    Top = 120
  end
  object cdsOrderCompleted: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 120
    object cdsOrderCompletedID: TIntegerField
      FieldName = 'ID'
    end
    object cdsOrderCompletedNAME: TStringField
      FieldName = 'NAME'
    end
  end
  object dsOrderNewConfirmed: TDataSource
    Left = 360
    Top = 344
  end
  object cdsOrderNewConfirmed: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 344
    object cdsOrderNewConfirmedID: TIntegerField
      FieldName = 'ID'
    end
    object cdsOrderNewConfirmedNAME: TStringField
      FieldName = 'NAME'
    end
  end
end
