unit uFrmRelatorioReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Comp.Client;

type
  TFrmRelatorioReport = class(TForm)
    RLReportAbastecimentoBombas: TRLReport;
    RLBandTitle: TRLBand;
    RLDrawTitle: TRLDraw;
    RLSystemInfoData: TRLSystemInfo;
    RLLabelData: TRLLabel;
    RLSystemInfoPagina: TRLSystemInfo;
    RLLabelPagina: TRLLabel;
    RLLabelImpressaoAbastecimentos: TRLLabel;
    RLGroup: TRLGroup;
    RLBandDetail: TRLBand;
    RLDrawBomba: TRLDraw;
    RLLabelBomba: TRLLabel;
    RLDrawDataAbastecimento: TRLDraw;
    RLLabelDataAbastecimento: TRLLabel;
    RLDrawValor: TRLDraw;
    RLLabelValor: TRLLabel;
    RLBandHeader: TRLBand;
    RLDrawColunaBomba: TRLDraw;
    RLDrawGrupo: TRLDraw;
    RLLabelTanqueGrupo: TRLLabel;
    RLLabelGrupo: TRLLabel;
    RLDrawColunaData: TRLDraw;
    RLLabelColunaData: TRLLabel;
    RLLabelColunaBomba: TRLLabel;
    RLDrawColunaValor: TRLDraw;
    RLLabelColunaValor: TRLLabel;
    RLBandSummary01: TRLBand;
    RLDrawValorTotalTanqueCaption: TRLDraw;
    RLDrawValorTotalTanque: TRLDraw;
    RLLabelValorTotalTanqueCaption: TRLLabel;
    RLLabelValorTotalTanque: TRLLabel;
    RLBandSummary02: TRLBand;
    RLDrawValorTotalCaption: TRLDraw;
    RLDrawValorTotal: TRLDraw;
    RLLabelValorTotalCaption: TRLLabel;
    RLLabelValorTotal: TRLLabel;
    procedure RLBandDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandHeaderBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandSummary01BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandSummary02BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FValorTotal: Double;
    FValorTotalTanque: Double;
    FQuery: TFDQuery;

    procedure SetQuery(const Value: TFDQuery);
  public
    property Query: TFDQuery read FQuery write SetQuery;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

{ TFrmRelatorioReport }

procedure TFrmRelatorioReport.RLBandDetailBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelBomba.Caption := Query.FieldByName('bomba').AsString.Trim;
  RLLabelDataAbastecimento.Caption := FormatDateTime('dd/mm/yyyy', Query.FieldByName('data').AsDateTime);
  RLLabelValor.Caption := 'R$ ' + FormatFloat('#,##0.00', Query.FieldByName('valor_abastecido').AsCurrency);
  FValorTotal := FValorTotal + Query.FieldByName('valor_abastecido').AsCurrency;
  FValorTotalTanque := FValorTotalTanque + Query.FieldByName('valor_abastecido').AsCurrency;
end;

procedure TFrmRelatorioReport.RLBandHeaderBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelGrupo.Caption := Trim(Query.FieldByName('Tanque').AsString);
end;

procedure TFrmRelatorioReport.RLBandSummary01BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelValorTotalTanque.Caption := 'R$ ' + FormatFloat('#,##0.00', FValorTotalTanque);
  FValorTotalTanque := 0;
end;

procedure TFrmRelatorioReport.RLBandSummary02BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelValorTotal.Caption := 'R$ ' + FormatFloat('#,##0.00', FValorTotal);
  FValorTotal := 0;
end;

procedure TFrmRelatorioReport.SetQuery(const Value: TFDQuery);
begin
  FQuery := Value;
end;

end.
