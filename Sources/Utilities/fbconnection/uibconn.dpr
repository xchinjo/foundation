{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG - Firebird Connection Manager DLL Library                           }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library uibconn;  

uses SysUtils, IniFiles, JvUIB, crgSec;

{$R *.res}

procedure LoadConnection(var _DBConn: TJvUIBDataBase;
  IsDefault: WordBool = True); stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    if (IsDefault) then
    begin
      _DBConn.DatabaseName :=
        ReadString('DEFAULT_DB', 'SERVER', 'localhost') + ':' +
        ReadString('DEFAULT_DB', 'NAME', '');

      _DBConn.UserName :=
        ReadString('DEFAULT_DB', 'USER_NAME', '');
      _DBConn.PassWord :=
        DecryptEx(ReadString('DEFAULT_DB', 'PASSWORD', ''));
    end else
    begin
      _DBConn.DatabaseName :=
        ReadString('CTRLVER_DB', 'SERVER', 'localhost') + ':' +
        ReadString('CTRLVER_DB', 'NAME', '');

      _DBConn.UserName :=
        ReadString('CTRLVER_DB', 'USER_NAME', '');
      _DBConn.PassWord :=
        DecryptEx(ReadString('CTRLVER_DB', 'PASSWORD', ''));
    end;
  finally
    Free();
  end;
end;

procedure SaveConnection(const _DBConn: TJvUIBDataBase;
  IsDefault: WordBool = True); stdcall;
var
  _ServerName, _DBName: String;
  _UserID, _UserPWD: String;
  _P: Integer;
begin
  _P := Pos(':', _DBConn.DatabaseName);
  _ServerName := Copy(_DBConn.DatabaseName, 1, _P - 1);
  _DBName := Copy(_DBConn.DatabaseName, _P + 1, Length(_DBConn.DatabaseName) - _P);
  _UserID := _DBConn.UserName;
  _UserPWD := EncryptEx(_DBConn.PassWord);

  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    if (IsDefault) then
    begin
      WriteString('DEFAULT_DB', 'SERVER', _ServerName);
      WriteString('DEFAULT_DB', 'NAME', _DBName);
      WriteString('DEFAULT_DB', 'USER_NAME', _UserID);
      WriteString('DEFAULT_DB', 'PASSWORD', _UserPWD);
    end else
    begin
      WriteString('CTRLVER_DB', 'SERVER', _ServerName);
      WriteString('CTRLVER_DB', 'NAME', _DBName);
      WriteString('CTRLVER_DB', 'USER_NAME', _UserID);
      WriteString('CTRLVER_DB', 'PASSWORD', _UserPWD);
    end;
  finally
    Free();
  end;
end;

function GetDefaultServer(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('DEFAULT_DB', 'SERVER', 'localhost');
  finally
    Free();
  end;
end;

function GetDefaultDBName(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('DEFAULT_DB', 'NAME', '');
  finally
    Free();
  end;
end;

function GetDefaultUserID(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('DEFAULT_DB', 'USER_NAME', '');
  finally
    Free();
  end;
end;

function GetDefaultUserPWD(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := DecryptEx(ReadString('DEFAULT_DB', 'PASSWORD', ''));
  finally
    Free();
  end;
end;

function GetCtrlVerServer(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('CTRLVER_DB', 'SERVER', 'localhost');
  finally
    Free();
  end;
end;

function GetCtrlVerDBName(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('CTRLVER_DB', 'NAME', '');
  finally
    Free();
  end;
end;

function GetCtrlVerUserID(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('CTRLVER_DB', 'USER_NAME', '');
  finally
    Free();
  end;
end;

function GetCtrlVerUserPWD(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := DecryptEx(ReadString('CTRLVER_DB', 'PASSWORD', ''));
  finally
    Free();
  end;
end;

function GetSecurityUserID(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := ReadString('SECURITY', 'USER_NAME', '');
  finally
    Free();
  end;
end;

function GetSecurityUserPWD(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := DecryptEx(ReadString('SECURITY', 'PASSWORD', ''));
  finally
    Free();
  end;
end;

procedure SetSecurityID(const _UserID, _UserPWD: String); stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    WriteString('SECURITY', 'USER_NAME', _UserID);
    WriteString('SECURITY', 'PASSWORD', EncryptEx(_UserPWD));
  finally
    Free();
  end;
end;

function GetMenuLanguage(): String; stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    Result := UpperCase(ReadString('MENUS', 'LANGUAGE', ''));
    if (Result = '') then
    begin
      Result := 'THA';
      WriteString('MENUS', 'LANGUAGE', Result);
    end;
  finally
    Free();
  end;
end;

procedure SetMenuLanguage(_MenuLanguage: String); stdcall;
begin
  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    if (UpperCase(_MenuLanguage) = '') then
      _MenuLanguage := 'THA';

    WriteString('MENUS', 'LANGUAGE', UpperCase(_MenuLanguage));
  finally
    Free();
  end;
end;

exports
  LoadConnection,
  SaveConnection,

  GetDefaultServer,
  GetDefaultDBName,
  GetDefaultUserID,
  GetDefaultUserPWD,

  GetCtrlVerServer,
  GetCtrlVerDBName,
  GetCtrlVerUserID,
  GetCtrlVerUserPWD,

  GetSecurityUserID,
  GetSecurityUserPWD,
  SetSecurityID,

  GetMenuLanguage,
  SetMenuLanguage;

end.
