library RGLib;

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
  GenReportFrm in 'GenReportFrm.pas' {frmGenReport};





{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);


function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: TDLLParameter;DefaultValue:TList): TForm; stdcall;
begin
  Result := TfrmGenReport.Create(_MainApp);

  if initSqlConnection(TfrmGenReport(Result).Conn)
  then
  begin
      TfrmGenReport(Result).reportCode:=_Parameter.ReportCode;
      if DefaultValue<>nil then
      TfrmGenReport(Result).defaultValue:=DefaultValue;

      TfrmGenReport(Result).UserID:=_Parameter.UserID;
      TfrmGenReport(Result).Branch:=_Parameter.Branch;

      Result.FormStyle := fsNormal;
      Result.WindowState := wsNormal;



      Result.ShowModal;
      FreeAndNil(Result);
  end;
end;


(*

function GenReport(_MainApp: TApplication;AParent:TWinControl; _Parameter: TDLLParam;_DBConn:TSocketConnection): TForm;export; stdcall;

begin

 if DllApplication=nil then
 begin
   DllApplication:=Application;
   Application:=_MainApp;
 end;




  // Load Deposit Reconcile
 // if _Parameter.Param1='DEP001' then
    if not Assigned(frmGenReport) then
    begin
        frmGenReport := TfrmGenReport.Create(Application);

//        frmGenReport.SockCon.Connected:=false;
//        initSockConn(frmGenReport.SockCon);

        frmGenReport.FormStyle := fsNormal;
        frmGenReport.KeyPreview:=true;
        //frmGenReport._Params:= 'M02';//_Parameter.Param1;   // report code
        frmGenReport.reportCode:=_Parameter.Param1;// 'M02';//_Parameter.Param1;   // report code
//        frmGenReport.reportTitle:=_Parameter.

        frmGenReport.UserID:=_Parameter.UserID;
        frmGenReport.Branch:=_Parameter.Branch;
        frmGenReport.PDM:=_Parameter.PDM;
        frmGenReport.PDT:=_Parameter.PDT;
        frmGenReport.WorkStation:=_Parameter.WorkStation;
        frmGenReport.ShowModal;
        FreeAndNil(frmGenReport);
    end;

   Result := frmGenReport;
end;




*)

exports
execute;
// GenReport;




begin

end.
