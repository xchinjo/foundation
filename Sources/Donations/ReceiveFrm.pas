unit ReceiveFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,CommonLIB,
  Dialogs, RzPanel, ExtCtrls, StdCtrls, DBXpress, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, RzEdit,
  RzCmboBx, Mask, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  RzButton, Buttons, frxClass, frxDBSet, Provider, SqlExpr, DBClient,
  RzLabel, Grids, DBGrids, RzDBEdit, frxDesgn;

type
  TfrmReceive = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    cdsBill: TClientDataSet;
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
    cdsBillreceivedate: TSQLTimeStampField;
    cdsBillDetails: TClientDataSet;
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
    dsBill: TDataSource;
    dsBillDetails: TDataSource;
    cdsBillDetailsw: TClientDataSet;
    cdsBillw: TClientDataSet;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    cdsBankCode: TClientDataSet;
    cdsFund: TClientDataSet;
    cdsObjective: TClientDataSet;
    cdsSearch: TClientDataSet;
    cdsRoyal: TClientDataSet;
    cdsTemp: TClientDataSet;
    dsObjective: TDataSource;
    cdsFundList: TClientDataSet;
    cdsDonator: TClientDataSet;
    cdsDonatorHistoryDtl: TClientDataSet;
    cdsDonatorHistoryHdr: TClientDataSet;
    cdsProjects: TClientDataSet;
    cdsBillReport: TClientDataSet;
    frxCdsBill: TfrxDBDataset;
    frxReport: TfrxReport;
    cxGridBillDetails: TcxGrid;
    cxGridBillDetailsDBTableView1: TcxGridDBTableView;
    cxGridBillDetailsDBTableView1item: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdbankbook: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdacccode: TcxGridDBColumn;
    cxGridBillDetailsLevel1: TcxGridLevel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    lbPeroidNo: TRzLabel;
    RzLabel1: TRzLabel;
    cdsBillingInfo: TClientDataSet;
    cdsBillingInfoDetail: TClientDataSet;
    RzLabel2: TRzLabel;
    lbUserName: TRzLabel;
    RzLabel3: TRzLabel;
    lbDonationPoint: TRzLabel;
    pnTop: TRzPanel;
    cdsBillDetailsbdobjectdesc: TStringField;
    cxGridBillDetailsDBTableView1bdobjectdesc: TcxGridDBColumn;
    cdsBillDetailsbdfounddesc: TStringField;
    cxGridBillDetailsDBTableView1bdfounddesc: TcxGridDBColumn;
    frxReport1: TfrxReport;
    cdsRoyalHistory: TClientDataSet;
    cdsFavorHistory: TClientDataSet;
    dsFavorHistory: TDataSource;
    pnProject: TRzPanel;
    pnClients: TRzPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAmount: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lbPay: TLabel;
    btnSelectBank: TSpeedButton;
    Label2: TLabel;
    btnAddObjective: TRzBitBtn;
    btnEditItem: TRzBitBtn;
    btnClear: TRzBitBtn;
    btnSave: TRzBitBtn;
    cmbPayType: TRzComboBox;
    edAmount: TRzNumericEdit;
    edObjtiveName: TRzEdit;
    edFundName: TRzEdit;
    edFAmount: TRzEdit;
    edObjtiveCode: TRzEdit;
    edFundCode: TRzEdit;
    edBankBranch: TRzEdit;
    edRefDate1: TRzEdit;
    edBank: TRzEdit;
    edRefCode: TRzEdit;
    edRecDesc: TRzEdit;
    edBankName: TRzEdit;
    dtRecDate: TRzDateTimeEdit;
    BitBtn1: TBitBtn;
    lbProject: TLabel;
    edProject: TRzEdit;
    spProject: TSpeedButton;
    spNormal: TSpeedButton;
    cdsTemp2: TClientDataSet;
    dsTemp: TDataSource;
    btnCancel: TRzBitBtn;
    cdsMaterReceive: TClientDataSet;
    cdsTemp3: TClientDataSet;
    cdsMaterReceiveHdr: TClientDataSet;
    pn2: TRzPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    dsDonator: TDataSource;
    edRefDate: TRzMaskEdit;
    Label20: TLabel;
    frxDesigner: TfrxDesigner;
    cdsBillbstatus: TStringField;
    cdsBillbproject: TStringField;
    cdsBillbremark: TStringField;
    RzPanel1: TRzPanel;
    btnSearch: TRzBitBtn;
    lbOrderItem: TLabel;
    edDonatorName: TRzEdit;
    btnBillingInfo: TRzBitBtn;
    cdsAddrLocation: TClientDataSet;
    cdsFundInfo: TClientDataSet;
    cdsObjInfo: TClientDataSet;
    ckKeyBillNo: TCheckBox;
    cdsAutoLocation: TClientDataSet;
    cdsAutoLocation1: TClientDataSet;
    cdsCheckBillNo: TClientDataSet;
    cdsBookBank: TClientDataSet;
    cdsObjAcc: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbPayTypeChange(Sender: TObject);
    procedure cmbPayTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSelectBankClick(Sender: TObject);
    procedure edBankBranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRefCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRefDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRecDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edObjtiveCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFundCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddObjectiveClick(Sender: TObject);
    procedure edFAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure btnEditItemClick(Sender: TObject);
    procedure btnFSelectAccountClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsBillDetailsAfterDelete(DataSet: TDataSet);
    procedure cdsBillDetailsAfterPost(DataSet: TDataSet);
    procedure cdsBillDetailsBeforeDelete(DataSet: TDataSet);
    procedure cdsBillDetailsBeforeEdit(DataSet: TDataSet);
    procedure cdsDonatorHistoryHdrAfterScroll(DataSet: TDataSet);
    procedure btnBillingInfoClick(Sender: TObject);
    procedure edDonatorNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBankKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsBillDetailsCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure edProjectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spProjectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edRefDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridBillDetailsDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    _currObjCode,_currObjAccCode,_currFundCode:string;

    _currFAmount :currency;

    _isRecive : boolean;
    
    FcurrPay: currency;
    FcurrAmount: currency;
    FcurrDonatorName: string;
    FcurrFndAccCode: string;
    FcurrBankCode: string;
    FcurrFndAccNo: string;
    FcurrFndAccName: string;
    FcurrDonatorCode: string;
    FcurrPeroidNo: integer;
    FcurrUserID: string;
    FcurrRecivedDonatorCode: string;
    FIsProject: boolean;
    FProjectCode: string;
    FBranchCode: string;
    { Private declarations }
    //procedure initDataset;
    procedure initForm;
    procedure initPayType;
    function getObjtiveDesc(objcode:string):string;
    function getFundDesc(fundcode:string):string;
    function getCurrDonations(cds:Tclientdataset;doid: string): currency;
    procedure setCurrDonations(doid: string;newDonations:currency);
    function processIsNextLevelRoyal(doid: string; donations: currency):boolean;
    function processIsNextLevelFavor(doid: string; donations: currency):boolean;
    procedure clearFrontDataset;
    procedure appMessage(var Msg: Tmsg; var Handled: boolean);
    procedure searchObjectiveCode(_code:string);
    procedure searchFundCode(_code:string);
    function IsExistsBillNo(_billno:integer):boolean;
    function IsValidDate(dt:string):boolean;

    procedure SetcurrAmount(const Value: currency);
    procedure SetcurrPay(const Value: currency);
    procedure SetcurrBankCode(const Value: string);
    procedure SetcurrDonatorCode(const Value: string);
    procedure SetcurrDonatorName(const Value: string);
    procedure SetcurrFndAccCode(const Value: string);
    procedure SetcurrFndAccName(const Value: string);
    procedure SetcurrFndAccNo(const Value: string);
    procedure SetcurrPeroidNo(const Value: integer);
    procedure SetcurrUserID(const Value: string);
    procedure SetcurrRecivedDonatorCode(const Value: string);
    procedure SetIsProject(const Value: boolean);
    procedure SetProjectCode(const Value: string);
    procedure PostMasterReceive(bdno:string);
    procedure SetBranchCode(const Value: string);
  public
    { Public declarations }
    procedure ExecSQL(strSQL: string);
    property currAmount : currency  read FcurrAmount write SetcurrAmount;
    property currPay :currency  read FcurrPay write SetcurrPay;
    property currDonatorCode :string  read FcurrDonatorCode write SetcurrDonatorCode;
    property currDonatorName :string read FcurrDonatorName write SetcurrDonatorName;
    property currBankCode :string read FcurrBankCode write SetcurrBankCode;
    property currFndAccCode :string read FcurrFndAccCode write SetcurrFndAccCode;
    property currFndAccName :string read FcurrFndAccName write SetcurrFndAccName;
    property currFndAccNo :string read FcurrFndAccNo write SetcurrFndAccNo;
    property currPeroidNo : integer read FcurrPeroidNo write SetcurrPeroidNo;
    property currUserID : string read FcurrUserID write SetcurrUserID;
    property currRecivedDonatorCode : string read FcurrRecivedDonatorCode write SetcurrRecivedDonatorCode;
    property IsProject : boolean read FIsProject write SetIsProject;
    property ProjectCode : string read FProjectCode write SetProjectCode;
    property BranchCode : string read FBranchCode write SetBranchCode;


  end;

var
  frmReceive: TfrmReceive;

implementation

uses DonatorProfileFrm, SelectBankFrm, ObjectiveFrm,
  FundInfoFrm, FundListFrm, EditItemFrm, SelectAccCodeFrm, CommonUtils,
  BillingInfoFrm, ConfirmBillNoFrm, SearchFrm, SearchProjectFrm,
  SelectBookBankFrm;

{$R *.dfm}


procedure TfrmReceive.appMessage(var Msg: Tmsg; var Handled: boolean);
begin
       if Msg.message = WM_KEYDOWN then
            if Msg.wparam = 9 then
        if GetKeyState(VK_SHIFT) >= 0 then
                    SelectNext(FindControl(Msg.hwnd),true,true)     {tab}
                else
         SelectNext(FindControl(Msg.hwnd),false,true);      {back tab}
end;

(*
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
*)

procedure TfrmReceive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmReceive.btnSearchClick(Sender: TObject);
var frm : TfrmDonatorProfile;
begin
   frm := TfrmDonatorProfile.Create(self);
   frm.MainForm:=self;

   if currDonatorCode<>'' then
   frm.donatorID := currDonatorCode;
   
   frm.ShowModal;
   if trim(frm.donatorID)<>'' then
   begin
     currDonatorCode := frm.donatorID;
     currDonatorName := frm.donatorName;

     edAmount.SetFocus;
     edAmount.SelectAll;
   end;
end;

procedure TfrmReceive.FormCreate(Sender: TObject);
begin
//currAmount:=0;
//_currFAmount:=0;
//currPay:=0;

SetChildTaborders(pnClientContainer);
initDataset(self,conn);
end;

procedure TfrmReceive.SetcurrAmount(const Value: currency);
begin
  FcurrAmount := Value;
  edAmount.Value:=value;
  lbAmount.Caption:='ยอดตั้งบริจาค '+FormatCurr('#,##0.00',value)+' บาท';

  if value <= currPay  then
  begin
    edObjtiveName.Enabled:=false;
    edObjtiveCode.Enabled:=false;
    edFundName.Enabled:=false;
    edFundCode.Enabled:=false;
  end else
  begin
    edObjtiveName.Enabled:=true;
    edObjtiveCode.Enabled:=true;
    edFundName.Enabled:=true;
    edFundCode.Enabled:=true;
  end;  

end;

procedure TfrmReceive.SetcurrPay(const Value: currency);
begin
  FcurrPay := Value;
  lbPay.Caption:='ยอดบริจาค '+FormatCurr('#,##0.00',value)+' บาท';


  if value >= currAmount  then
  begin
    edObjtiveName.Enabled:=false;
    edObjtiveCode.Enabled:=false;
    edFundName.Enabled:=false;
    edFundCode.Enabled:=false;
  end else
  begin
    edObjtiveName.Enabled:=true;
    edObjtiveCode.Enabled:=true;
    edFundName.Enabled:=true;
    edFundCode.Enabled:=true;
  end;
  
    
end;

procedure TfrmReceive.SetcurrBankCode(const Value: string);
begin
  FcurrBankCode := Value;
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

procedure TfrmReceive.SetcurrFndAccCode(const Value: string);
begin
  FcurrFndAccCode := Value;
end;

procedure TfrmReceive.SetcurrFndAccName(const Value: string);
begin
  FcurrFndAccName := Value;
end;

procedure TfrmReceive.SetcurrFndAccNo(const Value: string);
begin
  FcurrFndAccNo := Value;
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

procedure TfrmReceive.cmbPayTypeChange(Sender: TObject);
begin
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='22' then
 begin
    edBank.Enabled:=false;
    btnSelectBank.Enabled:=false;
    edBankName.Enabled:=false;
    edBankBranch.Enabled:=false;
//    edRecDate.Enabled:=false;
    edRefCode.Enabled:=false;
     edRefDate.Enabled:=false;
    edRefDate.Enabled:=false;
   // edRecDesc.Enabled:=false;
 end else
 if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='24' then
 begin
    edBank.Enabled:=false;
    btnSelectBank.Enabled:=false;
    edBankName.Enabled:=false;
    edBankBranch.Enabled:=false;
//    edRecDate.Enabled:=false;
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
//    edRecDate.Enabled:=false;
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
//    edRecDate.Enabled:=true;
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
//    edRecDate.Enabled:=true;
    edRefCode.Enabled:=true;
    edRefDate.Enabled:=false;
    edRecDesc.Enabled:=true;
 end;

end;

procedure TfrmReceive.cmbPayTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var fSelectBookBank:TfrmSelectBookBank;
    BookBankID : string;
begin
  if key=vk_return then
  begin

     if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='50' then
     begin


       fSelectBookBank := TfrmSelectBookBank.Create(self);
       fSelectBookBank.MainForm := self;
       fSelectBookBank.ShowModal;

       if fSelectBookBank.IsOK then
       begin
        if fSelectBookBank.SelectBookID<>'' then
        begin
          with cdsTemp do
          begin
            close;
            commandtext:=''+
            ' select b.BankID,b.BankCode,b.BankName,c.BankBrchName,a.BookNo '+
            ' from san$BANKBOOK a '+
            ' left join san$BANK b on  a.BankID=b.BankID '+
            ' left join san$BANKBRCH c on a.BankBrchId=c.BankBrchId '+
            ' where a.BankBookID='''+fSelectBookBank.SelectBookID+'''';
            open;

            if cdsTemp.recordcount>0 then
              begin
                edBank.Text     := cdsTemp.fieldbyname('BankCode').AsString;
                edBankBranch.Text := cdsTemp.fieldbyname('BankBrchName').AsString;
                edRefCode.Text  := cdsTemp.fieldbyname('BookNo').AsString;

                btnSelectBankClick(sender);
              end;
          end;
        end;
       end;


     end else
     
     if  trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str)='22' then
       SelectNext(Sender as TWinControl,true,True)
  //      if edObjtiveCode.Enabled then
   //     edObjtiveCode.SetFocus
     else
      SelectNext(Sender as TWinControl,true,True);
  end;

end;


procedure TfrmReceive.initForm;
begin
  initPayType;

  dtRecDate.Date:=getServerDate(cdsTemp);

  // first time get period no
  FcurrPeroidNo:=getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1');
  lbUserName.Caption:=getUserFullName(cdsTemp,currUserID);
  lbDonationPoint.Caption:=getDonationsPointName(cdsTemp,BranchCode);

  lbPeroidNo.Caption:=FormatCurr('00000', FcurrPeroidNo);

  //
  currAmount:=0;
  currPay:=0;
  IsProject:=false;

end;

procedure TfrmReceive.initPayType;
begin
  with cdsTemp do
  begin
    close;
    CommandText:='select pt_code,pt_title from paytype where pt_status<>''C'' order by pt_code';
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

procedure TfrmReceive.FormShow(Sender: TObject);
begin
  _isRecive:=true;
  initForm;
end;

procedure TfrmReceive.btnSelectBankClick(Sender: TObject);
var frm:TfrmSelectBank;
begin
  with cdsBankCode do
  begin


    close;
    //CommandText:='select * from bank_code where bk_code ='''+trim(edBank.Text)+'''';
    CommandText:='select Bankid,bankcode,bankname from san$BANK where  bankcode='''+UpperCase(trim(edBank.Text))+''' and  bankid not in (''1011'',''1014'')';
    open;
    if recordcount>0 then
    begin
      first;
     // currBankCode:=fieldbyname('bk_code').AsString;
      currBankCode:=fieldbyname('bankcode').AsString;
      edBank.Text:=currBankCode;
     // edBankName.Text:=fieldbyname('bk_title').AsString;
      edBankName.Text:=fieldbyname('bankname').AsString;

      edBankBranch.SetFocus;
      edBankBranch.SelectAll;

    end else
      begin
      close;
//      CommandText:='select * from bank_code where bk_code like '''+trim(edBank.Text)+'%''';
        CommandText:='select Bankid,bankcode,bankname from san$BANK where  bankcode like '''+UpperCase(trim(edBank.Text))+'%'' and  bankid not in (''1011'',''1014'')';

      open;

      if cdsBankCode.Active then
        if cdsBankCode.RecordCount>0 then
        begin
          frm := TfrmSelectBank.Create(self);
          frm.MainForm:=self;
          frm.ShowModal;

          if frm.IsOK then
          begin
            if trim(frm.bankCode)<>'' then
            begin
             edBank.Text:=frm.bankCode;
             currBankCode:=frm.bankCode;
             edBankName.Text:=frm.bankName;
            end;

            edBankBranch.SetFocus;
            edBankBranch.SelectAll;
          end else
          begin
            edBank.SetFocus;
            edBank.SelectAll;
          end;
          frm.Free;
        end;
    end;
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

procedure TfrmReceive.edRefDate1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmReceive.edObjtiveCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then searchObjectiveCode(edObjtiveCode.Text);
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
  CommandText:='select o_title,o_desc1,o_desc2 from object_code where o_code='''+objcode+'''';
  open;

  if Active then
    if RecordCount>0 then
    begin
       rep:= trim(fieldbyname('o_desc1').asstring)+trim(fieldbyname('o_desc2').asstring);
       //rep:= fieldbyname('o_title').asstring;
    end;
 end;

 result:=rep;

end;

procedure TfrmReceive.edFundCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    searchFundCode(edFundCode.Text);
end;

procedure TfrmReceive.btnAddObjectiveClick(Sender: TObject);
var
 frmAddObj : TfrmObjective;
// frmAddObjA : TfrmOvjectiveA;
  item:integer;
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

        if cdsBillDetails.RecordCount>=4 then
        begin
          Application.MessageBox(pchar('ไม่สามารถเพิ่มรายการมากกว่า 4 รายการได้'),pchar('Warning'),MB_OK or MB_ICONWARNING);
          exit;
        end;


        if (_currFAmount+currPay)>currAmount then
          if MessageDlg('ยืนยันบริจาคเกินจำนวนที่ตั้งไว้',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit
          else currAmount:=_currFAmount+currPay;


        item := cdsBillDetails.RecordCount+1;

        Screen.Cursor := crHourGlass;
        
        cdsBillDetails.Append;
        cdsBillDetailsbdno.AsString:='0001';
        cdsBillDetailsitem.AsInteger:= item;
        cdsBillDetailsbdobject.AsString:=_currObjCode;
        cdsBillDetailsbdfound.AsString:=_currFundCode;
        cdsBillDetailsbdamount.AsCurrency := _currFAmount;
        cdsBillDetailsbdbankbook.AsString:=getBookBankID(cdsTemp3,_currObjCode);

        cdsBillDetailsbdflag.AsString:='N';
        cdsBillDetailsbdacccode.AsString:=_currObjAccCode;
        cdsBillDetails.Post;

        Screen.Cursor := crDefault;

        {clear current obj , fund }
        if not IsProject then
        begin
          _currFundCode:='';
          edFundCode.Text:='';
          edFundName.Text:='';
          _currObjCode :='';
          edObjtiveName.Text:='';
          edObjtiveCode.Text:='';
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

  end else

   with  cdsObjective do
   begin
      close;
      CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa order by roworder';
      open;

      if ( currAmount > currPay ) then
      begin
        if recordcount>0 then
        begin
          frmAddObj:=TfrmObjective.Create(self);
          frmAddObj.MainForm:=self;
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
      end else
      if currPay=currAmount then btnSaveClick(sender);
   end;



end;

procedure TfrmReceive.edFAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_return then
    btnAddObjectiveClick(sender);
end;

procedure TfrmReceive.btnClearClick(Sender: TObject);
begin
  if cdsBillDetails.RecordCount>0 then
  begin
    cdsBillDetails.Last;
    cdsBillDetails.Delete
  end;

  edFAmount.SetFocus;
  edFAmount.SelectAll;
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
    frm.MainForm:=Self;
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
        MessageDlg('ยอดเงินสุงกว่ายอดตั้งบริจาค ไม่สามารถ แก้ไข จำนวนเงินได้',mtWarning,[mbOK],0);
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
        frm.MainForm := self;
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

procedure TfrmReceive.setCurrDonations(doid: string;newDonations:currency);
var sql:string;
begin
  sql:='update  donator set do_gtotal='+FormatCurr('0.00',newDonations)+' from donator where do_id='''+doid+'''';
  ExecSQL(sql);
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


procedure TfrmReceive.btnSaveClick(Sender: TObject);
var BillNO,i,k:integer;
    recStamp:TRecStamp;
    currDonations,newDonations : currency;
    billAmount : currency;
    frmConfirm : TfrmConfirmBillNo;
    strSQL,ReportFile,strBillNo:string;
begin
  try
    // renew period no every time

    if not _isRecive then exit;

    _isRecive := false;

    FcurrPeroidNo:=getPeroidNo(cdsTemp,'PEROID1','PRD01','MTTNM1');
    lbPeroidNo.Caption:=FormatCurr('00000', FcurrPeroidNo);

    billAmount:=0;
    currDonations := getCurrDonations(cdsTemp,currDonatorCode);

    
//    if MessageDlg('ยืนยันการบันทึกรับบริจาค',mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;



    if cdsBillDetails.Active then
      if cdsBillDetails.RecordCount<=0 then
      begin
        Application.MessageBox(pchar('ไม่สามรถทำการบันทึกได้ เนื่องจากยังไม่มีรายการ'),pchar('Information'),MB_OK or  MB_ICONINFORMATION);
        _isRecive:=true;
        exit;
      end;

    if currPay< currAmount then
    begin
        Application.MessageBox(pchar('ยังทำรายการบริจาคไม่ครบตามจำนวน ไม่สามารถบันทึกได้'),pchar('Warning'),MB_OK or MB_ICONWARNING);
        _isRecive:=true;
        exit;
    end;


    if ckKeyBillNo.Checked then
    begin
      strBillNo := InputBox('กำหนดเลขที่ใบเสร็จเอง','กรุณากรอกเลขที่ใบเสร็จ','');
      if IsInteger(strBillNo) then BillNO:=strtoint(strBillNo)
      else
      begin
        Application.MessageBox(pchar('เลขที่ใบเสร็จไม่ถูกต้อง กรุณา บันทึกใหม่'),pchar('Warning'),MB_OK or MB_ICONWARNING);
        _isRecive:=true;
        exit;
      end;
    end
      //BillNO := strtoint(InputBox('กำหนดเลขที่ใบเสร็จเอง','กรุณากรอกเลขที่ใบเสร็จ',''))
    else
      BillNO:=getBillNo(cdsTemp,'FRONT1','FRONT','00','MTTNM1');

    if IsExistsBillNo(BillNO) then
    begin
        Application.MessageBox(pchar('พบเลขที่ใบเสร้จนี้ในระบบ ไม่สามารถบันทึกได้ กรุณาทำรายการใหม่'),pchar('Warning'),MB_OK or MB_ICONWARNING);
        _isRecive:=true;
        exit;
    end;

    if edRefDate.Enabled then
    if edRefDate.Text<>'' then
    if not IsValidDate(edRefDate.Text) then
    begin
        Application.MessageBox(pchar('วันที่อ้างอิง ไม่ถูกต้อง กรุณาทำรายการใหม่'),pchar('Warning'),MB_OK or MB_ICONWARNING);
        if edRefDate.Enabled then
          edRefDate.SetFocus;
        _isRecive:=true;
        exit;
    end;

    frmConfirm := TfrmConfirmBillNo.Create(self);
    frmConfirm.BillNO :=inttostr(BillNO);
    frmConfirm.ShowModal;
    if not frmConfirm.IsOK then exit;


      with cdsBillw do
      begin
        // header
        Close;
        CommandText:='select top 1 * from bill';
        Open;
        EmptyDataSet;


        Append;
        FieldByName('bstatus').AsString:='A';
        FieldByName('bid').AsString:=currDonatorCode;
        FieldByName('bno').AsInteger:=BillNO;
        FieldByName('bperiod').AsString:=FormatCurr('00000', FcurrPeroidNo);

        FieldByName('bbank').AsString:=edBank.Text;
        FieldByName('bbankname').AsString:=edBankName.Text;
        FieldByName('bbrance').AsString:=edBankBranch.Text;
        FieldByName('brefno').AsString:=edRefCode.text;


        if isDate(edRefDate.Text) then
        FieldByName('brefdate').AsString:=edRefDate.Text;

        FieldByName('bdate').AsDateTime:=dtRecDate.Date;

        FieldByName('receivedate').AsDateTime:=getServerDate(cdsTemp);

        if IsProject then
          FieldByName('bproject').AsString:=ProjectCode;
        FieldByName('bremark').AsString:=edRecDesc.Text;


        FieldByName('btotal').AsCurrency:=currPay;
        billAmount:=currPay;
        FieldByName('bpaytype').AsString:=trim(TString(cmbPayType.Items.Objects[cmbPayType.ItemIndex]).Str);
        FieldByName('buserid').AsString:=FcurrUserID;
        post;

        if cdsBillDetails.Active then
          if cdsBillDetails.RecordCount<=0 then
          begin
            Application.MessageBox(pchar('ไม่สามรถทำการบันทึกได้ เนื่องจากยังไม่มีรายการ'),pchar('Warning'),MB_OK or MB_ICONWARNING);
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
              if not ckKeyBillNo.Checked then
              setBillNo(cdsTemp,'FRONT1','FRONT','00','MTTNM1');
              newDonations:=currDonations+billAmount;
              setCurrDonations(currDonatorCode,newDonations);   // accummulate donations

              currRecivedDonatorCode := currDonatorCode;

              // POST Master Receive
              PostMasterReceive(inttostr(BillNO));              

              cdsBillReport.Close;

              strSQL:=''+

              ' declare @bno varchar(7) '+
              ' set @bno='''+inttostr(BillNO)+''' '+
              ' select  top 4 a.*,b.*,c.*,h.* '+
              ' ,d.pt_title '+
              ' ,e.* '+
              ' ,f.fd_title '+
              ' from bill  a '+
              ' left join ( '+
              ' select * from billdetail where bdno=@bno '+
              ' union select @bno as bdno,10 as item,'''' as dbobject,'''' as bdfound , 0 as dbaount ,'''','''','''','''','''' '+
              ' union select @bno as bdno,11 as item,'''' as dbobject,'''' as bdfound , 0 as dbaount ,'''','''','''','''','''' '+
              ' union select @bno as bdno,12 as item,'''' as dbobject,'''' as bdfound , 0 as dbaount ,'''','''','''','''','''' '+
              ' union select @bno as bdno,13 as item,'''' as dbobject,'''' as bdfound , 0 as dbaount ,'''','''','''','''','''' '+
              ' ) b  on a.bno=b.bdno '+
              ' left join donator c on a.bid=c.do_id '+
              ' left join paytype d on a.bpaytype=d.pt_code '+
              ' left join object_code e on b.bdobject=e.o_code '+
              ' left join found_code f on b.bdfound=f.fd_code '+
              ' left join bill g on a.bno=g.bno and g.bno=@bno '+
              ' left join projects h on g.bproject=h.PjCode '+

              ' where a.bno=@bno '+
              ' order by b.item ';


              (*
              strSQL:=''+
              ' declare @bno varchar(7)  '+
              ' set @bno='''+inttostr(BillNO)+'''  '+
              ' select  top 4 a.*,b.*,c.*,h.*    '+
              ' ,d.pt_title  '+
              ' ,e.o_title  '+
              ' ,f.fd_title  '+
              ' from bill  a  '+
              ' left join (  '+
              ' 	select * from billdetail where bdno=@bno  '+
              ' 	union select @bno as bdno,10 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
              ' 	union select @bno as bdno,11 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
              ' 	union select @bno as bdno,12 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
              ' 	union select @bno as bdno,13 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
              ' ) b  on a.bno=b.bdno  '+
              ' left join donator c on a.bid=c.do_id  '+
              ' left join paytype d on a.bpaytype=d.pt_code  '+
              ' left join object_code e on b.bdobject=e.o_code  '+
              ' left join found_code f on b.bdfound=f.fd_code  '+
              ' left join bill g on a.bno=g.bno and b.bno=@bno  '+
              ' left join projects h on g.bproject=h.PjCode  '+

              ' where bno=@bno  '+
              ' order by b.item ';

              *)


              //InputBox('','',strSQL);
              cdsBillReport.CommandText :=strSQL;
              cdsBillReport.Open;
              if cdsBillReport.Active then
              begin
                ReportFile:=ExtractFilePath(Application.ExeName) + 'Reports\bill2.fr3';


                if not FileExists(ReportFile) then
                  begin
                    Application.MessageBox(pchar('หาไฟล์ Report ไม่เจอ :' + ReportFile),pchar('Warning'),MB_OK or MB_ICONWARNING);
                  end
                else begin
                  frxReport.LoadFromFile(ReportFile);
                  if Application.MessageBox(pchar('ทำการบันทึกเรียบร้อย'+#10#13+'[ Yes ] - พิมพ์ ใบเสร็จทันที '+#10#13+'[ No ] - แสดงก่อนพิมพ์'),pchar('Confirm'),MB_YESNO or MB_ICONINFORMATION) = mrYes then
                  begin
                    frxReport.PrepareReport;
                    frxReport.PrintOptions.ShowDialog := False;
                    frxReport.Print;
                  end
                  else
                  begin
                    //frxReport.DesignReport;
                    frxReport.ShowReport();
                  end;

                end;
              end;

              // process royal
              processIsNextLevelRoyal(currDonatorCode,newDonations);
              processIsNextLevelFavor(currDonatorCode,newDonations);

              clearFrontDataset;


              // royal process


            end;

      end;


      edDonatorName.SetFocus;

      _isRecive:=true;
      cmbPayType.ItemIndex:=0;
      cmbPayTypeChange(Sender);
  except
    on ee:exception do
    begin
      _isRecive:=true;
      Application.MessageBox(pchar(ee.Message),pchar('Error'),MB_OK);
    end;
  end;
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
        if (Application.MessageBox(pchar('คุณต้องการขอเครื่องราช ชั้นที่ '+inttostr(currRoyalLevel-1)+' หรือไม่'),pchar('Confirm'),MB_YESNO or MB_ICONWARNING)=mrYes) then
          ShowInsigniaRegister(Application,nil,swModal,doid);
      end;



      result := donations>=nextRoyalCurrency;
    end else
     result :=false;

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
//  edRecDate.Text:='';
  edRefCode.Text:='';
  edRefDate.Text:='';
  edBankName.Text:='';

  if not IsProject then
    edRecDesc.Text:='';

  cdsDonator.Close;    



  if IsProject then edProject.SetFocus else edDonatorName.SetFocus;

end;

procedure TfrmReceive.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  frm : TfrmDonatorProfile;
begin
  case key of
    vk_f3:
      begin
        if cdsBillDetails.RecordCount<=0 then
          IsProject := not IsProject;
      end;
    vk_f4:
      begin
        btnSaveClick(sender);
      end;
    vk_f6:
      begin
        if trim(FcurrDonatorCode)='' then
          btnSearchClick(sender)
        else if (currAmount = 0 ) then edAmount.SetFocus
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
       frm.MainForm := self;
       //frm.donatorID := currRecivedDonatorCode;
       if currDonatorCode<>'' then
       frm.donatorID := currDonatorCode;

      //ShowMessage(frm.donatorID);

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
    vk_f11 :
      begin
        ShowMessage('Design Report');
        frxReport.DesignReport;
      end;

  end;

//  if ((ssCtrl in Shift) AND (Key = vk_f7)) then btnClearClick(sender);

end;

procedure TfrmReceive.cdsBillDetailsAfterDelete(DataSet: TDataSet);
begin
  edFAmount.Text:= FormatCurr('#0',currAmount-currPay);
end;

procedure TfrmReceive.cdsBillDetailsAfterPost(DataSet: TDataSet);
begin
  currPay:=currPay+DataSet.fieldbyname('bdamount').AsCurrency;
  //spNormal.Enabled:=not (cdsBillDetails.RecordCount>0);
  //spProject.Enabled:= not (cdsBillDetails.RecordCount>0);
end;

procedure TfrmReceive.cdsBillDetailsBeforeDelete(DataSet: TDataSet);
begin
  currPay:=currPay-DataSet.fieldbyname('bdamount').AsCurrency;
end;

procedure TfrmReceive.cdsBillDetailsBeforeEdit(DataSet: TDataSet);
begin
 currPay:=currPay-DataSet.fieldbyname('bdamount').AsCurrency;
end;

procedure TfrmReceive.cdsDonatorHistoryHdrAfterScroll(DataSet: TDataSet);
begin
{          with cdsDonatorHistoryDtl do
          begin
            close;
            CommandText:='select * from billdetail where bdno='''+cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            open;
          end;
          }
end;

function TfrmReceive.processIsNextLevelFavor(doid: string;
  donations: currency): boolean;
var
  currFavorLevel:integer;
  nextFavorCurrency:currency;
begin
  //
  currFavorLevel:=0;
  //currRoyalCurrency:=0;
  nextFavorCurrency:=0;

  with cdsRoyal do
  begin
    close;
    CommandText:='select MIN(spcode) as spcode from support where spid ='''+doid+'''';
    open;
    if recordcount>0 then
      if not fieldbyname('spcode').IsNull then
      begin
         currFavorLevel:=fieldbyname('spcode').AsInteger;
      end else
      begin    // never request royal assign max level of royal
          close;
          CommandText:='select top 1 *  from sp_code where sp_amount<='+FormatCurr('0.00',donations);
          open;

          if recordcount>0 then
            if not fieldbyname('sp_level').IsNull then
            begin
              currFavorLevel:=fieldbyname('sp_level').AsInteger+1;
            end;
      end;

    if currFavorLevel>0 then
    begin
      close;
      CommandText:='select * from sp_code where sp_level='''+inttostr(currFavorLevel-1)+'''';
      open;
      if recordcount>0 then
      begin
        nextFavorCurrency:=fieldbyname('sp_amount').AsCurrency;
      end;

      if donations>=nextFavorCurrency then
      begin
        if (Application.MessageBox(pchar('คุณต้องการขอบัตรอุปการะคุณ ชั้นที่ '+inttostr(currFavorLevel-1)+' หรือไม่'),pchar('Confirm'),MB_OK or MB_ICONINFORMATION)=mrYes) then
          ShowFavorRegister(Application,nil,swModal,doid);
      end;



      result := donations>=currFavorLevel;
    end else
     result :=false;

  end;
end;

procedure TfrmReceive.SetcurrPeroidNo(const Value: integer);
begin
  FcurrPeroidNo := Value;
end;

procedure TfrmReceive.SetcurrUserID(const Value: string);
begin
  FcurrUserID := Value;
end;

procedure TfrmReceive.btnBillingInfoClick(Sender: TObject);
var
  frm : TfrmBillingInfo;
begin
  frm := TfrmBillingInfo.Create(self);
  frm.MainForm := self;
  frm.PeriodNo := FormatCurr('00000', FcurrPeroidNo);
  frm.ShowModal;
  frm.Free;
end;

procedure TfrmReceive.SetcurrRecivedDonatorCode(const Value: string);
begin
  FcurrRecivedDonatorCode := Value;
end;

procedure TfrmReceive.edDonatorNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var frmDSearch: TfrmSearch;
  _donatorID,_donatorName,_donatorLName,_donatorPreName: string;
begin
 if key=vk_return then
 begin
   if trim(edDonatorName.Text)<>'' then
   begin
        with cdsSearch do
        begin
          close;
          CommandText:='select do_id,do_prename,do_name,do_lname from donator where do_name like '''+trim(edDonatorName.Text)+'%''  or  do_lname like '''+trim(edDonatorName.Text)+'%'' or do_id like  '''+trim(edDonatorName.Text)+'%''  order by do_name,do_lname ';
                    
          Screen.Cursor:=crHourGlass;
          open;
          Screen.Cursor:=crDefault;


          if recordcount>0 then
           begin
            frmDSearch:=TfrmSearch.Create(self);
            frmDSearch.MainForm:=self;
            frmDSearch.ShowModal;

              if trim(frmDSearch.donatorID)<>'' then
              begin


                _donatorID := frmDSearch.donatorID;
                _donatorName := frmDSearch.donatorName;
                _donatorLName := frmDSearch.donatorLName;
                _donatorPreName:= frmDSearch.donatorPreName;

                with cdsDonator do
                begin
                  close;
                  CommandText:='select * from donator where do_id='''+_donatorID+'''';
                  open;
                end;

              end;


             if frmDSearch.IsOK then
             begin
               currDonatorCode := _donatorID;
               currDonatorName := trim(_donatorPreName)+' '+trim(_donatorName)+' '+ trim(_donatorLName);
               edAmount.SetFocus;
               edAmount.SelectAll;
             end;
           frmDSearch.Free;

           end else
           begin
            Application.MessageBox(pchar('ไม่พบรายชื่อผู้บริจาค!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
           end;
       end;


   end;
 end;
end;

procedure TfrmReceive.edBankKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then btnSelectBankClick(sender);
end;

procedure TfrmReceive.cdsBillDetailsCalcFields(DataSet: TDataSet);
begin
   DataSet.FieldByName('bdobjectdesc').AsString:=trim(DataSet.FieldByName('bdobject').AsString)+' - '+getObjtiveDesc(DataSet.FieldByName('bdobject').AsString);
   DataSet.FieldByName('bdfounddesc').AsString:=trim(DataSet.FieldByName('bdfound').AsString)+' - '+getFundDesc(DataSet.FieldByName('bdfound').AsString);
end;

procedure TfrmReceive.SetIsProject(const Value: boolean);
begin
  FIsProject := Value;

  lbProject.Visible := value;
  edProject.Visible := value;

  spProject.Down:=Value;
  spNormal.Down:= not value;



  if value then edProject.SetFocus else edDonatorName.SetFocus;



end;

procedure TfrmReceive.BitBtn1Click(Sender: TObject);
var strSQL:string;
begin


strSQL:=''+
' declare @bno varchar(7)  '+
' set @bno=''1021129''  '+
' select  top 4 a.*,b.*,c.*    '+
' ,d.pt_title  '+
' ,e.o_title  '+
' ,f.fd_title  '+
' from bill  a  '+
' left join (  '+
' 	select * from billdetail where bdno=@bno  '+
' 	union select @bno as bdno,10 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
' 	union select @bno as bdno,11 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
' 	union select @bno as bdno,12 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
' 	union select @bno as bdno,13 as item,'' '' as dbobject,'' '' as bdfound , 0 as dbaount ,'' '','' '','' '','' '','' ''  '+
' ) b  on a.bno=b.bdno  '+
' left join donator c on a.bid=c.do_id  '+
' left join paytype d on a.bpaytype=d.pt_code  '+
' left join object_code e on b.bdobject=e.o_code  '+
' left join found_code f on b.bdfound=f.fd_code  '+
' where bno=@bno  '+
' order by b.item ';


              cdsBillReport.Close;
              cdsBillReport.CommandText:=strSQL;
              cdsBillReport.Open;
              if cdsBillReport.Active then
                frxReport1.ShowReport();

end;

procedure TfrmReceive.edProjectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  frm : TfrmSearchProject;
begin
  if key=vk_return then
  begin

    with cdsTemp do
    begin
      close;
      CommandText:='select * from projects where PjStatus=''A''';
      open;

      if cdsTemp.Active then
        if cdsTemp.RecordCount>0 then
        begin
          frm := TfrmSearchProject.Create(self);
          frm.MainForm := self;
          frm.ShowModal;
          ProjectCode := frm.SelectProjectCode;
          edProject.Text := frm.SelectProjectName ;
          frm.Free;
        end;

      cdsTemp2.close;
      cdsTemp2.CommandText:='select * from projects where PjStatus=''A'' and PjCode= '''+trim(ProjectCode)+'''';
      //inputbox('','',CommandText);
      cdsTemp2.open;

      if cdsTemp2.Active then
        if cdsTemp2.RecordCount>0 then
         begin
          edObjtiveCode.Text:=cdsTemp2.fieldbyname('PjObjectiveCode').asstring;
          edFundCode.Text:=cdsTemp2.fieldbyname('PjFundCode').asstring;
          edRecDesc.Text:=cdsTemp2.fieldbyname('PjDesc').asstring;
          searchObjectiveCode(edObjtiveCode.Text);



          cdsTemp.close;
          cdsTemp.CommandText:='select * from object_code where o_code='''+_currObjCode+'''';
          cdsTemp.open;
          if cdsTemp.Active then
           if cdsTemp.RecordCount>0 then
           begin
            if cdsTemp.fieldbyname('o_flag').AsString='I' then searchFundCode(edFundCode.Text);
           end;
         end;
    end;
  end;

end;

procedure TfrmReceive.SetProjectCode(const Value: string);
begin
  FProjectCode := Value;
end;

procedure TfrmReceive.spProjectClick(Sender: TObject);
begin
  if cdsBillDetails.RecordCount<=0 then
  begin
    if spProject.Down then IsProject := true;
    if spNormal.Down then IsProject := false;
  end;
end;

procedure TfrmReceive.searchObjectiveCode(_code: string);
var
  frmAddObj:TfrmObjective;
  frmFundInf:TfrmFundInfo;
begin
   with  cdsObjective do
   begin
      close;
      CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa where o_code='''+trim(_code)+''' order by roworder';
      open;

      if recordcount>0 then // founc code
      begin

        if trim(fieldbyname('o_code').AsString)<>''  then
        begin
          _currObjCode:=fieldbyname('o_code').AsString;
          _currObjAccCode:=fieldbyname('o_acccode').AsString;

          if uppercase(trim(cdsObjective.FieldByName('o_flag').AsString))='N' then   // new
          begin
              frmFundInf := TfrmFundInfo.Create(self);
              frmFundInf.MainForm:=self;
              frmFundInf.Codetype := cdsObjective.FieldByName('o_codefd').AsString;
              frmFundInf.ObjectiveCode := cdsObjective.FieldByName('o_code').AsString;

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

               if (IsProject) and (currAmount<=0)  then
               begin
                 edAmount.SetFocus;
                 edAmount.SelectAll;
               end else
               begin
                 edFAmount.SetFocus;
                 edFAmount.SelectAll;
               end;
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
        CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa where o_code like'''+trim(_code)+'%'' order by roworder';
        open;


        frmAddObj:=TfrmObjective.Create(self);
        frmAddObj.MainForm := self;
        frmAddObj.ShowModal;

        if (trim(frmAddObj.selectcode)<>'') and (trim(frmAddObj.selectFundCode)<>'') then
        begin
          _currObjCode:=frmAddObj.selectcode;
          _currFundCode:=frmAddObj.selectFundCode;

          if Locate('o_code',_currObjCode,[]) then
          begin
            _currObjCode:=fieldbyname('o_code').AsString;
            _currObjAccCode:=fieldbyname('o_acccode').AsString;
          end;


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

procedure TfrmReceive.searchFundCode(_code: string);
var frmFundL:TfrmFundList;
_currFundCodeTmp:string;
begin
           with cdsFundList do
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
                    cdsFundList.CommandText:='select * from found_code where (fd_codetype = '+cdsFund.fieldbyname('o_codefd').asstring+') and fd_code='''+_code+''' and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
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

                         if (IsProject) and (currAmount<=0)  then
                         begin
                           edAmount.SetFocus;
                           edAmount.SelectAll;
                         end else
                         begin
                           edFAmount.SetFocus;
                           edFAmount.SelectAll;
                         end;
                         
                      end;
                    end
                    else
                    begin
                      //Fselectcode :='';

                      cdsFundList.Close;
                      cdsFundList.CommandText:='select * from found_code where (fd_codetype = '+cdsFund.fieldbyname('o_codefd').asstring+') and fd_code like '''+_code+'%'' and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
                      cdsFundList.Open;

                      frmFundL:=TfrmFundList.Create(self);
                      frmFundL.FundGroupCode := cdsFund.fieldbyname('o_codefd').asstring;
                      frmFundL.MainForm:=self;
                      frmFundL.ShowModal;
                      _currFundCodeTmp := frmFundL.SelectCode;
                      frmFundL.Free;

                      if trim(_currFundCodeTmp)<>'' then
                      begin
                        _currFundCode:=_currFundCodeTmp;
                        edFundCode.text:=_currFundCode;
                        edFundName.Text:=getFundDesc(_currFundCode);

                        edFAmount.Text:= FormatCurr('#0',currAmount-currPay);

                        //edFAmount.SetFocus;
                        //edFAmount.SelectAll;
                         if (IsProject) and (currAmount<=0)  then
                         begin
                           edAmount.SetFocus;
                           edAmount.SelectAll;
                         end else
                         begin
                           edFAmount.SetFocus;
                           edFAmount.SelectAll;
                         end;

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

procedure TfrmReceive.btnCancelClick(Sender: TObject);
begin
  if Application.MessageBox(pchar('ยืนยันยกเลิกรายการที่กำลังทำ เพื่อทำรายการใหม่!'),pchar('Confirm'),MB_OKCANCEL or MB_ICONINFORMATION)=mrOK then
  clearFrontDataset;
end;

procedure TfrmReceive.PostMasterReceive(bdno:string);
var rowcount:integer;
    ReceiveAmount:currency;
    currRcvDno,BatchNo:string;

begin
  rowcount:=0;
  ReceiveAmount:=0;
  cdsTemp3.Close;
  cdsTemp3.CommandText:='' +
' select '+
' a.* , '+
' 	b.* ,'+
' 	c.* '+
' from bill a '+
' left join billdetail b on a.bno=b.bdno '+
' left join object_code c on b.bdobject=c.o_code '+

' where a.bno='''+bdno+'''';
  cdsTemp3.Open;
  if cdsTemp3.Active then
    if cdsTemp3.RecordCount>0 then
      with cdsMaterReceive do
      begin

        if cdsTemp3.Active then
          if cdsTemp3.RecordCount>0 then
          begin

            currRcvDno := FormatCurr('000000', getRunning(cdsTemp,'RCVRUN1','RECEIVE','RCVRUN','MTTNM1'));

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
              cdsMaterReceive.FieldByName('DnoType').AsString:='RC';
              cdsMaterReceive.FieldByName('DocNo').AsString:=cdsTemp3.fieldbyname('bno').AsString;
              cdsMaterReceive.FieldByName('Item').AsInteger:=rowcount;
              cdsMaterReceive.FieldByName('AccCode').AsString:='100001';
              cdsMaterReceive.FieldByName('ObjCode').AsString:=cdsTemp3.fieldbyname('bdobject').AsString;
              cdsMaterReceive.FieldByName('FndCode').AsString:=cdsTemp3.fieldbyname('bdfound').AsString;
              cdsMaterReceive.FieldByName('Description').AsString:=getFundDesc(cdsTemp3.fieldbyname('bdfound').AsString);
              cdsMaterReceive.FieldByName('ReceiveType').AsString:=cdsTemp3.fieldbyname('bpaytype').AsString;
              cdsMaterReceive.FieldByName('Flag').AsString:='C';
              cdsMaterReceive.FieldByName('Amount').AsString:=cdsTemp3.fieldbyname('bdamount').AsString;

              ReceiveAmount:=ReceiveAmount+cdsTemp3.fieldbyname('bdamount').AsCurrency;
              //cdsMaterReceive.FieldByName('BringForward').AsString:='0';
              //cdsMaterReceive.FieldByName('CarryForward').AsString:='0';
              cdsMaterReceive.FieldByName('DocDate').AsDateTime:=cdsTemp3.fieldbyname('bdate').AsDateTime;
              cdsMaterReceive.FieldByName('Period').AsString:=cdsTemp3.fieldbyname('bperiod').AsString;
              cdsMaterReceive.FieldByName('RecStatus').AsString:='A';

              if  cdsTemp3.fieldbyname('o_flag').AsString='A' then
                cdsMaterReceive.FieldByName('AFlag').AsString:='N'
              else
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

procedure TfrmReceive.edRefDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
     SelectNext(Sender as TWinControl,True,True) ;
  end;
end;

function TfrmReceive.IsExistsBillNo(_billno: integer): boolean;
begin
  result:=false;
  cdsCheckBillNo.Close;
  cdsCheckBillNo.CommandText:='select * from bill where bno='''+inttostr(_billno)+'''';
  cdsCheckBillNo.Open;
  if cdsCheckBillNo.Active then
    Result:= cdsCheckBillNo.RecordCount>0;
end;

function TfrmReceive.IsValidDate(dt: string): boolean;
begin
  result:=false;

  cdsCheckBillNo.Close;
  cdsCheckBillNo.CommandText:='select CAST('''+dt+''' AS datetime) AS UsingCast';
  try
    cdsCheckBillNo.Open;
    result := true;
  except
    Result := false;
  end;
end;

procedure TfrmReceive.SetBranchCode(const Value: string);
begin
  FBranchCode := Value;
end;

procedure TfrmReceive.cxGridBillDetailsDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
