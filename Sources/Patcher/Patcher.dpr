program Patcher;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  SelectPathForm in 'SelectPathForm.pas' {frmSelectPath},
  uCiaXml in '..\LIB\uCiaXml.pas',
  CommonLIB in '..\LIB\CommonLIB.pas',
  CommonUtils in '..\LIB\CommonUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Patcher';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSelectPath, frmSelectPath);
  Application.Run;
end.
