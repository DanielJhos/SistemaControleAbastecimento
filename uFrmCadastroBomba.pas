unit uFrmCadastroBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uBomba, uBombaDAO;

type
  TFrmCadastroBomba = class(TForm)
    pnTanque: TPanel;
    lbTanque: TLabel;
    lbDescricao: TLabel;
    lbCodigo: TLabel;
    edDescricao: TEdit;
    edCodigo: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btIncluir: TButton;
    edDescricaoTanque: TEdit;
    edCodigoTanque: TEdit;
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
    FBomba: TBomba;
    FBombaDAO: TBombaDAO;

    procedure HabilitaBotoes(const AHabilitar: Boolean);
    procedure BotoesInsercaoEdicao;
    procedure BotoesNavegacao;
    procedure BotoesExcluir;
    procedure LimparCampos;
    procedure UltimoRegistro;
  end;

implementation

uses
  uFrmConsultaTanque,
  LibUtil;

{$R *.dfm}

procedure TFrmCadastroBomba.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroBomba.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
  btConsultar.Enabled := True;
end;

procedure TFrmCadastroBomba.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroBomba.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroBomba.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FBomba.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroBomba.btConsultarClick(Sender: TObject);
begin
  const lFrmConsultaTanque = TFrmConsultaTanque.Create(nil);
  try
    if lFrmConsultaTanque.ShowModal = mrOk then
    begin
      edCodigoTanque.Text := lFrmConsultaTanque.IDTanque.ToString;
      edDescricaoTanque.Text := lFrmConsultaTanque.DescricaoTanque;
    end;
  finally
    FreeAndNil(lFrmConsultaTanque);
  end;
end;

procedure TFrmCadastroBomba.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FBomba.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FBombaDAO.Deletar(FBomba.ID);
  UltimoRegistro;
end;

procedure TFrmCadastroBomba.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FBombaDAO.ProximoSequencial;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroBomba.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edDescricao.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "Descrição"!');
    edDescricao.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edCodigoTanque.Text.ToIntDef = 0 then
  begin
    Alerta('Necessário preencher o campo "Tanque"!');
    btConsultar.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FBomba.Inserir(edCodigo.Text.ToIntDef, edCodigoTanque.Text.ToIntDef, edDescricao.Text);
  FBombaDAO.Inserir(FBomba);
  HabilitaBotoes(False);
end;

procedure TFrmCadastroBomba.FormCreate(Sender: TObject);
begin
  FBomba := TBomba.Create;
  FBombaDAO := TBombaDAO.Create;
end;

procedure TFrmCadastroBomba.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBomba);
  FreeAndNil(FBombaDAO);
end;

procedure TFrmCadastroBomba.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edDescricao.Enabled := AHabilitar;
end;

procedure TFrmCadastroBomba.LimparCampos;
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edCodigoTanque.Clear;
  edDescricaoTanque.Clear;
end;

procedure TFrmCadastroBomba.UltimoRegistro;
begin
  FBombaDAO.UltimoRegistro(FBomba);

  if FBomba.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FBomba.ID.ToString;
  edDescricao.Text := FBomba.Descricao;
  edCodigoTanque.Text := FBomba.IDTanque.ToString;
  edDescricaoTanque.Text := FBombaDAO.ConsultarDescricaoTanque(FBomba.IDTanque);
end;

end.
