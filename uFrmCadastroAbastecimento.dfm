object FrmCadastroAbastecimento: TFrmCadastroAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Abastecimento'
  ClientHeight = 265
  ClientWidth = 427
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
  object pAbastecimento: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 265
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 423
    ExplicitHeight = 264
    object lbBomba: TLabel
      Left = 17
      Top = 199
      Width = 38
      Height = 15
      Caption = 'Bomba'
    end
    object lbQuantidadeLitros: TLabel
      Left = 17
      Top = 83
      Width = 110
      Height = 15
      Caption = 'Quantidade de Litros'
    end
    object Label1: TLabel
      Left = 17
      Top = 141
      Width = 88
      Height = 15
      Caption = 'Valor Abastecido'
    end
    object Label2: TLabel
      Left = 17
      Top = 25
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object edCodigoBomba: TEdit
      Left = 17
      Top = 224
      Width = 30
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object edDescricaoBomba: TEdit
      Left = 50
      Top = 224
      Width = 172
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edQuantidadeLitros: TEdit
      Left = 17
      Top = 108
      Width = 205
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      Text = '0,00'
    end
    object edValorAbastecido: TEdit
      Left = 17
      Top = 166
      Width = 205
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
      Text = '0,00'
    end
    object edCodigo: TEdit
      Left = 17
      Top = 50
      Width = 205
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object btIncluir: TButton
      Left = 334
      Top = 19
      Width = 81
      Height = 30
      Caption = 'Incluir'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 5
      StyleName = 'Windows'
      OnClick = btIncluirClick
    end
    object btSalvar: TButton
      Left = 334
      Top = 69
      Width = 81
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 6
      StyleName = 'Windows'
      OnClick = btSalvarClick
    end
    object btAlterar: TButton
      Left = 334
      Top = 120
      Width = 81
      Height = 30
      Caption = 'Alterar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 7
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btCancelar: TButton
      Left = 334
      Top = 170
      Width = 81
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 1
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 8
      StyleName = 'Windows'
      OnClick = btCancelarClick
    end
    object btExcluir: TButton
      Left = 334
      Top = 221
      Width = 81
      Height = 30
      Caption = 'Excluir'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 9
      StyleName = 'Windows'
      OnClick = btExcluirClick
    end
    object btConsultar: TButton
      Left = 228
      Top = 222
      Width = 70
      Height = 27
      Caption = 'Consultar'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 10
      StyleName = 'Windows'
      OnClick = btConsultarClick
    end
  end
end
