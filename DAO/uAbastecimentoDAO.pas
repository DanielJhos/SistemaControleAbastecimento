unit uAbastecimentoDAO;

interface

uses
  uAbastecimento,
  FireDAC.Comp.Client;

type
  TAbastecimentoDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const AAbastecimetno: TAbastecimento);
    procedure Deletar(const AID: Integer);
    procedure UltimoRegistro(const AAbastecimetno: TAbastecimento);

    function ProximoSequencial: String;
    function ConsultarDescricaoBomba(const AID: Integer): String;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TAbastecimentoDAO }

function TAbastecimentoDAO.ConsultarDescricaoBomba(const AID: Integer): String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT descricao');
  FQuery.SQL.Add('FROM bomba');
  FQuery.SQL.Add('WHERE id = :ID');
  FQuery.ParamByName('ID').AsInteger := AID;
  FQuery.Open;

  Result := FQuery.FieldByName('descricao').AsString;
end;

constructor TAbastecimentoDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TAbastecimentoDAO.Deletar(const AID: Integer);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM abastecimento');
  FQuery.SQL.Add('WHERE id = :ID');
  FQuery.ParamByName('ID').AsInteger := AID;
  FQuery.ExecSQL;
end;

destructor TAbastecimentoDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TAbastecimentoDAO.Inserir(const AAbastecimetno: TAbastecimento);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO abastecimento (id, id_bomba, data, quantidade_litros, valor_abastecido, imposto)');
  FQuery.SQL.Add('VALUES (:ID, :ID_BOMBA, :DATA, :QUANTIDADE_LITROS, :VALOR_ABASTECIDO, :IMPOSTO)');
  FQuery.SQL.Add('ON CONFLICT (id)');
  FQuery.SQL.Add('DO UPDATE');
  FQuery.SQL.Add('  SET id_bomba = excluded.id_bomba,');
  FQuery.SQL.Add('      data = excluded.data,');
  FQuery.SQL.Add('      quantidade_litros = excluded.quantidade_litros,');
  FQuery.SQL.Add('      valor_abastecido = excluded.valor_abastecido,');
  FQuery.SQL.Add('      imposto = excluded.imposto');
  FQuery.ParamByName('ID').AsInteger := AAbastecimetno.ID;
  FQuery.ParamByName('ID_BOMBA').AsInteger := AAbastecimetno.IDBomba;
  FQuery.ParamByName('DATA').AsDate := AAbastecimetno.Data;
  FQuery.ParamByName('QUANTIDADE_LITROS').AsFloat := AAbastecimetno.QuantidadeLitros;
  FQuery.ParamByName('VALOR_ABASTECIDO').AsFloat := AAbastecimetno.ValorAbastecido;
  FQuery.ParamByName('IMPOSTO').AsFloat := AAbastecimetno.Imposto;
  FQuery.ExecSQL;
end;

function TAbastecimentoDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT seq + 1');
  FQuery.SQL.Add('FROM sqlite_sequence');
  FQuery.SQL.Add('WHERE name = ''abastecimento''');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TAbastecimentoDAO.UltimoRegistro(const AAbastecimetno: TAbastecimento);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       id_bomba,');
  FQuery.SQL.Add('       data,');
  FQuery.SQL.Add('       quantidade_litros,');
  FQuery.SQL.Add('       valor_abastecido,');
  FQuery.SQL.Add('       imposto,');
  FQuery.SQL.Add('FROM abastecimetno');
  FQuery.SQL.Add('ORDER BY id DESC');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    AAbastecimetno.LimparCampos;
    Exit;
  end;

  AAbastecimetno.ID := FQuery.FieldByName('id').AsInteger;
  AAbastecimetno.IDBomba := FQuery.FieldByName('id_bomba').AsInteger;
  AAbastecimetno.Data := FQuery.FieldByName('data').AsDateTime;
  AAbastecimetno.QuantidadeLitros := FQuery.FieldByName('quantidade_litros').AsFloat;
  AAbastecimetno.ValorAbastecido := FQuery.FieldByName('valor_abastecido').AsFloat;;
  AAbastecimetno.Imposto := FQuery.FieldByName('imposto').AsFloat;
end;

end.
