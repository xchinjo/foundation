library floader;

uses
  SysUtils, Classes, IdTCPClient, IniFiles, Security, FileInfo;

{$R *.res}

procedure Ctrl_load(const _File, _Path: ShortString); stdcall;
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
        if (Pos('CONNECTED', SResponse) = 0) then
          Exit;

        WriteLn(LocalIP());
        ReadLn();

        if FileExists(_Path +  _File) then
        begin
          WriteLn('VERS ' + _File);
          SResponse := ReadLn();
          if ((SResponse <> 'NONE') AND
              (SResponse > GetFileVerionStringEx(
                 ExtractFilePath(ParamStr(0)) +  _File))) then
          begin
            DeleteFile(_Path +  _File);

            WriteLn('FILE ' + _File);

            FFile := TFileStream.Create(_Path +  _File, fmCreate);

            try
              ReadStream(FFile, -1, True);
            finally
              FFile.Free();
            end;
          end else
            WriteLn('NONE');
        end else
        begin
          WriteLn('VERF ' + _File);
          if (UpperCase(ReadLn()) = 'OK') then
          begin
            WriteLn('FILE ' + _File);

            FFile := TFileStream.Create(_Path +  _File, fmCreate);

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

exports
  Ctrl_load;

end.
