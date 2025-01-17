unit uBombaDAO;

interface

uses
  uBomba,
  FireDAC.Comp.Client;

type
  TBombaDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const ABomba: TBomba);
    procedure Deletar(const AID: Integer);
    procedure UltimoRegistro(const ABomba: TBomba);

    function ProximoSequencial: String;
    function ConsultarDescricaoTanque(const AID: Integer): String;
    function ConsultarBombas(const ADescricao: String): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TBombaDAO }

function TBombaDAO.ConsultarDescricaoTanque(const AID: Integer): String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT descricao');
  FQuery.SQL.Add('FROM tanque');
  FQuery.SQL.Add('WHERE id = :ID');
  FQuery.ParamByName('ID').AsInteger := AID;
  FQuery.Open;

  Result := FQuery.FieldByName('descricao').AsString;
end;

function TBombaDAO.ConsultarBombas(const ADescricao: String): TFDQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       descricao');
  FQuery.SQL.Add('FROM bomba');
  FQuery.SQL.Add('WHERE :DESCRICAO IN ('''', {UCASE(descricao)})');
  FQuery.SQL.Add('ORDER BY id');
  FQuery.ParamByName('DESCRICAO').AsString := ADescricao.ToUpper;
  FQuery.Open;

  Result := FQuery;
end;

constructor TBombaDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TBombaDAO.Deletar(const AID: Integer);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM bomba');
  FQuery.SQL.Add('WHERE id = :ID');
  FQuery.ParamByName('ID').AsInteger := AID;
  FQuery.ExecSQL;
end;

destructor TBombaDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TBombaDAO.Inserir(const ABomba: TBomba);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO bomba (id, id_tanque, descricao)');
  FQuery.SQL.Add('VALUES (:ID, :ID_TANQUE, :DESCRICAO)');
  FQuery.SQL.Add('ON CONFLICT (id)');
  FQuery.SQL.Add('DO UPDATE');
  FQuery.SQL.Add('  SET id_tanque = excluded.id_tanque,');
  FQuery.SQL.Add('      descricao = excluded.descricao');
  FQuery.ParamByName('ID').AsInteger := ABomba.ID;
  FQuery.ParamByName('ID_TANQUE').AsInteger := ABomba.IDTanque;
  FQuery.ParamByName('DESCRICAO').AsString := ABomba.Descricao;
  FQuery.ExecSQL;
end;

function TBombaDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT seq + 1');
  FQuery.SQL.Add('FROM sqlite_sequence');
  FQuery.SQL.Add('WHERE name = ''bomba''');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TBombaDAO.UltimoRegistro(const ABomba: TBomba);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       id_tanque,');
  FQuery.SQL.Add('       descricao');
  FQuery.SQL.Add('FROM bomba');
  FQuery.SQL.Add('ORDER BY id DESC');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    ABomba.LimparCampos;
    Exit;
  end;

  ABomba.ID := FQuery.FieldByName('id').AsInteger;
  ABomba.IDTanque := FQuery.FieldByName('id_tanque').AsInteger;
  ABomba.Descricao := FQuery.FieldByName('descricao').AsString;
end;

end.
