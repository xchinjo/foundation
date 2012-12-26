program starter;

uses
  Windows, Messages, SysUtils;

{$R *.res}

var
  WHandle: THandle;

procedure LoadProgram(const File_Name: String);
var
  _Handle: THandle;
  _Ctrl_load: procedure(const _File, _Path: ShortString); stdcall;
begin
  _Handle := LoadLibrary('floader.dll');
  if (_Handle <> 0) then
  begin
    _Ctrl_load := GetProcAddress(_Handle, 'Ctrl_load');

    if(Assigned(_Ctrl_load)) then
    _Ctrl_load(File_Name, ExtractFilePath(ParamStr(0)));

    FreeLibrary(_Handle);
  end;
end;

begin
  if (ParamCount <> 1) then
  begin
    MessageBox(0,
      PChar('No parameter specified, Program will be terminated.'#10#10#13 +
        'Usage:'#10#13'     starter.exe any_application.exe'),
      'Warning', 0 or MB_ICONEXCLAMATION);

    Exit;
  end;

  WHandle := FindWindow('TApplication', 'Starter Application');
  if WHandle <> 0 then
  begin
    SetForegroundWindow(WHandle);
    if IsIconic(WHandle ) THen
       SendMessage(WHandle, WM_SYSCOMMAND, SC_RESTORE,0);

    ShowWindow(WHandle, SW_SHOWNORMAL);
    Halt(0);
  end;

  ChDir(ExtractFilePath(ParamStr(0)));

  try
    LoadProgram(Trim(ParamStr(1)));
  except
  end;

  WinExec(PChar(Trim(ParamStr(1)) + ' EXEC'), SW_SHOW);
end.
