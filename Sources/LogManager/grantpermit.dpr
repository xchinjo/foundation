library grantpermit;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  pFIBDatabase,
  GrantManagerForm in 'GrantManagerForm.pas' {frmGrantManager};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TpFIBDatabase;
  _Type: TShowWindowType; _Parameter: ShortString): TForm; stdcall;
begin
  Result := TfrmGrantManager.Create(_MainApp);

  with (TfrmGrantManager(Result)) do
  begin
    DBTrans.DefaultDatabase := _DBConn;
    dsTemp.Database := _DBConn;
    dsTemp.Transaction := DBTrans;

    dsObjectList.Database := _DBConn;
    dsObjectList.Transaction := DBTrans;
    if (_Type = swModal) then
    begin
      FormStyle := fsStayOnTop;
      WindowState := wsNormal;
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
      BorderIcons := [biSystemMenu];

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
 