object ClientForm: TClientForm
  Left = 0
  Top = 0
  Caption = 'Operator'
  ClientHeight = 458
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object add_order: TButton
    Left = 474
    Top = 80
    Width = 89
    Height = 25
    Caption = 'Add order'
    TabOrder = 0
  end
  object add_customer: TButton
    Left = 474
    Top = 120
    Width = 89
    Height = 25
    Caption = 'Add customer'
    TabOrder = 1
  end
  object add_loader: TButton
    Left = 474
    Top = 160
    Width = 89
    Height = 25
    Caption = 'Add loader'
    TabOrder = 2
  end
  object add_truck: TButton
    Left = 474
    Top = 200
    Width = 89
    Height = 25
    Caption = 'Add truck'
    TabOrder = 3
  end
  object connect: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'connect'
    TabOrder = 4
    OnClick = connectClick
  end
  object client_socket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    Left = 296
    Top = 176
  end
end
