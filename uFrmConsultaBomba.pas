unit uFrmConsultaBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uBombaDAO;

type
  TFrmConsultaBomba = class(TForm)
    pnConsulta: TPanel;
    lbPesquisar: TLabel;
    edDescricaoBomba: TEdit;
    dgConsultaBomba: TDBGrid;
    btFiltrar: TButton;
    dsConsultaBomba: TDataSource;
    procedure btFiltrarClick(Sender: TObject);
    procedure dgConsultaBombaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FBombaDAO: TBombaDAO;
    FIDBomba: Integer;
    FDescricaoBomba: String;
  public
    property IDBomba: Integer read FIDBomba write FIDBomba;
    property DescricaoBomba: String read FDescricaoBomba write FDescricaoBomba;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

procedure TFrmConsultaBomba.btFiltrarClick(Sender: TObject);
begin
  dsConsultaBomba.DataSet := FBombaDAO.ConsultarBombas(edDescricaoBomba.Text.ToString.Trim);
end;

procedure TFrmConsultaBomba.dgConsultaBombaDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDBomba := dgConsultaBomba.DataSource.DataSet.FieldByName('id').Value;
  FDescricaoBomba := VarToStr(dgConsultaBomba.DataSource.DataSet.FieldByName('descricao').Value);
end;

procedure TFrmConsultaBomba.FormCreate(Sender: TObject);
begin
  FBombaDAO := TBombaDAO.Create;
end;

procedure TFrmConsultaBomba.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBombaDAO);
end;

end.
