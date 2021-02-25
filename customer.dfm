object fCustomer: TfCustomer
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
  ClientHeight = 172
  ClientWidth = 398
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
    Left = 87
    Top = 32
    Width = 27
    Height = 13
    Caption = #1060#1048#1054':'
  end
  object Label2: TLabel
    Left = 26
    Top = 72
    Width = 88
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
  end
  object eFIO: TEdit
    Left = 128
    Top = 29
    Width = 233
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    OnChange = eFIOChange
  end
  object ePhoneNumber: TEdit
    Left = 128
    Top = 69
    Width = 233
    Height = 21
    TabOrder = 1
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    OnChange = eFIOChange
  end
  object BitBtn1: TBitBtn
    Left = 26
    Top = 128
    Width = 97
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 128
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
