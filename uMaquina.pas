unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, SysUtils;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    Lista:TStringList;
    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses math;

function TMaquina.MontarTroco(Troco: Double): TList;
Function Dividir(Dividendo:Double; Divisor:Integer; Tipo:integer=1):String;
Var
  fmod:integer;
  fDiv : Double;

begin
  Result :='';
  fMod := Trunc(Dividendo) mod Divisor;
  fDiv := Trunc(Dividendo) Div Divisor;
  if fMod >= 0 then
  Begin
    Result := FloatToStr(fDiv) + ' nota de ' + IntToStr(Divisor);
    if Tipo <> 1 then
      Result := FloatToStr(fDiv) + ' moeda de ' + formatfloat('#0.00', Divisor/100);
  End;
End;

const
  nota: array[1..6] of integer = (100, 50, 20, 10, 5, 2);
  centavos: array[1..5] of integer = (50, 25, 10, 5, 1);
var
  ftroco: double;
  resto:Double;

  I : integer;
  fmod:integer;
  fDiv, vlr : Double;
begin
  Result :=TList.Create;
  vlr := round(frac(troco) * 100);
  fMod := Trunc(Troco) mod 100;

  if not Assigned(Lista) then
    Lista:=TStringList.Create;
  Lista.Clear;
  Lista.Add(Dividir(Troco, 100));

  i:=2;
  while I <=  High(nota) do
  Begin
  if (fMod > 0) and ( fMod >= nota[i]) then
    Begin
      Lista.Add(Dividir(fMod, nota[i]));
      fMod := Trunc(fMod) mod nota[i];
    end;
    inc(I);
  end;

  fMod := Trunc(vlr) mod 50;
  if (vlr >0) and ( fMod >= 50) then
    Lista.Add(Dividir(vlr, 50, 0));

  i:=2;
  while I <=  High(centavos) do
  Begin
  if (fMod > 0) and ( fMod >= centavos[i]) then
    Begin
      Lista.Add(Dividir(fMod, centavos[i], 0));
      fMod := Trunc(fMod) mod centavos[i];
    end;
    inc(I);
  end;

  Result.Add(Lista);
end;


end.

