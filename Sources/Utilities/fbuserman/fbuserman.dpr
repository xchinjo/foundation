{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG FireBird Users Manager DLL Library                                  }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library fbuserman;

uses SysUtils, jvuib, fbconnection;

{$R *.res}


{****************************** Private Routine *******************************}
function GetFBSecurity(): TJvUIBSecurity;
begin
  Result := TJvUIBSecurity.Create(nil);
  with Result do
  begin
    UserName := GetSecurityUserID();
    PassWord := GetSecurityUserPWD();
    Protocol := proTCPIP;
    Host := GetDefaultServer();
  end;
end;

{***************************** Exported Routine *******************************}
procedure AddUser(_UserName, _Password: String); stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    Pass := _Password;
    AddUser();
  finally
    Free();
  end;
end;

procedure AddUserEx(_UserName, _Password, _FirstName, _MiddleName, _LastName: String;
  _UserID, _GroupID: Integer); stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    UserID := _UserID;
    GroupID := _GroupID;
    Pass := _Password;
    FirstName := _FirstName;
    MiddleName := _MiddleName;
    LastName := _LastName;
    AddUser();
  finally
    Free();
  end;
end;

procedure ModifyUser(_UserName, _Password,_FirstName, _MiddleName,
  _LastName: String); Stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    Pass := _Password;
    FirstName := _FirstName;
    MiddleName := _MiddleName;
    LastName := _LastName;
    ModifyUser();
  finally
    Free();
  end;
end;

procedure ModifyUserEx(_UserName, _Password, _FirstName, _MiddleName, _LastName: String;
  _UserID, _GroupID: Integer); stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    UserID := _UserID;
    GroupID := _GroupID;
    Pass := _Password;
    FirstName := _FirstName;
    MiddleName := _MiddleName;
    LastName := _LastName;
    ModifyUser();
  finally
    Free();
  end;
end;

procedure ChangePassword(_UserName, _Password: String); stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    Pass := _Password;
    ModifyUser();
  finally
    Free();
  end;
end;

procedure DeleteUser(_UserName: String); stdcall;
begin
  with GetFBSecurity() do
  try
    User := _UserName;
    DeleteUser();
  finally
    Free();
  end;
end;

exports
  AddUser,
  AddUserEx,
  ModifyUser,
  ModifyUserEx,
  ChangePassword,
  DeleteUser;

end.
