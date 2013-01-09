unit EndPeroidFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBXpress, FMTBcd, Provider, DB, SqlExpr,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, Mask, RzEdit, RzLabel, RzButton, DBClient, ComCtrls, frxClass,
  frxDBSet, frxDesgn;

type
  TfrmEndPeroid = class(TForm)
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    cdsBill: TClientDataSet;
    dsBill: TDataSource;
    cdsBillCancel: TClientDataSet;
    dsBillCancel: TDataSource;
    cdsPeroid: TClientDataSet;
    dsPeroid: TDataSource;
    cdsTemp: TClientDataSet;
    cdsClosePeriod: TClientDataSet;
    cdsAllPeroid: TClientDataSet;
    PageContainer: TPageControl;
    TabCurrentPeriod: TTabSheet;
    TabClosedPeriod: TTabSheet;
    pnBody: TRzPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pnTitle1: TRzPanel;
    RzLabel2: TRzLabel;
    pnTitle2: TRzPanel;
    RzLabel1: TRzLabel;
    pnTitle3: TRzPanel;
    RzLabel3: TRzLabel;
    grdPeroid: TcxGrid;
    grdPeroidDBTableView1: TcxGridDBTableView;
    grdPeroidLevel1: TcxGridLevel;
    grdBill: TcxGrid;
    grdBillDBTableView1: TcxGridDBTableView;
    grdBillDBTableView1bid: TcxGridDBColumn;
    grdBillDBTableView1bno: TcxGridDBColumn;
    grdBillDBTableView1bperiod: TcxGridDBColumn;
    grdBillDBTableView1bdate: TcxGridDBColumn;
    grdBillDBTableView1btotal: TcxGridDBColumn;
    grdBillDBTableView1bbank: TcxGridDBColumn;
    grdBillDBTableView1bbankname: TcxGridDBColumn;
    grdBillLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    pnTop: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    edPeroidNo: TRzEdit;
    btnClosePeroid: TRzBitBtn;
    edAmount: TRzNumericEdit;
    edCancelAmount: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    edActiveItems: TRzNumericEdit;
    edCancelItems: TRzNumericEdit;
    pnButtom: TRzPanel;
    btnDailyReport: TRzBitBtn;
    btnCancelReport: TRzBitBtn;
    btnSummaryObjective: TRzBitBtn;
    btnReceiptReport: TRzBitBtn;
    btnSticker: TRzBitBtn;
    btnClose: TRzBitBtn;
    btnAddressReport: TRzBitBtn;
    btnMailReport: TRzBitBtn;
    btnCongratulations: TRzBitBtn;
    btnOutstanding: TRzBitBtn;
    RzPanel5: TRzPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    edShowPeroidNo: TRzEdit;
    edPeriodAmount: TRzNumericEdit;
    edPeriodCancelAmount: TRzNumericEdit;
    RzNumericEdit4: TRzNumericEdit;
    edPeriodActiveItems: TRzNumericEdit;
    edPeriodCancelItems: TRzNumericEdit;
    btnOpenPeroid: TRzBitBtn;
    RzPanel6: TRzPanel;
    btnDailyReportA: TRzBitBtn;
    btnCancelReportA: TRzBitBtn;
    btnSummaryObjectiveA: TRzBitBtn;
    btnReceiptReportA: TRzBitBtn;
    btnStickerA: TRzBitBtn;
    btnCloseA: TRzBitBtn;
    btnAddressReportA: TRzBitBtn;
    btnMailReportA: TRzBitBtn;
    btnCongratulationsA: TRzBitBtn;
    btnOutstandingA: TRzBitBtn;
    grdPeroidDBTableView1pe_id: TcxGridDBColumn;
    grdPeroidDBTableView1pe_begindate: TcxGridDBColumn;
    grdPeroidDBTableView1pe_begindate1: TcxGridDBColumn;
    grdPeroidDBTableView1pe_closedate: TcxGridDBColumn;
    grdPeroidDBTableView1pe_closedate1: TcxGridDBColumn;
    grdPeroidDBTableView1pe_user: TcxGridDBColumn;
    grdPeroidDBTableView1pe_ReceiptF: TcxGridDBColumn;
    grdPeroidDBTableView1pe_ReceiptT: TcxGridDBColumn;
    grdPeroidDBTableView1pe_Amount: TcxGridDBColumn;
    grdPeroidDBTableView1pe_ReceiptBill: TcxGridDBColumn;
    grdPeroidDBTableView1pe_CancelBill: TcxGridDBColumn;
    grdPeroidDBTableView1us_name: TcxGridDBColumn;
    cdsPeroidA: TClientDataSet;
    dsPeroidA: TDataSource;
    frxReport: TfrxReport;
    cdsReport: TClientDataSet;
    frxDataset: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    grdBillDBTableView1pt_title: TcxGridDBColumn;
    cxGrid3DBTableView1bid: TcxGridDBColumn;
    cxGrid3DBTableView1bno: TcxGridDBColumn;
    cxGrid3DBTableView1bperiod: TcxGridDBColumn;
    cxGrid3DBTableView1bdate: TcxGridDBColumn;
    cxGrid3DBTableView1btotal: TcxGridDBColumn;
    cxGrid3DBTableView1bbank: TcxGridDBColumn;
    cxGrid3DBTableView1bbankname: TcxGridDBColumn;
    cxGrid3DBTableView1pt_title: TcxGridDBColumn;
    grdBillDBTableView1bbrance: TcxGridDBColumn;
    cxGrid3DBTableView1bbrance: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    RzPanel2: TRzPanel;
    RzLabel4: TRzLabel;
    RzPanel3: TRzPanel;
    RzLabel5: TRzLabel;
    RzPanel4: TRzPanel;
    RzLabel6: TRzLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cdsBillA: TClientDataSet;
    dsBillA: TDataSource;
    cdsBillCancelA: TClientDataSet;
    dsBillCancelA: TDataSource;
    frxDesigner1: TfrxDesigner;
    btnRefresh: TRzBitBtn;
    grdBillDBTableView1do_name: TcxGridDBColumn;
    grdBillDBTableView1do_lname: TcxGridDBColumn;
    grdBillDBTableView1brefno: TcxGridDBColumn;
    grdBillDBTableView1brefdate: TcxGridDBColumn;
    grdBillDBTableView1bremark: TcxGridDBColumn;
    cxGrid3DBTableView1brefno: TcxGridDBColumn;
    cxGrid3DBTableView1brefdate: TcxGridDBColumn;
    cxGrid3DBTableView1buserid: TcxGridDBColumn;
    cxGrid3DBTableView1bremark: TcxGridDBColumn;
    cxGrid3DBTableView1do_name: TcxGridDBColumn;
    cxGrid3DBTableView1do_lname: TcxGridDBColumn;
    grdBillDBTableView1buserid: TcxGridDBColumn;
    cxGridDBTableView2brefno: TcxGridDBColumn;
    cxGridDBTableView2brefdate: TcxGridDBColumn;
    cxGridDBTableView2do_name: TcxGridDBColumn;
    cxGridDBTableView2do_lname: TcxGridDBColumn;
    cxGridDBTableView3brefno: TcxGridDBColumn;
    cxGridDBTableView3brefdate: TcxGridDBColumn;
    cxGridDBTableView3buserid: TcxGridDBColumn;
    cxGridDBTableView3do_name: TcxGridDBColumn;
    cxGridDBTableView3do_lname: TcxGridDBColumn;
    cxGridDBTableView2buserid: TcxGridDBColumn;
    cxGridDBTableView2bremark: TcxGridDBColumn;
    cxGridDBTableView3bremark: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnClosePeroidClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOpenPeroidClick(Sender: TObject);
    procedure btnReceiptReportClick(Sender: TObject);
    procedure btnDailyReportClick(Sender: TObject);
    procedure btnCancelReportClick(Sender: TObject);
    procedure btnSummaryObjectiveClick(Sender: TObject);
    procedure btnDailyReportAClick(Sender: TObject);
    procedure btnCancelReportAClick(Sender: TObject);
    procedure btnSummaryObjectiveAClick(Sender: TObject);
    procedure btnReceiptReportAClick(Sender: TObject);
    procedure btnStickerClick(Sender: TObject);
    procedure btnMailReportClick(Sender: TObject);
    procedure btnCongratulationsClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnStickerAClick(Sender: TObject);
    procedure btnMailReportAClick(Sender: TObject);
    procedure btnCongratulationsAClick(Sender: TObject);
    procedure grdPeroidDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure grdBillDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid3DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    FcurrWorkPeroid: string;
    FcurrTotalAmount: currency;
    FcurrClosePeroid: string;
    FcurrShowPeroid: string;
    FIsClosed: boolean;
    FBranch: string;
    FUserID: string;

    { Private declarations }
    procedure initForm();
    procedure SetcurrWorkPeroid(const Value: string);
    function getPeriodCancelAMT(pid:string):currency;
    function getPeriodActiveAMT(pid:string):currency;
    function getPeriodActiveItems(pid: string): integer;
    function getPeriodCancelItems(pid: string): integer;

    procedure SetcurrTotalAmount(const Value: currency);
    procedure ClosePeriod();
    procedure ExecSQL(strSQL: string);
    procedure SetcurrClosePeroid(const Value: string);
    procedure SetcurrShowPeroid(const Value: string);
    procedure ShowPeroid(peroid:string);
    procedure rpDailyReport(Period:string);
    procedure rpCancelReport(Period:string);
    procedure rpSummaryObjective(Period:string);
    procedure rpReceiptReport(Period:string);
    procedure SetIsClosed(const Value: boolean);
    procedure SetBranch(const Value: string);
    procedure SetUserID(const Value: string);

  public
    { Public declarations }
    property currClosePeroid : string read FcurrClosePeroid write SetcurrClosePeroid;
    property currWorkPeroid : string  read FcurrWorkPeroid write SetcurrWorkPeroid;
    property currTotalAmount : currency read FcurrTotalAmount write SetcurrTotalAmount;
    property currShowPeroid :string read FcurrShowPeroid write SetcurrShowPeroid;
    property IsClosed : boolean read FIsClosed write SetIsClosed;
    property UserID : string read FUserID write SetUserID;
    property Branch : string read FBranch write SetBranch;

  end;

var
  frmEndPeroid: TfrmEndPeroid;

implementation

uses ConfirmCloseFrm, CommonLIB, CommonUtils, PeriodFrm;

{$R *.dfm}

procedure TfrmEndPeroid.SetcurrShowPeroid(const Value: string);
begin
  FcurrShowPeroid := Value;
  edShowPeroidNo.Text := value;
end;


procedure TfrmEndPeroid.ShowPeroid(peroid: string);
begin
    if trim(FcurrShowPeroid)<>'' then
    begin
       cdsBillA.Close;
//       cdsBillA.CommandText:='select a.*,b.pt_title from bill a left join paytype b on a.bpaytype=b.pt_code where a.bperiod='''+FcurrShowPeroid+''' and a.bstatus=''A'' ';
       cdsBillA.CommandText:='select a.*,b.pt_title,c.* from bill a '+
       ' left join paytype b on a.bpaytype=b.pt_code left join donator c '+
       ' on a.bid=c.do_id where a.bperiod='''+FcurrShowPeroid+''' and a.bstatus=''A'' ' ;

       cdsBillA.Open;

       cdsBillCancelA.Close;
//       cdsBillCancelA.CommandText:='select a.*,b.pt_title from bill a left join paytype b on a.bpaytype=b.pt_code where a.bperiod='''+FcurrShowPeroid+''' and a.bstatus=''I'' ';
       cdsBillCancelA.CommandText:='select a.*,b.pt_title,c.* from bill a '+
       ' left join paytype b on a.bpaytype=b.pt_code left join donator c '+
       ' on a.bid=c.do_id where a.bperiod='''+FcurrShowPeroid+''' and a.bstatus=''I'' ' ;

       cdsBillCancelA.Open;
    end;
end;

procedure TfrmEndPeroid.ExecSQL(strSQL: string);
begin
  Conn.ExecuteDirect(strSQL);
end;

procedure TfrmEndPeroid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmEndPeroid.FormShow(Sender: TObject);
begin
  initdataset(self,Conn);
  initForm;
end;

procedure TfrmEndPeroid.btnClosePeroidClick(Sender: TObject);
var frm : TfrmConfirmClose;
begin
   frm := TfrmConfirmClose.Create(self);
   frm.MainForm :=self;
   frm.PeroidNo := FcurrWorkPeroid;
   frm.UserName :='ADMIN';
   frm.LocationName :='มูลนิธีโรงพยาบาลราชวิถี';
   frm.StartDate :=Now;
   frm.EndDate :=Now;
   frm.WorkStation:='เครื่อง 001';

   frm.ShowModal;

   if frm.IsConfirmClose then
   begin
      ClosePeriod;
   end;
    
   frm.Free;

end;

procedure TfrmEndPeroid.initForm;
begin

 PageContainer.ActivePage:=TabCurrentPeriod;


// if IsClosed then Period := currClosePeroid;

// IsClosed := false;

 cdsPeroid.Close;

 cdsPeroid.CommandText:= ''+ //'select * from period_data where pe_status=''A''';
' select '+
'	a.pe_id,a.pe_status,a.pe_seq,a.pe_begindate,a.pe_begindate as pe_begindate1,a.pe_closedate,a.pe_closedate as pe_closedate1 ,a.pe_user,a.pe_com,pe_comment,a.pe_refid '+
'	,a.pe_ReceiptF,a.pe_ReceiptT,a.pe_Amount,a.pe_ReceiptBill,a.pe_CancelBill'+
'	,b.us_code,b.us_name '+
' from period_data a  '+
' left join user_account b  on a.pe_user=b.us_code '+
' where a.pe_status=''A''  ';


 cdsPeroid.Open;

 if cdsPeroid.Active then
  if cdsPeroid.RecordCount>0 then
    FcurrWorkPeroid := FormatCurr('00000',cdsPeroid.fieldbyname('pe_id').asinteger);


 cdsBill.Close;
// cdsBill.CommandText:='select a.*,b.pt_title from bill a left join paytype b on a.bpaytype=b.pt_code where a.bperiod='''+FcurrWorkPeroid+''' and a.bstatus=''A'' ';
 cdsBill.CommandText:='select a.*,b.pt_title,c.* from bill a '+
 ' left join paytype b on a.bpaytype=b.pt_code left join donator c '+
 ' on a.bid=c.do_id where a.bperiod='''+FcurrWorkPeroid+''' and a.bstatus=''A'' ' ;
 cdsBill.Open;

 cdsBillCancel.Close;
 cdsBillCancel.CommandText:='select a.*,b.pt_title,c.* from bill a '+
 ' left join paytype b on a.bpaytype=b.pt_code left join donator c '+
 ' on a.bid=c.do_id where a.bperiod='''+FcurrWorkPeroid+''' and a.bstatus=''I'' ' ;
 cdsBillCancel.Open;


 { closed period }

 cdsPeroidA.Close;

 cdsPeroidA.CommandText:= ''+ //'select * from period_data where pe_status=''A''';
' select top 1 '+
'	a.pe_id,a.pe_status,a.pe_seq,a.pe_begindate,a.pe_begindate as pe_begindate1,a.pe_closedate,a.pe_closedate as pe_closedate1 ,a.pe_user,a.pe_com,pe_comment,a.pe_refid '+
'	,a.pe_ReceiptF,a.pe_ReceiptT,a.pe_Amount,a.pe_ReceiptBill,a.pe_CancelBill'+
'	,b.us_code,b.us_name '+
' from period_data a  '+
' left join user_account b  on a.pe_user=b.us_code '+
' where a.pe_status=''C''  order by pe_seq desc';


 cdsPeroidA.Open;


 edAmount.Value := getPeriodActiveAMT(FcurrWorkPeroid);
 edCancelAmount.Value:=getPeriodCancelAMT(FcurrWorkPeroid);
 edActiveItems.Value := getPeriodActiveItems(FcurrWorkPeroid);
 edCancelItems.Value := getPeriodCancelItems(FcurrWorkPeroid);

 edPeroidNo.Text:=FcurrWorkPeroid;

 TDateTimeField(cdsPeroid.FieldByName('pe_begindate')).DisplayFormat:='dd/MM/yyyy';
 TDateTimeField(cdsPeroid.FieldByName('pe_begindate1')).DisplayFormat:='hh:mm';
 TDateTimeField(cdsPeroid.FieldByName('pe_closedate')).DisplayFormat:='dd/MM/yyyy';
 TDateTimeField(cdsPeroid.FieldByName('pe_closedate1')).DisplayFormat:='hh:mm';

 TDateTimeField(cdsPeroidA.FieldByName('pe_begindate')).DisplayFormat:='dd/MM/yyyy';
 TDateTimeField(cdsPeroidA.FieldByName('pe_begindate1')).DisplayFormat:='hh:mm';
 TDateTimeField(cdsPeroidA.FieldByName('pe_closedate')).DisplayFormat:='dd/MM/yyyy';
 TDateTimeField(cdsPeroidA.FieldByName('pe_closedate1')).DisplayFormat:='hh:mm';



end;





procedure TfrmEndPeroid.SetcurrWorkPeroid(const Value: string);
begin
   FcurrWorkPeroid := value;
end;

function TfrmEndPeroid.getPeriodActiveAMT(pid: string): currency;
var rep : currency;
begin
  rep :=0;
 with cdsTemp do
 begin
  close;
  CommandText:='select SUM(btotal) AMT , COUNT(btotal) as ITEMS from bill  where bperiod='''+pid+''' and bstatus=''A''';
  open;
    if active then
      if recordcount>0 then
      begin
        rep := fieldbyname('AMT').AsCurrency;
        //edActiveItems.Value :=fieldbyname('ITEMS').AsInteger;
        //ShowMessage(formatcurr('#,###.00',fieldbyname('AMT').AsCurrency));
      end;
 end;

 result:=rep;
end;

function TfrmEndPeroid.getPeriodCancelAMT(pid: string): currency;
var rep : currency;
begin
  rep :=0;
 with cdsTemp do
 begin
  close;
  CommandText:='select SUM(btotal) AMT , COUNT(btotal) as ITEMS from bill  where bperiod='''+pid+''' and bstatus=''I''';
  open;
    if cdsTemp.active then
      if cdsTemp.recordcount>0 then
      begin
        rep := fieldbyname('AMT').AsCurrency;
        edCancelAmount.Value :=fieldbyname('ITEMS').AsInteger;
      end;
 end;

 result:=rep;
end;
procedure TfrmEndPeroid.SetcurrTotalAmount(const Value: currency);
begin
  FcurrTotalAmount := Value;
  edAmount.Value   := value;
end;

procedure TfrmEndPeroid.ClosePeriod;
var
  newPeriod,currPeriod:string;
begin
//  newPeriod := formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1')+1);
//  currPeriod := formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  newPeriod := formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1')+1);
  currPeriod := formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));

  with cdsClosePeriod do
  begin

    ExecSQL('update period_data set pe_status=''C'' where pe_id='''+currPeriod+'''');
    currClosePeroid:=currPeriod;

    close;
    CommandText:='select top 1 * from period_data';
    open;
    if cdsClosePeriod.Active then
    begin
      cdsClosePeriod.EmptyDataSet;
      cdsClosePeriod.Append;
      cdsClosePeriod.FieldByName('pe_id').AsString:=newPeriod;
      cdsClosePeriod.FieldByName('pe_status').AsString:='A';
      cdsClosePeriod.FieldByName('pe_seq').AsString:='';
      cdsClosePeriod.FieldByName('pe_begindate').AsDateTime:=getServerDate(cdsTemp);
      cdsClosePeriod.FieldByName('pe_closedate').AsDateTime:=getServerDate(cdsTemp);
      cdsClosePeriod.FieldByName('pe_user').AsString:='00000';
      cdsClosePeriod.FieldByName('pe_refid').AsString:=currPeriod;
      cdsClosePeriod.Post;
      cdsClosePeriod.ApplyUpdates(0);

      // apply new period
      //getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1')
      //setPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1');
      setPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1');


      // enable button
      btnDailyReport.Enabled:=true;
      btnCancelReport.Enabled:=true;
      btnSummaryObjective.Enabled:=true;
      btnReceiptReport.Enabled:=true;
      btnSticker.Enabled:=true;
      //btnAddressReport.Enabled:=true;
      btnMailReport.Enabled:=true;
      btnCongratulations.Enabled:=true;
     // btnOutstanding.Enabled:=true;
     // btnClose.Enabled:=true;
       {
      btnDailyReportA.Enabled:=true;
      btnCancelReportA.Enabled:=true;
      btnSummaryObjectiveA.Enabled:=true;
      btnReceiptReportA.Enabled:=true;
      btnStickerA.Enabled:=true;
      btnAddressReportA.Enabled:=true;
      btnMailReportA.Enabled:=true;
      btnCongratulationsA.Enabled:=true;
     // btnOutstandingA.Enabled:=true;
      btnCloseA.Enabled:=true;
               }


      btnClosePeroid.Enabled:=false;

      currClosePeroid :=currPeriod;
      IsClosed:=true;
      ShowMessage('Successfull.');

    end;
    
  end;
end;

procedure TfrmEndPeroid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F3 then
  begin
    PageContainer.ActivePage:=TabClosedPeriod;
    btnOpenPeroidClick(sender);
  end;
end;

procedure TfrmEndPeroid.btnOpenPeroidClick(Sender: TObject);
var
  frm : TfrmPeriod;
begin
  if TabClosedPeriod.Enabled then
    with cdsAllPeroid do
    begin
      close;
      CommandText:= ''+
      ' select '+
      '	a.pe_id,a.pe_status,a.pe_seq,a.pe_begindate,a.pe_begindate as pe_begindate1,a.pe_closedate,a.pe_closedate as pe_closedate1 ,a.pe_user,a.pe_com,pe_comment,a.pe_refid '+
      '	,a.pe_ReceiptF,a.pe_ReceiptT,a.pe_Amount,a.pe_ReceiptBill,a.pe_CancelBill'+
      '	,b.us_code,b.us_name '+
      ' from period_data a  '+
      ' left join user_account b  on a.pe_user=b.us_code '+
      ' where a.pe_status=''C''  order by pe_seq desc';
      open;
      if cdsAllPeroid.Active then
        if cdsAllPeroid.RecordCount>0 then
          begin
            frm := TfrmPeriod.Create(self);
            frm.MainForm:=self;
            frm.ShowModal;
            currShowPeroid:=frm.SelectPeroid;
            frm.Free;

            ShowPeroid(FcurrShowPeroid);
            edPeriodAmount.Value := getPeriodActiveAMT(FcurrShowPeroid);
            edPeriodCancelAmount.Value := getPeriodCancelAMT(FcurrShowPeroid);
            edPeriodActiveItems.Value := getPeriodActiveItems(FcurrShowPeroid);
            edPeriodCancelItems.Value := getPeriodCancelItems(FcurrShowPeroid);
          end;
    end;
end;

procedure TfrmEndPeroid.SetcurrClosePeroid(const Value: string);
begin
  FcurrClosePeroid := Value;
end;

procedure TfrmEndPeroid.btnReceiptReportClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  //Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));

  dllParams.ReportCode:='RPT01002';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;  
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
{
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  rpReceiptReport(Period);
  }
end;
procedure TfrmEndPeroid.btnDailyReportClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
//  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));

  dllParams.ReportCode:='RPT01003';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;


procedure TfrmEndPeroid.btnCancelReportClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
//  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));
  dllParams.ReportCode:='RPT01004';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;


procedure TfrmEndPeroid.btnSummaryObjectiveClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  //Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));
  dllParams.ReportCode:='RPT01001';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);

end;




procedure TfrmEndPeroid.rpDailyReport(Period: string);
var TotalAmout:Currency;
    FReport,BDate:string;
begin
  cdsReport.Close;
  cdsReport.CommandText := 'SELECT a.bid       ' +
                      '     , a.bno       ' +
                      '     , a.bperiod   ' +
                      '     , a.bdate     ' +
                      '     , a.btotal    ' +
                      '     , a.bpaytype  ' +
                      '     , a.bbank     ' +
                      '     , a.bbankname ' +
                      '     , a.bbrance   ' +
                      '     , a.brefno    ' +
                      '     , a.brefdate  ' +
                      '     , a.bcancelid ' +
                      '     , a.buserid   ' +
                      '     , a.bfrom     ' +
                      '     , a.bryid     ' +
                      '     , a.bloc      ' +
                      '     , a.bspiid    ' +
                      '     , a.bentry    ' +
                      '     , a.bcomid    ' +
                      '     , b.do_prename + '' '' + b.do_name AS donator_name' +
                      '     , b.do_lname AS donator_lastname ' +
                      '     , c.pt_title AS pay_name         ' +
                      'FROM bill a                           ' +
                      'LEFT JOIN donator b ON a.bid = b.do_id ' +
                      'LEFT JOIN paytype c ON a.bpaytype = c.pt_code ' +
                      'WHERE ((''' + Period + '''='''' or a.bperiod = ''' + Period + ''')) ' +
                     // '        AND (''' + BDate + '''='''' or CAST(a.bdate as DATE)=''' + BDate + ''')) ' +
                    //  'AND (a.bcancelid is null or a.bcancelid = '''') '+
                      ' and a.bstatus=''A''';
  //InputBox('','',cdsReport.CommandText);                      
  cdsReport.Open;

  cdsReport.First;
  while not (cdsReport.Eof) do
  begin
    TotalAmout := TotalAmout + cdsReport.FieldByName('btotal').AsCurrency;
    cdsReport.Next;
  end;

  FReport := ExtractFilePath(Application.ExeName) + 'Reports\peSummaryRep.fr3';
  if not FileExists(FReport) then
    begin
      MessageDlg('หาไฟล์ Report ไม่เจอ :' + FReport,mtWarning,[mbOK], 0);
    end
  else
    begin
      frxReport.LoadFromFile(FReport);
      frxReport.Variables['RT'] := QuotedStr('Admin');
      frxReport.Variables['TA'] := QuotedStr(FormatCurr('#,##0.00',TotalAmout));
      frxReport.ShowReport;
    end;
end;

procedure TfrmEndPeroid.btnDailyReportAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT01003';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;
{
var
    Period:string;
begin
  if trim(FcurrShowPeroid)<>'' then
  begin
    rpDailyReport(FcurrShowPeroid);
  end;
end;
}

procedure TfrmEndPeroid.rpCancelReport(Period: string);
var TotalAmout:Currency;
    FReport,BDate:string;
begin
  cdsReport.Close;
  cdsReport.CommandText :=  ''+

      ' SELECT a.bid as cid '+
      '     , a.bid  as cdonator '+      '     , a.bno as cno '+      '     , a.bperiod '+      '     , a.bdate '+      '     , a.btotal '+      '     , a.buserid as cuserid '+      '     , a.bcomid as ccomid '+      '     , a.bdate as cdate '+      '     , b.do_prename + '' '' + b.do_name + '' '' + b.do_lname AS FullName '+      '     , c.us_name      '+      '     , d.cm_name     '+      '     , e.bbankname  '+      '     , e.bbrance   '+      '     , e.pt_title '+      '     , e.brefno '+      '     , e.brefdate '+      ' FROM bill a ' +
      ' LEFT JOIN donator b ON a.bid = b.do_id '+
      ' LEFT JOIN user_account c ON a.buserid = c.us_code '+      ' LEFT JOIN computer_code d ON a.bcomid = d.cm_id '+      ' LEFT JOIN (SELECT  * FROM bill e1 '+      '           LEFT JOIN paytype  e2 ON e1.bpaytype = e2.pt_code '+      '           ) e ON a.bno = e.bno '+      ' WHERE ( '+      '	(	''' + Period + '''='''' or a.bperiod = ''' + Period + ''') '+      '        AND (''' + BDate + '''='''' or CAST(a.bdate as DATE)=''' + BDate + ''') '+      '       ) '+      '	and a.bstatus=''I'' ';

  cdsReport.Open;

  cdsReport.First;
  while not (cdsReport.Eof) do
  begin
    TotalAmout := TotalAmout + cdsReport.FieldByName('btotal').AsCurrency;
    cdsReport.Next;
  end;

  FReport := ExtractFilePath(Application.ExeName) + 'Reports\peCanceledRep.fr3';
  if not FileExists(FReport) then
    begin
      MessageDlg('หาไฟล์ Report ไม่เจอ :' + FReport,mtWarning,[mbOK], 0);
    end
  else
    begin
      frxReport.LoadFromFile(FReport);
      frxReport.Variables['RT'] := QuotedStr('Admin');
      frxReport.Variables['TA'] := QuotedStr(FormatCurr('#,##0.00',TotalAmout));
      frxReport.ShowReport;
    end;
end;

procedure TfrmEndPeroid.btnCancelReportAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT01004';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;
{
var
    Period:string;
begin
  if trim(FcurrShowPeroid)<>'' then
  begin
      rpCancelReport(FcurrShowPeroid);
  end;
end;
}


procedure TfrmEndPeroid.rpSummaryObjective(Period: string);
var TotalAmout:Currency;
    FReport,BDate:string;
begin
  cdsReport.Close;
  cdsReport.CommandText := 'SELECT a.bdno        ' +
                      '     , a.bdobject    ' +
                      '     , a.bdfound     ' +
                      '     , a.bdamount    ' +
                      '     , a.bdbankbook  ' +
                      '     , a.bdacccode   ' +
                      '     , a.bdfoundtype ' +
                      '     , a.bdpaytype   ' +
                      '     , a.bdflag      ' +
                      '     , b.bid         ' +
                      '     , b.bno         ' +
                      '     , b.bperiod     ' +
                      '     , b.bdate       ' +
                      '     , b.btotal      ' +
                      '     , b.bpaytype    ' +
                      '     , b.bbank       ' +
                      '     , b.bbankname   ' +
                      '     , b.bbrance     ' +
                      '     , b.brefno      ' +
                      '     , b.brefdate    ' +
                      '     , b.buserid     ' +
                      '     , b.bfrom       ' +
                      '     , b.bryid       ' +
                      '     , b.bloc        ' +
                      '     , b.bspiid      ' +
                      '     , b.bentry      ' +
                      '     , b.bcomid      ' +
                      '     , b.bcancelid   ' +
                      '     , b.do_prename  ' +
                      '     , b.do_name     ' +
                      '     , b.do_lname    ' +
                      '     , c.o_title     ' +
                      '     , d.fd_title    ' +
                      '     , e.pt_title    ' +
                      '     , case when a.bdobject = ''121'' then ' +
                      '        ''ตั้งทุน''+rtrim(d.fd_title)+''เพื่อช่วยเหลือผู้ป่วยอนาถา''' +
                      '            when a.bdobject = ''122'' then ' +
                      '        ''สมทบทุน''+rtrim(d.fd_title)+''เพื่อช่วยเหลือผู้ป่วยอนาถา''' +
                      '            when a.bdobject = ''27''then   ' +
                      '        ''สมทบทุน''+rtrim(d.fd_title)      ' +
                      '       else c.o_title                      ' +
                      '       end AS DonationCaption              ' +
                      'FROM billdetail a                          ' +
                      'LEFT JOIN ( SELECT * FROM bill  b1         ' +
                      '            LEFT JOIN donator b2 ON b1.bid = b2.do_id   ' +
                      '            where bstatus=''A''   ' +
                      '          ) b ON a.bdno = b.bno                         ' +
                      'LEFT JOIN object_code  c ON a.bdobject = c.o_code       ' +
                      'LEFT JOIN found_code  d ON a.bdfound = d.fd_code        ' +
                      'LEFT JOIN paytype  e ON b.bpaytype = e.pt_code     ' +
                      'WHERE ((''' + Period + '''='''' or b.bperiod = ''' + Period + ''') ' +
                      '        AND (''' + BDate + '''='''' or CAST(b.bdate as DATE)=''' + BDate + '''))';
  cdsReport.Open;
  cdsReport.First;
  while not (cdsReport.Eof) do
  begin
    TotalAmout := TotalAmout + cdsReport.FieldByName('bdamount').AsCurrency;
    cdsReport.Next;
  end;

  FReport := ExtractFilePath(Application.ExeName) + 'Reports\peByObjectRep.fr3';
  if not FileExists(FReport) then
    begin
      MessageDlg('หาไฟล์ Report ไม่เจอ :' + FReport,mtWarning,[mbOK], 0);
    end
  else
    begin
      frxReport.LoadFromFile(FReport);
      frxReport.Variables['RT'] := QuotedStr('Admin');
      frxReport.Variables['TA'] := QuotedStr(FormatCurr('#,##0.00',TotalAmout));
      frxReport.ShowReport;
      //frxReport.DesignReport;
    end;
end;

procedure TfrmEndPeroid.btnStickerClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
//  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));
  dllParams.ReportCode:='RPT02';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;


procedure TfrmEndPeroid.btnSummaryObjectiveAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT01001';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);

end;
{
var
    Period:string;
begin
  if trim(FcurrShowPeroid)<>'' then
  begin
      rpSummaryObjective(FcurrShowPeroid);
  end;
end;
}

procedure TfrmEndPeroid.rpReceiptReport(Period: string);
var FReport,BDate:string;
begin
  cdsReport.Close;
  cdsReport.CommandText := 'SELECT * FROM (                                   ' +
                      'SELECT a.bperiod                                  ' +
                      '   , isnull(b.o_title,'''') + '' ('' + isnull(b.bdobject,'''') + '')'' AS FDESCRIPTION ' +
                      '   , SUM(b.bdamount) AS amount                    ' +
                      '   , ''สรุปเงินบริจาครายวัตถุประสงค์'' AS TGROUP  ' +
                      '   , 1 AS RUN                                     ' +
                      'FROM bill a                                       ' +
                      'LEFT JOIN (SELECT b1.bdno                         ' +
                      '          , b1.bdobject                           ' +
                      '          , b1.bdfound                            ' +
                      '          , b1.bdamount                           ' +
                      '          , b1.bdbankbook                         ' +
                      '          , b1.bdacccode                          ' +
                      '          , b1.bdfoundtype                        ' +
                      '          , b1.bdpaytype                          ' +
                      '          , b1.bdflag                             ' +
                      '          , b3.fd_title                           ' +
                      '          ,  case when b1.bdobject = ''121'' then   ' +
                      '              ''ตั้งทุน''+rtrim(b3.fd_title)+''เพื่อช่วยเหลือผู้ป่วยอนาถา'' ' +
                      '            when b1.bdobject = ''122'' then         ' +
                      '              ''สมทบทุน''+rtrim(b3.fd_title)+''เพื่อช่วยเหลือผู้ป่วยอนาถา'' ' +
                      '            when b1.bdobject = ''27''then           ' +
                      '              ''สมทบทุน''+rtrim(b3.fd_title)      ' +
                      '           else b2.o_title                        ' +
                      '           end AS o_title                         ' +
                      '           FROM billdetail b1                     ' +
                      '           LEFT JOIN object_code b2 ON b1.bdobject = b2.o_code ' +
                      '           LEFT JOIN found_code b3 ON b1.bdfound = b3.fd_code ' +
                      '          ) AS b ON a.bno = b.bdno                ' +
                      ' WHERE ((''' + Period + '''='''' or a.bperiod = ''' + Period + ''') )' +
                      //'        AND (''' + BDate + '''='''' or CAST(a.bdate as DATE)=''' + BDate + ''')) ' +
                      '        AND  a.bstatus=''A'' ' +                      
                      ' GROUP BY a.bperiod, b.bdobject, b.o_title         ' +
                      ' UNION                                             ' +
                      ' SELECT a.bperiod                                  ' +
                      '     , b.pt_title                                 ' +
                      '     , SUM(a.btotal) AS total                     ' +
                      '     , ''รายการเงินสด'' AS TGROUP                 ' +
                      '     , 2 AS RUN                                   ' +
                      ' FROM  bill a                                      ' +
                      ' LEFT JOIN paytype b ON a.bpaytype = b.pt_code' +
                      ' WHERE ((a.bpaytype <> 50) AND (a.bpaytype <> 28)) AND ((''' + Period + '''='''' or a.bperiod = ''' + Period + ''') ) ' +
                      //'        AND (''' + BDate + '''='''' or CAST(a.bdate as DATE)=''' + BDate + '''))' +
                      '        AND  a.bstatus=''A'' ' +
                      ' GROUP BY a.bperiod, a.bpaytype, b.pt_title        ' +
                      ' UNION                                             ' +
                      ' SELECT a.bperiod                                  ' +
                      '     , isnull(b.pt_title,'''') + '' '' + isnull(a.bbankname,'''') + '' ('' + isnull(a.brefno,'''') + '')'' AS FDESCRIPTION ' +
                      '   , SUM(a.btotal) AS total                       ' +
                      '   , ''รายการเข้าบัญชีธนาคาร'' AS TGROUP          ' +
                      '   , 3 AS RUN                                     ' +
                      ' FROM bill a                                       ' +
                      ' LEFT JOIN paytype b ON a.bpaytype = b.pt_code' +
                      ' WHERE ((a.bpaytype = 50) OR (a.bpaytype = 28)) AND ((''' + Period + '''='''' or a.bperiod = ''' + Period + ''') ) ' +
                      //'        AND (''' + BDate + '''='''' or CAST(a.bdate as DATE)=''' + BDate + ''')) ' +
                      '        AND  a.bstatus=''A'' ' +
                      ' GROUP BY a.bperiod, a.bpaytype, b.pt_title, a.bbank, a.bbankname, a.brefno ' +
                      ' )AA ORDER BY AA.RUN';
//  inputbox('','',cdsReport.commandtext);
  cdsReport.Open;
  FReport := ExtractFilePath(Application.ExeName) + 'Reports\peMoneyRep.fr3';
  if not FileExists(FReport) then
    begin
      MessageDlg('หาไฟล์ Report ไม่เจอ :' + FReport,mtWarning,[mbOK], 0);
    end
  else
    begin
      frxReport.LoadFromFile(FReport);
      //frxReport.DesignReport;
      frxReport.ShowReport;
    end;

    
end;

procedure TfrmEndPeroid.btnReceiptReportAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT01002';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;
  {
var
    Period:string;
begin
  if trim(FcurrShowPeroid)<>'' then
  begin
      rpReceiptReport(FcurrShowPeroid);
  end;
end;
}




procedure TfrmEndPeroid.btnMailReportClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
//  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));
  dllParams.ReportCode:='PRT04';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;


procedure TfrmEndPeroid.btnCongratulationsClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
//  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1'));
  Period:= formatcurr('00000',getPeroidNo(cdsTemp,'PEROID1',Branch,'MTTNM1'));
  if IsClosed then Period := currClosePeroid;
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',Period));
  dllParams.ReportCode:='RPT03';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

function TfrmEndPeroid.getPeriodActiveItems(pid: string): integer;
var rep :integer;
begin
  rep :=0;
 with cdsTemp do
 begin
  close;
  CommandText:='select SUM(btotal) AMT , COUNT(btotal) as ITEMS from bill  where bperiod='''+pid+''' and bstatus=''A''';
  open;
    if active then
      if recordcount>0 then
      begin
        rep := fieldbyname('ITEMS').AsInteger;
        //edActiveItems.Value :=fieldbyname('ITEMS').AsInteger;
      end;
 end;

 result:=rep;
end;

function TfrmEndPeroid.getPeriodCancelItems(pid: string): integer;
var rep :integer;
begin
  rep :=0;
 with cdsTemp do
 begin
  close;
  CommandText:='select SUM(btotal) AMT , COUNT(btotal) as ITEMS from bill  where bperiod='''+pid+''' and bstatus=''I''';
  open;
    if active then
      if recordcount>0 then
      begin
        rep := fieldbyname('ITEMS').AsInteger;
        //edActiveItems.Value :=fieldbyname('ITEMS').AsInteger;
      end;
 end;

 result:=rep;
end;

procedure TfrmEndPeroid.SetIsClosed(const Value: boolean);
begin
  FIsClosed := Value;
end;

procedure TfrmEndPeroid.btnRefreshClick(Sender: TObject);
begin
   initForm;
end;

procedure TfrmEndPeroid.btnStickerAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT02';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmEndPeroid.btnMailReportAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='PRT04';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmEndPeroid.btnCongratulationsAClick(Sender: TObject);
var
    Period:string;
    dllParams : TDLLParameter;
    DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('PERIOD',FcurrShowPeroid));
  dllParams.ReportCode:='RPT03';
  dllParams.UserID:=UserID;
  dllParams.Branch:= Branch;
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmEndPeroid.SetBranch(const Value: string);
begin
  FBranch := Value;
end;

procedure TfrmEndPeroid.SetUserID(const Value: string);
begin
  FUserID := Value;
end;

procedure TfrmEndPeroid.grdPeroidDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmEndPeroid.grdBillDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmEndPeroid.cxGrid3DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
