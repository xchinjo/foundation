unit BackOfficeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBXpress, FMTBcd, Provider, DB, SqlExpr,
  StdCtrls, RzLabel, Buttons, RzEdit, RzCmboBx, Mask, RzButton, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, DBClient;

type
  TfrmBackOffice = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    pnClients: TRzPanel;
    lbOrderItem: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    btnAddItem: TRzBitBtn;
    btnEditItem: TRzBitBtn;
    btnClear: TRzBitBtn;
    btnSearch: TRzBitBtn;
    btnSave: TRzBitBtn;
    edDonatorName: TRzEdit;
    edAmount: TRzNumericEdit;
    edRefCode: TRzEdit;
    edRemark: TRzEdit;
    dtRecDate: TRzDateTimeEdit;
    btnBillingInfo: TRzBitBtn;
    BitBtn1: TBitBtn;
    btnCancel: TRzBitBtn;
    Label1: TLabel;
    pnAllClients: TRzPanel;
    cxGridDisbursement: TcxGrid;
    cxGridDisbursementDBTableView1: TcxGridDBTableView;
    cxGridDisbursementLevel1: TcxGridLevel;
    cdsDisbursement: TClientDataSet;
    dsDisbursement: TDataSource;
    cxGridDisbursementDBTableView1DocNo: TcxGridDBColumn;
    cxGridDisbursementDBTableView1Item: TcxGridDBColumn;
    cxGridDisbursementDBTableView1RefNo: TcxGridDBColumn;
    cxGridDisbursementDBTableView1AccNo: TcxGridDBColumn;
    cxGridDisbursementDBTableView1Description: TcxGridDBColumn;
    cxGridDisbursementDBTableView1FundCode: TcxGridDBColumn;
    cxGridDisbursementDBTableView1Amount: TcxGridDBColumn;
    cxGridDisbursementDBTableView1Remark: TcxGridDBColumn;
    cdsTemp: TClientDataSet;
    cdsDisbursementHdr: TClientDataSet;
    cdsTemp2: TClientDataSet;
    cdsTemp3: TClientDataSet;
    cdsMaterReceiveHdr: TClientDataSet;
    cdsMaterReceive: TClientDataSet;
    procedure btnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edDonatorNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FcurrFundCode: string;
    FcurrDocNo: string;
    FcurrAmount: currency;
    procedure SetcurrFundCode(const Value: string);
    procedure SetcurrDocNo(const Value: string);
    procedure SetcurrAmount(const Value: currency);
    procedure PostMasterReceive(dno:string);
    function getFundDesc(fundcode: string): string;
    function getFundAcc(fundcode: string): string;

    { Private declarations }
  public
    { Public declarations }
    property currFundCode : string read FcurrFundCode write SetcurrFundCode;
    property currDocNo :  string read FcurrDocNo write SetcurrDocNo;
    property currAmount : currency read FcurrAmount write SetcurrAmount;
  end;

var
  frmBackOffice: TfrmBackOffice;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

procedure TfrmBackOffice.btnSearchClick(Sender: TObject);
var params,refparams : TDLLParameter;
begin
  params.ParameterString1 := edDonatorName.Text;
  SelectFund(Application,nil,swModal,params,refparams);
  currFundCode :=refparams.ParameterString1;
  edDonatorName.Text:=refparams.ParameterString2;

  if trim(currFundCode)<>'' then
  begin
    edAmount.SetFocus;
    edAmount.SelectAll;
  end;
//  ShowMessage(refparams.ParameterString1);
end;

procedure TfrmBackOffice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmBackOffice.btnAddItemClick(Sender: TObject);
var
  ItemNo : integer;
begin

  ItemNo := cdsDisbursement.RecordCount;
  currDocNo := FormatCurr('000000', getRunning(cdsTemp,'DISRUN1','BACKOFFICE','DISRUN','MTTNM1'));

  //ShowMessage(IntToStr(getRunning(cdsTemp,'DISRUN1','BACKOFFICE','DISRUN','MTTNM1')));
  //setRunning(cdsTemp,'DISRUN1','BACKOFFICE','DISRUN','MTTNM1');

  //exit;

  with cdsDisbursement do
  begin
    Append;
    FieldByName('DocNo').AsString :=  currDocNo;
    FieldByName('Item').AsInteger := ItemNo+1;
    FieldByName('RefNo').AsString:=edRefCode.Text;
    FieldByName('AccNo').AsString:=getFundAcc(currFundCode);
    FieldByName('Description').AsString:=getFundDesc(currFundCode);
    FieldByName('FundCode').AsString:=currFundCode;
    FieldByName('Amount').AsCurrency:=edAmount.Value;
    FieldByName('Remark').AsString:=edRemark.Text;
    FieldByName('DocDate').AsDateTime:=getServerDate(cdsTemp);
    FieldByName('UserID').AsString:='ADMIN';

    currAmount:=currAmount+edAmount.Value;
    post;
  end;

  edDonatorName.SetFocus;
  edDonatorName.SelectAll;
end;

procedure TfrmBackOffice.FormShow(Sender: TObject);
begin

  initDataset(self,Conn);

  cdsDisbursement.Close;
  cdsDisbursement.Open;
  cdsDisbursement.EmptyDataSet;
end;

procedure TfrmBackOffice.btnSaveClick(Sender: TObject);
begin
  try


    if cdsDisbursement.RecordCount<=0 then
    begin
          Application.MessageBox(pchar('ยังไม่มีรายการ ไม่สามารถทำการบันทึกได้'),pchar('Warning'),MB_OK or MB_ICONWARNING);
      exit;
    end;

    cdsDisbursementHdr.Close;
    cdsDisbursementHdr.Open;
    cdsDisbursementHdr.EmptyDataSet;
    cdsDisbursementHdr.Append;
    cdsDisbursementHdr.FieldByName('DocNo').AsString:=currDocNo;
    cdsDisbursementHdr.FieldByName('DocDate').AsDateTime:=getServerDate(cdsTemp);
    cdsDisbursementHdr.FieldByName('UserID').AsString:='ADMIN';
    cdsDisbursementHdr.FieldByName('Amount').AsCurrency:=currAmount;

    cdsDisbursementHdr.Post;
    cdsDisbursementHdr.ApplyUpdates(0);


    cdsDisbursement.ApplyUpdates(0);
    cdsDisbursement.EmptyDataSet;
    setRunning(cdsTemp,'DISRUN1','BACKOFFICE','DISRUN','MTTNM1');

    PostMasterReceive(currDocNo);
    Application.MessageBox(pchar('Success'),pchar('Infomation'),MB_OK or MB_ICONINFORMATION);
    currAmount :=0;

    edDonatorName.SetFocus;
    edDonatorName.SelectAll;
  except
    on err:Exception do
    Application.MessageBox(pchar(err.Message),pchar('Error'),MB_OK or MB_ICONERROR);
  end;
end;

procedure TfrmBackOffice.SetcurrFundCode(const Value: string);
begin
  FcurrFundCode := Value;
end;

procedure TfrmBackOffice.edDonatorNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSearchClick(sender);
end;

procedure TfrmBackOffice.edRemarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then btnAddItemClick(sender);
end;

procedure TfrmBackOffice.SetcurrDocNo(const Value: string);
begin
  FcurrDocNo := Value;
end;

procedure TfrmBackOffice.SetcurrAmount(const Value: currency);
begin
  FcurrAmount := Value;
end;

function TfrmBackOffice.getFundDesc(fundcode: string): string;
var rep:string;
begin
 with cdsTemp do
 begin
  rep:='';
  close;
  CommandText:='select fd_title from found_code where fd_code='''+fundcode+'''';
  open;

  if Active then
    if RecordCount>0 then
    begin
       rep:= fieldbyname('fd_title').asstring;
    end;
 end;

 result:=rep;

end;

function TfrmBackOffice.getFundAcc(fundcode: string): string;
var rep:string;
begin
 with cdsTemp do
 begin
  rep:='';
  close;
  CommandText:='select fd_acccode from found_code where fd_code='''+fundcode+'''';
  open;

  if Active then
    if RecordCount>0 then
    begin
       rep:= fieldbyname('fd_acccode').asstring;
    end;
 end;

 result:=rep;

end;

procedure TfrmBackOffice.PostMasterReceive(dno: string);
var rowcount:integer;
    ReceiveAmount:currency;
    currRcvDno,BatchNo:string;
begin
  rowcount:=0;
  ReceiveAmount:=0;
  cdsTemp3.Close;
  cdsTemp3.CommandText:='' +
' select '+
' a.*,b.* '+
' from DisbursementHdr a '+
' left join  Disbursement b on a.DocNo=b.DocNo '+
' where a.DocNo='''+dno+''' ';

  cdsTemp3.Open;
  if cdsTemp3.Active then
    if cdsTemp3.RecordCount>0 then
      with cdsMaterReceive do
      begin

        if cdsTemp3.Active then
          if cdsTemp3.RecordCount>0 then
          begin

            currRcvDno :=FormatCurr('000000', getRunning(cdsTemp,'RCVRUN1','RECEIVE','RCVRUN','MTTNM1'));

            cdsMaterReceive.Close;
            cdsMaterReceive.CommandText:='select top 1 * from MttReceive';
            cdsMaterReceive.Open;
            cdsMaterReceive.EmptyDataSet;
            cdsTemp3.first;
            while not cdsTemp3.Eof do
            begin
              inc(rowcount);
              cdsMaterReceive.Append;
              cdsMaterReceive.FieldByName('RcvDno').AsString:=currRcvDno;
              cdsMaterReceive.FieldByName('DnoType').AsString:='WA';
              cdsMaterReceive.FieldByName('DocNo').AsString:=cdsTemp3.fieldbyname('DocNo').AsString;
              cdsMaterReceive.FieldByName('Item').AsInteger:=rowcount;
              cdsMaterReceive.FieldByName('AccCode').AsString:=cdsTemp3.fieldbyname('AccNo').AsString;
             // cdsMaterReceive.FieldByName('ObjCode').AsString:=cdsTemp3.fieldbyname('bdobject').AsString;
              cdsMaterReceive.FieldByName('FndCode').AsString:=cdsTemp3.fieldbyname('FundCode').AsString;
              cdsMaterReceive.FieldByName('Description').AsString:=cdsTemp3.fieldbyname('Remark').AsString;
              //cdsMaterReceive.FieldByName('ReceiveType').AsString:=cdsTemp3.fieldbyname('bpaytype').AsString;
              cdsMaterReceive.FieldByName('Flag').AsString:='D';
              cdsMaterReceive.FieldByName('Amount').AsString:=cdsTemp3.fieldbyname('Amount').AsString;

              ReceiveAmount:=ReceiveAmount+cdsTemp3.fieldbyname('Amount').AsCurrency;
              //cdsMaterReceive.FieldByName('BringForward').AsString:='0';
              //cdsMaterReceive.FieldByName('CarryForward').AsString:='0';
              cdsMaterReceive.FieldByName('DocDate').AsDateTime:=cdsTemp3.fieldbyname('DocDate').AsDateTime;
              cdsMaterReceive.FieldByName('Period').AsString:=cdsTemp3.fieldbyname('RefNo').AsString;
              cdsMaterReceive.FieldByName('RecStatus').AsString:='A';

              //if  cdsTemp3.fieldbyname('o_flag').AsString='A' then
              //  cdsMaterReceive.FieldByName('AFlag').AsString:='N'
              //else
              cdsMaterReceive.FieldByName('AFlag').AsString:='Y';
              cdsMaterReceive.FieldByName('UserID').AsString:='ADMIN';
              cdsMaterReceive.FieldByName('WorkStation').AsString:='ADMIN';
              cdsMaterReceive.post;
              cdsTemp3.Next;
            end;

            cdsMaterReceiveHdr.Close;
            cdsMaterReceiveHdr.CommandText:='select top 1 * from MttReceiveHdr ';
            cdsMaterReceiveHdr.Open;

            if cdsMaterReceiveHdr.Active then
            begin
              cdsMaterReceiveHdr.EmptyDataSet;
              cdsMaterReceiveHdr.Append;
              BatchNo := FormatDateTime('MM',getServerDate(cdsTemp))+FormatCurr('00', getRunning(cdsTemp,'BATCHNO1','RECEIVE','BATCHNO','MTTNM1'));

              cdsMaterReceiveHdr.FieldByName('BatchNo').AsString:=BatchNo;
              cdsMaterReceiveHdr.FieldByName('RcvDno').AsString:=currRcvDno;
              cdsMaterReceiveHdr.FieldByName('RcvDate').AsDateTime:=getServerDate(cdsTemp);
              cdsMaterReceiveHdr.FieldByName('Amount').AsCurrency:=ReceiveAmount;
              //cdsMaterReceiveHdr.FieldByName('BringForward').AsString:='4000';
              //cdsMaterReceiveHdr.FieldByName('CarryForward').AsString:='5000';
              cdsMaterReceiveHdr.FieldByName('RecStatus').AsString:='Y';
              cdsMaterReceiveHdr.FieldByName('RecActivate').AsString:='A';
              cdsMaterReceiveHdr.post;

            end;

              cdsMaterReceive.ApplyUpdates(0);
              cdsMaterReceiveHdr.ApplyUpdates(0);
              setRunning(cdsTemp,'RCVRUN1','RECEIVE','RCVRUN','MTTNM1')
          end;
      end;
end;

procedure TfrmBackOffice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f6 then btnAddItemClick(sender);
  if key=vk_f4 then
  begin
    if Application.MessageBox(pchar('ยืนยันบันทึกรายการเบิกจ่าย!'),pchar('Confirm'),MB_OKCANCEL or MB_ICONINFORMATION)=mrOK then
      btnSaveClick(sender);
  end;
end;

end.
