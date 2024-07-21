unit uTanque;

interface

type
  TTipoCombustivel = (tcGasolina, tcOleoDiesel);
  TTanque = class
  private
    FID: Integer;
    FDescricao: String;
    FTipoCombustivel: TTipoCombustivel;
  public
    property ID: Integer read FID write FID;
    property Descricao: String read FDescricao write FDescricao;
    property TipoCombustivel: TTipoCombustivel read FTipoCombustivel write FTipoCombustivel;

    procedure Inserir(const AID: Integer; const ADescricao: String; const ATipoCombustivel: TTipoCombustivel);
    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TTanque }

procedure TTanque.Inserir(const AID: Integer; const ADescricao: String;
  const ATipoCombustivel: TTipoCombustivel);
begin
  FID := AID;
  FDescricao := ADescricao;
  FTipoCombustivel := ATipoCombustivel;
end;

procedure TTanque.LimparCampos;
begin
  FID := 0;
  FDescricao := EmptyStr;
  FTipoCombustivel := TTipoCombustivel.tcGasolina;
end;

end.
