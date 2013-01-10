unit SettingFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBXpress, FMTBcd, Provider, DB, SqlExpr,
  StdCtrls, RzLabel, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DBClient, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, RzButton, Mask, RzEdit, RzCmboBx;

type
  TfrmSetting = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    PageControl1: TPageControl;
    TabSettingReceive: TTabSheet;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    pnAllLocation: TRzPanel;
    grdLocation: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cdsRcvLocation: TClientDataSet;
    dsRcvLocation: TDataSource;
    cxGridDBTableView1MTTCDE: TcxGridDBColumn;
    cxGridDBTableView1MTTDES: TcxGridDBColumn;
    cxGridDBTableView1BILLNO: TcxGridDBColumn;
    cxGridDBTableView1PEROIDNO: TcxGridDBColumn;
    btnAddNew: TRzBitBtn;
    btnEdit: TRzBitBtn;
    Label4: TLabel;
    edLocCode: TRzEdit;
    Label1: TLabel;
    edLocDesc: TRzEdit;
    Label2: TLabel;
    edLocBillNo: TRzEdit;
    Label3: TLabel;
    edLocPeroidNo: TRzEdit;
    btnSave: TRzBitBtn;
    Label5: TLabel;
    cmbStatus: TRzComboBox;
    cdsTemp: TClientDataSet;
    pnAllReceiveType: TRzPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    grdPayType: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    btnAddNewPayType: TRzBitBtn;
    btnEditPayType: TRzBitBtn;
    edTypCode: TRzEdit;
    edTypeName: TRzEdit;
    btnSavePayType: TRzBitBtn;
    cmbTypeStatus: TRzComboBox;
    cdsPayType: TClientDataSet;
    dsPayType: TDataSource;
    cxGridDBTableView2pt_code: TcxGridDBColumn;
    cxGridDBTableView2pt_title: TcxGridDBColumn;
    cxGridDBTableView2pt_abbr: TcxGridDBColumn;
    cxGridDBTableView2pt_status: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cdsRcvLocationAfterScroll(DataSet: TDataSet);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPayTypeAfterScroll(DataSet: TDataSet);
  private
    FBranch: string;
    FUserId: string;
    procedure SetBranch(const Value: string);
    procedure SetUserId(const Value: string);
    procedure ExecSQL(strsql:string);

    procedure initForm();

    { Private declarations }
  public
    { Public declarations }
    property UserId : string read FUserId write SetUserId;
    property Branch: string read FBranch write SetBranch;
  end;

var
  frmSetting: TfrmSetting;

implementation

uses CommonLIB;

{$R *.dfm}

{ TfrmSetting }

procedure TfrmSetting.initForm;
begin
  cdsRcvLocation.Close;
  cdsRcvLocation.Open;
  cdsPayType.Close;
  cdsPayType.Open;

  cmbStatus.Items.Clear;
  cmbStatus.Items.AddObject('Active',TString.Create('A'));
  cmbStatus.Items.AddObject('In Active',TString.Create('I'));

  cmbTypeStatus.Items.Clear;
  cmbTypeStatus.Items.AddObject('Active',TString.Create('A'));
  cmbTypeStatus.Items.AddObject('In Active',TString.Create('C'));

end;

procedure TfrmSetting.SetBranch(const Value: string);
begin
  FBranch := Value;
end;

procedure TfrmSetting.SetUserId(const Value: string);
begin
  FUserId := Value;
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  initForm;
end;

procedure TfrmSetting.cxGridDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmSetting.cdsRcvLocationAfterScroll(DataSet: TDataSet);
begin
  edLocCode.Text:= DataSet.fieldbyname('MTTCDE').AsString;
  edLocDesc.Text:= DataSet.fieldbyname('MTTDES').AsString;
  edLocBillNo.Text:= DataSet.fieldbyname('BILLNO').AsString;
  edLocPeroidNo.Text:= DataSet.fieldbyname('PEROIDNO').AsString;
  if  DataSet.fieldbyname('MTTACT').AsString='A' then  cmbStatus.ItemIndex:=0
  else   cmbStatus.ItemIndex:=1;
end;

procedure TfrmSetting.btnEditClick(Sender: TObject);
begin
  edLocDesc.Enabled:=true;
  edLocBillNo.Enabled:=true;
  edLocPeroidNo.Enabled:=true;
  btnSave.Enabled := true;
  cmbStatus.Enabled:=true;
end;

procedure TfrmSetting.btnSaveClick(Sender: TObject);
var maxcde : integer;
    newcde : string;
begin
  maxcde:=0;
  cdsTemp.Close;
  cdsTemp.CommandText:=' select COUNT(*) as MAXCOUNT from MTTCDE where MTTGRP=''FRONT''';
  cdsTemp.Open;
  if cdsTemp.RecordCount>0 then
    maxcde:=cdsTemp.fieldbyname('MAXCOUNT').AsInteger;

  cdsTemp.Close;
  cdsTemp.CommandText:=' select * from MTTCDE where MTTGRP=''FRONT'' and MTTCDE='''+edLocCode.Text+'''';
  cdsTemp.Open;

  newcde :=  FormatCurr('00', maxcde+1);
  if cdsTemp.Active then
    if cdsTemp.RecordCount>0 then
    begin
      ExecSQL('update MTTCDE set MTTNM1='+edLocBillNo.Text+',MTTDES='''+edLocDesc.Text+''',MTTACT='''+TString(cmbStatus.Items.Objects[cmbStatus.ItemIndex]).Str+''' where MTTGRP=''FRONT'' and MTTCDE='''+edLocCode.Text+'''');
      ExecSQL('update MTTCDE set MTTNM1='+edLocPeroidNo.Text+',MTTDES='''+edLocDesc.Text+''',MTTACT='''+TString(cmbStatus.Items.Objects[cmbStatus.ItemIndex]).Str+''' where MTTGRP=''PEROID'' and MTTCDE='''+edLocCode.Text+'''');
    end else
    begin
      ExecSQL('insert into MTTCDE (MTTACT,MTTSTS,MTTABR,MTTGRP,MTTCDE,MTTDES,MTTNM1) values('''+TString(cmbStatus.Items.Objects[cmbStatus.ItemIndex]).Str+''',''A'',''FRONT'+inttostr(maxcde+1)+''',''FRONT'','''+edLocCode.Text+''','''+edLocDesc.Text+''','+edLocBillNo.Text+')');
      ExecSQL('insert into MTTCDE (MTTACT,MTTSTS,MTTABR,MTTGRP,MTTCDE,MTTDES,MTTNM1) values('''+TString(cmbStatus.Items.Objects[cmbStatus.ItemIndex]).Str+''',''A'',''PEROID'+inttostr(maxcde+1)+''',''PEROID'','''+edLocCode.Text+''','''+edLocDesc.Text+''','+edLocBillNo.Text+')');
    end;

  edLocDesc.Enabled:=false;
  edLocBillNo.Enabled:=false;
  edLocPeroidNo.Enabled:=false;
  btnSave.Enabled := false;
  cmbStatus.Enabled:=false;


  cdsRcvLocation.Close;
  cdsRcvLocation.Open;
end;

procedure TfrmSetting.ExecSQL(strsql: string);
begin
 Conn.ExecuteDirect(strsql);
end;

procedure TfrmSetting.btnAddNewClick(Sender: TObject);
begin
  cdsTemp.Close;
  cdsTemp.CommandText:=' select COUNT(*) as MAXCOUNT from MTTCDE where MTTGRP=''FRONT''';
  cdsTemp.Open;
  if cdsTemp.RecordCount>0 then
    edLocCode.Text:= FormatCurr('00', cdsTemp.fieldbyname('MAXCOUNT').AsInteger);

  edLocDesc.Enabled:=true;
  edLocBillNo.Enabled:=true;
  edLocPeroidNo.Enabled:=true;
  btnSave.Enabled := true;
  cmbStatus.Enabled:=true;

  edLocDesc.text:='';
  edLocBillNo.text:='';
  edLocPeroidNo.text:='';
  btnSave.Enabled := true;
  cmbStatus.ItemIndex:=0;
end;

procedure TfrmSetting.FormCreate(Sender: TObject);
begin
  initDataset(self,Conn);
end;

procedure TfrmSetting.cdsPayTypeAfterScroll(DataSet: TDataSet);
begin
  edTypCode.Text:=DataSet.fieldbyname('pt_code').AsString;
  edTypeName.Text:=DataSet.fieldbyname('pt_title').AsString;
  if  DataSet.fieldbyname('pt_status').AsString='C' then  cmbTypeStatus.ItemIndex:=1
  else   cmbTypeStatus.ItemIndex:=0;
end;

end.
