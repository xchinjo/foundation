library grantorpremit;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  pFIBDatabase;

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TpFIBDatabase;
  _Type: TShowWindowType; _Parameter: ShortString): TForm; stdcall;
begin
  MessageBox(0, 'Grant Manager', 'Message', 0);
  Result := nil; //Create form here
  Exit; // For only temp_ext.dll

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
 