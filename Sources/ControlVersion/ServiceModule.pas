unit ServiceModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, FileInfo,
  IdTCPServer;

type
  TFileControlVersionManager = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
  private
    FPath: String;
    TCPServer: TIdTCPServer;

    procedure TCPServerExecute(AThread: TIdPeerThread);
  public
    function GetServiceController: TServiceController; override;
  end;

var
  FileControlVersionManager: TFileControlVersionManager;

implementation

uses Security, IniFiles;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  FileControlVersionManager.Controller(CtrlCode);
end;

function TFileControlVersionManager.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TFileControlVersionManager.TCPServerExecute(AThread: TIdPeerThread);
var
  SRequest: String;
  FileName: String;
  FFile: TFileStream;
begin
  with AThread.Connection do
  begin
    WriteLn('CONNECTED -P(' + IntToStr(TCPServer.DefaultPort) + ') -P:' +FPath);
    try
      SRequest := UpperCase(ReadLn());
      WriteLn('OK');
      SRequest := UpperCase(ReadLn());
      FileName := FPath + Trim(Copy(SRequest, 5, Length(SRequest) - 4));

      if (Pos('VERS', SRequest) <> 0) then
      begin
        if (FileExists(FileName)) then
        begin
          SRequest := GetFileVerionStringEx(FileName);
          WriteLn(SRequest);
        end else
          WriteLn('NONE');

        SRequest := UpperCase(ReadLn);

        if (SRequest <> 'NONE') then
        begin
          FFile := TFileStream.Create(FileName, fmOpenRead);
          try
            OpenWriteBuffer();
            WriteStream(FFile);
            CloseWriteBuffer();
          finally
            FFile.Free();
          end;
        end;
      end else
      begin
        if ((Pos('VERF', SRequest) <> 0) and FileExists(FileName)) then
        begin
          WriteLn('OK');
        end else
        begin
          WriteLn('NONE');
        end;

        SRequest := UpperCase(ReadLn);

        if (SRequest <> 'NONE') then
        begin
          FFile := TFileStream.Create(FileName, fmOpenRead);
          try
            OpenWriteBuffer();
            WriteStream(FFile);
            CloseWriteBuffer();
          finally
            FFile.Free();
          end;
        end;
      end;
    finally
      Disconnect();
    end;
  end;
end;

procedure TFileControlVersionManager.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  if (not Assigned(TCPServer)) then
    TCPServer := TIdTCPServer.Create(Self);

  with TIniFile.Create(SystemDir + '\crg_svr.conf') do
  try
    TCPServer.DefaultPort := ReadInteger('CTRL_VER', 'PORT', 9000);
    FPath := ReadString('CTRL_VER', 'PATH', '');
  finally
    Free();
  end;

  TCPServer.Active := True;
  TCPServer.OnExecute := TCPServerExecute;
end;

procedure TFileControlVersionManager.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  if (Assigned(TCPServer)) then
    FreeAndNil(TCPServer);
end;

procedure TFileControlVersionManager.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  TCPServer.Active := False;
  TCPServer.OnExecute := nil;
end;

end.
