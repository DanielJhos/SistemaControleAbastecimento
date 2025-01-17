unit uTanqueDAO;

interface

uses
  uTanque,
  FireDAC.Comp.Client;

type
  TTanqueDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const ATanque: TTanque);
    procedure Deletar(const AID: Integer);
    procedure UltimoRegistro(const ATanque: TTanque);
    function ProximoSequencial: String;
    function ConsultarTanques(const ADescricao: String): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  FireDAC.DApt,
  uDataModule,
  LibUtil;

{ TTanqueDAO }

function TTanqueDAO.ConsultarTanques(const ADescricao: String): TFDQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       descricao,');
  FQuery.SQL.Add('       tipo_combustivel');
  FQuery.SQL.Add('FROM tanque');
  FQuery.SQL.Add('WHERE :DESCRICAO IN ('''', {UCASE(descricao)})');
  FQuery.SQL.Add('ORDER BY id');
  FQuery.ParamByName('DESCRICAO').AsString := ADescricao.ToUpper;
  FQuery.Open;

  Result := FQuery;
end;

constructor TTanqueDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TTanqueDAO.Deletar(const AID: Integer);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM tanque');
  FQuery.SQL.Add('WHERE id = :ID');
  FQuery.ParamByName('ID').AsInteger := AID;
  FQuery.ExecSQL;
end;

destructor TTanqueDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TTanqueDAO.Inserir(const ATanque: TTanque);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO tanque (id, descricao, tipo_combustivel)');
  FQuery.SQL.Add('VALUES (:ID, :DESCRICAO, :TIPO_COMBUSTIVEL)');
  FQuery.SQL.Add('ON CONFLICT (id)');
  FQuery.SQL.Add('DO UPDATE');
  FQuery.SQL.Add('  SET descricao = excluded.descricao,');
  FQuery.SQL.Add('      tipo_combustivel = excluded.tipo_combustivel;');
  FQuery.ParamByName('ID').AsInteger := ATanque.ID;
  FQuery.ParamByName('DESCRICAO').AsString := ATanque.Descricao;
  FQuery.ParamByName('TIPO_COMBUSTIVEL').AsInteger := (ATanque.TipoCombustivel = TTipoCombustivel(tcGasolina))
    .IfThen<Integer>(0, 1);

  FQuery.ExecSQL;
end;

function TTanqueDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT seq + 1');
  FQuery.SQL.Add('FROM sqlite_sequence');
  FQuery.SQL.Add('WHERE name = ''tanque''');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TTanqueDAO.UltimoRegistro(const ATanque: TTanque);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       descricao,');
  FQuery.SQL.Add('       tipo_combustivel');
  FQuery.SQL.Add('FROM tanque');
  FQuery.SQL.Add('ORDER BY id DESC');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    ATanque.LimparCampos;
    Exit;
  end;

  ATanque.ID := FQuery.FieldByName('id').AsInteger;
  ATanque.Descricao := FQuery.FieldByName('descricao').AsString;
  ATanque.TipoCombustivel := TTipoCombustivel(FQuery.FieldByName('tipo_combustivel').AsInteger);
end;

end.
