program StopWatchApp;

uses
  Forms,
  AppStopWatchFrm in 'AppStopWatchFrm.pas' {frmAppStopWatch},
  StopWatch in 'StopWatch.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAppStopWatch, frmAppStopWatch);
  Application.Run;
end.
