program config;

uses
  Windows,
  Messages, 
  Forms,
  MainForm in 'MainForm.pas' {frmMain};

{$R *.res}

var
  _Handle: THandle;
begin
  _Handle := FindWindow('TfrmMain', 'CRG - Application  Loader Configuration');//'CRG - Configuration Tools');
  if (_Handle <> 0) then
  begin
    SetForegroundWindow(_Handle);
    if (IsIconic(_Handle)) THen
      SendMessage(_Handle, WM_SYSCOMMAND, SC_RESTORE, 0);

    ShowWindow(_Handle, SW_SHOWNORMAL);
    Exit;
  end;

  Application.Initialize;
  Application.Title := 'CRG - Configuration Tools';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
