program fin_app;

uses
  Forms,
  PersonalEntryForm in 'PersonalEntryForm.pas' {frmPersonalEntry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Application for H/P, L/S financial';
//  Application.CreateForm(TfrmPersonalEntry, frmPersonalEntry);
  Application.Run;
end.
