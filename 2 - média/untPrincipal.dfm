object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 300
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
  object Label1: TLabel
    Left = 64
    Top = 29
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object edValor: TEdit
    Left = 64
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 240
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 96
    Width = 585
    Height = 196
    TabOrder = 2
  end
end
