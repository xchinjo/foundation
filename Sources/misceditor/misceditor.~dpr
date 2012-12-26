library misceditor;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  JvUIB,
  MainMiscDataForm in 'MainMiscDataForm.pas' {frmMainMiscData},
  HeaderDataEditorForm in 'HeaderDataEditorForm.pas' {frmHeaderDataEditor};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmMainMiscData.Create(_MainApp);
  with TfrmMainMiscData(Result) do
  begin
    trnsDefault.DataBase := _DBConn;

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
 