{ *********************************************************************** }
{                                                                         }
{ The Bantung Software  Runtime Library                                   }
{ Bantung - Security Manager DLL Library                                  }
{                                                                         }
{ Copyright (c) 2012 Bantung Software Co., Ltd.                           }
{                                                                         }
{ *********************************************************************** }

library nsec;

uses
  Windows,
  Messages,
  SysUtils,
  IdIPWatch;

{$R *.res}

{$I CRG_WM_MSG.INC}

function GetSystemDir(): String; stdcall;
var
  Buff: array[1..255] of char;
begin
  GetSystemDirectory(@Buff, 255);
  GetSystemDir := StrPas(@Buff);
end;

function LocalIP(): String; stdcall;
begin
  with TIdIPWatch.Create(nil) do
  try
    HistoryEnabled := False;
    Result := LocalIP();
  finally
    Free();
  end;
end;

function DecryptStr(const S: String; const Key: Byte = 11;
  const Level: Byte = 1): String; stdcall;
var
  i, l: Integer;
  _S1, _S2: String;
begin
  Result := '';
  _S1 := S;
  while (_S1 <> '') do
  begin
    _S2 := Copy(_S1, 1, 2);
    Delete(_S1, 1, 2);
    Result :=  Result + Chr(StrToInt('$' + _S2));
  end;

  for l := Level downto 1 do
    for i := 1 to Length(Result) do
      Result[i] := Chr(Ord(Result[i]) xor (not Key xor l));

  for i := 1 to Length(Result) do
    Result[i] := Chr(Ord(Result[i]) xor Key);
end;

function EncryptStr(const S: String; const Key: Byte = 11;
  const Level: Byte = 1): String; stdcall;
var
  i, l: Integer;
  _St: String;
begin
  _St := '';
  for i := 1 to Length(S) do
    _St := _St + Chr(Ord(S[i]) xor Key);

  for l := 1 to Level do
    for i := 1 to Length(_St) do
      _St[i] := Chr(Ord(_St[i]) xor (not Key xor l));

  Result := '';
  for i := 1 to Length(_St) do
    Result :=  Result + IntToHex(Ord(_St[i]), 2);
end;

function DecryptEx(const S: String; const Level: Byte = 2): String; stdcall;
var
  i: Integer;
begin
  Result := S;
  for i := 1 to Level do
    Result := DecryptStr(Result);
end;

function EncryptEx(const S: String; const Level: Byte = 2): String; stdcall;
var
  i: Integer;
begin
  Result := S;
  for i := 1 to Level do
    Result := EncryptStr(Result);
end;

function ExecuteByName(_Handle: THandle; const _AppName: String): Boolean; stdcall;
var
  i: Integer;
begin
  PostMessage(_Handle, WM_PRG_CHAR, 0, 0);
  for i := 1 to Length(_AppName) do
    PostMessage(_Handle, WM_PRG_CHAR, Ord(_AppName[i]), 0);

  PostMessage(_Handle, WM_EXEC_PRG, 1, 0);

  Result := True;
end;

exports
  GetSystemDir,
  LocalIP,
  DecryptStr,
  EncryptStr,
  DecryptEx,
  EncryptEx,
  ExecuteByName;

end.
