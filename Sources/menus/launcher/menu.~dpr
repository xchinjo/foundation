program menu;

uses
  Windows,
  Messages,
  Forms,
  Tlhelp32,
  sysutils,
  MainForm in 'MainForm.pas' {frmMainMenu},
  ChangPWDForm in 'ChangPWDForm.pas' {frmChangPWD},
  CommonLIB in '..\..\LIB\CommonLIB.pas',
  CommonUtils in '..\..\LIB\CommonUtils.pas',
  uCiaXml in '..\..\LIB\uCiaXml.pas';

{$R *.RES}
var
  WHandle: THandle;

begin
  //CoInitialize(nil);
  //if ((ParamCount() <> 1) and (ParamStr(1) <> 'EXEC')) then
  //  Exit;

  WHandle := FindWindow('TApplication', 'CRG - Main Menus');
  if (WHandle <> 0) then
  begin
    SetForegroundWindow(WHandle);
    if (IsIconic(WHandle)) THen
       SendMessage(WHandle, WM_SYSCOMMAND, SC_RESTORE, 0);

    ShowWindow(WHandle, SW_SHOWNORMAL);
    Exit;
  end;

  Application.Initialize;
  Application.Title := 'UIT - Main Menus';
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.Run;
end.
