program rundll32;

uses
  Windows,Forms,
  JvUIB,
  IniFiles,
  fbconnection;

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

  TExecuteProgram = function(
    _MainApp: Pointer; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: String): Pointer; stdcall;

var
  _Handle: THandle;
  _ExecuteProgram: TExecuteProgram;
  _DBConn: TJvUIBDataBase;
begin





  if (ParamCount <> 4) then
    Exit;

  _Handle := LoadLibrary(PChar(ParamStr(1)));
  if (_Handle <> 0) then
  begin
    _ExecuteProgram := GetProcAddress(_Handle, 'Execute');
    try
      if(Assigned(_ExecuteProgram)) then
      begin
        _DBConn := TJvUIBDataBase.Create(nil);
        try
          LoadConnection(_DBConn);

          _DBConn.UserName := ParamStr(2);
          _DBConn.PassWord := ParamStr(3);
          //_DBConn.Connected := True;



          _ExecuteProgram(nil, _DBConn, swModal, ParamStr(4));
        finally
          if (_DBConn.Connected) then
            _DBConn.Connected := False;

          _DBConn.Free();
        end;
      end;
    finally
      FreeLibrary(_Handle);
    end;
  end;

end.
