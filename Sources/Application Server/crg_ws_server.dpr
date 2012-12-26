library crg_ws_server;

uses
  ActiveX,
  ComObj,
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  MainWebModule in 'MainWebModule.pas' {WM: TWebModule},
  MainWSData in 'MainWSData.pas' {WSData: TSoapDataModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TWM, WM);
  Application.Run;
end.
