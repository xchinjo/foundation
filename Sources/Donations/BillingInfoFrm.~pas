unit BillingInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ReceiveFrm, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls, RzButton, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient;

type
  TfrmBillingInfo = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    edDonatorNameInfo: TRzEdit;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    ListView: TListView;
    Splitter1: TSplitter;
    lbAccumulate: TLabel;
    Label3: TLabel;
    RzPanel3: TRzPanel;
    btnCancel: TRzBitBtn;
    cxGridBillDetails: TcxGrid;
    cxGridBillDetailsDBTableView1: TcxGridDBTableView;
    cxGridBillDetailsDBTableView1item: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdobject: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdfound: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn;
    cxGridBillDetailsLevel1: TcxGridLevel;
    Label1: TLabel;
    dsBillingInfo: TDataSource;
    lbBillNo: TLabel;
    RzPanel4: TRzPanel;
    Label2: TLabel;
    lbBillAmount: TLabel;
    Label5: TLabel;
    lbStatus: TLabel;
    Label4: TLabel;
    btCancel: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    FMainForm: TfrmReceive;
    FPeriodNo: string;
    FcurrBillNo: string;
    procedure SetMainForm(const Value: TfrmReceive);
    procedure SetPeriodNo(const Value: string);
    procedure SetcurrBillNo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property PeriodNo :string read FPeriodNo write SetPeriodNo;
    property currBillNo : string read FcurrBillNo write SetcurrBillNo;
  end;

var
  frmBillingInfo: TfrmBillingInfo;

implementation

uses CommonLIB;

{$R *.dfm}

{ TfrmBillingInfo }

procedure TfrmBillingInfo.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmBillingInfo.FormShow(Sender: TObject);
var
  item : TListItem;
begin
// ListView.SetFocus;

 Screen.Cursor:=crHourGlass;
 MainForm.cdsBillingInfo.Close;
 MainForm.cdsBillingInfo.open;

  with MainForm.cdsBillingInfo do
  begin
    close;
    CommandText:=''+
    ' select a.*,b.do_prename,b.do_name,b.do_lname,b.do_gtotal from bill  a '  +
    ' left join donator b on a.bid=b.do_id ' +
    ' where a.bperiod='''+FPeriodNo+''' ';
    open;

     if Active then
       begin
          self.Caption:='ใบเสร็จ จำนวน '+inttostr(recordcount)+' รายการ ';
          ListView.Items.Clear;
          first;
          while not Eof do
          begin
             item := ListView.Items.Add;
             item.Caption:= fieldbyname('bno').AsString;
             item.SubItems.Add(trim(fieldbyname('do_prename').AsString)+' '+trim(fieldbyname('do_name').AsString)+' '+trim(fieldbyname('do_lname').AsString) ) ;
             item.Data := TString.Create(fieldbyname('bno').AsString);
            if not Eof then next;
          end;
       end;
  end;
  
  Screen.Cursor:=crDefault;
end;


procedure TfrmBillingInfo.SetPeriodNo(const Value: string);
begin
  FPeriodNo := Value;
end;

procedure TfrmBillingInfo.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if ListView.Selected<> nil then
  begin

    if (trim(TString(ListView.Selected.Data).Str)<>'') then
    begin
      lbBillNo.Caption:=trim(TString(ListView.Selected.Data).Str);
      with FMainForm.cdsBillingInfoDetail do
      begin
        close;
        //CommandText:='select * from billdetail where bdno='''+TString(ListView.Selected.Data).Str+'''';
        CommandText :=''+

         ' select '+
         ' a.*,b.o_title,c.fd_title '+
         ' from billdetail  a '+
         ' left join object_code b on a.bdobject=b.o_code '+
         ' left join found_code c on a.bdfound=c.fd_code '+
         ' where a.bdno='''+TString(ListView.Selected.Data).Str+''' ';

        open;
      end;


      currBillNo := trim(TString(ListView.Selected.Data).Str);
    end;


    with MainForm do
    begin
      cdsBillingInfo.close;
      cdsBillingInfo.CommandText:=''+
      ' select a.*,b.do_prename,b.do_name,b.do_lname,b.do_gtotal,a.btotal from bill  a '  +
      ' left join donator b on a.bid=b.do_id ' +
      ' where a.bno='''+trim(TString(ListView.Selected.Data).Str)+''' ';
      cdsBillingInfo.open;

       if cdsBillingInfo.Active then
        if cdsBillingInfo.recordcount>0 then
         begin
          cdsBillingInfo.first;
         // ShowMessage(trim(cdsBillingInfo.fieldbyname('bstatus').AsString));
          btnCancel.visible := (UpperCase(trim(cdsBillingInfo.fieldbyname('bstatus').AsString))='A');
          btCancel.Enabled := (UpperCase(trim(cdsBillingInfo.fieldbyname('bstatus').AsString))='A');
          if  (UpperCase(trim(cdsBillingInfo.fieldbyname('bstatus').AsString))='A') then
          begin

            lbStatus.Font.Color:=clGreen;
            lbStatus.Caption:='ใช้งาน'
          end
          else
          begin

            lbStatus.Font.Color:=clRed;
            lbStatus.Caption:='ยกเลิก';
          end;

          lbBillAmount.Caption:=FormatCurr('#,###,##0.00',cdsBillingInfo.fieldbyname('btotal').AsCurrency);
          edDonatorNameInfo.Text:=trim(cdsBillingInfo.fieldbyname('do_prename').AsString)+' '+trim(cdsBillingInfo.fieldbyname('do_name').AsString)+' '+trim(cdsBillingInfo.fieldbyname('do_lname').AsString) ;
          lbAccumulate.Caption:=FormatCurr('#,###,##0.00',cdsBillingInfo.fieldbyname('do_gtotal').AsCurrency)+' บาท';
         end;
    end;

  end;
end;

procedure TfrmBillingInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_escape then close;
end;

procedure TfrmBillingInfo.btnCancelClick(Sender: TObject);
begin
 if Trim(currBillNo)<>'' then
   if MessageDlg('ยินยันการบันทึกยกเลิก',mtConfirmation,mbOKCancel,0)=mrOK then
     begin
       MainForm.ExecSQL('update bill set bstatus=''I'' where bno='''+currBillNo+'''');
       //close;
     end;
end;

procedure TfrmBillingInfo.SetcurrBillNo(const Value: string);
begin
  FcurrBillNo := Value;
end;

procedure TfrmBillingInfo.btCancelClick(Sender: TObject);
begin
 if Trim(currBillNo)<>'' then
   if MessageDlg('ยินยันการบันทึกยกเลิก',mtConfirmation,mbOKCancel,0)=mrOK then
     begin
       MainForm.ExecSQL('update bill set bstatus=''I'' where bno='''+currBillNo+'''');
       //close;
     end;
end;

end.

