unit LibUtil;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TCaptionHelper = record Helper for TCaption
  public
    function ToString: String;
    function ToIntDef(const AValue: Integer = 0): Integer;
    function ToFloatDef(const AValue: Double = 0): Double;
  end;

  BooleanHelper = Boolean;

  TLTBooleanHelper = record Helper for BooleanHelper
  public
    function IfThen<T>(const AValueTrue, AValueFalse: T): T; overload;
  end;

  TWinControlHelper = class Helper for TWinControl
  public
    procedure ToFocus;
  end;

procedure Informa(const AMensagem: String);
procedure Alerta(const AMensagem: String);

implementation

{ TCaptionHelper }

function TCaptionHelper.ToString: String;
begin
  Result := String(Self);
end;

function TCaptionHelper.ToIntDef(const AValue: Integer): Integer;
begin
  Result := StrToIntDef(Self.ToString, AValue);
end;

function TCaptionHelper.ToFloatDef(const AValue: Double): Double;
begin
  Result := StrToFloatDef(Self.ToString, AValue);
end;

{ TLTBooleanHelper }

function TLTBooleanHelper.IfThen<T>(const AValueTrue, AValueFalse: T): T;
begin
  if Self then
    Result := AValueTrue
  else
    Result := AValueFalse;
end;

procedure Informa(const AMensagem: String);
begin
  MessageDlg(AMensagem, mtInformation, [mbOk], 0);
end;

procedure Alerta(const AMensagem: String);
begin
  MessageDlg(AMensagem, mtWarning, [mbOk], 0);
end;

{ TCustomEditHelper }

procedure TWinControlHelper.ToFocus;
begin
  if Self.CanFocus then
    Self.SetFocus;
end;

end.
