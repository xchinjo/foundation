program fbbak;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes, JvComponent, JvUIB, JvComponentBase, IniFiles;

type
  TBackup = class
  private
    jvBackup: TJvUIBBackup;

    FAutoBackup: Boolean;
    FIsVerbose: Boolean;
    FShowWindow: Boolean;

    FHostList: TStringList;
    FDBFiles: TStringList;
    FBAKTypes: TStringList;
    FBAKFiles: TStringList;

    FConfigFile: String;

    function GetIdent(const _S: String): String;
    function GetValues(const _S: String): String;
    function GetBakFileName(const _File: String; const _Type: Integer): String;

    procedure jvBackupVerbose(Sender: TObject; Message: String);
  public
    constructor Create();
    destructor Destroy(); override;

    procedure StartBackup();
  end;

const
  _PF_TXT = 'CRG_BAK: ';

var
  _fb_back_conf: String;

constructor TBackup.Create();
begin
  FConfigFile := ExtractFileName(ParamStr(0));
  FConfigFile := Copy(_fb_back_conf, 1, Pos('.', _fb_back_conf) - 1);
  FConfigFile :=
    ExtractFilePath(ParamStr(0)) + PathDelim + _fb_back_conf + '.conf';

  jvBackup := TJvUIBBackup.Create(nil);

  FHostList := TStringList.Create();
  FDBFiles := TStringList.Create();
  FBAKTypes := TStringList.Create();
  FBAKFiles := TStringList.Create();

  with TIniFile.Create(FConfigFile) do
  try
    ReadSectionValues('db.hosts', FHostList);
    ReadSectionValues('db.files', FDBFiles);
    ReadSectionValues('bak.types', FBAKTypes);
    ReadSectionValues('bak.files', FBAKFiles);

    FAutoBackup := ReadBool('options', 'autobackup', False);
    FIsVerbose := ReadBool('options', 'verbose', True);
    FShowWindow := ReadBool('options', 'show_window', True);

    jvBackup.UserName := ReadString('options', 'user_name', 'sysdba');
    jvBackup.PassWord := ReadString('options', 'password', 'masterkey');
  finally
    Free();
  end;

  if (not FShowWindow) then
    FIsVerbose := False;

  if (FIsVerbose) then
    jvBackup.OnVerbose := jvBackupVerbose;
end;

destructor TBackup.Destroy();
begin
  jvBackup.Free();

  FHostList.Free();
  FDBFiles.Free();
  FBAKTypes.Free();
  FBAKFiles.Free();
end;

procedure TBackup.jvBackupVerbose(Sender: TObject; Message: String);
begin
  WriteLn(_PF_TXT + Copy(Message, 6, Length(Message) - 6));
end;

function TBackup.GetIdent(const _S: String): String;
var
  _P: Integer;
begin
  Result := '';
  _P := Pos('=', _S);
  if (_P <> 0) then
    Result := Copy(_S, 1, _P - 1);
end;

function TBackup.GetValues(const _S: String): String;
var
  _P: Integer;
begin
  Result := '';
  _P := Pos('=', _S);
  if (_P <> 0) then
    Result := Copy(_S, _P + 1, Length(_S) - _P);
end;

function TBackup.GetBakFileName(const _File: String; const _Type: Integer): String;
const
  _WEEKDAYS: array [1..7] of String[10] =
    ('Sunday', 'Monday', 'Tuesday', 'Wednesday',
     'Thursday', 'Friday', 'Saturday');
begin
 case _Type of
   0: Result := _File;
   1: Result := _File + FormatDateTime('yyyymmdd', Now()) + '.fbk';
   2: Result := _File + FormatDateTime('yyyymmdd.hhmmss', Now()) + '.fbk';
   3: Result := _File + _WEEKDAYS[DayOfWeek(Now())] + '.fbk';
 end;
end;

procedure TBackup.StartBackup();
begin
  Exit;
end;

begin
  WriteLn('Please wait while Firebird backup utility is in progress...');
  WriteLn('');
  
  with (TBackup.Create()) do
  try
    StartBackup();
  finally
    Free();
  end;

  ReadLn;
end.
