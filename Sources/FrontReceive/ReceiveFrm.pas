unit ReceiveFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  RzPanel, ExtCtrls, StdCtrls,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCurrencyEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzButton, DBXpress, SqlExpr,
  FMTBcd, Provider, DBClient, Mask, RzEdit, RzDBEdit, RzCmboBx, frxClass,
  frxDBSet, Buttons,sqltimst;

type


  TShowMode = set of (swSearch,swShowDetail);

  TfrmReceive = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Bevel2: TBevel;
    lbOrderItem: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnAddObjective: TRzBitBtn;
    btnEditItem: TRzBitBtn;
    btnClear: TRzBitBtn;
    btnSearch: TRzBitBtn;
    cxGridBillDetailsDBTableView1: TcxGridDBTableView;
    cxGridBillDetailsLevel1: TcxGridLevel;
    cxGridBillDetails: TcxGrid;
    btnSave: TRzBitBtn;
    lbAmount: TLabel;
    cdsBillDetails: TClientDataSet;
    dsBillDetails: TDataSource;
    cdsBillDetailsbdno: TStringField;
    cdsBillDetailsitem: TIntegerField;
    cdsBillDetailsbdobject: TStringField;
    cdsBillDetailsbdfound: TStringField;
    cdsBillDetailsbdamount: TBCDField;
    cdsBillDetailsbdbankbook: TStringField;
    cdsBillDetailsbdacccode: TStringField;
    cdsBillDetailsbdfoundtype: TStringField;
    cdsBillDetailsbdpaytype: TStringField;
    cdsBillDetailsbdflag: TStringField;
    cdsBill: TClientDataSet;
    dsBill: TDataSource;
    cdsBillbid: TStringField;
    cdsBillbno: TStringField;
    cdsBillbperiod: TStringField;
    cdsBillbdate: TSQLTimeStampField;
    cdsBillbtotal: TBCDField;
    cdsBillbpaytype: TStringField;
    cdsBillbbank: TStringField;
    cdsBillbbankname: TStringField;
    cdsBillbbrance: TStringField;
    cdsBillbrefno: TStringField;
    cdsBillbrefdate: TSQLTimeStampField;
    cdsBillbuserid: TStringField;
    cdsBillbfrom: TStringField;
    cdsBillbryid: TStringField;
    cdsBillbloc: TStringField;
    cdsBillbspiid: TStringField;
    cdsBillbentry: TSQLTimeStampField;
    cdsBillbcomid: TStringField;
    cdsBillbcancelid: TStringField;
    edDonatorName: TRzEdit;
    cmbPayType: TRzComboBox;
    Label2: TLabel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    cdsSearch: TClientDataSet;
    edAmount: TRzNumericEdit;
    cxGridBillDetailsDBTableView1item: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdobject: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdfound: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdbankbook: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdacccode: TcxGridDBColumn;
    cdsObjective: TClientDataSet;
    dsObjective: TDataSource;
    cdsFund: TClientDataSet;
    cdsFundList: TClientDataSet;
    cdsTemp: TClientDataSet;
    Bevel5: TBevel;
    Label3: TLabel;
    edObjtiveName: TRzEdit;
    Label11: TLabel;
    edFundName: TRzEdit;
    Label12: TLabel;
    edFAmount: TRzEdit;
    Label14: TLabel;
    edFAccountCode: TRzEdit;
    Label15: TLabel;
    edFAccountNo: TRzEdit;
    lbPay: TLabel;
    cdsBillw: TClientDataSet;
    cdsBillDetailsw: TClientDataSet;
    frxReport: TfrxReport;
    frxCdsBill: TfrxDBDataset;
    cdsBillReport: TClientDataSet;
    edObjtiveCode: TRzEdit;
    edFundCode: TRzEdit;
    cdsDonator: TClientDataSet;
    cdsDonatorHistoryHdr: TClientDataSet;
    cdsDonatorHistoryDtl: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    edBankBranch: TRzEdit;
    edRefDate: TRzEdit;
    edBank: TRzEdit;
    edRefCode: TRzEdit;
    edRecDate: TRzEdit;
    edRecDesc: TRzEdit;
    btnSelectBank: TSpeedButton;
    cdsBankCode: TClientDataSet;
    edBankName: TRzEdit;
    dtRecDate: TRzDateTimeEdit;
    edFAccountName: TRzEdit;
    btnFSelectAccount: TSpeedButton;
    cdsBillreceivedate: TSQLTimeStampField;
    cdsRoyal: TClientDataSet;
    cdsBillDetailsbdfunddesc: TStringField;
    cdsBillDetailsbdobjectdesc: TStringField;
    cxGridBillDetailsDBTableView1bdfunddesc: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdobjectdesc: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddObjectiveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure edFAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbPayTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure cdsBillDetailsAfterPost(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure cdsBillwReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsBillDetailswReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure btnEditItemClick(Sender: TObject);
    procedure cdsBillDetailsBeforeDelete(DataSet: TDataSet);
    procedure cdsBillDetailsBeforeEdit(DataSet: TDataSet);
    procedure edObjtiveCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFundCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsBillDetailsAfterDelete(DataSet: TDataSet);
    procedure cmbPayTypeChange(Sender: TObject);
    procedure edBankKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBankBranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRefCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRefDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRecDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsDonatorHistoryHdrAfterScroll(DataSet: TDataSet);
    procedure btnSelectBankClick(Sender: TObject);
    procedure btnFSelectAccountClick(Sender: TObject);
  private
    { Private declarations }
    _currObjCode,_currFundCode:string;

    _currFAmount :currency;
    FcurrAmount: currency;
    FcurrPay: currency;
    FcurrDonatorCode: string;
    FcurrDonatorName: string;
    FcurrBankCode: string;
    FcurrFndAccCode: string;
    FcurrFndAccName: string;
    FcurrFndAccNo: string;


    procedure appMessage(var Msg: Tmsg; var Handled: boolean);
    procedure initForm();
    procedure initDataset();

    function getObjtiveDesc(objcode:string):string;
    function getFundDesc(fundcode:string):string;
    procedure SetcurrAmount(const Value: currency);
    procedure SetcurrPay(const Value: currency);
    procedure clearFrontDataset();
    procedure SetcurrDonatorCode(const Value: string);
    procedure SetcurrDonatorName(const Value: string);
    function SelectObjectiveCode(objCode:string):string;
    function SelectFundCode(fundCode:string):string;
    procedure initPayType();
    procedure SetcurrBankCode(const Value: string);
    procedure SetcurrFndAccCode(const Value: string);
    procedure SetcurrFndAccName(const Value: string);
    procedure SetcurrFndAccNo(const Value: string);
    function getCurrDonations(cds:Tclientdataset;doid:string):currency;
    procedure setCurrDonations(doid:string;newDonations:currency);


  public
    { Public declarations }
    procedure ExecSQL(strSQL:string);
    function processIsNextLevelRoyal(doid:string;donations:currency):boolean;

    property currAmount : currency read FcurrAmount write SetcurrAmount;
    property currPay :currency read FcurrPay write SetcurrPay;
    property currDonatorCode :string read FcurrDonatorCode write SetcurrDonatorCode;
    property currDonatorName :string read FcurrDonatorName write SetcurrDonatorName;
    property currBankCode :string  read FcurrBankCode write SetcurrBankCode;
    property currFndAccCode : string read FcurrFndAccCode write SetcurrFndAccCode;
    property currFndAccName : string read FcurrFndAccName write SetcurrFndAccName;
    property currFndAccNo :string  read FcurrFndAccNo write SetcurrFndAccNo;

  end;

var
  frmReceive: TfrmReceive;

implementation

uses DonatorProfileFrm, CommonLIB, ObjectiveFrm, FundListFrm, FundInfoFrm,
  OvjectiveAFrm, Math, EditItemFrm, SelectBankFrm, SelectAccCodeFrm,
  DateUtils;

{$R *.dfm}



procedure TfrmReceive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmReceive.FormCreate(Sender: TObject);
begin

(*currAmount:=0;
_currFAmount:=0;
currPay:=0;

SetChildTaborders(pnClientContainer);
initDataset;
*)

end;

procedure TfrmReceive.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var
  frm : TfrmDonatorProfile;
begin
  case key of
    vk_f4:
      begin
        btnSaveClick(sender);
      end;
    vk_f6:
      begin
        if trim(FcurrDonatorCode)='' then
          btnSearchClick(sender)
        else
          btnAddObjectiveClick(sender);
      end;
    vk_f7:
      begin
         if ((ssCtrl in Shift) AND (Key = vk_f7)) then btnClearClick(sender)
         else btnEditItemClick(sender);
      end;
    vk_escape:
      begin
       frm := TfrmDonatorProfile.Create(self);
       frm.IsShowInfo:=true;
       frm.ShowModal;
       {
       if trim(frm.donatorID)<>'' then
       begin
         currDonatorCode := frm.donatorID;
         currDonatorName := frm.donatorName;
         edAmount.SetFocus;
       end;
       }
      end;
  end;

//  if ((ssCtrl in Shift) AND (Key = vk_f7)) then btnClearClick(sender);

end;

procedure TfrmReceive.appMessage(var Msg: Tmsg; var Handled: boolean);
begin
       if Msg.message = WM_KEYDOWN then
            if Msg.wparam = 9 then
        if GetKeyState(VK_SHIFT) >= 0 then
                    SelectNext(FindControl(Msg.hwnd),true,true)     {tab}
                else
         SelectNext(FindControl(Msg.hwnd),false,true);      {back tab}
end;

procedure TfrmReceive.FormShow(Sender: TObject);
begin
//  initForm;
end;

procedure TfrmReceive.edAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  item : integer;
begin
  if key=vk_return then
  begin
    if edAmount.Value>0 then
      currAmount:=edAmount.Value
    else
      currAmount:=0;
    cmbPayType.SetFocus;

      edFAmount.Text:= FormatCurr('#0',currAmount-currPay);    
  end;

end;

procedure TfrmReceive.btnAddObjectiveClick(Sender: TObject);
var
 frmAddObj : TfrmObjective;
 frmAddObjA : TfrmOvjectiveA;
 var item:integer;
begin
  if ((trim(_currObjCode)<>'') and (trim(_currFundCode)<>'' )) then
  begin

   if trim(edFAmount.text)='' then
   begin
    edFAmount.SetFocus;
    exit;
   end;


   if trim(currDonatorCode)='' then
   begin
     btnSearchClick(sender);
   end else
   begin

      _currFAmount:= StrToCurr(edFAmount.text);

      if currPay=currAmount then exit;

      if (_currFAmount+currPay)>currAmount then
        if MessageDlg('�׹�ѹ��ԨҤ�Թ�ӹǹ��������',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit
        else currAmount:=_currFAmount+currPay;


        
      item := cdsBillDetails.RecordCount+1;

      cdsBillDetails.Append;
      cdsBillDetailsbdno.AsString:='0001';
      cdsBillDetailsitem.AsInteger:= item;
      cdsBillDetailsbdobject.AsString:=_currObjCode;
      cdsBillDetailsbdfound.AsString:=_currFundCode;
      cdsBillDetailsbdamount.AsCurrency := _currFAmount;
      cdsBillDetails.Post;

      edFAmount.Text:= FormatCurr('#0',currAmount-currPay);

      if (currAmount-currPay)>0 then
      begin
        edObjtiveCode.SetFocus;
        edObjtiveCode.SelectAll;
      end else
      begin
        edFAmount.SetFocus;
        edFAmount.SelectAll;
      end;

   end;

  end else

   with  frmReceive.cdsObjective do
   begin
      close;
      CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa order by roworder';
      open;

      if recordcount>0 then
      begin
        frmAddObj:=TfrmObjective.Create(self);
        frmAddObj.ShowModal;

        if (trim(frmAddObj.selectcode)<>'') and (trim(frmAddObj.selectFundCode)<>'') then
        begin
          _currObjCode:=frmAddObj.selectcode;
          _currFundCode:=frmAddObj.selectFundCode;


          if (_currObjCode=_currFundCode) then
          begin
              edFundCode.Enabled:=false;
              edFundName.Enabled:=false;

              edObjtiveCode.Text:=_currObjCode;
              edObjtiveName.Text:=getObjtiveDesc( _currObjCode);

              edFAmount.SetFocus;
              edFAmount.SelectAll;
          end else
          begin

            edFundCode.Enabled:=true;
            edFundName.Enabled:=true;

            edObjtiveCode.Text:=_currObjCode;
            edFundCode.Text:=_currFundCode;
            edObjtiveName.Text:=getObjtiveDesc( _currObjCode);
            edFundName.Text:=getFundDesc(_currFundCode);

            edFAmount.Text:= FormatCurr('#0',currAmount-currPay);
            edFAmount.SetFocus;
            edFAmount.SelectAll;
          end;
        end;
        frmAddObj.Free;
      end;
   end;
end;

procedure TfrmReceive.initForm;
begin
  initPayType;

  dtRecDate.Date:=getServerDate(cdsTemp);

end;

procedure TfrmReceive.initDataset;
var provName:string;
  i:integer;
begin
    with self do
    begin
      for I := 0 to self.ComponentCount - 1 do
      begin
        if ((Components[I] is TClientDataset)  and (Components[I].Tag <> 99))
          then
        begin
          AddProv(self,Conn,TClientDataSet(Components[I]).Name);
          initCDS(TClientDataSet(Components[I]).Name,TClientDataSet(Components[I]));
        end;
      end;
    end;
end;

procedure TfrmReceive.btnClearClick(Sender: TObject);
begin
  //cdsBillDetails.EmptyDataSet;
  //currPay:=0;


  if cdsBillDetails.RecordCount>0 then
  begin
    cdsBillDetails.Last;
    cdsBillDetails.Delete
  end;

  edFAmount.SetFocus;
  edFAmount.SelectAll;
end;

procedure TfrmReceive.edFAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
   if key = vk_return then
    btnAddObjectiveClick(sender);

end;

procedure TfrmReceive.cmbPayTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='22' then
        edObjtiveCode.SetFocus
     else
      SelectNext(Sender as TWinControl,true,True);
  end;

end;

procedure TfrmReceive.btnSearchClick(Sender: TObject);
var frm : TfrmDonatorProfile;
begin
   frm := TfrmDonatorProfile.Create(self);
   frm.ShowModal;
   if trim(frm.donatorID)<>'' then
   begin
     currDonatorCode := frm.donatorID;
     currDonatorName := frm.donatorName;
     edAmount.SetFocus;
   end;
end;
function TfrmReceive.getFundDesc(fundcode: string): string;
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

function TfrmReceive.getObjtiveDesc(objcode: string): string;
var rep:string;
begin
 with cdsTemp do
 begin
  rep:='';
  close;
  CommandText:='select o_title from object_code where o_code='''+objcode+'''';
  open;

  if Active then
    if RecordCount>0 then
    begin
       rep:= fieldbyname('o_title').asstring;
    end;
 end;

 result:=rep;

end;

procedure TfrmReceive.SetcurrAmount(const Value: currency);
begin
  FcurrAmount := Value;
  edAmount.Value:=value;
  lbAmount.Caption:='�ʹ��駺�ԨҤ '+FormatCurr('#,##0.00',value)+' �ҷ';
end;

procedure TfrmReceive.cdsBillDetailsAfterPost(DataSet: TDataSet);
begin
  currPay:=currPay+DataSet.fieldbyname('bdamount').AsCurrency;
end;

procedure TfrmReceive.SetcurrPay(const Value: currency);
begin
  FcurrPay := Value;
  lbPay.Caption:='�ʹ��ԨҤ '+FormatCurr('#,##0.00',value)+' �ҷ';
end;

procedure TfrmReceive.btnSaveClick(Sender: TObject);
var BillNO,i,k:integer;
    recStamp:TRecStamp;
    currDonations,newDonations : currency;
    billAmount : currency;
begin
  try

    billAmount:=0;
    currDonations := getCurrDonations(cdsTemp,currDonatorCode);

    
    if MessageDlg('�׹�ѹ��úѹ�֡�Ѻ��ԨҤ',mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;


    if cdsBillDetails.Active then
      if cdsBillDetails.RecordCount<=0 then
      begin
        MessageDlg('������ö�ӡ�úѹ�֡�� ���ͧ�ҡ�ѧ�������¡��',mtWarning,[mbOK],0);
        exit;
      end;

    if currPay< currAmount then
    begin
        MessageDlg('�ѧ����¡�ú�ԨҤ���ú����ӹǹ �������ö�ѹ�֡��',mtWarning,[mbOK],0);
        exit;
    end;


      with cdsBillw do
      begin
        // header
        Close;
        CommandText:='select top 1 * from bill';
        Open;
        EmptyDataSet;

        BillNO:=getBillNo(cdsTemp,'FRONT1','FRONT','00','MTTNM1');

        Append;
        FieldByName('bid').AsString:=currDonatorCode;
        FieldByName('bno').AsInteger:=BillNO;
        FieldByName('bperiod').AsString:='1111';
        FieldByName('bdate').AsDateTime:=dtRecDate.Date;
        FieldByName('receivedate').AsDateTime:=getServerDate(cdsTemp);

        FieldByName('btotal').AsCurrency:=currPay;
        billAmount:=currPay;
        FieldByName('bpaytype').AsString:=trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str);

        //recStamp:=TRecStamp.Create;
        //recStamp.SetStamp(FieldByName('create_on'));
    //    TRecStamp(FieldByName('create_on')).SetStamp()


    (*    FieldByName('bbank').AsString:='';
        FieldByName('bbankname').AsString:='';
        FieldByName('bbrance').AsString:='';
        FieldByName('brefno').AsString;
        FieldByName('brefdate').AsString; *)
        FieldByName('buserid').AsString:='uid';
    (*    FieldByName('bfrom').AsString;
        FieldByName('bryid').AsString;
        FieldByName('bloc').AsString;
        FieldByName('bspiid').AsString;
        FieldByName('bentry').AsString;
        FieldByName('bcomid').AsString;
        FieldByName('bcancelid').AsString; *)
        post;

        if cdsBillDetails.Active then
          if cdsBillDetails.RecordCount<=0 then
          begin
            MessageDlg('������ö�ӡ�úѹ�֡�� ���ͧ�ҡ�ѧ�������¡��',mtWarning,[mbOK],0);
            exit;
            //clearFrontDataset;
          end
          else
            with cdsBillDetails do
            begin
              cdsBillDetailsw.Close;
              cdsBillDetailsw.CommandText:='select top 1 * from billdetail';
              cdsBillDetailsw.Open;
              cdsBillDetailsw.EmptyDataSet;



              {
              first;
              while not cdsBillDetails.Eof do
              begin

                cdsBillDetailsw.Append;
                cdsBillDetailsw.FieldByName('bdno').AsInteger:=BillNO;//cdsBillDetails.FieldByName('bdno').value;
                cdsBillDetailsw.FieldByName('item').value:=cdsBillDetails.FieldByName('item').value;
                cdsBillDetailsw.FieldByName('bdobject').value:=cdsBillDetails.FieldByName('bdobject').value;
                cdsBillDetailsw.FieldByName('bdfound').value:=cdsBillDetails.FieldByName('bdfound').value;
                cdsBillDetailsw.FieldByName('bdamount').value:=cdsBillDetails.FieldByName('bdamount').value;
                cdsBillDetailsw.FieldByName('bdbankbook').value:=cdsBillDetails.FieldByName('bdbankbook').value;
                cdsBillDetailsw.FieldByName('bdacccode').value:=cdsBillDetails.FieldByName('bdacccode').value;
                cdsBillDetailsw.FieldByName('bdfoundtype').value:=cdsBillDetails.FieldByName('bdfoundtype').value;
                cdsBillDetailsw.FieldByName('bdpaytype').value:=cdsBillDetails.FieldByName('bdpaytype').value;
                cdsBillDetailsw.FieldByName('bdflag').value:=cdsBillDetails.FieldByName('bdflag').value;
                cdsBillDetailsw.Post;

                if not cdsBillDetails.Eof then cdsBillDetails.Next;
              end;

              }

              cdsBillDetails.First();
              while (not cdsBillDetails.Eof) do
              begin
                cdsBillDetailsw.Append();
                for i := 0 to (cdsBillDetailsw.FieldCount - 1) do
                begin
                  for k := 0 to (cdsBillDetails.FieldCount - 1) do
                     if  cdsBillDetailsw.Fields[i].FieldName=cdsBillDetails.Fields[k].FieldName then
                     begin
                           if  cdsBillDetailsw.Fields[i].FieldName='bdno' then cdsBillDetailsw.FieldByName(cdsBillDetailsw.Fields[i].FieldName).value:=BillNO
                           else
                           begin
                              cdsBillDetailsw.FieldByName(cdsBillDetailsw.Fields[i].FieldName).Value :=
                                cdsBillDetails.FieldByName(cdsBillDetails.Fields[k].FieldName).Value;
                           end;
                     end;
                end;


                try
                cdsBillDetailsw.Post();
                except
                end;
                cdsBillDetails.Next();
              end;



              cdsBillw.ApplyUpdates(0);
              cdsBillDetailsw.ApplyUpdates(0);


              // POST Receive
              setBillNo(cdsTemp,'FRONT1','FRONT','00','MTTNM1');
              newDonations:=currDonations+billAmount;
              setCurrDonations(currDonatorCode,newDonations);   // accummulate donations



              MessageDlg('�ӡ�úѹ�֡���º����',mtInformation,[mbOK],0);

              cdsBillReport.Close;
              cdsBillReport.CommandText:='select top 1 a.*,b.*,c.* from bill  a left join billdetail b on a.bno=b.bdno  left join donator c on a.bid=c.do_id where bno='''+inttostr(BillNO)+'''';

              cdsBillReport.Open;
              if cdsBillReport.Active then
                frxReport.ShowReport();

              // process royal
              processIsNextLevelRoyal(currDonatorCode,newDonations);

              clearFrontDataset;

              // royal process


            end;

      end;
  except
    on ee:exception do
    begin
      Application.MessageBox(pchar(ee.Message),pchar('Error'),MB_OK);
    end;
  end;
end;

procedure TfrmReceive.clearFrontDataset;
begin
  if cdsBill.State in [dsEdit,dsInsert] then cdsBill.Cancel;
  cdsBill.EmptyDataSet;

  if cdsBillDetails.State in [dsEdit,dsInsert] then cdsBillDetails.Cancel;
  cdsBillDetails.EmptyDataSet;

  currDonatorCode:='';
  currDonatorName:='';

  currPay:=0;
  currAmount:=0;

  // clear text
  edAmount.Value:=0;
  edDonatorName.Text:='';
  edBank.Text:='';
  edBankBranch.Text:='';
  edRecDate.Text:='';
  edRefCode.Text:='';
  edRefDate.Text:='';
  edRecDesc.Text:='';

  edFAccountCode.Text:='';
  edFAccountNo.Text:='';

end;

procedure TfrmReceive.cdsBillwReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
 Application.MessageBox(pchar(e.Message),pchar('Error'),MB_OK or MB_ICONERROR);
end;

procedure TfrmReceive.cdsBillDetailswReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 Application.MessageBox(pchar(e.Message),pchar('Error'),MB_OK or MB_ICONERROR);

end;

procedure TfrmReceive.btnEditItemClick(Sender: TObject);
var frm:TfrmEditItem;

 _currItemAmount,_newItemAmount,_newPay:Currency;
begin
  _currItemAmount:=0;
  _newItemAmount:=0;
  _newPay := 0;
  if cdsBillDetails.RecordCount>0 then
  begin
//    if not cxGridBillDetails.se then
//    cdsBillDetails.Last;

    frm :=TfrmEditItem.Create(self);
    frm.itemAmount := cdsBillDetails.fieldbyname('bdamount').AsCurrency;
    _currItemAmount := cdsBillDetails.fieldbyname('bdamount').AsCurrency;
    frm.itemObjCode := cdsBillDetails.fieldbyname('bdobject').AsString;
    frm.itemFundCode := cdsBillDetails.fieldbyname('bdfound').AsString;
    frm.ShowModal;
    _newItemAmount := frm.itemAmount;
    _newPay := (currPay-_currItemAmount)+_newItemAmount;

    if _newItemAmount<> cdsBillDetails.fieldbyname('bdamount').AsCurrency then
    begin

      if  _newPay > currAmount then
      begin
        MessageDlg('�ʹ�Թ�ا�����ʹ��駺�ԨҤ �������ö ��� �ӹǹ�Թ��',mtWarning,[mbOK],0);
        exit;
      end;


      cdsBillDetails.Edit;
      cdsBillDetails.fieldbyname('bdamount').AsCurrency:=frm.itemAmount;
      cdsBillDetails.Post;
    end;


      edFAmount.Text:= FormatCurr('#0',currAmount-currPay);

      if (currAmount-currPay)>0 then
      begin
        edObjtiveCode.SetFocus;
        edObjtiveCode.SelectAll;
      end else
      begin
        edFAmount.SetFocus;
        edFAmount.SelectAll;
      end;    


  end;

end;

procedure TfrmReceive.SetcurrDonatorCode(const Value: string);
begin
  FcurrDonatorCode := Value;
end;

procedure TfrmReceive.SetcurrDonatorName(const Value: string);
begin
  FcurrDonatorName := Value;
  edDonatorName.Text := value;
end;

procedure TfrmReceive.cdsBillDetailsBeforeDelete(DataSet: TDataSet);
begin
  currPay:=currPay-DataSet.fieldbyname('bdamount').AsCurrency;
end;

procedure TfrmReceive.cdsBillDetailsBeforeEdit(DataSet: TDataSet);
begin
 currPay:=currPay-DataSet.fieldbyname('bdamount').AsCurrency;
end;

procedure TfrmReceive.edObjtiveCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  frmAddObj:TfrmObjective;
  frmFundInf:TfrmFundInfo;
begin
  if key=vk_return then
  begin

   with  cdsObjective do
   begin
      close;
      CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa where o_code='''+trim(edObjtiveCode.Text)+''' order by roworder';
      open;

      if recordcount>0 then     // founc code
      begin

        if trim(fieldbyname('o_code').AsString)<>''  then
        begin
          _currObjCode:=fieldbyname('o_code').AsString;

          if uppercase(trim(cdsObjective.FieldByName('o_flag').AsString))='N' then   // new
          begin
              frmFundInf := TfrmFundInfo.Create(self);
              frmFundInf.ShowModal;
              frmFundInf.Free;
          end else
          if uppercase(trim(cdsObjective.FieldByName('o_flag').AsString))='A' then   // no children
          begin

                _currFundCode:=_currObjCode;
                edFundCode.Text:='';
                edFundName.Text:='';

               edFundCode.Enabled:=false;
               edFundName.Enabled:=false;

               edFAmount.SetFocus;
               edFAmount.SelectAll;
          end else
          begin
               edFundCode.Enabled:=true;
               edFundName.Enabled:=true;
               edFundCode.SetFocus;
               edFundCode.SelectAll;
          end;

          edObjtiveName.Text:=getObjtiveDesc( _currObjCode);


        end;



      end else
      begin       // search code

        close;
        CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa where o_code like'''+trim(edObjtiveCode.Text)+'%'' order by roworder';
        open;

        frmAddObj:=TfrmObjective.Create(self);
        frmAddObj.ShowModal;

        if (trim(frmAddObj.selectcode)<>'') and (trim(frmAddObj.selectFundCode)<>'') then
        begin
          _currObjCode:=frmAddObj.selectcode;
          _currFundCode:=frmAddObj.selectFundCode;

           (*
          edFundName.Enabled:=true;
          edFundCode.Enabled:=true;

          edObjtiveCode.Text:=_currObjCode;
          edFundCode.Text:=_currFundCode;
          edObjtiveName.Text:=getObjtiveDesc( _currObjCode);
          edFundName.Text:=getFundDesc(_currFundCode);

          edFAmount.Text:= FormatCurr('#0',currAmount-currPay);

          edFAmount.SetFocus;
          edFAmount.SelectAll;

          if trim(_currObjCode)<>'' then
          begin
            edFAmount.SetFocus;
            edFAmount.SelectAll;
          end else
          begin
            edObjtiveCode.SetFocus;
            edObjtiveCode.SelectAll;
          end;
          *)

          if (_currObjCode=_currFundCode) then
          begin
              edFundCode.Enabled:=false;
              edFundName.Enabled:=false;
              edFundCode.Text:='';
              edFundName.Text:='';


              edObjtiveCode.Text:=_currObjCode;
              edObjtiveName.Text:=getObjtiveDesc( _currObjCode);

              edFAmount.SetFocus;
              edFAmount.SelectAll;
          end else
          begin

            edFundCode.Enabled:=true;
            edFundName.Enabled:=true;

            edObjtiveCode.Text:=_currObjCode;
            edFundCode.Text:=_currFundCode;
            edObjtiveName.Text:=getObjtiveDesc( _currObjCode);
            edFundName.Text:=getFundDesc(_currFundCode);

            edFAmount.Text:= FormatCurr('#0',currAmount-currPay);
            edFAmount.SetFocus;
            edFAmount.SelectAll;
          end;


        end;
        frmAddObj.Free;
      end;
   end;


  end;
end;

procedure TfrmReceive.edFundCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var frmFundL:TfrmFundList;
_currFundCodeTmp:string;
begin
  if key=vk_return then
           with frmReceive.cdsFundList do
           begin
                _currFundCodeTmp:='';
//                if trim(_currObjCode)<>'' then
                begin
                cdsFund.Close;
                cdsFund.CommandText:='select o_codefd,o_flag from object_code where o_code ='''+_currObjCode+''' and o_status<>''C'' order by  cast(o_code as integer )';
                cdsFund.Open;
                    // get sub fundation list send to dialog

                if cdsFund.Active then
                  if cdsFund.RecordCount>0 then
                  begin

                    cdsFundList.Close;
                    cdsFundList.CommandText:='select * from found_code where (fd_codetype = '+cdsFund.fieldbyname('o_codefd').asstring+') and fd_code='''+edFundCode.Text+''' and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
                    cdsFundList.Open;


                    //cdsFundList.Close;
                    //cdsFundList.CommandText:='select * from found_code where  (isnull(upper(fd_status) ,'''') <> ''C'') and fd_code='''+trim(edFundCode.Text)+''' order by fd_code';
                    //cdsFundList.Open;
                    if cdsFundList.RecordCount>0 then
                    begin
                      if trim(cdsFundList.fieldbyname('fd_code').AsString)<>''  then
                      begin
                        _currFundCode:=cdsFundList.fieldbyname('fd_code').AsString;
                        edFundName.Text:=getFundDesc(_currFundCode);

                        edFAmount.SetFocus;
                        edFAmount.SelectAll;
                      end;
                    end
                    else
                    begin
                      //Fselectcode :='';

                      cdsFundList.Close;
                      cdsFundList.CommandText:='select * from found_code where (fd_codetype = '+cdsFund.fieldbyname('o_codefd').asstring+') and fd_code like '''+edFundCode.Text+'%'' and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
                      cdsFundList.Open;


                      frmFundL:=TfrmFundList.Create(self);
                      //frmFundL.FundGroupCode :=cdsFund.fieldbyname('o_codefd').asstring;
                      frmFundL.ShowModal;
                      _currFundCodeTmp := frmFundL.SelectCode;
                      frmFundL.Free;

                      if trim(_currFundCodeTmp)<>'' then
                      begin
                        _currFundCode:=_currFundCodeTmp;
                        edFundCode.text:=_currFundCode;
                        edFundName.Text:=getFundDesc(_currFundCode);
                        
                        edFAmount.Text:= FormatCurr('#0',currAmount-currPay);

                        edFAmount.SetFocus;
                        edFAmount.SelectAll;
                      end else
                      begin

                        edFundCode.text:=_currFundCode;
                        edFundCode.SetFocus;
                        edFundCode.SelectAll;
                      end;
                    end;
                  end;

                end;

           end;
end;

procedure TfrmReceive.cdsBillDetailsAfterDelete(DataSet: TDataSet);
begin
  edFAmount.Text:= FormatCurr('#0',currAmount-currPay);
end;

function TfrmReceive.SelectFundCode(fundCode: string): string;
begin

end;

function TfrmReceive.SelectObjectiveCode(objCode: string): string;
begin

end;

procedure TfrmReceive.initPayType;
begin
  with cdsTemp do
  begin
    close;
    CommandText:='select pt_code,pt_title  from paytype where pt_status<>''C'' order by pt_code';
    open;

    if recordcount>0 then
    begin
      first;
      cmbPayType.Items.Clear;
      while not cdstemp.Eof do
      begin

        cmbPayType.AddObject(cdstemp.fieldbyname('pt_title').AsString,TString.Create(cdstemp.fieldbyname('pt_code').AsString));
        if not cdsTemp.Eof then cdsTemp.Next;
      end;
        cmbPayType.ItemIndex:=0;
    end;


  end;
end;

procedure TfrmReceive.cmbPayTypeChange(Sender: TObject);
begin
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='22' then
 begin
    edBank.Enabled:=false;
    btnSelectBank.Enabled:=false;
    edBankName.Enabled:=false;
    edBankBranch.Enabled:=false;
    edRecDate.Enabled:=false;
    edRefCode.Enabled:=false;
    edRefDate.Enabled:=false;
    edRecDesc.Enabled:=false;
 end else
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='24' then
 begin
    edBank.Enabled:=false;
    btnSelectBank.Enabled:=false;
    edBankName.Enabled:=false;
    edBankBranch.Enabled:=false;
    edRecDate.Enabled:=false;
    edRefCode.Enabled:=true;
    edRefDate.Enabled:=true;
    edRecDesc.Enabled:=true;
 end;
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='25' then
 begin
    edBank.Enabled:=false;
    btnSelectBank.Enabled:=false;
    edBankName.Enabled:=false;
    edBankBranch.Enabled:=false;
    edRecDate.Enabled:=false;
    edRefCode.Enabled:=true;
    edRefDate.Enabled:=true;
    edRecDesc.Enabled:=true;
 end else
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='28' then
 begin
    edBank.Enabled:=true;
    btnSelectBank.Enabled:=true;
    edBankName.Enabled:=true;
    edBankBranch.Enabled:=true;
    edRecDate.Enabled:=true;
    edRefCode.Enabled:=true;
    edRefDate.Enabled:=true;
    edRecDesc.Enabled:=true;
 end else
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='50' then
 begin
    edBank.Enabled:=true;
    btnSelectBank.Enabled:=true;
    edBankName.Enabled:=true;
    edBankBranch.Enabled:=true;
    edRecDate.Enabled:=true;
    edRefCode.Enabled:=true;
    edRefDate.Enabled:=true;
    edRecDesc.Enabled:=true;
 end;

end;

procedure TfrmReceive.edBankKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    //if trim(edBank.Text)='' then
      btnSelectBankClick(sender)
    //else
    // SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

procedure TfrmReceive.edBankBranchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

procedure TfrmReceive.edRefCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

procedure TfrmReceive.edRefDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

procedure TfrmReceive.edRecDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

procedure TfrmReceive.cdsDonatorHistoryHdrAfterScroll(DataSet: TDataSet);
begin
          with frmReceive.cdsDonatorHistoryDtl do
          begin
            close;
            CommandText:='select * from billdetail where bdno='''+frmReceive.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            open;
          end;
end;

procedure TfrmReceive.btnSelectBankClick(Sender: TObject);
var frm:TfrmSelectBank;
begin
  with cdsBankCode do
  begin
    close;
    CommandText:='select * from bank_code ';
    open;

    if cdsBankCode.Active then
      if cdsBankCode.RecordCount>0 then
      begin
        frm := TfrmSelectBank.Create(self);
        frm.ShowModal;
        if trim(frm.bankCode)<>'' then
        begin
         edBank.Text:=frm.bankCode;
         currBankCode:=frm.bankCode;
         edBankName.Text:=frm.bankName;
        end;

        frm.Free;
        edBankBranch.SetFocus;
        edBankBranch.SelectAll;
      end;
  end;
end;

procedure TfrmReceive.SetcurrBankCode(const Value: string);
begin
  FcurrBankCode := Value;
end;

procedure TfrmReceive.btnFSelectAccountClick(Sender: TObject);
var
  frm : TfrmSelectAccCode;
begin

  with cdsTemp do
  begin
    Close;
    CommandText:='select * from acccode';
    open;

    if cdsTemp.Active then
      if cdsTemp.RecordCount>0 then
      begin
        frm := TfrmSelectAccCode.Create(self);
        frm.ShowModal;
        if trim(frm.SelectAccCode)<>'' then
        begin
          currFndAccCode:=frm.SelectAccCode;
          currFndAccName:=frm.SelectAccName;
          currFndAccNo := frm.SelectAccNo;
        end;

      end;
  end;

end;

procedure TfrmReceive.SetcurrFndAccCode(const Value: string);
begin
  FcurrFndAccCode := Value;
  edFAccountCode.Text:=value;
end;

procedure TfrmReceive.SetcurrFndAccName(const Value: string);
begin
  FcurrFndAccName := Value;
  edFAccountName.Text:=value;
end;

procedure TfrmReceive.SetcurrFndAccNo(const Value: string);
begin
  FcurrFndAccNo := Value;
  edFAccountNo.Text:=value;
end;

function TfrmReceive.getCurrDonations(cds:Tclientdataset;doid: string): currency;
var rep:currency;
begin
  rep:=0;
  with cds do
  begin
    close;
    CommandText:='select do_gtotal from donator where do_id='''+doid+'''';
    open;

    if cds.Active then
      if cds.RecordCount>0 then
          rep := cds.fieldbyname('do_gtotal').AsCurrency;
  end;

  result:=rep;
end;

procedure TfrmReceive.setCurrDonations(doid: string;newDonations:currency);
var sql:string;
begin
  sql:='update  donator set do_gtotal='+FormatCurr('0.00',newDonations)+' from donator where do_id='''+doid+'''';
  ExecSQL(sql);
end;

procedure TfrmReceive.ExecSQL(strSQL: string);
begin
  Conn.ExecuteDirect(strSQL);
end;



function TfrmReceive.processIsNextLevelRoyal(doid: string; donations: currency):boolean;
var
  currRoyalLevel:integer;
  nextRoyalCurrency:currency;
begin
  //
  currRoyalLevel:=0;
  //currRoyalCurrency:=0;
  nextRoyalCurrency:=0;

  with cdsRoyal do
  begin
    close;
    CommandText:='select MIN(ryrcode) as ryrcode from royal where id ='''+doid+'''';
    open;
    if recordcount>0 then
      if not fieldbyname('ryrcode').IsNull then
      begin
         currRoyalLevel:=fieldbyname('ryrcode').AsInteger;
      end else
      begin    // never request royal assign max level of royal
          close;
          CommandText:='select top 1 *  from royal_code where ry_amount<='+FormatCurr('0.00',donations);
          open;

          if recordcount>0 then
            if not fieldbyname('ry_level').IsNull then
            begin
              currRoyalLevel:=fieldbyname('ry_level').AsInteger+1;
            end;
      end;

    if currRoyalLevel>0 then
    begin
      close;
      CommandText:='select * from royal_code where ry_level='''+inttostr(currRoyalLevel-1)+'''';
      open;
      if recordcount>0 then
      begin
        nextRoyalCurrency:=fieldbyname('ry_amount').AsCurrency;
      end;

      if donations>=nextRoyalCurrency then
      begin
        MessageDlg('�س��ͧ��â�����ͧ�Ҫ ��鹷�� '+inttostr(currRoyalLevel-1)+' �������',mtConfirmation,[mbYes,mbNo],0);
      end;



      result := donations>=nextRoyalCurrency;
    end else
     result :=false;

  end;
end;

end.
