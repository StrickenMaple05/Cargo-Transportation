object fOrderInfo: TfOrderInfo
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
  ClientHeight = 466
  ClientWidth = 532
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
    Left = 71
    Top = 167
    Width = 39
    Height = 13
    Caption = #1054#1090#1082#1091#1076#1072
  end
  object Label2: TLabel
    Left = 84
    Top = 215
    Width = 26
    Height = 13
    Caption = #1050#1091#1076#1072
  end
  object Label3: TLabel
    Left = 85
    Top = 263
    Width = 27
    Height = 13
    Caption = #1069#1090#1072#1078
  end
  object Label5: TLabel
    Left = 8
    Top = 51
    Width = 104
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
  end
  object Label6: TLabel
    Left = 46
    Top = 99
    Width = 64
    Height = 13
    Caption = #1054#1073#1098#1077#1084' '#1075#1088#1091#1079#1072
  end
  object Label7: TLabel
    Left = 34
    Top = 371
    Width = 80
    Height = 13
    Caption = #1048#1090#1086#1075#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
  end
  object Label8: TLabel
    Left = 8
    Top = 138
    Width = 193
    Height = 13
    Caption = '-------- '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1086#1089#1090#1072#1074#1082#1077' --------'
  end
  object Label4: TLabel
    Left = 8
    Top = 21
    Width = 173
    Height = 13
    Caption = '-------- '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1075#1088#1091#1079#1077' --------'
  end
  object Label9: TLabel
    Left = 8
    Top = 336
    Width = 192
    Height = 13
    Caption = '------------------------------------------------'
  end
  object eName: TEdit
    Left = 118
    Top = 48
    Width = 385
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
    OnChange = eNameChange
  end
  object eStartAddress: TEdit
    Left = 116
    Top = 164
    Width = 385
    Height = 21
    TabOrder = 1
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1086#1095#1082#1091' '#1040
    OnChange = eNameChange
  end
  object eEndAddress: TEdit
    Left = 116
    Top = 212
    Width = 389
    Height = 21
    TabOrder = 2
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1086#1095#1082#1091' '#1041
    OnChange = eNameChange
  end
  object eFloor: TEdit
    Left = 118
    Top = 260
    Width = 385
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1101#1090#1072#1078#1072
    OnChange = eNameChange
  end
  object eSize: TEdit
    Left = 120
    Top = 96
    Width = 385
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1086#1073#1098#1077#1084' '#1075#1088#1091#1079#1072
    OnChange = eNameChange
  end
  object rbElevator: TRadioButton
    Left = 120
    Top = 303
    Width = 121
    Height = 17
    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1083#1080#1092#1090#1072
    TabOrder = 5
  end
  object ePrice: TEdit
    Left = 120
    Top = 368
    Width = 385
    Height = 21
    NumbersOnly = True
    TabOrder = 6
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1080#1090#1086#1075#1086#1074#1091#1102' '#1089#1091#1084#1084#1091
    OnChange = eNameChange
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 424
    Width = 97
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 352
    Top = 424
    Width = 96
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
    OnClick = BitBtn2Click
  end
end
