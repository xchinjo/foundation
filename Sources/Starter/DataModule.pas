unit DataModule;

interface

uses
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient;

type
  TDM = class(TDataModule)
  private
    { Private declarations }
  public
    procedure LoadProgram(const File_Name: String);
  end;

var
  DM: TDM;

implementation

uses IniFiles, Security, FileInfo;

{$R *.dfm}

procedure TDM.LoadProgram(const File_Name: String);
var
  TCPClient: TIdTCPClient;
  SResponse: String;
  FFile: TFileStream;
begin
  TCPClient := TIdTCPClient.Create(nil);
  try
    with TIniFile.Create(SystemDir + _CRG_CONFIG) do
    try
      TCPClient.Host := ReadString('CONTROLVERSION', 'SERVER', '');
      TCPClient.Port := ReadInteger('CONTROLVERSION', 'PORT', 9000);
    finally
    end;

    TCPClient.ReadTimeout := 0;

    with TCPClient do
    begin
      Connect();
      while Connected do
      try
        SResponse := UpperCase(ReadLn);
        if (SResponse <> 'CONNECTED') then
          Exit;

        WriteLn(LocalIP());
        ReadLn();

        if FileExists(ExtractFilePath(ParamStr(0)) +  File_Name) then
        begin
          WriteLn('VERS ' + File_Name);
          SResponse := ReadLn();
          if ((SResponse <> 'NONE') AND
              (SResponse > GetFileVerionStringEx(
                 ExtractFilePath(ParamStr(0)) +  File_Name))) then
          begin
            DeleteFile(ExtractFilePath(ParamStr(0)) +  File_Name);

            WriteLn('FILE ' + File_Name);

            FFile :=
              TFileStream.Create(
                ExtractFilePath(ParamStr(0)) +  File_Name, fmCreate);

            try
              ReadStream(FFile, -1, True);
            finally
              FFile.Free();
            end;
          end else
            WriteLn('NONE');
        end else
        begin
          WriteLn('VERF ' + File_Name);
          if (UpperCase(ReadLn()) = 'OK') then
          begin
            WriteLn('FILE ' + File_Name);

            FFile :=
              TFileStream.Create(
                ExtractFilePath(ParamStr(0)) +  File_Name, fmCreate);

            try
              ReadStream(FFile, -1, True);
            finally
              FFile.Free();
            end;
          end else
            WriteLn('NONE');
        end;
      finally
        Disconnect();
      end;
    end;
  finally
    TCPClient.Free();
  end;
end;

end.
