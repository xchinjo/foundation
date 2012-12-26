{ *********************************************************************** }
{                                                                         }
{ The CRG Software NGF Runtime Library                                    }
{ Personal Infomation Manager                                             }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{ The original code has been written by:                                  }
{   Montri Patchaiyo (thecrgrt@yahoo.com); January 03, 2006               }
{                                                                         }
{ Add the following information when it was modified                      }
{ ======================================================================= }
{ Modified By: __________________________________________________________ }
{ Modified Date: ________________________________________________________ }
{ Note : ________________________________________________________________ }
{                                                                         }
{ *********************************************************************** }

library cif_cus;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  Controls,
  JvUIB,
  MainPersonalForm in 'MainPersonalForm.pas' {frmMainPersonal},
  CustomerListFrame in 'CustomerListFrame.pas' {frmCustomerList: TFrame},
  PersonalInfoForm in 'PersonalInfoForm.pas' {frmPersonalInfo: TFrame};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmMainPersonal.Create(_MainApp);

  TfrmMainPersonal(Result).DBConn := _DBConn;
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

function CreateCustomerListFrame(_Parent: TWinControl; _DBConn: TJvUIBDataBase;
  _SearchString: String; _Align: TAlign): TFrame; stdcall;
begin
  Result :=
    CustomerListFrame.CreateCustomerListFrame(
      _Parent, _DBConn, _SearchString, _Align);
end;

exports
  Execute,
  CreateCustomerListFrame;

end.
