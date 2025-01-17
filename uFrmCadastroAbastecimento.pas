unit uFrmCadastroAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uAbastecimento, uAbastecimentoDAO;

type
  TFrmCadastroAbastecimento = class(TForm)
    pAbastecimento: TPanel;
    lbBomba: TLabel;
    lbQuantidadeLitros: TLabel;
    edDescricaoBomba: TEdit;
    edCodigoBomba: TEdit;
    edQuantidadeLitros: TEdit;
    edValorAbastecido: TEdit;
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    btIncluir: TButton;
    btSalvar: TButton;
    btAlterar: TButton;
    btCancelar: TButton;
    btExcluir: TButton;
    btConsultar: TButton;
    procedure btConsultarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FAbastecimento: TAbastecimento;
    FAbastecimentoDAO: TAbastecimentoDAO;
  public
    procedure HabilitaBotoes(const AHabilitar: Boolean);
    procedure BotoesInsercaoEdicao;
    procedure BotoesNavegacao;
    procedure BotoesExcluir;
    procedure LimparCampos;
    procedure UltimoRegistro;
  end;

implementation

uses
  uFrmConsultaBomba,
  LibUtil;

{$R *.dfm}

{ TFrmCadastroAbastecimento }

procedure TFrmCadastroAbastecimento.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroAbastecimento.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmCadastroAbastecimento.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroAbastecimento.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroAbastecimento.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FAbastecimento.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroAbastecimento.btConsultarClick(Sender: TObject);
begin
  const lFrmConsultaBomba = TFrmConsultaBomba.Create(nil);
  try
    if lFrmConsultaBomba.ShowModal = mrOk then
    begin
      edCodigoBomba.Text := lFrmConsultaBomba.IDBomba.ToString;
      edDescricaoBomba.Text := lFrmConsultaBomba.DescricaoBomba;
    end;
  finally
    FreeAndNil(lFrmConsultaBomba);
  end;
end;

procedure TFrmCadastroAbastecimento.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FAbastecimento.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FAbastecimentoDAO.Deletar(FAbastecimento.ID);
  UltimoRegistro;
end;

procedure TFrmCadastroAbastecimento.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FAbastecimentoDAO.ProximoSequencial;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroAbastecimento.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edQuantidadeLitros.Text.ToFloatDef = 0 then
  begin
    Alerta('Necessário preencher o campo "Quantidade de Litros"!');
    edQuantidadeLitros.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edValorAbastecido.Text.ToFloatDef = 0 then
  begin
    Alerta('Necessário preencher o campo "Valor Abastecido"!');
    edValorAbastecido.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edCodigoBomba.Text.ToIntDef = 0 then
  begin
    Alerta('Necessário preencher o campo "Bomba"!');
    btConsultar.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FAbastecimento.Inserir(edCodigo.Text.ToIntDef, edCodigoBomba.Text.ToIntDef, Date,
    edQuantidadeLitros.Text.ToFloatDef, edValorAbastecido.Text.ToIntDef,
      edValorAbastecido.Text.ToIntDef);

  FAbastecimentoDAO.Inserir(FAbastecimento);
  HabilitaBotoes(False);
end;


procedure TFrmCadastroAbastecimento.FormCreate(Sender: TObject);
begin
  FAbastecimento := TAbastecimento.Create;
  FAbastecimentoDAO := TAbastecimentoDAO.Create;
end;

procedure TFrmCadastroAbastecimento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FAbastecimento);
  FreeAndNil(FAbastecimentoDAO);
end;

procedure TFrmCadastroAbastecimento.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edQuantidadeLitros.Enabled := AHabilitar;
  edValorAbastecido.Enabled := AHabilitar;
end;

procedure TFrmCadastroAbastecimento.LimparCampos;
begin
  edCodigo.Clear;
  edQuantidadeLitros.Clear;
  edValorAbastecido.Clear;
  edCodigoBomba.Clear;
  edDescricaoBomba.Clear;
end;

procedure TFrmCadastroAbastecimento.UltimoRegistro;
begin
  FAbastecimentoDAO.UltimoRegistro(FAbastecimento);

  if FAbastecimento.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FAbastecimento.ID.ToString;
  edQuantidadeLitros.Text := FAbastecimento.QuantidadeLitros.ToString;
  edValorAbastecido.Text := FAbastecimento.ValorAbastecido.ToString;
  edCodigoBomba.Text := FAbastecimento.IDBomba.ToString;
  edDescricaoBomba.Text := FAbastecimentoDAO.ConsultarDescricaoBomba(FAbastecimento.IDBomba);
end;

end.
