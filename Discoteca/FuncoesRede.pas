unit FuncoesRede;

interface

uses SysUtils, Windows;

function NomeComputador : String;

implementation

function NomeComputador : String;
var
  lpBuffer : PChar;
  nSize : LongWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

end.
