object fLogin: TfLogin
  Left = 0
  Top = 0
  Caption = #1042#1093#1086#1076
  ClientHeight = 356
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 72
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Port: TLabel
    Left = 64
    Top = 126
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label2: TLabel
    Left = 72
    Top = 18
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object LabelCon: TLabel
    Left = 40
    Top = 212
    Width = 78
    Height = 13
    Caption = 'DISCONNECTED'
  end
  object eHost: TEdit
    Left = 8
    Top = 99
    Width = 137
    Height = 21
    TabOrder = 0
    Text = '25.104.253.3'
  end
  object Button1: TButton
    Left = 8
    Top = 181
    Width = 137
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 1
    OnClick = Button1Click
  end
  object ePort: TSpinEdit
    Left = 8
    Top = 144
    Width = 137
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 23
  end
  object eID: TSpinEdit
    Left = 8
    Top = 37
    Width = 137
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 2
  end
  object Memo1: TMemo
    Left = 160
    Top = 37
    Width = 665
    Height = 311
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    Left = 56
    Top = 232
  end
  object UDPClient: TIdUDPClient
    Port = 0
    OnConnected = UDPClientConnected
    OnDisconnected = UDPClientDisconnected
    Left = 96
    Top = 296
  end
  object UDPServer: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = UDPServerUDPRead
    Left = 16
    Top = 296
  end
end
