library cif_acc;

uses
  Forms,
  JvUIB,
  MainAccForm in 'MainAccForm.pas' {frmMainAcc},
  AccountInfoForm in 'AccountInfoForm.pas' {frmAccInfo};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  frmMainAcc := TfrmMainAcc.Create(_MainApp);
  frmMainAcc.trnsDefault.DataBase := _DBConn;
  if (_Type = swModal) then
  begin
    frmMainAcc.FormStyle := fsNormal;
    frmMainAcc.WindowState := wsNormal;
    frmMainAcc.ShowModal();
    frmMainAcc.Free();
    frmMainAcc := nil;
  end else
  begin
    frmMainAcc.FormStyle := fsMDIChild;
    frmMainAcc.Show();
  end;

  Result := frmMainAcc;
end;

exports
  Execute;

end.
 