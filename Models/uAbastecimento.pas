unit uAbastecimento;

interface

type
  TAbastecimento = class
  private
    FID: Integer;
    FIDBomba: Integer;
    FData: TDateTime;
    FQuantidadeLitros: Double;
    FValorAbastecido: Double;
    FImposto: Double;
  public
    property ID: Integer read FID write FID;
    property IDBomba: Integer read FIDBomba write FIDBomba;
    property Data: TDateTime read FData write FData;
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;
    property ValorAbastecido: Double read FValorAbastecido write FValorAbastecido;
    property Imposto: Double read FImposto write FImposto;

    procedure Inserir(const AID, AIDBomba: Integer; const AData: TDateTime;
      const AQuantidadeLitros, AValorAbastecido, AImposto: Double);
    procedure LimparCampos;
  end;

implementation

{ TAbastecimento }

procedure TAbastecimento.Inserir(const AID, AIDBomba: Integer; const AData: TDateTime;
  const AQuantidadeLitros, AValorAbastecido, AImposto: Double);
begin
  FID := AID;
  FIDBomba := AIDBomba;
  FData := AData;
  FQuantidadeLitros := AQuantidadeLitros;
  FValorAbastecido := AValorAbastecido;
  FImposto := (AImposto * 13) / 100;
end;

procedure TAbastecimento.LimparCampos;
begin
  FID := 0;
  FIDBomba := 0;
  FData := 0;
  FQuantidadeLitros := 0;
  FValorAbastecido := 0;
  FImposto := 0;
end;

end.
