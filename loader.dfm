object fLoader: TfLoader
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1079#1095#1080#1082#1072
  ClientHeight = 185
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 32
    Width = 27
    Height = 13
    Caption = #1060#1048#1054':'
  end
  object eFIO: TEdit
    Left = 104
    Top = 29
    Width = 129
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054' '#1075#1088#1091#1079#1095#1080#1082#1072
    OnChange = eFIOChange
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 112
    Width = 89
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 112
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
