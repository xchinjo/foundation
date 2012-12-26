{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG FireBird Users Manager DLL Library                                  }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library fbuserman.bak;

uses SysUtils, JvUIBase, JvUIBLib, fbconnection;

{$R *.res}
type
  EUserException = Exception;

  TUIBProtocol = (
    proLocalHost,
    proTCPIP,
    proNetBEUI
  );
  
  TFBService = class
  private
    FLiBraryName: string;
    FUserName: string;
    FPassWord: string;
    FHost    : string;
    FProtocol: TUIBProtocol;
    FHandle  : IscSvcHandle;
    function CreateSPB: string; virtual;
    procedure SetLibraryName(const Lib: String);
  protected
    FLibrary: TUIBLibrary;

    procedure BeginService;
    procedure EndService;
  public
    constructor Create();
    destructor Destroy(); override;
  published
    property UserName: string read FUserName write FUserName;
    property PassWord: string read FPassWord write FPassWord;
    property Host: string read FHost write FHost;
    property Protocol: TUIBProtocol read FProtocol write FProtocol default proLocalHost;
    { Define wich library the connection use.}
    property LibraryName: string read FLiBraryName write SetLibraryName;
  end;

  TSecurityAction = (ActionAddUser, ActionDeleteUser, ActionModifyUser, ActionDisplayUser);

  TFBSecurity = class(TFBService)
  private
    FSecurityAction: TSecurityAction;

    FUser_Name: String;
    FUser_Id: Integer;
    FGroup_Id: Integer;
    FUser_Password: String;
    FFirst_Name: String;
    FMiddle_Name: String;
    FLast_Name: String;

    function AddParam(Value: String; Param: Char): String; overload;
    function AddParam(Value: Integer; Param: Char): String; overload;
  protected
    function CreateStartSPB(): String;
  public
    procedure Execute();
  published
    property Action: TSecurityAction read FSecurityAction write FSecurityAction;

    property User_Name: String read FUser_Name write FUser_Name;
    property User_Id: Integer read FUser_Id write FUser_Id;
    property Group_Id: Integer read FGroup_Id write FGroup_Id;
    property User_Password: String read FUser_Password write FUser_Password;
    property First_Name: String read FFirst_Name write FFirst_Name;
    property Middle_Name: String read FMiddle_Name write FMiddle_Name;
    property Last_Name: String read FLast_Name write FLast_Name;
  end;

{********************************* TFBService *********************************}
procedure TFBService.BeginService;
begin
  FLibrary.Load(FLiBraryName);
  case FProtocol of
    proLocalHost : FLibrary.ServiceAttach('service_mgr', FHandle, CreateSPB);
    proTCPIP     : FLibrary.ServiceAttach(Fhost + ':service_mgr', FHandle, CreateSPB);
    proNetBEUI    : FLibrary.ServiceAttach('\\'+ Fhost + '\service_mgr', FHandle, CreateSPB);
  end;
end;

constructor TFBService.Create();
begin
  FLibrary := TUIBLibrary.Create;
  FLiBraryName := GDS32DLL;
  FProtocol := proLocalHost;
  FHandle := nil;
end;

destructor TFBService.Destroy;
begin
  FLibrary.Free;
end;

function TFBService.CreateSPB: string;
  procedure AddString(id: char; var Str: string);
  begin
    if (Str <> '') then
      Result := Result + id + Char(length(Str)) + Str;
  end;
begin
  Result := isc_spb_version + isc_spb_current_version;
  AddString(isc_spb_user_name, FUserName);
  AddString(isc_spb_password, FPassWord);
end;

procedure TFBService.SetLibraryName(const Lib: String);
begin
  FLibrary.UnLoad;
  FLiBraryName := Lib;
end;

procedure TFBService.EndService;
begin
  FLibrary.ServiceDetach(FHandle);
end;

{******************************** TFBSecurity *********************************}
function TFBSecurity.AddParam(Value: String; Param: Char): String;
var
  Len: UShort;
begin
  Len := Length(Value);
  if (Len > 0) then
  begin
    Result :=
      Char(Param) + PChar(@Len)[0] + PChar(@Len)[1] + Value;
  end;
end;

function TFBSecurity.AddParam(Value: Integer; Param: Char): String;
begin
  Result :=
    Char(Param) + PChar(@Value)[0] + PChar(@Value)[1] +
    PChar(@Value)[2] + PChar(@Value)[3];
end;


function TFBSecurity.CreateStartSPB(): String;
begin
  case FSecurityAction of
    ActionAddUser:
    begin
      if ( Pos(' ', FUser_Name) > 0) then
        raise EUserException.Create('User name cannot be contained white space.');
      if (Length(FUser_Name) = 0) then
        raise EUserException.Create('User name cannot be blank.');

      Result := isc_action_svc_add_user;
      Result := Result + AddParam(FUser_Name, isc_spb_sec_username);
      Result := Result + AddParam(FUser_Id, isc_spb_sec_userid);
      Result := Result + AddParam(FGroup_Id, isc_spb_sec_groupid);
      Result := Result + AddParam(FUser_Password, isc_spb_sec_password);
      Result := Result + AddParam(FFirst_Name, isc_spb_sec_firstname);
      Result := Result + AddParam(FMiddle_Name, isc_spb_sec_middlename);
      Result := Result + AddParam(FLast_Name, isc_spb_sec_lastname);
    end;
    ActionDeleteUser:
    begin
      if (Length(FUser_Name) = 0) then
        raise EUserException.Create('User name cannot be blank.');

      Result := isc_action_svc_delete_user;
      Result := Result + AddParam(FUser_Name, isc_spb_sec_username);
    end;
    ActionModifyUser:
    begin
      if (Length(FUser_Name) = 0) then
        raise EUserException.Create('User name cannot be blank.');

      Result := isc_action_svc_modify_user;
      Result := Result + AddParam(FUser_Name, isc_spb_sec_username);
      Result := Result + AddParam(FUser_Password, isc_spb_sec_password);
      Result := Result + AddParam(FUser_Name, isc_spb_sec_firstname);
      Result := Result + AddParam(FMiddle_Name, isc_spb_sec_middlename);
      Result := Result + AddParam(FLast_Name, isc_spb_sec_lastname);
    end;
  end;
end;

procedure TFBSecurity.Execute();
begin
  BeginService();
  try
    FLibrary.ServiceStart(FHandle, CreateStartSPB());
  finally
    EndService();
  end;
end;

{****************************** Private Routine *******************************}
function GetFBSecurity(_Action: TSecurityAction = ActionAddUser): TFBSecurity;
begin
  Result := TFBSecurity.Create();
  with Result do
  begin
    UserName := GetSecurityUserID();
    PassWord := GetSecurityUserPWD();
    Protocol := proTCPIP;
    Host := GetDefaultServer();
    Action := _Action;
  end;
end;

{***************************** Exported Routine *******************************}
procedure AddUser(_UserName, _Password: String); stdcall;
begin
  with GetFBSecurity() do
  try
    User_Name := _UserName;
    User_Password := _Password;
    Execute();
  finally
    Free();
  end;
end;

procedure AddUserEx(_UserName, _Password, _FirstName, _MiddleName, _LastName: String;
  _UserID, _GroupID: Integer); stdcall;
begin
  with GetFBSecurity() do
  try
    User_Name := _UserName;
    User_ID := _UserID;
    Group_Id := _GroupID;
    User_Password := _Password;
    First_Name := _FirstName;
    Middle_Name := _MiddleName;
    Last_Name := _LastName;
    Execute();
  finally
    Free();
  end;
end;

procedure ModifyUser(_UserName, _Password,_FirstName, _MiddleName,
  _LastName: String); Stdcall;
begin
  with GetFBSecurity(ActionModifyUser) do
  try
    User_Name := _UserName;
    User_Password := _Password;
    First_Name := _FirstName;
    Middle_Name := _MiddleName;
    Last_Name := _LastName;
    Execute();
  finally
    Free();
  end;
end;

procedure ModifyUserEx(_UserName, _Password, _FirstName, _MiddleName, _LastName: String;
  _UserID, _GroupID: Integer); stdcall;
begin
  with GetFBSecurity(ActionModifyUser) do
  try
    User_Name := _UserName;
    User_ID := _UserID;
    Group_Id := _GroupID;
    User_Password := _Password;
    First_Name := _FirstName;
    Middle_Name := _MiddleName;
    Last_Name := _LastName;
    Execute();
  finally
    Free();
  end;
end;

procedure ChangePassword(_UserName, _Password: String); stdcall;
begin
  with GetFBSecurity(ActionModifyUser) do
  try
    User_Name := _UserName;
    User_Password := _Password;
    Execute();
  finally
    Free();
  end;
end;

procedure DeleteUser(_UserName: String); stdcall;
begin
  with GetFBSecurity(ActionDeleteUser) do
  try
    User_Name := _UserName;
    Execute();
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
