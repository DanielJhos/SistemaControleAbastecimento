unit uFrmConsultaTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uTanqueDAO;

type
  TFrmConsultaTanque = class(TForm)
    pnConsulta: TPanel;
    edDescricaoTanque: TEdit;
    dgConsultaTanque: TDBGrid;
    lbPesquisar: TLabel;
    dsConsultaTanque: TDataSource;
    btFiltrar: TButton;
    procedure btFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dgConsultaTanqueDblClick(Sender: TObject);
  private
    FTanqueDAO: TTanqueDAO;
    FIDTanque: Integer;
    FDescricaoTanque: String;
  public
    property IDTanque: Integer read FIDTanque;
    property DescricaoTanque: String read FDescricaoTanque;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

procedure TFrmConsultaTanque.btFiltrarClick(Sender: TObject);
begin
  dsConsultaTanque.DataSet := FTanqueDAO.ConsultarTanques(edDescricaoTanque.Text.ToString.Trim);
end;

procedure TFrmConsultaTanque.dgConsultaTanqueDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDTanque := dgConsultaTanque.DataSource.DataSet.FieldByName('id').Value;
  FDescricaoTanque := VarToStr(dgConsultaTanque.DataSource.DataSet.FieldByName('descricao').Value);
end;

procedure TFrmConsultaTanque.FormCreate(Sender: TObject);
begin
  FTanqueDAO := TTanqueDAO.Create;
end;

procedure TFrmConsultaTanque.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FTanqueDAO);
end;

end.
