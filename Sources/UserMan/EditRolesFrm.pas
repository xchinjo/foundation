unit EditRolesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, StdCtrls, RzCmboBx, RzButton, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,UserListFrm, cxCheckBox,
  cxDropDownEdit;

type
  TfrmEditRoles = class(TForm)
    rzTopPanel: TRzPanel;
    grdRolePermissionDBTableView1: TcxGridDBTableView;
    grdRolePermissionLevel1: TcxGridLevel;
    grdRolePermission: TcxGrid;
    RzPanel1: TRzPanel;
    btnOK: TRzButton;
    btnCancel: TRzButton;
    cmbRoles: TRzComboBox;
    dsRolePermission: TDataSource;
    grdRolePermissionDBTableView1id: TcxGridDBColumn;
    grdRolePermissionDBTableView1MenuName: TcxGridDBColumn;
    grdRolePermissionDBTableView1FAccess: TcxGridDBColumn;
    grdRolePermissionDBTableView1FInsert: TcxGridDBColumn;
    grdRolePermissionDBTableView1FModify: TcxGridDBColumn;
    grdRolePermissionDBTableView1FDelete: TcxGridDBColumn;
    grdRolePermissionDBTableView1FInquiry: TcxGridDBColumn;
    grdRolePermissionDBTableView1FReport: TcxGridDBColumn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbRolesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    FMainForm: TFrmUserList;
    procedure SetMainForm(const Value: TFrmUserList);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TFrmUserList read FMainForm write SetMainForm;
  end;

var
  frmEditRoles: TfrmEditRoles;

implementation

uses CommonUtils, CommonLIB, DBClient;



{$R *.dfm}

procedure TfrmEditRoles.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEditRoles.SetMainForm(const Value: TFrmUserList);
begin
  FMainForm := Value;
end;

procedure TfrmEditRoles.FormShow(Sender: TObject);
begin
//  loadCmbList(cmbRoles,FMainForm.cdsTemp,'select * from roles where RoleStatus=''A''','RoleId','RoleName','1');
end;

procedure TfrmEditRoles.cmbRolesChange(Sender: TObject);
begin
{
  with FMainForm.cdsRolePermission do
  begin
    if cmbRoles.Items.Count>0 then
    begin
      close;
      CommandText:='select a.*,c.*,b.* from Menus a left join RolesPermission b on a.id=b.MenuId and b.RoleId='+TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str+' left join Roles c on b.RoleId=c.RoleId';
      open;
    end;
  end;
  }
end;

procedure TfrmEditRoles.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmEditRoles.btnOKClick(Sender: TObject);
var 
    strSQL:string;
begin



  with FMainForm do
  begin
   // if cdsRolePermission.State in [dsEdit,dsInsert] then cdsPermission.Post;
    cdsRolePermission.First;
    while not cdsRolePermission.Eof do
    begin

      strSQL:='if exists(select * from RolesPermission where RoleId='+TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str+' and MenuId='+cdsRolePermission.fieldbyname('id').AsString+' ) begin '+
      '  update RolesPermission set   '+
      '  FAccess='''+cdsRolePermission.fieldbyname('FAccess').AsString+''',  '+
      '  FInsert='''+cdsRolePermission.fieldbyname('FInsert').AsString+''',   '+
      '  FModify='''+cdsRolePermission.fieldbyname('FModify').AsString+''',   '+
      '  FDelete='''+cdsRolePermission.fieldbyname('FDelete').AsString+''',     '+
      '  FInquiry='''+cdsRolePermission.fieldbyname('FInquiry').AsString+''',     '+
      '  FReport='''+cdsRolePermission.fieldbyname('FReport').AsString+'''      '+
      '  where RoleId='+TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str+' and MenuId='+cdsRolePermission.fieldbyname('id').AsString+'   '+
      ' end else begin ' +
      '	insert into RolesPermission(MenuId,RoleId,RoleStatus,FAccess,FInsert,FModify,FDelete,FInquiry,FReport) '+
      '	values('+cdsRolePermission.fieldbyname('id').AsString+','+TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str+',''A'','''+cdsRolePermission.fieldbyname('FAccess').AsString+''','''+cdsRolePermission.fieldbyname('FInsert').AsString+''','''+cdsRolePermission.fieldbyname('FModify').AsString+''','''+cdsRolePermission.fieldbyname('FDelete').AsString+''','''+cdsRolePermission.fieldbyname('FInquiry').AsString+''','''+cdsRolePermission.fieldbyname('FReport').AsString+''')  '+

      ' end ';

      //InputBox('','',strSQL);
      ExecSQL(strSQL);
      cdsRolePermission.Next;
    end;
  end;


{
  FMainForm.cdsRolePermissionW.Close;
  FMainForm.cdsRolePermissionW.CommandText:='select * from RolesPermission where RoleId='+TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str;
  FMainForm.cdsRolePermissionW.Open;
  }
end;

end.
