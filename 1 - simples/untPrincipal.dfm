object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 327
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
    Left = 96
    Top = 45
    Width = 57
    Height = 13
    Caption = 'Str Original:'
  end
  object Label2: TLabel
    Left = 96
    Top = 104
    Width = 39
    Height = 13
    Caption = 'strVelha'
  end
  object Label3: TLabel
    Left = 304
    Top = 104
    Width = 38
    Height = 13
    Caption = 'strNova'
  end
  object Label4: TLabel
    Left = 96
    Top = 256
    Width = 55
    Height = 13
    Caption = 'Resultado: '
  end
  object edStr: TEdit
    Left = 96
    Top = 64
    Width = 374
    Height = 21
    TabOrder = 0
  end
  object edOdl: TEdit
    Left = 96
    Top = 128
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object edtNew: TEdit
    Left = 304
    Top = 128
    Width = 166
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edResultado: TEdit
    Left = 96
    Top = 272
    Width = 374
    Height = 21
    TabOrder = 4
  end
  object btLimpar: TButton
    Left = 190
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btLimparClick
  end
end
