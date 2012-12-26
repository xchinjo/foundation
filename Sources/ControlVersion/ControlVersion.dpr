program ControlVersion;

uses
  SvcMgr,
  ServiceModule in 'ServiceModule.pas' {FileControlVersionManager: TService};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Control Version';
  Application.CreateForm(TFileControlVersionManager, FileControlVersionManager);
  Application.Run;
end.
