library setting;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Windows,
  Forms,
  JvUIB,
  CommonLIB in '..\LIB\CommonLIB.pas',
  CommonUtils in '..\LIB\CommonUtils.pas',
  uCiaXml in '..\LIB\uCiaXml.pas',
  SettingFrm in 'SettingFrm.pas' {frmSetting};

{$R *.res}
type
  TShowWindowType = (swNone, swModal, swNormal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: TDLLParameter): TForm; stdcall;
begin
  Result := TfrmSetting.Create(_MainApp);

  if initSqlConnection(TfrmSetting(Result).Conn)
  then
  begin
    if (_Type = swModal) then
    begin
      Result.FormStyle := fsNormal;
      Result.WindowState := wsNormal;

      Result.ShowModal;
      FreeAndNil(Result);
    end else
    begin

      TfrmSetting(Result).Branch:=_Parameter.Branch;
      TfrmSetting(Result).UserId:=_Parameter.UserID;

      Result.FormStyle := fsMDIChild;
      Result.WindowState:=wsMaximized;
      Result.Show();

    end;
  end;
end;

exports
  Execute;
begin
end.
