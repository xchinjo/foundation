library FndUtils;

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
  uCiaXml in '..\LIB\uCiaXml.pas',
  CommonLIB in '..\LIB\CommonLIB.pas',
  CommonUtils in '..\LIB\CommonUtils.pas',
  FundListFrm in 'FundListFrm.pas' {frmFundList};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function SelectFund(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: TDLLParameter; out _Output : TDLLParameter): TForm; stdcall;
begin
  Result := TfrmFundList.Create(_MainApp);

  if initSqlConnection(TfrmFundList(Result).Conn)
  then
  begin
    if (_Type = swModal) then
    begin
      Result.FormStyle := fsNormal;
      Result.WindowState := wsNormal;
      TfrmFundList(Result).DLLParameter := _Parameter;
      Result.ShowModal;

      _Output.ParameterString1:=TfrmFundList(Result).SelectCode;
      _Output.ParameterString2:=TfrmFundList(Result).selectName;

      FreeAndNil(Result);
    end else
    begin

      Result.FormStyle := fsMDIChild;
      Result.WindowState:=wsMaximized;
      Result.Show();

    end;
  end;
end;

exports
  SelectFund;
begin
end.
