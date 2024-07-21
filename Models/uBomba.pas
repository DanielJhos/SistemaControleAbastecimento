unit uBomba;

interface

type
  TBomba = class
  private
    FID: Integer;
    FIDTanque: Integer;
    FDescricao: String;
  public
    property ID: Integer read FID write FID;
    property IDTanque: Integer read FIDTanque write FIDTanque;
    property Descricao: String read FDescricao write FDescricao;

    procedure Inserir(const AID, AIDTanque: Integer; const ADescricao: String);
    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TBomba }

procedure TBomba.Inserir(const AID, AIDTanque: Integer; const ADescricao: String);
begin
  FID := AID;
  FIDTanque := AIDTanque;
  FDescricao := ADescricao;
end;

procedure TBomba.LimparCampos;
begin
  FID := 0;
  FIDTanque := 0;
  FDescricao := EmptyStr;
end;

end.
