program SistemaAbastecimento;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmSistemaAbastecimento},
  uAbastecimento in 'Models\uAbastecimento.pas',
  uTanque in 'Models\uTanque.pas',
  uBomba in 'Models\uBomba.pas',
  uFrmCadastroAbastecimento in 'uFrmCadastroAbastecimento.pas' {FrmCadastroAbastecimento},
  uFrmCadastroBomba in 'uFrmCadastroBomba.pas' {FrmCadastroBomba},
  uFrmCadastroTanque in 'uFrmCadastroTanque.pas' {FrmCadastroTanque},
  uTanqueDAO in 'DAO\uTanqueDAO.pas',
  LibUtil in 'LibUtil.pas',
  uDataModule in 'uDataModule.pas' {dmConexao: TDataModule},
  uFrmConsultaTanque in 'uFrmConsultaTanque.pas' {FrmConsultaTanque},
  uBombaDAO in 'DAO\uBombaDAO.pas',
  uAbastecimentoDAO in 'DAO\uAbastecimentoDAO.pas',
  uFrmConsultaBomba in 'uFrmConsultaBomba.pas' {FrmConsultaBomba},
  uFrmRelatorioAbastecimento in 'uFrmRelatorioAbastecimento.pas' {FrmRelatorioAbastecimento},
  uFrmRelatorioReport in 'uFrmRelatorioReport.pas' {FrmRelatorioReport};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSistemaAbastecimento, FrmSistemaAbastecimento);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
