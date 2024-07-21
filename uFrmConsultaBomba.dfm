object FrmConsultaBomba: TFrmConsultaBomba
  Left = 0
  Top = 0
  Caption = 'Consulta de Bombas'
  ClientHeight = 357
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 357
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 406
    ExplicitHeight = 356
    object lbPesquisar: TLabel
      Left = 16
      Top = 19
      Width = 53
      Height = 15
      Caption = 'Pesquisar:'
    end
    object edDescricaoBomba: TEdit
      Left = 16
      Top = 40
      Width = 289
      Height = 23
      TabOrder = 0
    end
    object dgConsultaBomba: TDBGrid
      Left = 0
      Top = 80
      Width = 410
      Height = 277
      Align = alBottom
      BorderStyle = bsNone
      DataSource = dsConsultaBomba
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dgConsultaBombaDblClick
    end
    object btFiltrar: TButton
      Left = 311
      Top = 37
      Width = 81
      Height = 30
      Caption = 'Filtrar'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 2
      StyleName = 'Windows'
      OnClick = btFiltrarClick
    end
  end
  object dsConsultaBomba: TDataSource
    AutoEdit = False
    Left = 176
    Top = 256
  end
end
