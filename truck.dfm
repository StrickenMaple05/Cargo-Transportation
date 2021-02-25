object fTruck: TfTruck
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1079#1086#1074#1080#1082
  ClientHeight = 168
  ClientWidth = 267
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
    Left = 16
    Top = 24
    Width = 90
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1079#1086#1074#1080#1082#1072':'
  end
  object Label2: TLabel
    Left = 29
    Top = 72
    Width = 77
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1082#1091#1079#1086#1074#1072':'
  end
  object eNumber: TEdit
    Left = 128
    Top = 21
    Width = 113
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
    OnChange = eNumberChange
  end
  object BitBtn1: TBitBtn
    Left = 17
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
    Left = 152
    Top = 112
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object eSize: TSpinEdit
    Left = 128
    Top = 69
    Width = 113
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
    OnChange = eNumberChange
  end
end
