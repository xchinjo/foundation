program Installer;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  SelectPathForm in 'SelectPathForm.pas' {frmSelectPath};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'UIT-Software System Installation';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSelectPath, frmSelectPath);
  Application.Run;
end.
