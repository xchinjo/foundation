library receive;

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
  ReceiveFrm in 'ReceiveFrm.pas' {frmReceive},
  DonatorProfileFrm in 'DonatorProfileFrm.pas' {frmDonatorProfile},
  CommonLIB in '..\LIB\CommonLIB.pas',
  SearchFrm in 'SearchFrm.pas' {frmSearch},
  ObjectiveFrm in 'ObjectiveFrm.pas' {frmObjective},
  FundListFrm in 'FundListFrm.pas' {frmFundList},
  FundInfoFrm in 'FundInfoFrm.pas' {frmFundInfo},
  OvjectiveAFrm in 'OvjectiveAFrm.pas' {frmOvjectiveA},
  uCiaXml in '..\LIB\uCiaXml.pas',
  EditItemFrm in 'EditItemFrm.pas' {frmEditItem},
  SelectBankFrm in 'SelectBankFrm.pas' {frmSelectBank},
  SelectAccCodeFrm in 'SelectAccCodeFrm.pas' {frmSelectAccCode};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  //Application.Initialize;
  result := TfrmReceive.Create(_MainApp);

  if initSqlConnection(TfrmReceive(result).Conn)
  then
  begin
    //TfrmAppInfo(Result).trnsDefault.DataBase := _DBConn;
    if (_Type = swModal) then
    begin
      result.FormStyle := fsNormal;
      result.WindowState := wsNormal;
      result.WindowState:=wsMaximized;

      result.ShowModal;
      FreeAndNil(Result);
    end else
    begin
      result.FormStyle := fsMDIChild;
      result.Show();
    end;


    //Result:=frmReceive;
  end;
end;

exports
  Execute;

end.

