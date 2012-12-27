unit UserListFrm;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, RzLabel, ExtCtrls, RzPanel, DB,
  DBClient, Provider, SqlExpr, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, cxDBData, Mask, RzEdit, RzDBEdit, RzButton,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, cxCheckBox, cxDropDownEdit;

type

  TFNodeType = (ntRoot,ntGroup,ntReport);
  TPermissionFlag = (fgMenu,fgInsert,fgModify,fgDelete,fgInquiry,fgReport);
  TPermissionFlags = set of  TPermissionFlag;


  TNodeData = class
     FID:string;
     FName :string;
     FLevel:integer;
     FParent:integer;
     FNodeType:TFNodeType;
     FPermissionFg:TPermissionFlags;
     FNodeFlag:string;
     FNodeStatus:string;
  end;



  TFrmUserList = class(TForm)
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    DsUserList: TDataSource;
    PaneUser: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    pnClients: TRzPanel;
    RzPanel5: TRzPanel;
    Label9: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    TxtId: TRzDBEdit;
    TxtName: TRzDBEdit;
    TxtUser: TRzDBEdit;
    Conn: TSQLConnection;
    DtDate: TRzDBDateTimeEdit;
    CdsUserList: TClientDataSet;
    BtnAdd: TRzBitBtn;
    BtnActive: TRzBitBtn;
    BtnInactive: TRzBitBtn;
    Auto: TClientDataSet;
    rzTopPanel: TRzPanel;
    PageControlUsr: TPageControl;
    TabUserList: TTabSheet;
    tabPermission: TTabSheet;
    grdUserList: TcxGrid;
    grdUserListDBTableView1: TcxGridDBTableView;
    grdUserListDBTableView1DBColumn1: TcxGridDBColumn;
    grdUserListDBTableView1DBColumn2: TcxGridDBColumn;
    grdUserListDBTableView1us_status: TcxGridDBColumn;
    grdUserListLevel1: TcxGridLevel;
    trUserPermission: TTreeView;
    cdsPermission: TClientDataSet;
    cdsMenus: TClientDataSet;
    pnRight: TRzPanel;
    pnRightTop: TRzPanel;
    lvRoles: TListView;
    btnNewRole: TRzBitBtn;
    btnEditRole: TRzBitBtn;
    cdsRolePermission: TClientDataSet;
    cdsTemp: TClientDataSet;
    cdsRolePermissionW: TClientDataSet;
    grdUserListDBTableView1UserRole: TcxGridDBColumn;
    grdRolePermission: TcxGrid;
    grdRolePermissionDBTableView1: TcxGridDBTableView;
    grdRolePermissionDBTableView1id: TcxGridDBColumn;
    grdRolePermissionDBTableView1MenuName: TcxGridDBColumn;
    grdRolePermissionDBTableView1FAccess: TcxGridDBColumn;
    grdRolePermissionDBTableView1FInsert: TcxGridDBColumn;
    grdRolePermissionDBTableView1FModify: TcxGridDBColumn;
    grdRolePermissionDBTableView1FDelete: TcxGridDBColumn;
    grdRolePermissionDBTableView1FInquiry: TcxGridDBColumn;
    grdRolePermissionDBTableView1FReport: TcxGridDBColumn;
    grdRolePermissionLevel1: TcxGridLevel;
    dsRolePermission: TDataSource;
    btnSavePermission: TRzBitBtn;
    cdsRoles: TClientDataSet;
    btnChangePassword: TRzBitBtn;
    btnRefresh: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    function AUTOID(F: string): string;
    procedure CdsUserListNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnEditRoleClick(Sender: TObject);
    procedure grdUserListDBTableView1UserRoleGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tabPermissionShow(Sender: TObject);
    procedure lvRolesClick(Sender: TObject);
    procedure btnSavePermissionClick(Sender: TObject);
    procedure lvRolesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdUserListDBTableView1DblClick(Sender: TObject);
    procedure btnChangePasswordClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure BtnInactiveClick(Sender: TObject);
    procedure BtnActiveClick(Sender: TObject);
    procedure grdUserListDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    procedure LoadUser ;
    function EnaBtn (R:Boolean): Boolean ;
    procedure getPermission(uid:string);
    procedure GenerateTree(Node: TTreeNode; ParentId: integer;cds: TClientDataSet;step:integer);
    procedure ShowPermisison();


  public
    { Public declarations }
    procedure ExecSQL(sql:string);

  end;

var
  FrmUserList: TFrmUserList;
  RootNode: TTreeNode;

implementation

uses uCiaXml, crgSec,CommonLIB, EditRolesFrm, CommonUtils, SelectRoleFrm,
  ChangePasswordFrm, NewUserFrm;

{$R *.dfm}

procedure TFrmUserList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TFrmUserList.LoadUser;
begin
  CdsUserList.Close ;
  CdsUserList.CommandText := 'select a.*,c.* from user_account a  left join UserRole b on a.us_code=b.uid left join Roles c on b.role=c.RoleId  order by a.us_code';
  CdsUserList.Open ;
  //loadCmbItems(TcxComboBoxProperties(grdUserListDBTableView1UserRole.Properties).Items,cdsTemp,'select * from roles where RoleStatus=''A''','RoleId','RoleName','1');
end;

procedure TFrmUserList.FormShow(Sender: TObject);
begin
  LoadUser ;
  EnaBtn(True) ;
  grdUserList.SetFocus ;
end;

function TFrmUserList.EnaBtn(R: Boolean): Boolean;
begin
  BtnAdd.Enabled     := R ;


  TxtName.ReadOnly  := R ;
//  TxtCode.ReadOnly := R ;
  TxtUser.ReadOnly    := R ;

//  TxtTel.ReadOnly    := R ;
  DtDate.ReadOnly := R ;
end;

procedure TFrmUserList.BtnAddClick(Sender: TObject);
var frm : TfrmNewUser;
    strSQL:string;
begin
(*
  CdsUserList.Append ;
  TxtName.SetFocus ;
  EnaBtn(False) ;
  *)
  (*
  cdsMenus.close;
  cdsMenus.CommandText:='select * from Menus';
  cdsMenus.Open;

  getPermission('');
  *)

  frm := TfrmNewUser.Create(self);
  frm.MainForm := self;
  frm.ShowModal;

  if frm.IsOK then
  begin
    strSQL:=''+
    ' insert into user_account(us_code,us_user,us_name,us_password,us_role,us_status) '+
    ' values('''+frm.UserCode+''','''+frm.UserName+''','''+frm.FullName+''','''+EncryptEx(frm.Password)+''',2,''A'') ';

    ExecSQL(strSQL);
    ShowMessage('บันทึกเรียบร้อย');
  end;

end;

function TFrmUserList.AUTOID(F: string): string;
begin
  Auto.Close;
  Auto.CommandText:= 'select max('+F+')as userid from user_account' ;
  Auto.Open;
  if Auto.FieldByName('us_code').AsString = '' then
    begin
      Result :='00001';
    end
  else
  Result := RightStr('000'+IntToStr(StrToInt(Auto.FieldByName('us_code').AsString) + 1 ), 3) ;
end;

procedure TFrmUserList.CdsUserListNewRecord(DataSet: TDataSet);
begin
  CdsUserList.FieldByName('us_code').AsString  := AUTOID('userid') ;
  //CdsUserList.FieldByName('cdate').AsDateTime := Now ;
end;

procedure TFrmUserList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3: BtnAddClick(Sender) ;
  end;
end;

procedure TFrmUserList.FormCreate(Sender: TObject);
begin
  SetChildTaborders(PaneUser);
  initSqlConnection(Conn);
  initDataset(self,Conn);



  PageControlUsr.ActivePage:=TabUserList;
end;

procedure TFrmUserList.getPermission(uid: string);
var
  TempNode,TempNode2: TTreeNode;
  irow:integer;

begin

  trUserPermission.FullExpand;


  trUserPermission.Items.Clear;



  RootNode:=trUserPermission.Items.AddChild(RootNode,'Menu');
  RootNode.Data:=TNodeData.Create;
  //TempNode.ImageIndex:=0;
  //TempNode.SelectedIndex:=0;
  TNodeData(RootNode.Data).FID:='';
  TNodeData(RootNode.Data).FName:='Menu';
  TNodeData(RootNode.Data).FLevel:=0;
  TNodeData(RootNode.Data).FNodeType:=ntRoot;
  TNodeData(RootNode.Data).FNodeFlag:='O';
  TNodeData(RootNode.Data).FNodeStatus:='A';



  TempNode:=trUserPermission.Items.AddChild(RootNode,'Front Office');
  TempNode.Data:=TNodeData.Create;
  //TempNode.ImageIndex:=0;
  //TempNode.SelectedIndex:=0;
  TNodeData(TempNode.Data).FID:='';
  TNodeData(TempNode.Data).FName:='Front Office';
  TNodeData(TempNode.Data).FLevel:=0;
  TNodeData(TempNode.Data).FNodeType:=ntRoot;
  TNodeData(TempNode.Data).FNodeFlag:='O';
  TNodeData(TempNode.Data).FNodeStatus:='A';

  with cdsMenus do
  begin
    close;
    CommandText:='select * from Menus';
    open;
    GenerateTree(TempNode,0,cdsMenus,1);
  end;


  trUserPermission.FullExpand;



end;

procedure TFrmUserList.GenerateTree(Node: TTreeNode; ParentId: integer;
  cds: TClientDataSet; step: integer);
var
TempNode,TempNode2: TTreeNode;
irow:integer;
begin

    Node.DeleteChildren;
    if cds.RecordCount>0 then
    begin
      cds.First;
      while not cds.Eof do
      begin

        cdsPermission.close;
        cdsPermission.CommandText:='select * from Menus';
        cdsPermission.Open;


        TempNode:=trUserPermission.Items.AddChild(Node,'['+trim(cds.fieldbyname('id').AsString)+'] '+cds.fieldbyname('MenuName').AsString);
        TempNode.Data:=TNodeData.Create;
        TNodeData(TempNode.Data).FID:=trim(cds.fieldbyname('id').AsString);
        TNodeData(TempNode.Data).FName:=cds.fieldbyname('MenuName').AsString;
        TNodeData(TempNode.Data).FParent:=ParentId;
        TNodeData(TempNode.Data).FLevel:=TNodeData(Node.Data).FLevel+1;


        TNodeData(TempNode.Data).FNodeFlag:='O';
        TNodeData(TempNode.Data).FNodeStatus:='A';

        TempNode.ImageIndex:=0;
        TempNode.SelectedIndex:=0;

        (*

        if cdsPerM.RecordCount>0 then
        begin
         if UpperCase(trim(cdsPerM.FieldByName('RecordStatus').AsString))='A' then
          TempNode.StateIndex:=2
         else TempNode.StateIndex:=1;
         if UpperCase(trim(cdsPerM.FieldByName('FlagMenu').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgMenu];
         if UpperCase(trim(cdsPerM.FieldByName('FlagInsert').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgInsert];
         if UpperCase(trim(cdsPerM.FieldByName('FlagModify').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgModify];
         if UpperCase(trim(cdsPerM.FieldByName('FlagDelete').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgDelete];
         if UpperCase(trim(cdsPerM.FieldByName('FlagInquiry').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgInquiry];
         if UpperCase(trim(cdsPerM.FieldByName('FlagReport').AsString))='Y' then TNodeData(TempNode.Data).FPermissionFg:=TNodeData(TempNode.Data).FPermissionFg+[fgReport];
        end
        else
          TempNode.StateIndex:=1;




        if (TNodeData(Node.Data).FNodeType=ntRoot) then
        begin
          TNodeData(TempNode.Data).FNodeType:=ntGroup;

        end;

        if (TNodeData(Node.Data).FNodeType=ntGroup)  then
        begin
          TNodeData(TempNode.Data).FNodeType:=ntReport;
        end;

        *)


        cds.Next;
      end;
    end;


//
end;
procedure TFrmUserList.ExecSQL(sql: string);
begin
  Conn.ExecuteDirect(sql)
end;

procedure TFrmUserList.btnEditRoleClick(Sender: TObject);
var frm:TfrmEditRoles;
begin
  cdsRolePermission.Close;
  cdsRolePermission.Open;

  frm := TfrmEditRoles.Create(self);
  frm.MainForm := self;
  frm.ShowModal;
end;

procedure TFrmUserList.grdUserListDBTableView1UserRoleGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
   //ShowMessage(TcxComboBoxProperties(AProperties).Items.ValueFromIndex[0]);

end;

procedure TFrmUserList.tabPermissionShow(Sender: TObject);
var
  item : TListItem;
begin
  cdsRolePermission.Close;
  cdsRolePermission.Open;


  cdsTemp.Close;
  cdsTemp.CommandText:='select * from roles where RoleStatus=''A''';
  cdsTemp.Open;

 if cdsTemp.Active then
   with  cdsTemp do
   begin
      lvRoles.Items.Clear;
      first;
      while not cdsTemp.Eof do
      begin
         item := lvRoles.Items.Add;
         item.Caption:= fieldbyname('RoleId').AsString;
         item.SubItems.Add(fieldbyname('RoleName').AsString) ;
         item.Data := TString.Create(fieldbyname('RoleId').AsString);
        if not cdsTemp.Eof then next;
      end;
   end;
end;



procedure TFrmUserList.lvRolesClick(Sender: TObject);
begin
  if lvRoles.Selected<> nil then
  ShowPermisison;
end;

procedure TFrmUserList.btnSavePermissionClick(Sender: TObject);
var
    strSQL:string;
begin

    cdsRolePermission.First;
    while not cdsRolePermission.Eof do
    begin

      strSQL:='if exists(select * from RolesPermission where RoleId='+TString(lvRoles.Selected.Data).Str+' and MenuId='+cdsRolePermission.fieldbyname('RECORD_ID').AsString+' ) begin '+
      '  update RolesPermission set   '+
      '  FAccess='''+cdsRolePermission.fieldbyname('FAccess').AsString+''',  '+
      '  FInsert='''+cdsRolePermission.fieldbyname('FInsert').AsString+''',   '+
      '  FModify='''+cdsRolePermission.fieldbyname('FModify').AsString+''',   '+
      '  FDelete='''+cdsRolePermission.fieldbyname('FDelete').AsString+''',     '+
      '  FInquiry='''+cdsRolePermission.fieldbyname('FInquiry').AsString+''',     '+
      '  FReport='''+cdsRolePermission.fieldbyname('FReport').AsString+'''      '+
      '  where RoleId='+TString(lvRoles.Selected.Data).Str+' and MenuId='+cdsRolePermission.fieldbyname('RECORD_ID').AsString+'   '+
      ' end else begin ' +
      '	insert into RolesPermission(MenuId,RoleId,RoleStatus,FAccess,FInsert,FModify,FDelete,FInquiry,FReport) '+
      '	values('+cdsRolePermission.fieldbyname('RECORD_ID').AsString+','+TString(lvRoles.Selected.Data).Str+',''A'','''+cdsRolePermission.fieldbyname('FAccess').AsString+''','''+cdsRolePermission.fieldbyname('FInsert').AsString+''','''+cdsRolePermission.fieldbyname('FModify').AsString+''','''+cdsRolePermission.fieldbyname('FDelete').AsString+''','''+cdsRolePermission.fieldbyname('FInquiry').AsString+''','''+cdsRolePermission.fieldbyname('FReport').AsString+''')  '+

      ' end ';
      ExecSQL(strSQL);
      cdsRolePermission.Next;
    end;
end;


procedure TFrmUserList.lvRolesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   ShowPermisison;
end;

procedure TFrmUserList.ShowPermisison;
begin
  with cdsRolePermission do
  begin
      close;
      CommandText:='select a.*,c.*,b.* from MTTMNU a left join RolesPermission b on a.record_id=b.MenuId and b.RoleId='+TString(lvRoles.Selected.Data).Str+' left join Roles c on b.RoleId=c.RoleId';
      open;
  end;
end;

procedure TFrmUserList.grdUserListDBTableView1DblClick(Sender: TObject);
var frm : TfrmSelectRole;
    strSQL:string;
begin
   frm := TfrmSelectRole.Create(self);
   frm.MainForm:=self;

   if CdsUserList.fieldbyname('us_role').IsNull then
    frm.currRole :=2
   else frm.currRole := StrToInt((CdsUserList.fieldbyname('us_role').AsString));
   frm.ShowModal;
   if frm.IsOK then
   begin
     strSQL:=''+
     ' declare @uid varchar(30) '+
     ' declare @role int '+
     ' set @uid='''+CdsUserList.fieldbyname('us_code').AsString+''' '+
     ' set @role='+inttostr(frm.SelectRole)+
     ' if exists(   '+
     ' select  * from UserRole where uid=@uid '+
     ' ) begin '+
     '   update UserRole set role=@role where uid=@uid '+
     ' end else '+
     ' begin '+
     '   insert UserRole(uid,role) values(@uid,@role) '+
     ' end ';
     ExecSQL(strSQL);


     strSQL:='update user_account set us_role='''+inttostr(frm.SelectRole)+''' where us_code='''+CdsUserList.fieldbyname('us_code').AsString+'''';
     ExecSQL(strSQL);

     LoadUser;
   end;

end;

procedure TFrmUserList.btnChangePasswordClick(Sender: TObject);
var frm : TfrmChangePassword;
    strSQL:string;
begin
   frm :=TfrmChangePassword.Create(self);
   frm.CurrPassword :=  DecryptEx(CdsUserList.fieldbyname('us_password').AsString);
   frm.ShowModal;
   if frm.IsOK then
   begin
     strSQL:='update user_account set us_password='''+EncryptEx(frm.NewPassword)+''' where us_code='''+CdsUserList.fieldbyname('us_code').AsString+'''';
     ExecSQL(strSQL);
     ShowMessage('Successfull change password.');
   end;
end;

procedure TFrmUserList.btnRefreshClick(Sender: TObject);
begin
  LoadUser;
end;

procedure TFrmUserList.BtnInactiveClick(Sender: TObject);
var strSQL:string;
begin
     strSQL:=' update user_account set us_status=''I'' where us_code='''+CdsUserList.fieldbyname('us_code').AsString+''' ';
     ExecSQL(strSQL);

     LoadUser;
end;
procedure TFrmUserList.BtnActiveClick(Sender: TObject);
var strSQL:string;
begin
     strSQL:=' update user_account set us_status=''A'' where us_code='''+CdsUserList.fieldbyname('us_code').AsString+''' ';
     ExecSQL(strSQL);

     LoadUser;
end;

procedure TFrmUserList.grdUserListDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
