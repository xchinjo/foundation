unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs,
  cxLookAndFeelPainters, ExtCtrls, AppEvnts, jvuib, ImgList, Controls,
  Menus, DB, jvuibdataset, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, ComCtrls, ToolWin, cxGraphics, cxLookAndFeels, xTabs,
  XPMenu, JvExControls, JvXPCore, JvXPBar, JvExForms, JvScrollBox,
  JvExExtCtrls, JvNetscapeSplitter, JvExtComponent, JvPanel, JvBevel,
  cxMaskEdit, cxDropDownEdit,Tlhelp32, DBXpress, FMTBcd, DBClient,
  Provider, SqlExpr;

{$I CRG_WM_MSG.INC}

type
  PCurrentMenuItem = ^TCurrentMenuItem;
  TCurrentMenuItem = record
    Parent_ID: Integer;
    MenuItem: TMenuItem;

    Prior: PCurrentMenuItem;
  end;

  TProgramItemInfo = packed record
    ProgramName: String;
    Description: String;
    Paramrter: String;
    MainFormHandle: TForm;
    DLLHandled: THandle;
    AppClose: TCloseEvent;
    AppActivate: TNotifyEvent;
    MenuItem: TMenuItem;
    Tag : integer;
  end;
  TProgramsItemInfo = array of TProgramItemInfo;

  TfrmMainMenu = class(TForm)
    Status: TStatusBar;
    dbcDefault: TJvUIBDataBase;
    dsMenuData1: TJvUIBDataSet;
    dsMenuData1PARENT_ID: TIntegerField;
    dsMenuData1RECORD_ID: TIntegerField;
    dsMenuData1ORDER_ITEM: TIntegerField;
    dsMenuData1NAME: TStringField;
    dsMenuData1SHORTCUT: TStringField;
    dsMenuData1APP_NAME: TStringField;
    dsMenuData1PARAMS: TStringField;
    dsMenuData1ICON: TBlobField;
    dsMenuData1DESCRIPTION: TStringField;
    trnsDefault: TJvUIBTransaction;
    imgList1: TImageList;
    pnSignOnPanel: TPanel;
    Label3: TLabel;
    Image1: TImage;
    gbBox: TGroupBox;
    pnServerInfo: TPanel;
    lbDatabaseName: TLabel;
    edDatabaseName: TcxTextEdit;
    pnSecurity: TPanel;
    lbUserID: TLabel;
    lbPassword: TLabel;
    edUserID: TcxTextEdit;
    edPassword: TcxTextEdit;
    Panel1: TPanel;
    btnSignOn: TcxButton;
    btnExit: TcxButton;
    lbVersion: TLabel;
    dsSQL: TJvUIBQuery;
    dbcFileCtrlVersion: TJvUIBDataBase;
    trnFileCtrlVersion: TJvUIBTransaction;
    tmTimer: TTimer;
    tmFreeLib: TTimer;
    aEvents: TApplicationEvents;
    xTab: TxTabs;
    XPMenu1: TXPMenu;
    pnLeft: TJvScrollBox;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    PopupMenu00: TPopupMenu;
    mmRunningProgram: TMenuItem;
    JvXPBar1: TJvXPBar;
    lbFPoint: TLabel;
    cmbLocation: TcxComboBox;
    Button1: TButton;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    cdsMenuData: TClientDataSet;
    cdsLogin: TClientDataSet;
    cdsTemp: TClientDataSet;
    
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmSignOnOffClick(Sender: TObject);
    procedure mmChangePasswordClick(Sender: TObject);
    procedure mmLanguageThaiClick(Sender: TObject);
    procedure mmAppLoaderCRGPLClick(Sender: TObject);
    procedure mmAboutAppLoaderClick(Sender: TObject);
    procedure mmAboutProgramClick(Sender: TObject);
    procedure mmCloseClick(Sender: TObject);
    procedure btnSignOnClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSignOnOffClick(Sender: TObject);
    procedure btnAbountClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edDatabaseServerKeyPress(Sender: TObject; var Key: Char);
    procedure tmTimerTimer(Sender: TObject);
    procedure tmFreeLibTimer(Sender: TObject);
    procedure aEventsHint(Sender: TObject);
    procedure xTabTabChange(Sender: TObject);
    procedure xTabCloseTab(Sender: TObject; Index: Integer;
      var Close: Boolean);

  private
    UID : string;
    FUserID: String;
    FBranch : string;
    FPassword: String;

    FMenusLanguage: String;
    FMenuReloaded: Boolean;

    FAboutProgramText: String;

    FProgramsItemInfo: TProgramsItemInfo;
    FCurrentMenuItem: PCurrentMenuItem;

    FExecProgramName: String;
    FFreeHandled: THandle;

    procedure UnloadMenu();
    procedure LoadMenu();
    procedure MenuItemsClick(Sender: TObject);

    procedure AppExtClose(Sender: TObject; var Action: TCloseAction);
    procedure AppExtCloseA(Sender: TObject; var Action: TCloseAction);
    procedure AppExtActivate(Sender: TObject);
    procedure RunningProgramClick(Sender: TObject);

    procedure LoadProgram(const File_Name: String);

    procedure ShowServerInfoPanel();
    procedure HideServerInfoPanel();
    procedure HideSignOnPanel();
    procedure ShowSignOnPanel();

    procedure ExecByName(const _AppName: String);

    function ExecSQL(const _CommandText: String): Boolean;
    procedure SetWrkUsr(const _UserID, Job_Desc: String);

    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
    procedure SignedOff(var Message: TMessage); message WM_SIGNOFF;
    procedure ExecAppExt(var Message: TMessage); message WM_EXEC_PRG;
    procedure ExecAppChar(var Message: TMessage); message WM_PRG_CHAR;

  public
    SignOnTime: Integer;
    OldUserName: String;

    procedure UpdateSystemMenu();
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

uses fshow, crgSec, fbconnection, fbuserman, fctrlversion, ChangPWDForm,
  CommonLIB, CommonUtils;

{$R *.dfm}

var
  PN_SIGNON_HEIGH: Integer;
  PN_BOX_HEIGH: Integer;

  PN_SEC_TOP: Integer;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

//************************* Begin Menu Loader Engine *************************//
function FindPriorItem(_CurrentMenuItem: PCurrentMenuItem;
  Parant_ID: Integer): PCurrentMenuItem;
begin
  Result := _CurrentMenuItem;

  while ((Result <> nil) and (Result^.Parent_ID <> Parant_ID)) do
    Result := Result^.Prior;
end;



function GotoPriorItem(_CurrentMenuItem: PCurrentMenuItem;
  Parant_ID: Integer): PCurrentMenuItem;
begin
  Result := _CurrentMenuItem;

  while ((Result <> nil) and (Result^.Parent_ID <> Parant_ID) ) do
  begin
    _CurrentMenuItem := Result;
    Result := Result^.Prior;
    Dispose(_CurrentMenuItem);
  end;
end;

function CreateNextItem(_CurrentMenuItem: PCurrentMenuItem;
  _Parent_ID: Integer; _MenuItem: TMenuItem): PCurrentMenuItem;
begin
  if ((_CurrentMenuItem <> nil) and (_CurrentMenuItem^.Parent_ID = _Parent_ID)) then
  begin
    Result := _CurrentMenuItem;
    Exit;
  end;

  if (FindPriorItem(_CurrentMenuItem, _Parent_ID) = nil) then
  begin
    New(Result);

    Result^.Parent_ID := _Parent_ID;
    Result^.MenuItem := _MenuItem;
    Result^.Prior := _CurrentMenuItem;
  end else
    Result := GotoPriorItem(_CurrentMenuItem, _Parent_ID);
end;

procedure FreeAllItem(_CurrentMenuItem: PCurrentMenuItem);
var
  _C: PCurrentMenuItem;
begin
  _C := _CurrentMenuItem;

  if (_C = nil) then
    Exit;

  if (_C^.Prior <> nil) then
  begin
    while (_C^.Prior <> nil) do
    begin
      _CurrentMenuItem := _C.Prior;
      Dispose(_C);
      _C := _CurrentMenuItem;
    end;
  end;

  Dispose(_CurrentMenuItem);
end;

procedure TfrmMainMenu.UnloadMenu();
var
  _P: Integer;
begin
 JvXPBar1.Items.Clear;
(*
  _P := mmMainMenu.Items.Count - 2;
  while (_P > -1) do
  begin
    mmMainMenu.Items.Delete(_P);
    Dec(_P);
  end;

  *)

  
end;

procedure TfrmMainMenu.LoadMenu();
const
  PULL_DOWN_ID = -1;
var
  _Parent_ID, _Position, _Tag, i,icount: Integer;
 // _Item: TMenuItem;
  _XPBarItem : TJvXPBarItem;
begin
//  dsMenuData.Params.ByNameAsString['USER_ID'] := FUserID;
//  dsMenuData.Params.ByNameAsString['LANGUAGE'] := FMenusLanguage;

  UnloadMenu();

  try


    cdsMenuData.Close;
    cdsMenuData.CommandText:=''+

    ' select  '+
    ' a.*,  '+
    ' b.*, '+
    ' c.*,  '+
    ' d.*,   '+
    ' d.NAME_TH as NAME,   '+
    ' d.DESC_THA as DESCRIPTION    '+
    ' from user_account a   '+
    ' left join UserRole b on a.us_role=b.role  and a.us_code=b.uid   '+
    ' left join RolesPermission c on b.role=c.RoleId   '+
    ' left join MTTMNU d on c.MenuId=d.RECORD_ID    '+
    ' where a.us_code='''+UID+'''  ';

    {
    ' select a.*,b.*,c.*,d.*,d.NAME_TH as NAME,d.DESC_THA as DESCRIPTION from user_account a '+
    ' left join UserRole b on a.us_role=b.role '+
    ' left join RolesPermission c on b.role=c.RoleId '+
    ' left join MTTMNU d on c.MenuId=d.RECORD_ID '+
    ' where a.us_code='''+UID+''' ';
    }

    //inputbox('','',cdsMenuData.CommandText);

    cdsMenuData.Open();

    (*_Item := mmMainMenu.Items;   *)
    FCurrentMenuItem := nil;

    _Tag := 0; _Position := 0; icount:=0;

    cdsMenuData.Last();

    if (not FMenuReloaded) then
      SetLength(FProgramsItemInfo, cdsMenuData.RecordCount);

    cdsMenuData.First();
    while (not (cdsMenuData.Eof)) do
    begin
      if Trim(cdsMenuData.fieldbyname('FAccess').AsString)='A' then
      begin
      _Parent_ID := cdsMenuData.fieldbyname('PARENT_ID').AsInteger;


      (*
      FCurrentMenuItem := CreateNextItem(FCurrentMenuItem, _Parent_ID, _Item);

      _Item := TMenuItem.Create(mmMainMenu);
      _Item.Caption := Trim(dsMenuDataNAME.Value);

      _Item.Hint :=
        Trim(dsMenuDataDESCRIPTION.Value);

      _Item.ShortCut := TextToShortCut(dsMenuDataSHORTCUT.Value);
      _Item.GroupIndex := 1;
      *)


      _XPBarItem := JvXPBar1.Items.Add;
      _XPBarItem.Caption:= Trim(cdsMenuData.fieldbyname('NAME').Value);
      _XPBarItem.Hint :=Trim(cdsMenuData.fieldbyname('DESCRIPTION').Value);
      _XPBarItem.Enabled:=Trim(cdsMenuData.fieldbyname('ACTIVATE').AsString)='A';

      (*
      if (not dsMenuDataICON.IsNull) then
      begin
        dsMenuDataICON.SaveToFile('xbg');
        //_Item.Bitmap.LoadFromFile('xbg');
        DeleteFile('xbg')
      end;
      *)

      (*_Item.Tag := _Tag; *)
      _XPBarItem.Tag:=_Tag;

      //FProgramsItemInfo[_Tag].MenuItem := _Item;
      FProgramsItemInfo[_Tag].ProgramName := Trim(cdsMenuData.fieldbyname('APP_NAME').Value);
      FProgramsItemInfo[_Tag].Description := _XPBarItem.Caption;
      if (not FMenuReloaded) then
        FProgramsItemInfo[_Tag].MainFormHandle := nil;

      if (FProgramsItemInfo[_Tag].ProgramName <> '') then
      begin
        (*_Item.OnClick := MenuItemsClick;*)
        _XPBarItem.OnClick:=MenuItemsClick;
      end;

      Inc(_Tag);
      Inc(icount);

      (*
      if (FCurrentMenuItem^.Parent_ID = PULL_DOWN_ID) then
      begin
        FCurrentMenuItem^.MenuItem.Insert(_Position, _Item);
        Inc(_Position);
      end else
        FCurrentMenuItem^.MenuItem.Insert(
          FCurrentMenuItem^.MenuItem.Count, _Item);
       *)

      end;
      cdsMenuData.Next();
    end;
  finally
    FreeAllItem(FCurrentMenuItem);
    cdsMenuData.Close();
  end;

  if (FMenuReloaded) then
  begin
    for i := 0 to (mmRunningProgram.Count - 1) do
    begin
      mmRunningProgram.Items[i].Caption :=
        FProgramsItemInfo[mmRunningProgram.Items[i].Tag].Description;
    end;
  end;
end;

//*************************** Execut Program Event ***************************//
procedure TfrmMainMenu.AppExtCloseA(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caNone;
end;
procedure TfrmMainMenu.AppExtClose(Sender: TObject; var Action: TCloseAction);
var
  i,tabcount,indextab, _Item: Integer;
begin
  _Item := (Sender as TForm).Tag;

  if (Assigned(FProgramsItemInfo[_Item].AppClose)) then
    FProgramsItemInfo[_Item].AppClose(Sender, Action);

  FProgramsItemInfo[_Item].MainFormHandle := nil;

  for i := 0 to mmRunningProgram.Count - 1 do
  begin
    if (mmRunningProgram.Items[i].Tag = _Item) then
    begin
      mmRunningProgram.Items[i].Free();
      Break;
    end;
  end;

  while (tmFreeLib.Enabled) do (* wait for terminating last operation *) ;
  FFreeHandled := FProgramsItemInfo[_Item].DLLHandled;
  tmFreeLib.Enabled := True;


  {delete xtab}

  xTab.Refresh;
  for tabcount:=0 to xTab.Tabs.Count-1 do
  begin
    if xTab.Tabs.Strings[tabcount]=FProgramsItemInfo[_Item].Description then
    begin
      xTab.DeleteTab(tabcount);
      exit;
    end;
  end;



end;

procedure TfrmMainMenu.AppExtActivate(Sender: TObject);
var
  i, _Item: Integer;
begin
  _Item := (Sender as TForm).Tag;

  if (Assigned(FProgramsItemInfo[_Item].AppActivate)) then
    FProgramsItemInfo[_Item].AppActivate(Sender);

  for i := 0 to (mmRunningProgram.Count - 1) do
    mmRunningProgram.Items[i].Checked := False;

  FProgramsItemInfo[_Item].MenuItem.Checked := True;
end;

//************************ Running Menus Click Event *************************//
procedure TfrmMainMenu.RunningProgramClick(Sender: TObject);
var
  i, _Item: Integer;
begin
  _Item := (Sender as TMenuItem).Tag;

  for i := 0 to High(FProgramsItemInfo) do
  begin
    if (Assigned(FProgramsItemInfo[i].MainFormHandle)) then
    begin
      if (FProgramsItemInfo[i].MainFormHandle.Tag = _Item) then
        FProgramsItemInfo[i].MainFormHandle.BringToFront();
    end;
  end;
end;

//*************************** All Menus Click Event **************************//
procedure TfrmMainMenu.MenuItemsClick(Sender: TObject);
type
  TShowWindowType = (swNone, swModal, swNomal);

  TExecuteProgram = function(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: TDLLParameter): TForm; stdcall;

  TProgramType = (ptEXE, ptDLL, ptBPL, ptUnknow);

  function GetPrgramType(_ProgramName: String): TProgramType;
  begin
    if (UpperCase(ExtractFileExt(_ProgramName)) = '.EXE') then
      Result := ptEXE
    else
    if (UpperCase(ExtractFileExt(_ProgramName)) = '.DLL') then
      Result := ptDLL
    else
    if (UpperCase(ExtractFileExt(_ProgramName)) = '.BPL') then
      Result := ptBPL
    else
      Result := ptUnknow;
  end;

  function GetFormHandle(_ProgramName: String): TForm;
  var
    i,j: Integer;
  begin
    Result := nil;
    for i := 0 to High(FProgramsItemInfo) do
    begin
      if (FProgramsItemInfo[i].ProgramName = _ProgramName) then
      begin
        Result := FProgramsItemInfo[i].MainFormHandle;

        if xTab.Tabs.Count> 0 then
        for j:=0 to xTab.Tabs.Count-1 do
        if xTab.Tabs.Strings[j]= FProgramsItemInfo[i].Description then
        begin
          xTab.ActiveTab:=j;
        end;

        Exit;
      end;
    end;
  end;

  procedure AddRunningProgram(_Item: Integer);
  var
    _PrgItem: TMenuItem;
    i: Integer;
  begin
    FProgramsItemInfo[_Item].AppClose :=
      FProgramsItemInfo[_Item].MainFormHandle.OnClose;
    FProgramsItemInfo[_Item].MainFormHandle.OnClose := AppExtClose;

    FProgramsItemInfo[_Item].AppActivate :=
      FProgramsItemInfo[_Item].MainFormHandle.OnActivate;
    FProgramsItemInfo[_Item].MainFormHandle.OnActivate := AppExtActivate;

    FProgramsItemInfo[_Item].MainFormHandle.Tag := _Item;

    for i := 0 to (mmRunningProgram.Count - 1) do
      mmRunningProgram.Items[i].Checked := False;

    _PrgItem := TMenuItem.Create(PopupMenu00);
    _PrgItem.Caption := FProgramsItemInfo[_Item].Description;
    _PrgItem.GroupIndex := 2;
    _PrgItem.RadioItem := True;
    _PrgItem.Checked := True;

    if (FMenusLanguage = 'ENG') then
      _PrgItem.Hint := 'Switch to ' + FProgramsItemInfo[_Item].Description
    else
    if (FMenusLanguage = 'THA') then
      _PrgItem.Hint :='ไปที่โปรแกรม ' + FProgramsItemInfo[_Item].Description;

    _PrgItem.Tag := _Item;
    _PrgItem.OnClick := RunningProgramClick;



    mmRunningProgram.Add(_PrgItem);

    FProgramsItemInfo[_Item].MenuItem := _PrgItem;
    UpdateSystemMenu();
  end;

var
  _ProgramName: String;
  _Parameter: TDLLParameter;
  _ProgramType: TProgramType;
  _ExecuteProgram: TExecuteProgram;
  _RunningForm: TForm;
  _Item: Integer;
  _tabcount:integer;
  cHandle: Integer;
begin

  if (Sender is TMenuItem) then
    _Item := (Sender as TMenuItem).Tag
  else
    _Item := (Sender as TJvXPBarItem).Tag;

  _ProgramName := FProgramsItemInfo[_Item].ProgramName;
  _Parameter.Parameters := FProgramsItemInfo[_Item].Paramrter;
  _Parameter.UserID := UID;
  _Parameter.WorkStation:='';
  _Parameter.Company:='';
  _Parameter.Branch:=FBranch;

  if (Trim(_ProgramName) <> '') then
  begin
    LoadProgram(_ProgramName);

    _ProgramType := GetPrgramType(_ProgramName);
    case _ProgramType of
      ptEXE: WinExec(PChar(_ProgramName + ' ' + _Parameter.Parameters), SW_SHOW);
      ptDLL, ptBPL:
      begin
        _RunningForm := GetFormHandle(_ProgramName);

        if (not Assigned(_RunningForm)) then
        begin
          FProgramsItemInfo[_Item].DLLHandled := LoadLibrary(PChar(_ProgramName));
          FProgramsItemInfo[_Item].Tag:=_Item;

          if (FProgramsItemInfo[_Item].DLLHandled <> 0) then
          begin
            _ExecuteProgram := GetProcAddress(FProgramsItemInfo[_Item].DLLHandled, 'Execute');

//              xTab.Tabs.AddObject(FProgramsItemInfo[_Item].Description, TObject(FProgramsItemInfo[_Item].MainFormHandle));
 //             xTab.ActiveTab := -1 + xTab.Tabs.Count;

            if(Assigned(_ExecuteProgram)) then
            begin


              FProgramsItemInfo[_Item].MainFormHandle :=_ExecuteProgram(Application, dbcDefault, swNone, _Parameter);

              if (Assigned(FProgramsItemInfo[_Item].MainFormHandle))  then
              begin
                xTab.Tabs.AddObject(FProgramsItemInfo[_Item].Description, TObject(FProgramsItemInfo[_Item].MainFormHandle));
                xTab.ActiveTab := -1 + xTab.Tabs.Count;

                SetWrkUsr(FUserID, 'Execute: ' + FProgramsItemInfo[_Item].Description);
                AddRunningProgram(_Item);
              end;

              if (not Assigned(FProgramsItemInfo[_Item].MainFormHandle)) then
              begin
                FreeLibrary(FProgramsItemInfo[_Item].DLLHandled);
                Exit;
              end;
            end else
              FProgramsItemInfo[_Item].MainFormHandle := nil;
          end;
        end else
        begin
          try
            _RunningForm.BringToFront();

          except
            FProgramsItemInfo[_Item].MainFormHandle := nil;
            MenuItemsClick(Sender);
          end;
        end;
      end;
    end;
  end;
end;

//**************************** Transfer Program ******************************//
//procedure _Ctrl_load(const _File, _Path: ShortString); stdcall
//  external 'floader.dll' name 'Ctrl_load';

procedure TfrmMainMenu.LoadProgram(const File_Name: String);
begin
//  _Ctrl_load(File_Name, ExtractFilePath(Application.ExeName));
end;

//************************** Miscellaneous function **************************//
procedure TfrmMainMenu.SetWrkUsr(const _UserID, Job_Desc: String);
begin
  ExecSQL(
    'EXECUTE PROCEDURE SP_SET_LOGGED_USER(' +
    QuotedStr(_UserID) + ', ' +
    QuotedStr(Job_Desc) + ')');
end;

//*************************** Form Miscellaneous *****************************//
procedure TfrmMainMenu.ShowServerInfoPanel();
begin
  if (not pnServerInfo.Visible) then
  begin
    pnSignOnPanel.Height := PN_SIGNON_HEIGH;
    gbBox.Height := PN_BOX_HEIGH;
    pnSecurity.Top := PN_SEC_TOP;

    pnServerInfo.Visible := True;
  end;
end;

procedure TfrmMainMenu.HideServerInfoPanel();
begin
  if (pnServerInfo.Visible) then
  begin
    pnSecurity.Top := pnServerInfo.Top;
    pnSignOnPanel.Height := pnSignOnPanel.Height - pnServerInfo.Height;
    gbBox.Height := gbBox.Height - pnServerInfo.Height;

    pnSignOnPanel.Top := pnSignOnPanel.Top + pnServerInfo.Height;

    pnServerInfo.Visible := False;
  end;
end;

procedure TfrmMainMenu.HideSignOnPanel();
begin
  pnSignOnPanel.Enabled := False;
  pnSignOnPanel.Hide();
end;

procedure TfrmMainMenu.ShowSignOnPanel();
begin
  if (pnSignOnPanel.Visible) then
    Exit;

  pnSignOnPanel.Left := ClientWidth - pnSignOnPanel.Width - 15;
  pnSignOnPanel.Top :=
    ClientHeight - Status.Height -
    lbVersion.Height - pnSignOnPanel.Height - 10;

  pnSignOnPanel.Show();

  pnSignOnPanel.Enabled := True;
end;

procedure TfrmMainMenu.ExecByName(const _AppName: String);
var
  i: Integer;
  _Index: Integer;
begin
  _Index := -1;
  for i := Low(FProgramsItemInfo) to High(FProgramsItemInfo) do
  begin
    if (UpperCase(Trim(_AppName)) = UpperCase(
        Trim(FProgramsItemInfo[i].ProgramName))) then
      _Index := i;
  end;

  if (_Index <> -1) then
  begin
    FProgramsItemInfo[_Index].MenuItem.OnClick(
      FProgramsItemInfo[_Index].MenuItem);
  end;
end;

function TfrmMainMenu.ExecSQL(const _CommandText: String): Boolean;
begin
  Result := True;
  try
    dsSQL.SQL.Text := _CommandText;
    dsSQL.ExecSQL();
    dsSQL.Close(etmCommit);
  except
    Result := False;
  end;
end;

procedure TfrmMainMenu.UpdateSystemMenu();
begin
(*
  if (FMenusLanguage = 'THA') then
  begin
    mmSystem.Caption := 'ระบบ';

    if (pnSignOnPanel.Visible) then
    begin
      mmSignOnOff.Caption := '&SignOn เข้าสู่ Application loader';
      mmSignOnOff.Hint := 'SignOn เข้าใช้งาน Application Loader';
    end else
    begin
      mmSignOnOff.Caption := '&SignOff และปิดเซสชั่นผู้ใช้งาน ' + FUserID;
      mmSignOnOff.Hint :=
        'SignOff และปิดเซสชั่นของผู้ใช้งาน ' + FUserID +
        ' เพื่อการ SignOn ของผู้ใช้คนใหม่';
    end;

    mmChangePassword.Caption := 'เปลี่ยนรหัสผ่าน';
    mmChangePassword.Hint := 'เปลี่ยนรหัสผ่านของผู้ใช้งานปัจจุปัน';
    mmSwitchMenusLanguage.Caption := 'Switch Language';
    mmSwitchMenusLanguage.Hint := 'Change Language to THAI/ENGLISH Language';
    mmLanguageThai.Caption := 'Thai';
    mmLanguageThai.Hint := 'Switch to Thai Language';
    mmLanguageEnglish.Caption := 'English';
    mmLanguageEnglish.Hint := 'Switch to English Language';

    if (mmRunningProgram.Count = 0) then
      mmRunningProgram.Caption := 'โปรแกรมที่ทำงานอยู่ (ไม่มี)'
    else
      mmRunningProgram.Caption := 'โปรแกรมที่ทำงานอยู่';

    mmRunningProgram.Hint := 'แสดงรายการของโปรแกรมที่ทำงานอยู่';
    mmAppLoaderCRGPL.Caption := 'ลิขสิทธิ์ของ Application Loader (CRG-PL)';
    mmAppLoaderCRGPL.Hint := 'แสดง CRG Public Licensed';
    mmAboutAppLoader.Caption := 'เกี่ยวกับ Application Loader...';
    mmAboutAppLoader.Hint := 'แสดงหน้าต่างรายละเอียดเกี่ยวกับ Application Loader';
    mmAboutProgram.Caption := 'เกี่ยวกับโปรแรกรม ' + FAboutProgramText + '...';
    mmAboutProgram.Hint := 'แสดงหน้าต่างรายละเอียดเกี่ยวกับโปรแกรม ' + FAboutProgramText;
    mmClose.Caption := 'จบการทำงาน';
    mmClose.Hint := 'จบการทำงานของ Aapplication Loader Program และโปรแกรมที่รันอยู่';
  end else
  if (FMenusLanguage = 'ENG') then
  begin
    mmSystem.Caption := 'System';

    if (pnSignOnPanel.Visible) then
    begin
      mmSignOnOff.Caption := '&Sign On to Application loader';
      mmSignOnOff.Hint := 'Sign on to Application Loader';
    end else
    begin
      mmSignOnOff.Caption := '&Sign Off and Close Session for User: ' + FUserID;
      mmSignOnOff.Hint :=
        'Sign off from user: ' + FUserID + ' and resign on for next user';
    end;

    mmChangePassword.Caption := 'Change Password';
    mmChangePassword.Hint := 'Change password for current signed on user';
    mmSwitchMenusLanguage.Caption := 'เปลี่ยนภาษา';
    mmSwitchMenusLanguage.Hint := 'เปลี่ยนภาษาเป็นภาษาไทยหรือภาษาอังกฤษ';
    mmLanguageThai.Caption := 'ไทย';
    mmLanguageThai.Hint := 'เปลี่ยนรายการเป็นภาษาไทย';
    mmLanguageEnglish.Caption := 'อังกฤษ';
    mmLanguageEnglish.Hint := 'เปลี่ยนรายเป็นภาษาอังกฤษ';

    if (mmRunningProgram.Count = 0) then
      mmRunningProgram.Caption := 'Running Program (None)'
    else
      mmRunningProgram.Caption := 'Running Program';

    mmRunningProgram.Hint := 'List of Running Program';
    mmAppLoaderCRGPL.Caption := 'Application Loader Licensed (CRG-PL)';
    mmAppLoaderCRGPL.Hint := 'Show CRG Public Licensed';
    mmAboutAppLoader.Caption := 'About Application Loader...';
    mmAboutAppLoader.Hint := 'Show About for Application Loader';
    mmAboutProgram.Caption := 'About Program ' + FAboutProgramText + '...';
    mmAboutProgram.Hint := 'Show About Box for this Program ' + FAboutProgramText;
    mmClose.Caption := 'Terminate Program';
    mmClose.Hint := 'Terminate Aapplication Loader Program';
  end
  *)
end;

//******************************* Form Events ********************************//
const
  _LicenseDll = 'licensed.dll';

var
  _Handle: THandle;
  _ShowLicensedBox: procedure (_app_title: String); stdcall;
  _IsAcceptAgreement: function(): Boolean; stdcall;

procedure _LoadLibraries();
begin
  _Handle := LoadLibrary(_LicenseDll);
  if (_Handle <> 0) then
  begin
    _ShowLicensedBox := GetProcAddress(_Handle, 'ShowLicensedBox');
    _IsAcceptAgreement := GetProcAddress(_Handle, 'IsAcceptAgreement');
  end;
end;

function LoadAboutData(_mmS3, _mmAboutAppLoader: TMenuItem): String;
var
  _Handle: THandle;
  _PrgDesc: function(): PChar; stdcall;
begin
  _Handle := LoadLibrary('about.dll');
  if (_Handle <> 0) then
  try
    _PrgDesc := GetProcAddress(_Handle, 'PrgDesc');
    if(Assigned(_PrgDesc)) then
    begin
      Result := Strpas(_PrgDesc());
      _mmS3.Visible := True;
      _mmAboutAppLoader.Visible := True;
    end;
  finally
    FreeLibrary(_Handle);
  end;
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  if (not FileExists('licensed.dll')) then
  begin
    Application.MessageBox(
      PChar(
        'License file not found!!!'#10#10#13 +
        'Problem:'#10#13 +
        'File "license.rtf" was not found on current working directory.'#10#13+
        'Application loader is a freely used software under the licensed agreement ' +
        'and cannot be ran without licensed file, ' +
        'thereby license file is must be always existed on this system.'#10#10#13 +
        'Work around:'#10#13 +
        'Please make sure the license file was already existed on current ' +
        'working directory before your application loader is started.'#10#13 +
        'You can copy this file from another machine and put it into your path, ' +
        'the license file can be shared with one another for any machine.'),
      'Application Loader - License Error', MB_OK or MB_ICONERROR);

    Application.Terminate();
    Exit;
  end;

  initSqlConnection(Conn);
  initDataset(self,Conn);


  _LoadLibraries();

  {
  if (not _IsAcceptAgreement()) then
  begin
    _ShowLicensedBox('Application Loader');

    if (not _IsAcceptAgreement()) then
    begin
      Application.Terminate();
      Exit;
    end;
  end;
  }

  (*FAboutProgramText := LoadAboutData(mmS3, mmAboutAppLoader);  *)

  Left := 0; Top := 0;

  Constraints.MaxHeight := Screen.Height;
  Constraints.MinHeight := 600;

  Constraints.MaxWidth := Screen.Width;
  Constraints.MinWidth := 800;

  ChDir(ExtractFilePath(Application.ExeName));

  {
  try
    SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_ICALENDARTYPE, '7'); //พุทธศักราช
    SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, 'dd/MM/yyyy');
  except
  end;}

  {** Initialize local configuration file to easy setting up **}
  if (not FileExists(SystemDir + _CRG_CONFIG)) then
  begin
    with TStringList.Create() do
    try
      Add('# IMPORTANT');
      Add('# Do not edit this file directly if you not understand.');
      Add('# The changed of this file may not take effect until your application is restarted');
      Add('');
      Add('[DEFAULT_DB]');
      Add('SERVER=');
      Add('NAME=');
      Add('USER_NAME=ADMIN'); // 'ADMIN' user id.
      Add('PASSWORD=C7B8C7BFC7CDC7C9C7CE');  // 'admin' password
      Add('');
      Add('[CTRLVER_DB]');
      Add('SERVER=');
      Add('NAME=');
      Add('CONTROLLED=');
      Add('');
      Add('[SECURITY]');
      Add('USER_NAME=SYSDBA'); // 'SYSDBA' user id.
      Add('PASSWORD=C7CDC7B8C6BAC6BFC7BCC6BDC7CBC7BCC6C9');  // 'masterkey' password
      Add('');
      Add('[MENUS]');
      Add('LANGUAGE=THA');

      SaveToFile(SystemDir + _CRG_CONFIG);
    finally
      Free();
    end;
  end;

  //LoadConnection(dbcFileCtrlVersion, False);
  dbcFileCtrlVersion.DatabaseName:=ExtractFilePath(Application.ExeName)+'FCTRLVERSION.FDB';
  //edDatabaseServer.Text := 'localhost';//GetDefaultServer();
  edDatabaseName.Text := ExtractFilePath(Application.ExeName)+'DATA.FDB';//GetDefaultDBName();

  //edUserID.Text := 'ADMIN';//GetDefaultUserID();

  //edCtrlVerSvr.Text := dbcFileCtrlVersion.DatabaseName;

  FMenusLanguage := GetMenuLanguage();
  if (FMenusLanguage = '') then
  begin
    FMenusLanguage := 'THA';
    SetMenuLanguage(FMenusLanguage);
  end;
(*
  mmLanguageThai.Checked := (FMenusLanguage = 'THA');
  mmLanguageEnglish.Checked := (FMenusLanguage = 'ENG');
  *)
  UpdateSystemMenu();

  lbVersion.Caption :=
    lbVersion.Caption + GetFileVerionString(Application.ExeName) +
    ' (Hybrid)';

  PN_SIGNON_HEIGH := pnSignOnPanel.Height;
  PN_BOX_HEIGH := gbBox.Height;
  PN_SEC_TOP := pnSecurity.Top;

  HideServerInfoPanel();
  JvXPBar1.Items.Clear;

  WindowState := wsMaximized;
end;

procedure TfrmMainMenu.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  i,tabcount,indextab, _Item: Integer;
begin
  if (FMenusLanguage = 'THA') then
    CanClose :=
      (Application.MessageBox(
        'คุณต้องการจบการทำงานของโปรแรกมทั้งหมดเดี๋ยวนี้หรือไม่?',
        'ยืนยันคำสั่ง', MB_YESNO or MB_ICONINFORMATION) = mrYes)
  else
  if (FMenusLanguage = 'ENG') then
    CanClose :=
      (Application.MessageBox(
        'Do you want to quit all application now?',
        'Confirmation operation', MB_YESNO or MB_ICONINFORMATION) = mrYes);

  KillTask('menu.exe');        

end;


procedure TfrmMainMenu.FormResize(Sender: TObject);
begin
  lbVersion.Left := ClientWidth - lbVersion.Width - 15;
  lbVersion.Top := ClientHeight - Status.Height - lbVersion.Height - 5;

  if (pnSignOnPanel.Visible) then
  begin
    pnSignOnPanel.Left := ClientWidth - pnSignOnPanel.Width - 15;
    pnSignOnPanel.Top :=
      ClientHeight - Status.Height -
      lbVersion.Height - pnSignOnPanel.Height - 10;
  end;

  inherited;
end;

procedure TfrmMainMenu.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);

 //edUserID.Text:=EncryptEx('ADMIN');
  if (Trim(edDatabaseName.Text) <> '') then
  begin
    if (Trim(edUserID.Text) <> '') then
      edPassword.SetFocus()
    else
      edUserID.SetFocus();
  end else
  begin
    ShowServerInfoPanel();
    edDatabaseName.SetFocus();
  end;


  if (ParamCount > 2) then
  begin
    edUserID.Text := ParamStr(2);
    edPassword.Text := ParamStr(3);

    btnSignOnClick(btnSignOn);

    if (ParamCount > 3) then
      PostMessage(Handle, WM_EXEC_PRG, 0, 0);
  end;

  loadCmbItems(cmbLocation.Properties.Items,cdsTemp,'select MTTCDE,MTTDES from MTTCDE where MTTGRP=''FRONT'' and MTTACT=''A''','MTTCDE','MTTDES','00');
end;

procedure TfrmMainMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  _IsCtrlPress: Boolean;
begin
  _IsCtrlPress := (ssCtrl in Shift);

  case Key of
    VK_F3: mmSignOnOffClick(sender);
    VK_F4:
    begin
      if (_IsCtrlPress) then
      begin
        WinExec(PChar('Notepad ' + SystemDir + _CRG_CONFIG), SW_SHOW);
      end else
      if (pnSignOnPanel.Visible) then
      begin
        if (pnServerInfo.Visible) then
        begin
          HideServerInfoPanel();

          if (not edPassword.IsFocused) then
            edUserID.SetFocus();
        end else
          ShowServerInfoPanel();
      end;
    end;
    VK_F5:
    begin
      if (_IsCtrlPress and (not pnSignOnPanel.Visible)) then
        Application.MessageBox(
          PChar(
            'Signed On User: ' + FUserID + #10#13 +
            'Database Name: ' + edDatabaseName.Text ),
          'Server Information', MB_OK or MB_ICONINFORMATION);
    end;
  end;

  inherited;
end;

//************************** Sign On/Off Menu Click **************************//
procedure TfrmMainMenu.mmSignOnOffClick(Sender: TObject);
var
  i: Integer;
begin
  if (pnSignOnPanel.Visible) then
    Exit;

  i :=
    Application.MessageBox(
      PChar('Do you want to "Log-Off" from current user: "' + FUserID + '"?'),
      'Confirm', MB_YESNO or MB_ICONQUESTION);

  if (i = idNo) then
    Exit;

  for i := 0 to High(FProgramsItemInfo) do
  begin
    if (FProgramsItemInfo[i].MainFormHandle <> nil) then
      FProgramsItemInfo[i].MainFormHandle.Close();
  end;

  UnloadMenu();

  Status.Panels[1].Text := ' Signed On User: None';

  //mmChangePassword.Enabled := False;

  if (dbcFileCtrlVersion.Connected) then
    dbcFileCtrlVersion.Connected := False;

  if (dbcDefault.Connected) then
    dbcDefault.Connected := False;
    
  ShowSignOnPanel();

  UpdateSystemMenu();

  edUserID.SelectAll();
  edUserID.SetFocus();
end;

//************************ Chang Password Menu Click *************************//
procedure TfrmMainMenu.mmChangePasswordClick(Sender: TObject);
begin
  with TfrmChangPWD.Create(Self) do
  try
    edUserID.Text := FUserID;

    Password := FPassword;
    edOldPassword.Enabled := True;

    if ((ShowModal() = mrOK)) then
    begin
      trnsDefault.StartTransaction();
      try
        ExecSQL(
          'UPDATE TB_USERS ' +
          'SET ' +
          '  USER_PWD = ' + QuotedStr(EncryptEx(edPassword1.Text)) + ', ' +
          '  STATUS = 0 ' +
          'WHERE ' +
          '  USER_ID = ' + QuotedStr(FUserID));

        ChangePassword(FUserID, edPassword1.Text);
        dbcDefault.PassWord := edPassword1.Text;
      except
        trnsDefault.Rollback();
      end;

      if (trnsDefault.InTransaction) then
        trnsDefault.Commit();
    end;
  finally
    Free();
  end;
end;

procedure TfrmMainMenu.mmLanguageThaiClick(Sender: TObject);
var
  i: Integer;
begin
  if ((Sender as TMenuItem).Checked) then
    Exit;

  (Sender as TMenuItem).Checked := True;
  (*
  if (mmLanguageThai.Checked) then
    FMenusLanguage := 'THA'
  else
  if (mmLanguageEnglish.Checked) then
    FMenusLanguage := 'ENG';
  *)
  SetMenuLanguage(FMenusLanguage);

  for i := 0 to (Screen.FormCount - 1) do
    PostMessage(Screen.Forms[i].Handle, WM_LANGUAGE_CHANGED, 0, 0);
end;

//****************** Application Loader License Menu Click *******************//
procedure TfrmMainMenu.mmAppLoaderCRGPLClick(Sender: TObject);
begin
  _ShowLicensedBox('Application Loader');
end;

//******************* About Application Loader Menu Click ********************//
procedure AboutBox(Title, Msg: PChar); stdcall external 'crgabout' name 'AboutBox';

procedure TfrmMainMenu.mmAboutAppLoaderClick(Sender: TObject);
const
  _CR = #13;
begin
  AboutBox(
    'CRG Main Menu',
    PChar(
      'Application Loader Version: ' +
      GetFileVerionString(Application.ExeName) + _CR +
      'Main Menu is a centralized controlling and loading'+ _CR +
      'for any application.' + _CR +
      _CR +
      'The THUNDERBIRD name was derived form PHOENIX' + _CR +
      'but its was built from scratch.' + _CR +
      _CR +
      'In associated with:' + _CR +
      'The Computer Research Group.' + _CR +
      'The CRG, The CRG RT , The CRG Software is' + _CR +
      'trade mark of the CRG Software Co., Ltd.'));
end;

//************************ About Program Menu Click **************************//
procedure TfrmMainMenu.mmAboutProgramClick(Sender: TObject);
var
  _Handle: THandle;
  _AboutProc: TProcedure; 
begin
  _Handle := LoadLibrary('about.dll');
  if (_Handle <> 0) then
  try
    _AboutProc := GetProcAddress(_Handle, 'AboutBox');
    if(Assigned(_AboutProc)) then
      _AboutProc();
  finally
    FreeLibrary(_Handle);
  end;
end;

//***************************** Close Menu Click *****************************//
procedure TfrmMainMenu.mmCloseClick(Sender: TObject);
begin
  Close();
end;

//************************** SignOn OK Button Click **************************//
procedure TfrmMainMenu.btnSignOnClick(Sender: TObject);

  function ChangPWD(): Boolean;
  begin
    with TfrmChangPWD.Create(Self) do
    try
      edUserID.Text := FUserID;

      Result := (ShowModal() = mrOK);
      if (Result) then
      begin
        FPassword := edPassword1.Text;;
        Self.edPassword.Text := FPassword;
        dbcDefault.PassWord := FPassword;

        trnsDefault.StartTransaction();
        try
          ExecSQL(
            'UPDATE TB_USERS ' +
            'SET ' +
            '  USER_PWD = ' + QuotedStr(EncryptEx(FPassword)) + ', ' +
            '  STATUS = 0 ' +
            'WHERE ' +
            '  USER_ID = ' + QuotedStr(FUserID));

          ChangePassword(FUserID, FPassword);
        except
          trnsDefault.Rollback();
        end;

        if (trnsDefault.InTransaction) then
          trnsDefault.Commit();
      end;
    finally
      Free();
    end;
  end;

var
  _Msg: String;
begin
  Screen.Cursor := crHourGlass;

  //ChangPWD();
  //edUserID.Text:=QuotedStr(EncryptEx('ADMIN'));
  //Application.MessageBox(pchar(DecryptEx(EncryptEx('ADMIN'))),pchar(''),MB_OK);

  //inputbox('','',EncryptEx('ADMIN'));

 

  btnSignOn.Enabled := False;
  btnExit.Enabled := False;
  
  if (Trim(edUserID.Text)<>'') then
  with cdsLogin do
  begin
    close;
    CommandText:='select * from user_account where us_user='''+Trim(edUserID.Text)+''' and us_password='''+EncryptEx(trim(edPassword.Text))+''' and us_status=''A'' ';
    open;

    if cdsLogin.Active then
      if cdsLogin.RecordCount>0 then
      begin
        SignOnTime := 0;

        FMenuReloaded := False;
        UID := trim(cdsLogin.fieldbyname('us_code').AsString);
        FBranch := TString(cmbLocation.Properties.Items.Objects[cmbLocation.ItemIndex]).Str;

        LoadMenu();

        FUserID:=trim(cdsLogin.fieldbyname('us_name').AsString);

        //mmChangePassword.Enabled := True;

        Status.Panels[1].Text := ' SignedOn User: ' + FUserID;

        HideSignOnPanel();
        HideServerInfoPanel();
      end else
      begin
          _Msg := 'ไม่พบรหัสผู้ใช้งาน';
          Application.MessageBox(PChar(_Msg), 'Error', MB_OK or MB_ICONERROR);
          btnSignOn.Enabled := true;
          btnExit.Enabled := true;

          edUserID.SetFocus;
          edUserID.SelectAll;
      end;
  end;



  (*
  try
    if (OldUserName <> Trim(edUserID.Text)) then
      SignOnTime := 0;

    OldUserName := Trim(edUserID.Text);


    if (FUserID <> UpperCase(Trim(edUserID.Text))) then
    begin
      FUserID := UpperCase(Trim(edUserID.Text));
      SignOnTime := 0;
    end;

    if (FUserID  = '') then
    begin
      if (FMenusLanguage = 'ENG') then
        _Msg := 'Specific a User ID. of database server before loging'
      else
      if (FMenusLanguage = 'THA') then
        _Msg := 'ระบุ User ID ที่จะใช้ในการ LogIn ไปยัง Database Server ก่อน';

      Application.MessageBox(PChar(_Msg), 'Error', MB_OK or MB_ICONERROR);
      Exit;
    end;

    if (dbcDefault.Connected) then
      dbcDefault.Connected := False;

//    dbcDefault.DatabaseName := Trim(edDatabaseServer.Text) + ':' + Trim(edDatabaseName.Text);
    dbcDefault.DatabaseName := ExtractFilePath(Application.ExeName)+'DATA.FDB' ;//Trim(edDatabaseServer.Text) + ':' + Trim(edDatabaseName.Text);

    dbcDefault.UserName := GetManagerUserID();
    dbcDefault.PassWord := GetManagerUserPWD();
    try
      dbcDefault.Connected := True;

      dsSQL.SQL.Text :=
        'SELECT RESULT FROM SP_VERIFY_USER(' +
           QuotedStr(Trim(edUserID.Text)) + ', ' +
           QuotedStr(EncryptEx(edPassword.Text)) + ')';

      dsSQL.Open();

      case dsSQL.Fields.ByNameAsInteger['RESULT'] of
        -3:
        begin
          dsSQL.Close();
          dsSQL.SQL.Text :=
            'SELECT ' +
            '  DESCRIPTION ' +
            'FROM ' +
            '  SP_GET_USER_ACC_DESC(' +
              QuotedStr(Trim(edUserID.Text)) + ', ' +
              QuotedStr(FMenusLanguage) + ')';

          try
            dsSQL.Open();

            if (FMenusLanguage = 'ENG') then
              _Msg :=
                'Your user profile is not permitted to sign-on at this time'#10#10#13+
                'Your valid accesses time are:'#10#10#13 +
                dsSQL.Fields.ByNameAsString['DESCRIPTION']
            else
            if (FMenusLanguage = 'THA') then
              _Msg :=
                'แฟ้มข้อมูลผู้ใช้งานของคุณไม่อนุญาติให้เข้าใช้งานระบบได้ในเวลานี้'#10#10#13+
                'เวลาที่คุณสามารถเข้าใช้งานได้คือ:'#10#10#13 +
                dsSQL.Fields.ByNameAsString['DESCRIPTION'];

            Application.MessageBox(PChar(_Msg), 'Waring', MB_OK or MB_ICONWARNING);
          finally
            dsSQL.Close(etmCommit);
          end;

          edUserID.SetFocus();
          edUserID.SelectAll();

          Exit;
        end;
        -2:
        begin
          Inc(SignOnTime);
          if (SignOnTime > 2) then
          begin
            if (FMenusLanguage = 'ENG') then
              _Msg :=
                'Problem with authentication!!! ' +
                'You''ve entered wrong password for a 3 times.'#10#13 +
                'User account has been disabled.'#10#13 +
                'Contact your administrator to be enabled.'
            else
            if (FMenusLanguage = 'THA') then
              _Msg :=
                'ปัญหาเกี่ยวกับความปลอดภัย!!! ' +
                'คุณใส่รหัสผ่านผิด 3 ครั้ง'#10#13 +
                'บัญชีรายชื่อผู้ใช้งานถูกยกเลิก'#10#13 +
                'ติดต่อผู้ดูแลระบบเพื่อปลดล็อค';

            Application.MessageBox(
              PChar(_Msg), 'Warning', MB_OK or MB_ICONWARNING);

            ExecSQL(
              'UPDATE TB_USERS ' +
              'SET ' +
              '  STATUS = 1 ' +
              'WHERE ' +
              '  USER_ID = ' + QuotedStr(FUserID));

            edUserID.SetFocus();
          end else
          begin
            if (FMenusLanguage = 'ENG') then
              _Msg :=
                'Password is not valid.'#10#13 +
                'The password is case sensitive, be careful to types its.'
            else
            if (FMenusLanguage = 'THA') then
              _Msg :=
                'รหัสผ่านไม่ถูกต้อง'#10#13 +
                'รหัสผ่านมีความแตกต่างกันระหว่างตัวอักษรตัวเล็กกับตัวใหญ่ ' +
                'ให้พิมพ์ด้วยความระมัดระวัง'; 

            Application.MessageBox(PChar(_Msg), 'Error', MB_OK or MB_ICONERROR);

            edPassword.SetFocus();
          end;

          edPassword.SelectAll();

          Exit;
        end;
        -1:
        begin
          if (FMenusLanguage = 'ENG') then
            _Msg := 'User ID. does not exist'
          else
          if (FMenusLanguage = 'THA') then
            _Msg := 'ไม่พบรหัสผู้ใช้งาน';

          Application.MessageBox(PChar(_Msg), 'Error', MB_OK or MB_ICONERROR);

          edUserID.SetFocus();
          edUserID.SelectAll();

          Exit;
        end;
        1:
        begin
          if (FMenusLanguage = 'ENG') then
            _Msg :=
              'User account has been disabled, ' +
              'contact your aministrator to be enabled.'
          else
          if (FMenusLanguage = 'THA') then
            _Msg :=
              'บัญชีรายชื่อนี้ไม่สามารถใช้งานได้ ' +
              'กรุณาติดต่อผู้ดูแลระบบเพื่อ';

          Application.MessageBox(PChar(_Msg), 'Warning', MB_OK or MB_ICONWARNING);

          edUserID.SetFocus();
          edUserID.SelectAll();

          Exit;
        end;
        2:
        begin
          if (FMenusLanguage = 'ENG') then
            _Msg := 'User account has been locked by your administrator.'
          else
          if (FMenusLanguage = 'THA') then
            _Msg := 'บัญชีรายชื่อนี้ถูกล็อคโดยผู้ดูแลระบบ';

          Application.MessageBox(PChar(_Msg), 'Warning', MB_OK or MB_ICONWARNING);

          edUserID.SetFocus();
          edUserID.SelectAll();

          Exit;
        end;
        3:
        begin
          if (FMenusLanguage = 'ENG') then
            _Msg :=
                'Password has been expired, You must be re-entered new password'
          else
          if (FMenusLanguage = 'THA') then
            _Msg := 'รหัสผ่านหมดอายุคุณต้องเลือกรหัสผ่านใหม่';

          Application.MessageBox(
            PChar(_Msg), 'Warning', MB_OK or MB_ICONWARNING);

          ChangPWD();
        end;
        99:
        begin
          if (FMenusLanguage = 'ENG') then
            _Msg :=
              'Password does not exist on your profile, ' +
              'it necessary to be created a new password.'
          else
          if (FMenusLanguage = 'THA') then
            _Msg :=
              'ไม่มีการกำหนดรหัสผ่านบนบัญชีผู้ใช้งานของคุณ ' +
              'จำเป็นต้องมีการสร้างรหัสผ่านใหม่';

          Application.MessageBox(
            PChar(_Msg), 'Information', MB_OK or MB_ICONINFORMATION);

          ChangPWD();
        end;
      end;
    finally
      dsSQL.Close();
      dbcDefault.Connected := False;
    end;

    FPassword := edPassword.Text;
    dbcDefault.DatabaseName :=Trim(edDatabaseName.Text);
    //dbcDefault.UserName := FUserID;
    //dbcDefault.PassWord := FPassword;

    {joefix}
    dbcDefault.UserName := GetManagerUserID();
    dbcDefault.PassWord := GetManagerUserPWD();


    try
      dbcDefault.Connected := True;
      SetWrkUsr(FUserID, 'Signed on to Application Loader');
    except
      on E: Exception do
      begin
        Application.MessageBox(
          PChar(E.Message),
          'Error', MB_OK or MB_ICONERROR);

        Exit;
      end;
    end;

    //SaveConnection(dbcDefault);
    //SaveConnection(dbcFileCtrlVersion, False);
  finally
    btnSignOn.Enabled := True;
    btnExit.Enabled := True;

    Screen.Cursor := crDefault;
  end;


  SignOnTime := 0;

  FMenuReloaded := False;
  LoadMenu();

  //mmChangePassword.Enabled := True;

  Status.Panels[1].Text := ' SignedOn User: ' + FUserID;

  HideSignOnPanel();
  HideServerInfoPanel();



  //UpdateSystemMenu();

  //dbcFileCtrlVersion.Connected := True;

  *)
  Screen.Cursor := crDefault;
end;

//************************ SignOn Cancel Button Click ************************//
procedure TfrmMainMenu.btnExitClick(Sender: TObject);
begin
  mmCloseClick(sender);
end;

//************************ SignOnOff Tool Button Click ***********************//
procedure TfrmMainMenu.btnSignOnOffClick(Sender: TObject);
begin
  mmSignOnOffClick(sender);
end;

//************************ About CRG Tool Button Click ***********************//
procedure TfrmMainMenu.btnAbountClick(Sender: TObject);
begin
  mmAboutAppLoaderClick(sender);
end;

//************************** Close Tool Button Click *************************//
procedure TfrmMainMenu.btnCloseClick(Sender: TObject);
begin
  mmCloseClick(sender);
end;

//************************** SignOnPanel Edit Events *************************//
procedure TfrmMainMenu.edDatabaseServerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    SelectNext(ActiveControl, True, True);

    if (Sender = edPassword) then
    begin

      if (Trim(edUserID.Text) = '') then
      begin
        edUserID.SetFocus();
        Exit;
      end;

      if (cmbLocation.ItemIndex = -1)  then
      begin
        cmbLocation.ItemIndex:=0;
        cmbLocation.SetFocus();
        Exit;
      end;

      btnSignOnClick(edPassword);
    end;

    Key := #0;
  end;
end;

//******************************* Timer Events *******************************//
procedure TfrmMainMenu.tmTimerTimer(Sender: TObject);
begin
  Status.Panels[2].Text :=
    FormatDateTime(' dd mmmm eeee hh:mm:ss', Now());
end;

procedure TfrmMainMenu.tmFreeLibTimer(Sender: TObject);
begin
  FreeLibrary(FFreeHandled);
  tmFreeLib.Enabled := False;
end;

//**************************** Application Events ****************************//
procedure TfrmMainMenu.LanguageChaged(var Message: TMessage);
//var
//  i: Integer;
begin
  FMenuReloaded := True;

  if (not pnSignOnPanel.Visible) then
    LoadMenu();

  UpdateSystemMenu();

  ExecSQL(
    'EXECUTE PROCEDURE SP_SET_CURRENT_LANGUAGE(' + QuotedStr(FMenusLanguage) + ')');
//  for i := 0 to (Screen.FormCount - 1) do
//    PostMessage(Screen.Forms[i].Handle, WM_MENUS_RELOADED, 0, 0);
end;

procedure TfrmMainMenu.SignedOff(var Message: TMessage);
begin
  if (not pnSignOnPanel.Visible) then
    mmSignOnOffClick(nil);
end;

procedure TfrmMainMenu.ExecAppExt(var Message: TMessage);
begin
  if (Message.WParam = 0) then
    ExecByName(ParamStr(4))
  else
  if (Message.WParam = 1) then
  begin
    if (Trim(FExecProgramName) <> '') then
    begin
      ExecByName(FExecProgramName);
      FExecProgramName := '';
    end;
  end;
end;

procedure TfrmMainMenu.ExecAppChar(var Message: TMessage);
begin
  if (Message.WParam = 0) then
    FExecProgramName := ''
  else
    FExecProgramName := FExecProgramName + Chr(Lo(Message.WParam));
end;

procedure TfrmMainMenu.aEventsHint(Sender: TObject);
begin
  Status.Panels[3].Text := ' ' + GetLongHint(Application.Hint);
end;

//************************** End Application Events **************************//

procedure TfrmMainMenu.xTabTabChange(Sender: TObject);
  function GetFormHandle(_ProgramName: String): TForm;
  var
    i,j: Integer;
  begin
    Result := nil;
    for i := 0 to High(FProgramsItemInfo) do
    begin
      if FProgramsItemInfo[i].Description=_ProgramName then
       Result := FProgramsItemInfo[i].MainFormHandle;
    end;
  end;
var
  _RunningForm: TForm;
  _Item: Integer;
begin
      if xTab.ActiveTab>=0 then
        if xTab.ActiveTab <= xTab.Tabs.Count then
        begin
          _RunningForm := GetFormHandle(xTab.Tabs.Strings[xTab.ActiveTab]);
          if Assigned(_RunningForm) then
          begin
            try
            _RunningForm.BringToFront();
            except
              FProgramsItemInfo[_Item].MainFormHandle := nil;
            end;
          end;
        end;
end;
procedure TfrmMainMenu.xTabCloseTab(Sender: TObject; Index: Integer;
  var Close: Boolean);

  function GetFormHandle(_ProgramName: String): TForm;
  var
    i,j: Integer;
  begin
    Result := nil;
    for i := 0 to High(FProgramsItemInfo) do
    begin
      if FProgramsItemInfo[i].Description=_ProgramName then
       Result := FProgramsItemInfo[i].MainFormHandle;
    end;
  end;
    
var
  _RunningForm: TForm;
  _Item: Integer;
begin

    if xTab.Tabs.Count=1 then
    begin
      if (Application.MessageBox(pchar('ยืนยันการจบโปรแกรม ? '),pchar('Exit Applicatoin'),MB_OKCANCEL or MB_ICONWARNING)=mrOK)
      then Application.Terminate;
    end else
    begin
        _RunningForm := GetFormHandle(xTab.Tabs.Strings[Index]);
        if Assigned(_RunningForm)  then
        begin
         _RunningForm.Close;
        end;
    end;
end;

end.
