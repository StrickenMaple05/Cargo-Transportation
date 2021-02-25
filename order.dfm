object fOrder: TfOrder
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
  ClientHeight = 449
  ClientWidth = 699
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
    Left = 32
    Top = 88
    Width = 47
    Height = 13
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
  end
  object Label2: TLabel
    Left = 32
    Top = 136
    Width = 47
    Height = 13
    Caption = #1043#1088#1091#1079#1086#1074#1080#1082
  end
  object Label3: TLabel
    Left = 472
    Top = 18
    Width = 96
    Height = 13
    Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1079#1072#1082#1072#1079#1077
  end
  object Label4: TLabel
    Left = 29
    Top = 184
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1079#1095#1080#1082
  end
  object Label5: TLabel
    Left = 29
    Top = 236
    Width = 50
    Height = 13
    Caption = #1043#1088#1091#1079#1095#1080#1082' 2'
    Visible = False
  end
  object Label6: TLabel
    Left = 29
    Top = 284
    Width = 50
    Height = 13
    Caption = #1043#1088#1091#1079#1095#1080#1082' 3'
    Visible = False
  end
  object eCustomerFIO: TEdit
    Left = 85
    Top = 85
    Width = 260
    Height = 21
    TabOrder = 0
    Text = #1042#1099#1073#1088#1072#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    OnChange = eCustomerFIOChange
  end
  object BtnChooseCustomer: TButton
    Left = 320
    Top = 83
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = BtnChooseCustomerClick
  end
  object eTruckNumber: TEdit
    Left = 85
    Top = 133
    Width = 260
    Height = 21
    TabOrder = 2
    Text = #1042#1099#1073#1088#1072#1090#1100' '#1075#1088#1091#1079#1086#1074#1080#1082
    OnChange = eCustomerFIOChange
  end
  object BtnChooseTruck: TButton
    Left = 320
    Top = 131
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = BtnChooseTruckClick
  end
  object MemoInfo: TMemo
    Left = 384
    Top = 37
    Width = 297
    Height = 398
    ParentColor = True
    ReadOnly = True
    TabOrder = 4
  end
  object Button1: TButton
    Left = 32
    Top = 35
    Width = 313
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    TabOrder = 5
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 410
    Width = 97
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 410
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object eLoaderFIO1: TEdit
    Left = 85
    Top = 181
    Width = 260
    Height = 21
    TabOrder = 8
    Text = #1042#1099#1073#1088#1072#1090#1100' '#1075#1088#1091#1079#1095#1080#1082#1072
    OnChange = eCustomerFIOChange
  end
  object Button2: TButton
    Left = 320
    Top = 179
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 9
    OnClick = Button2Click
  end
  object rbSelectLoader2: TRadioButton
    Left = 38
    Top = 232
    Width = 172
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1090#1086#1088#1086#1075#1086' '#1075#1088#1091#1079#1095#1080#1082#1072
    TabOrder = 10
    OnClick = rbSelectLoader2Click
  end
  object eLoaderFIO2: TEdit
    Left = 85
    Top = 230
    Width = 260
    Height = 21
    TabOrder = 11
    Text = #1042#1099#1073#1088#1072#1090#1100' '#1074#1090#1086#1088#1086#1075#1086' '#1075#1088#1091#1079#1095#1080#1082#1072
    Visible = False
  end
  object Button3: TButton
    Left = 320
    Top = 228
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 12
    Visible = False
    OnClick = Button3Click
  end
  object rbSelectLoader3: TRadioButton
    Left = 38
    Top = 280
    Width = 209
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1088#1077#1090#1100#1077#1075#1086' '#1075#1088#1091#1079#1095#1080#1082#1072
    TabOrder = 13
    Visible = False
    OnClick = rbSelectLoader3Click
  end
  object eLoaderFIO3: TEdit
    Left = 85
    Top = 278
    Width = 260
    Height = 21
    TabOrder = 14
    Text = #1042#1099#1073#1088#1072#1090#1100' '#1090#1088#1077#1090#1100#1077#1075#1086' '#1075#1088#1091#1079#1095#1080#1082#1072
    Visible = False
  end
  object Button4: TButton
    Left = 320
    Top = 276
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 15
    Visible = False
    OnClick = Button4Click
  end
end
