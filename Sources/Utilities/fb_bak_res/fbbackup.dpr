program fbbackup;

uses
  Forms,
  BackupForm in 'BackupForm.pas' {frmBackForm},
  UserPWDForm in 'UserPWDForm.pas' {frmUserPWD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBackForm, frmBackForm);
  Application.Run;
end.
