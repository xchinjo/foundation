Unit MainWSData;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm,// IAppSvrSOAP,
  Provider, DBXpress, FMTBcd, DB, SqlExpr;

type
  {$I crg_ws_server.inc}

  TWSData = class(TSoapDataModule, IWSData, IAppServerSOAP, IAppServer)
    scConnection: TSQLConnection;
    dspMenuData: TDataSetProvider;
    dspData: TDataSetProvider;
    dsMenuData: TSQLDataSet;
    dsData: TSQLDataSet;
    procedure SoapDataModuleCreate(Sender: TObject);
  private
    FUserId, FPassword: String;
    FSignedOn: Boolean;

    FDatabaseServer: String;
    FDatabaseName: String;
  public
    function SignOn(_UserId, _Password: WideString; out _sResult: WideString): WordBool; stdcall;
    function SignOff(): WordBool; stdcall;
    function ExecSQL(_CommandText: WideString): WordBool; stdcall;
  end;

implementation

uses IniFiles, Security;

{$R *.DFM}

{$I NGF_MAN.INC}

procedure TWSDataCreateInstance(out obj: TObject);
begin
 obj := TWSData.Create(nil);
end;

procedure TWSData.SoapDataModuleCreate(Sender: TObject);
begin
  with TIniFile.Create(SystemDir + _SVR_CONFIG) do
  try
    FDatabaseServer := ReadString('DATABASE', 'SERVER', '');
    FDatabaseName := ReadString('DATABASE', 'NAME', '');
  finally
    Free();
  end;

  scConnection.Params.Values['Database'] := FDatabaseServer + ':' + FDatabaseName;
  FSignedOn := False;
end;

function TWSData.SignOn(_UserId, _Password: WideString; out _sResult: WideString): WordBool;
begin
  SignOff();
  Result := False;

  FUserId := _UserId;
  FPassword := _Password;

  if (scConnection.Connected) then
    scConnection.Close();

  scConnection.Params.Values['User_Name'] := NGF_DEFAULT_UID;
  scConnection.Params.Values['Password'] := NGF_DEFAULT_PWD;

  try
    scConnection.Open();

    dsData.CommandText :=
      'SELECT RESULT FROM SP_VERIFY_USER(' +
      QuotedStr(Trim(FUserId)) + ', ' +
      QuotedStr(EncryptEx(FPassword)) +  ')';

    dsData.Open();

    Result := (dsData.FieldByName('RESULT').AsInteger = 0);
    _sResult := '00'; //IntToStr(dsData.FieldByName('RESULT').AsInteger);
    if (Length(_sResult) < 2) then
      _sResult := '0' + _sResult;

    case dsData.FieldByName('RESULT').AsInteger of
      -2:
      begin
        _sResult :=
          _sResult +
          'Password is not valid.'#10#13 +
          'The password is case sensitive, be careful to types its.';
        Exit;
      end;
      -1:
      begin
        _sResult :=
          _sResult +
          'User account does not exist';
        Exit;
      end;
      1:
      begin
        _sResult :=
          _sResult +
          'User account has been disabled, ' +
          'contact your aministrator to be enabled.';
        Exit;
      end;
      2:
      begin
        _sResult :=
          _sResult +
          'Password was expired, You must be re-entered new password';
        Exit;
      end;
      3:
      begin
        _sResult :=
          _sResult +
          'User account has been locked by your administrator.';
        Exit;
      end;
      99:
      begin
        _sResult :=
          _sResult +
          'Password does not exist on your profile, ' +
          'it necessary to be created a new password.';
        Exit;
      end;
    end;
  except
    on E: Exception do
    begin
      _sResult := '00' + E.Message;
      Exit;
    end;
  end;

  scConnection.Close();
  scConnection.Params.Values['User_Name'] := FUserId;
  scConnection.Params.Values['Password'] := FPassword;

  try
    scConnection.Open();
  except
    on E: Exception do
    begin
      _sResult := '00' + E.Message;
      Exit;
    end;
  end;

  dsMenuData.ParamByName('USER_ID').AsString := FUserId;

  FSignedOn := True;
  Result := True;
end;

function TWSData.SignOff(): WordBool;
begin
  FSignedOn := False;
  Result := True;
end;

function TWSData.ExecSQL(_CommandText: WideString): WordBool;
begin
  Result := (scConnection.ExecuteDirect(_CommandText) = 0);
end;

initialization
   InvRegistry.RegisterInvokableClass(TWSData, TWSDataCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IWSData));
end.
