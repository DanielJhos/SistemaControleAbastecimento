object FrmRelatorioAbastecimento: TFrmRelatorioAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Abastecimento'
  ClientHeight = 127
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnRelatorioAbastecimento: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 127
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 320
    ExplicitHeight = 126
    object lbDataInicial: TLabel
      Left = 15
      Top = 25
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label1: TLabel
      Left = 183
      Top = 25
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object lbAte: TLabel
      Left = 150
      Top = 52
      Width = 18
      Height = 15
      Caption = 'At'#233
    end
    object dtDataInicial: TDateTimePicker
      Left = 15
      Top = 46
      Width = 121
      Height = 23
      Date = 45494.000000000000000000
      Time = 0.703934722223493700
      TabOrder = 0
    end
    object dtDataFinal: TDateTimePicker
      Left = 183
      Top = 46
      Width = 121
      Height = 23
      Date = 45494.000000000000000000
      Time = 0.703934722223493700
      TabOrder = 1
    end
    object btExecutar: TButton
      Left = 223
      Top = 89
      Width = 81
      Height = 30
      Caption = 'Executar'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 2
      StyleName = 'Windows'
      OnClick = btExecutarClick
    end
  end
end
