program hpls_customer;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'H/P, L/S Customer';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
