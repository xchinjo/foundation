library misceditor;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  pFIBDatabase,
  MainMiscDataForm in 'MainMiscDataForm.pas' {frmMainMiscData},
  HeaderDataEditorForm in 'HeaderDataEditorForm.pas' {frmHeaderDataEditor};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TpFIBDatabase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmMainMiscData.Create(_MainApp);
  with TfrmMainMiscData(Result) do
  begin
    DBTrans.DefaultDatabase := _DBConn;
    dsMiscHeaderData.Database := _DBConn;
    dsMiscHeaderData.Transaction := DBTrans;
    dsMiscHeaderData.UpdateTransaction := DBTrans;
    dsMiscDetailData.Database := _DBConn;
    dsMiscDetailData.Transaction := DBTrans;
    dsMiscDetailData.UpdateTransaction := DBTrans;
    
    if (_Type = swModal) then
    begin
      FormStyle := fsStayOnTop;
      WindowState := wsNormal;
      ShowModal();
      FreeAndNil(Result);
    end else
    begin
      FormStyle := fsMDIChild;
      Show();
    end;
  end;
end;

exports
  Execute;

end.
 