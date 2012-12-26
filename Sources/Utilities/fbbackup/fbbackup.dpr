program fbbackup;

uses
  Forms,
  BackupForm in 'BackupForm.pas' {frmBackForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBackForm, frmBackForm);
  Application.Run;
end.
