unit uFrmRelatorioAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmRelatorioAbastecimento = class(TForm)
    pnRelatorioAbastecimento: TPanel;
    dtDataInicial: TDateTimePicker;
    lbDataInicial: TLabel;
    dtDataFinal: TDateTimePicker;
    Label1: TLabel;
    lbAte: TLabel;
    btExecutar: TButton;
    procedure btExecutarClick(Sender: TObject);
  end;

implementation

uses
  FireDAC.Comp.Client,
  Data.DB,
  uDataModule,
  LibUtil,
  uFrmRelatorioReport;

{$R *.dfm}

procedure TFrmRelatorioAbastecimento.btExecutarClick(Sender: TObject);
begin
  const lQuery = TFDQuery.Create(nil);
  const lDataSource = TDataSource.Create(nil);
  try
    lQuery.Connection := dmConexao.FDConnection;
    lQuery.SQL.Add('SELECT b.descricao AS bomba,');
    lQuery.SQL.Add('       a.data,');
    lQuery.SQL.Add('       t.descricao AS tanque,');
    lQuery.SQL.Add('       a.valor_abastecido');
    lQuery.SQL.Add('FROM abastecimento a');
    lQuery.SQL.Add('  INNER JOIN bomba  b ON a.id_bomba = b.id');
    lQuery.SQL.Add('  INNER JOIN tanque t ON b.id_tanque = t.id');
    lQuery.SQL.Add('WHERE data BETWEEN :DATA_INICIAL AND :DATA_FINAL');
    lQuery.SQL.Add(' ORDER BY b.Descricao');
    lQuery.ParamByName('DATA_INICIAL').AsDate := dtDataInicial.DateTime;
    lQuery.ParamByName('DATA_FINAL').AsDate := dtDataFinal.DateTime;
    lQuery.Open();

    if lQuery.IsEmpty then
    begin
      Informa('Sem registros de abastecimento!');
      Exit;
    end;

    lDataSource.DataSet := lQuery;

    const lFrmRelatorioReport = TFrmRelatorioReport.Create(nil);
    try
      lFrmRelatorioReport.RLReportAbastecimentoBombas.DataSource := lDataSource;
      lFrmRelatorioReport.Query := lQuery;

      lFrmRelatorioReport.RLReportAbastecimentoBombas.Preview();

    finally
      FreeAndNil(lFrmRelatorioReport);
    end;
  finally

    FreeAndNil(lQuery);
    FreeAndNil(lDataSource);
  end;
end;

end.
