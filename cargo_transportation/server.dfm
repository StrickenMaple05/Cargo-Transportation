object ServerForm: TServerForm
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 413
  ClientWidth = 635
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
  object test: TButton
    Left = 144
    Top = 64
    Width = 121
    Height = 25
    Caption = 'test add customer'
    TabOrder = 0
    OnClick = testClick
  end
  object operators: TComboBox
    Left = 144
    Top = 112
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'operators'
  end
  object memo: TMemo
    Left = 144
    Top = 160
    Width = 217
    Height = 121
    Lines.Strings = (
      'memo')
    TabOrder = 2
  end
  object start: TButton
    Left = 386
    Top = 110
    Width = 57
    Height = 25
    Caption = 'start'
    TabOrder = 3
    OnClick = startClick
  end
  object send: TButton
    Left = 368
    Top = 64
    Width = 75
    Height = 25
    Caption = 'send'
    TabOrder = 4
    OnClick = sendClick
  end
  object Button1: TButton
    Left = 232
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object server_socket: TServerSocket
    Active = False
    Port = 23
    ServerType = stNonBlocking
    OnClientConnect = server_socketClientConnect
    OnClientRead = ServerSocketClientRead
    Left = 400
    Top = 176
  end
  object http_server: TIdHTTPServer
    Bindings = <>
    OnCommandGet = http_serverCommandGet
    Left = 400
    Top = 240
  end
end
