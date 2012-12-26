library langeditor;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  JvUIB,
  LanguageEditorForm in 'LanguageEditorForm.pas' {frmLanguageEditor};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmLanguageEditor.Create(_MainApp);

  TfrmLanguageEditor(Result).trnsDefault.DataBase := _DBConn;
  if (_Type = swModal) then
  begin
    Result.FormStyle := fsNormal;
    Result.WindowState := wsNormal;
    Result.ShowModal();
    FreeAndNil(Result);
  end else
  begin
    Result.FormStyle := fsMDIChild;
    Result.Show();
  end;
end;

exports
  Execute;

end.
 