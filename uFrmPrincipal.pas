unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TFrmSistemaAbastecimento = class(TForm)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    mmSistemaAbastecimento: TMainMenu;
    miCadastros: TMenuItem;
    miBomba: TMenuItem;
    miTanque: TMenuItem;
    miMovimento: TMenuItem;
    miAbastecimento: TMenuItem;
    miRelatorio: TMenuItem;
    miRelatorioAbastecimento: TMenuItem;
    procedure miAbastecimentoClick(Sender: TObject);
    procedure miBombaClick(Sender: TObject);
    procedure miTanqueClick(Sender: TObject);
    procedure miRelatorioAbastecimentoClick(Sender: TObject);
  end;

var
  FrmSistemaAbastecimento: TFrmSistemaAbastecimento;

implementation

uses
  uFrmCadastroTanque,
  uFrmCadastroBomba,
  uFrmCadastroAbastecimento,
  uFrmRelatorioAbastecimento;

{$R *.dfm}

procedure TFrmSistemaAbastecimento.miAbastecimentoClick(Sender: TObject);
begin
  const lFrmCadastroAbastecimento = TFrmCadastroAbastecimento.Create(nil);
  try
    lFrmCadastroAbastecimento.ShowModal;
  finally
    FreeAndNil(lFrmCadastroAbastecimento)
  end;
end;

procedure TFrmSistemaAbastecimento.miBombaClick(Sender: TObject);
begin
  const lFrmCadastroBomba = TFrmCadastroBomba.Create(nil);
  try
    lFrmCadastroBomba.ShowModal;
  finally
    FreeAndNil(lFrmCadastroBomba);
  end;
end;

procedure TFrmSistemaAbastecimento.miRelatorioAbastecimentoClick(
  Sender: TObject);
begin
  const lFrmRelatorioAbastecimento = TFrmRelatorioAbastecimento.Create(nil);
  try
    lFrmRelatorioAbastecimento.ShowModal;
  finally
    FreeAndNil(lFrmRelatorioAbastecimento);
  end;
end;

procedure TFrmSistemaAbastecimento.miTanqueClick(Sender: TObject);
begin
  const lFrmCadastroTanque = TFrmCadastroTanque.Create(nil);
  try
    lFrmCadastroTanque.ShowModal;
  finally
    FreeAndNil(lFrmCadastroTanque);
  end;
end;

end.
