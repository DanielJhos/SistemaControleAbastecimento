object FrmCadastroTanque: TFrmCadastroTanque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Tanque'
  ClientHeight = 209
  ClientWidth = 346
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
  object pnTanque: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lTipoCombustivel: TLabel
      Left = 17
      Top = 139
      Width = 109
      Height = 15
      Caption = 'Tipo de Comb'#250'stivel'
    end
    object lbDescricao: TLabel
      Left = 17
      Top = 83
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lbCodigo: TLabel
      Left = 17
      Top = 27
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object cbTipoCombustivel: TComboBox
      Left = 17
      Top = 163
      Width = 209
      Height = 23
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
      Items.Strings = (
        'Gasolina'
        #211'leo Diesel')
    end
    object edDescricao: TEdit
      Left = 17
      Top = 107
      Width = 209
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edCodigo: TEdit
      Left = 17
      Top = 51
      Width = 97
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object btSalvar: TButton
      Left = 261
      Top = 51
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
      TabOrder = 4
      StyleName = 'Windows'
      OnClick = btSalvarClick
    end
    object btCancelar: TButton
      Left = 261
      Top = 123
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
      TabOrder = 5
      StyleName = 'Windows'
      OnClick = btCancelarClick
    end
    object btAlterar: TButton
      Left = 261
      Top = 87
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
      TabOrder = 6
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 261
      Top = 160
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
      TabOrder = 7
      StyleName = 'Windows'
      OnClick = btExcluirClick
    end
    object btIncluir: TButton
      Left = 261
      Top = 15
      Width = 81
      Height = 30
      Caption = 'Incluir'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 3
      StyleName = 'Windows'
      OnClick = btIncluirClick
    end
  end
end
