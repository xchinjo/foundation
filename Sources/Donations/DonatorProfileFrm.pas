unit DonatorProfileFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCurrencyEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, RzPanel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, RzButton, Mask, RzEdit, RzDTP, RzCmboBx, RzDBEdit, DBClient,ReceiveFrm,CommonLIB,
  Buttons;

type
  TShowMode = set of (swSearch,swShowDetail);

  TfrmDonatorProfile = class(TForm)
    pnClientContainer: TPanel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    RzPanel1: TRzPanel;
    btnOK: TRzBitBtn;
    btnNew: TRzBitBtn;
    btnEditProfile: TRzBitBtn;
    btnClose: TRzBitBtn;
    pgDonator: TPageControl;
    tabDonatorInfo: TTabSheet;
    tabDonatorHistory: TTabSheet;
    TabRoyalHistory: TTabSheet;
    TabFavorHistory: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label39: TLabel;
    Label40: TLabel;
    lbDonatorName: TLabel;
    lbDonatorLName: TLabel;
    edSearchName: TRzEdit;
    edSearchLName: TRzEdit;
    TabSheet6: TTabSheet;
    cdsSearch: TDataSource;
    ClientDataSet1: TClientDataSet;
    dsDonator: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGridBillDetails: TcxGrid;
    cxGridBillDetailsDBTableView1: TcxGridDBTableView;
    cxGridBillDetailsLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel6: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    dsDonatorHistoryHdr: TDataSource;
    dsDonatorHistoryDtl: TDataSource;
    cxGridDBTableView1bno: TcxGridDBColumn;
    cxGridDBTableView1bperiod: TcxGridDBColumn;
    cxGridDBTableView1bdate: TcxGridDBColumn;
    cxGridDBTableView1btotal: TcxGridDBColumn;
    cxGridDBTableView1bpaytype: TcxGridDBColumn;
    cxGridDBTableView1bbank: TcxGridDBColumn;
    cxGridDBTableView1bbankname: TcxGridDBColumn;
    cxGridDBTableView1bbrance: TcxGridDBColumn;
    cxGridDBTableView1brefno: TcxGridDBColumn;
    cxGridDBTableView1buserid: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdno: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1item: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdobject: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdfound: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdbankbook: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdacccode: TcxGridDBColumn;
    btnSave: TRzBitBtn;
    pn3: TRzPanel;
    Label29: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit21: TRzDBEdit;
    RzDBEdit22: TRzDBEdit;
    RzDBEdit23: TRzDBEdit;
    RzDBEdit24: TRzDBEdit;
    RzDBEdit25: TRzDBEdit;
    RzDBEdit26: TRzDBEdit;
    RzDBEdit27: TRzDBEdit;
    pn2: TRzPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
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
    pn1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbHead1: TLabel;
    cmbPreName: TRzComboBox;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzMaskEdit1: TRzMaskEdit;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    dsRoyalHistory: TDataSource;
    cxGridDBTableView2ryid: TcxGridDBColumn;
    cxGridDBTableView2ryrdate: TcxGridDBColumn;
    cxGridDBTableView2ryrcode: TcxGridDBColumn;
    cxGridDBTableView2rystatus: TcxGridDBColumn;
    cxGridDBTableView2ry_title: TcxGridDBColumn;
    cxGridDBTableView4spiid: TcxGridDBColumn;
    cxGridDBTableView4spid: TcxGridDBColumn;
    cxGridDBTableView4spdate: TcxGridDBColumn;
    cxGridDBTableView4spcode: TcxGridDBColumn;
    cxGridDBTableView4spininame: TcxGridDBColumn;
    cxGridDBTableView4spname: TcxGridDBColumn;
    cxGridDBTableView4spfname: TcxGridDBColumn;
    cxGridDBTableView4spstatus: TcxGridDBColumn;
    cxGridDBTableView4sp_title: TcxGridDBColumn;
    cxGridDBTableView4do_name: TcxGridDBColumn;
    cxGridDBTableView4do_lname: TcxGridDBColumn;
    btnRepHistory: TRzBitBtn;
    btnSelectProvince: TSpeedButton;
    edProvince: TRzDBEdit;
    edTambon: TRzDBEdit;
    btnSelectTambon: TSpeedButton;
    edAmphur: TRzDBEdit;
    btnSelectAmphur: TSpeedButton;
    edProvince1: TRzDBEdit;
    edTambon1: TRzDBEdit;
    edAmphur1: TRzDBEdit;
    btnSelectProvince2: TSpeedButton;
    btnSelectTambon2: TSpeedButton;
    btnSelectAmphur2: TSpeedButton;
    btnCopy: TRzButton;
    cxGridBillDetailsDBTableView1o_title: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1fd_title: TcxGridDBColumn;
    Label13: TLabel;
    lbTotalBill: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lbAmount: TLabel;
    Label35: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edSearchNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure tabDonatorHistoryShow(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbPreNameChange(Sender: TObject);
    procedure TabRoyalHistoryShow(Sender: TObject);
    procedure TabFavorHistoryShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnRepHistoryClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridBillDetailsDBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView2CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView3CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView4CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView5CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSelectProvinceClick(Sender: TObject);
    procedure btnSelectTambonClick(Sender: TObject);
    procedure btnSelectAmphurClick(Sender: TObject);
    procedure btnSelectProvince2Click(Sender: TObject);
    procedure btnSelectTambon2Click(Sender: TObject);
    procedure btnSelectAmphur2Click(Sender: TObject);
    procedure edTambonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAmphurKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edProvinceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edProvince1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTambon1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAmphur1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCopyClick(Sender: TObject);
  private
    FdonatorID: string;
    FdonatorName: string;
    FshowMode: TShowMode;
    FIsShowInfo: boolean;
    FMainForm: TfrmReceive;

    _selectTambon,_selectAmphur,_selectProvince:string;
    _selectTambon2,_selectAmphur2,_selectProvince2:string;

    procedure SetdonatorID(const Value: string);
    procedure SetdonatorName(const Value: string);
    procedure ShowDonatorProfile(doid:string);
    procedure SetIsShowInfo(const Value: boolean);
    procedure ShowHistory(doid:string);
    procedure ShowRoyalHistory(doid:string);
    procedure ShowDonatorInfo(doid:string);
    procedure ShowFavorHistory(doid:string);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure initPreName();
    procedure initForm();
    procedure getAutoLocation(cds:TClientDataSet;_tamboncode,_amphurcode,_provincecode,_codetype,typecode:string);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property donatorID : string read FdonatorID write SetdonatorID;
    property donatorName : string read FdonatorName write SetdonatorName;
    property IsShowInfo : boolean read FIsShowInfo write SetIsShowInfo;
  end;

var
  frmDonatorProfile: TfrmDonatorProfile;

implementation

uses SearchFrm, CommonUtils, SelectPrivinceFrm, SelectTambonFrm,
  SelectAmphurFrm, SearchLocationFrm;

{$R *.dfm}



procedure TfrmDonatorProfile.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
    if (ssCtrl in Shift) then
    if (Char(Lo(Key)) = 'R') then
    begin
      Key := 0;
      
      if (FMainForm.cdsMiscHeaderDataIS_SYSTEM.Value = 1) then
        FMainForm.cdsMiscHeaderDataIS_SYSTEM.Value := 0
      else
        FMainForm.cdsMiscHeaderDataIS_SYSTEM.Value := 1;

      dbeCODE.Properties.ReadOnly :=
        (FMainForm.cdsMiscHeaderDataIS_SYSTEM.Value <> 0);
      if (dbeCODE.Properties.ReadOnly) then
        dbeCODE.Style.Color := clSilver
      else
        dbeCODE.Style.Color := clWindow;
    end;
    }

  if key=vk_f6 then
  begin
    btnEditProfileClick(sender);
  end;
  if key=vk_f2 then
  begin
    if (Application.MessageBox(pchar('ยืนยันยันทึกรายการ'),pchar('Confirm'),MB_YESNO or MB_ICONINFORMATION)=mrYes) then
    btnSaveClick(sender);
  end;


  if key=vk_f7 then
  begin
    btnNewClick(sender);
  end;




  if (ssCtrl in Shift) then
  begin
    if (Char(Lo(Key)) = 'R') then
    begin
      {if (pnEditorData.Enabled) then
        if (SystemRequired = 1) then
          SystemRequired := 0
        else
          SystemRequired := 1;
       }
      Key := 0;
    end;// else
    //if (Key = VK_DELETE) then
    //  btnDeleteClick(btnDelete);
  end else
  begin
    case Key of
      VK_ESCAPE:
       begin
         btnCloseClick(sender);
       end;
      vk_f5 :
      begin
        btnOKClick(sender);
      end;
      //VK_F3: btnAddNewClick(btnAddNew);
    end;
  end;


//  if (key=VK_ESCAPE) then frmDonatorProfile.Close;
end;

procedure TfrmDonatorProfile.FormShow(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  initPreName;

  FMainForm.cdsDonator.close;
  initForm;
end;



procedure TfrmDonatorProfile.edSearchNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  frmSearch : TfrmSearch;
  _donatorID,_donatorName,_donatorLName,_donatorPreName: string;
  icount,k : integer;

begin
 if key=vk_return then
 begin
  if ( ( trim(edSearchName.Text)<>'') or (trim(edSearchLName.Text)<>'' ) )  then
  with FMainForm.cdsSearch do
    begin
      close;
//      CommandText:='select do_id,do_prename,do_name,do_lname from donator where do_name like '''+edSearchName.Text+'%'' ';
      CommandText:='select do_id,do_prename,do_name,do_lname from donator where do_name like '''+edSearchName.Text+'%'' and  ISNULL(do_lname,'''') like '''+edSearchLName.Text+'%'' order by do_name,do_lname ';
      Screen.Cursor:=crHourGlass;
      open;
      Screen.Cursor:=crDefault;


      if recordcount>0 then
       begin
        frmSearch:=TfrmSearch.Create(self);
        frmSearch.MainForm:=FMainForm;
        frmSearch.ShowModal;

        if not IsShowInfo then
          if trim(frmSearch.donatorID)<>'' then
          begin
            _donatorID := frmSearch.donatorID;
            _donatorName := frmSearch.donatorName;
            _donatorLName := frmSearch.donatorLName;
            _donatorPreName:= frmSearch.donatorPreName;

            with FMainForm.cdsDonator do
            begin
              close;
              CommandText:='select * from donator where do_id='''+_donatorID+'''';
              open;

              if FMainForm.cdsDonator.RecordCount>0 then
              begin
                for icount:=0 to cmbPreName.Items.Count-1 do
                begin
                  if  TString(cmbPreName.Items.Objects[icount]).Str=FMainForm.cdsDonator.FieldByName('do_precde').AsString then
                    cmbPreName.ItemIndex:=icount;
                end;

                btnEditProfile.Enabled:=true;
                self.Caption:='ข้อมูลผู้บริจาค ('+_donatorID+')';



                // fix prename
                for k:= 0 to cmbPreName.Items.Count-1 do
                begin
                  if trim(cmbPreName.Items.Strings[k])=trim(FMainForm.cdsDonator.Fieldbyname('do_prename').AsString) then
                    cmbPreName.ItemIndex:=k;
                end;


              end;

            end;

          end;
        frmSearch.Free;
       end;
   end;

  if trim(_donatorID)<>'' then
  begin
    FdonatorID := _donatorID;
    FdonatorName := trim(_donatorPreName)+' '+trim(_donatorName)+' '+ trim(_donatorLName);
    edSearchName.Text:=_donatorName;
    edSearchLName.Text:=_donatorLName;
    lbDonatorName.Caption:=_donatorName;
    lbDonatorLName.Caption:=_donatorLName;



    edSearchName.SelectAll;
  end;

 end;
end;


procedure TfrmDonatorProfile.SetdonatorID(const Value: string);
begin
  FdonatorID := Value;
end;

procedure TfrmDonatorProfile.SetdonatorName(const Value: string);
begin
  FdonatorName := Value;
end;

procedure TfrmDonatorProfile.ShowDonatorProfile(doid: string);
begin
 if trim(doid)<>'' then
 with FMainForm.cdsDonator do
 begin
    Close;
    CommandText:='select * from donator where do_id='''+doid+'''';
    open;
 end;
end;

procedure TfrmDonatorProfile.btnCloseClick(Sender: TObject);
begin
        donatorID:='';
        close;
end;


procedure TfrmDonatorProfile.SetIsShowInfo(const Value: boolean);
begin
  FIsShowInfo := Value;
end;

procedure TfrmDonatorProfile.btnOKClick(Sender: TObject);
begin
 if FMainForm.cdsDonator.State in [dsInsert,dsEdit] then
 begin
  if MessageDlg('ข้อมูลถูกแก้ไข ยืนยันบันทึกรายการ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    FMainForm.cdsDonator.Post;
    FdonatorName := trim(FMainForm.cdsDonator.fieldbyname('do_prename').AsString)+' '+trim(FMainForm.cdsDonator.fieldbyname('do_name').AsString)+' '+ trim(FMainForm.cdsDonator.fieldbyname('do_lname').AsString);
    FMainForm.cdsDonator.ApplyUpdates(0);

    FdonatorID := FMainForm.cdsDonator.fieldbyname('do_id').AsString;


  end else
  begin
    FMainForm.cdsDonator.Cancel;
  end;
 end;

 close;
end;

procedure TfrmDonatorProfile.tabDonatorHistoryShow(Sender: TObject);
begin
 if trim(donatorID)<>'' then
   ShowHistory(FdonatorID);
end;

procedure TfrmDonatorProfile.ShowHistory(doid: string);
begin
  with FMainForm.cdsDonatorHistoryHdr do
  begin
    close;
    CommandText:='select * from bill where bid='''+doid+''' ';
    open;

    if FMainForm.cdsDonatorHistoryHdr.Active then
      if FMainForm.cdsDonatorHistoryHdr.RecordCount> 0 then
      begin
          with FMainForm.cdsDonatorHistoryDtl do
          begin
            close;
            //CommandText:='select * from billdetail where bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            CommandText:=''+

            '  select a.*,b.o_title,c.fd_title from billdetail a '+
            '  LEFT join object_code b on a.bdobject=b.o_code '+
            '  left join found_code c on a.bdfound=c.fd_code '+
            '  where '+
            '  a.bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+''' ';


            open;
          end;
      end;



      with FMainForm.cdsTemp do
      begin
        FMainForm.cdsTemp.close;
        FMainForm.cdsTemp.CommandText:=''+


        ' select  COUNT(*) allBill,SUM(bdamount) Amt '+
        ' from bill  a '+
        ' left join billdetail b on a.bno=b.bdno '+
        ' where a.bid='''+doid+''' ' ;


        FMainForm.cdsTemp.open;
        if FMainForm.cdsTemp.Active then
          if FMainForm.cdsTemp.RecordCount>0 then
          begin
            lbTotalBill.Caption:=FormatCurr('#,##0',FMainForm.cdsTemp.fieldbyname('allBill').AsCurrency)+' ' ;
            lbAmount.Caption:=FormatCurr('#,##0.00',FMainForm.cdsTemp.fieldbyname('amt').AsCurrency)+' ';
          end;
      end;
      

  end;



end;

procedure TfrmDonatorProfile.btnEditProfileClick(Sender: TObject);
begin
  if not btnEditProfile.Enabled then  exit;

  SetControl(tabDonatorInfo,true);
  tabDonatorInfo.Enabled:=true;
  FMainForm.cdsDonator.Edit;
  cmbPreName.SetFocus;
  btnSave.Enabled:=true;
end;

procedure TfrmDonatorProfile.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmDonatorProfile.ShowDonatorInfo(doid: string);
begin

end;

procedure TfrmDonatorProfile.initPreName;
begin
  with FMainForm.cdsTemp do
  begin
    close;
    CommandText:='select MTTCDE,MTTDES from MTTCDE where MTTGRP=''PRENAME'' order by MTTDES';
    open;

    if FMainForm.cdsTemp.Active then
      if FMainForm.cdsTemp.RecordCount>0 then
        begin
          cmbPreName.Items.Clear;
          FMainForm.cdsTemp.First;
          while not FMainForm.cdsTemp.Eof do
          begin
            cmbPreName.Items.AddObject(FMainForm.cdsTemp.fieldbyname('MTTDES').AsString,TString.Create(FMainForm.cdsTemp.fieldbyname('MTTCDE').AsString));
            FMainForm.cdsTemp.Next;
          end;
          cmbPreName.ItemIndex:=0;
        end;
  end;
end;

procedure TfrmDonatorProfile.btnSaveClick(Sender: TObject);
begin
  SetControl(tabDonatorInfo,false);
  tabDonatorInfo.Enabled:=true;
  if FMainForm.cdsDonator.State in [dsInsert,dsEdit] then
  begin
    FMainForm.cdsDonator.FieldByName('do_prename').AsString:=cmbPreName.Text;
    FMainForm.cdsDonator.FieldByName('do_precde').AsString:=TString(cmbPreName.Items.Objects[cmbPreName.ItemIndex]).Str;

    FMainForm.cdsTemp.Close;
    FMainForm.cdsTemp.CommandText:='select * from donator where do_name='''+trim(FMainForm.cdsDonator.FieldByName('do_name').AsString)+''' and do_lname='''+trim(FMainForm.cdsDonator.FieldByName('do_lname').AsString)+'''';
    FMainForm.cdsTemp.Open;
    if FMainForm.cdsTemp.RecordCount>0 then
    if Application.MessageBox(pchar('พบรายชื่อที่ซ้ำกัน ต้องการยกเลิกบันทึกและดึกรายการที่ซ้ำหรือไม่ ?'),pchar('Warning'),MB_YESNO or MB_ICONWARNING)=mrYes then
    begin
     donatorID := FMainForm.cdsTemp.FieldByName('do_id').AsString;
     FMainForm.cdsDonator.Cancel;
     FMainForm.cdsDonator.close;
     initForm;



    end else
    begin
      FMainForm.cdsDonator.post;
      FMainForm.cdsDonator.ApplyUpdates(0);
      FdonatorID := FMainForm.cdsDonator.fieldbyname('do_id').AsString;
    end;
    btnSave.Enabled:=false;
  end;
end;

procedure TfrmDonatorProfile.cmbPreNameChange(Sender: TObject);
begin
  if (cmbPreName.ItemIndex>=0) then
  if FMainForm.cdsDonator.State in [dsedit,dsinsert] then
  begin
    FMainForm.cdsDonator.FieldByName('do_precde').AsString:=TString(cmbPreName.Items.Objects[cmbPreName.ItemIndex]).str;
  end;
end;

procedure TfrmDonatorProfile.ShowRoyalHistory(doid: string);
begin
  with FMainForm.cdsRoyalHistory do
  begin
    close;
//    CommandText:='';
    open;
  end;
end;

procedure TfrmDonatorProfile.TabRoyalHistoryShow(Sender: TObject);
begin
  ShowRoyalHistory(FdonatorID);
end;

procedure TfrmDonatorProfile.ShowFavorHistory(doid: string);
var strSQL:string;
begin
  with FMainForm.cdsFavorHistory do
  begin
    close;
    strSQL:='' +

    ' select a.*,b.*,c.* '+
    ' from support a '+
    ' left join sp_code b on a.spcode=b.sp_code '+
    ' left join donator c on a.spid=c.do_id '+
    ' where a.spstatus<>''I'' and a.spid='''+doid+''' '+
    ' order by spcode ';

    CommandText:=strSQL;
    open;
  end;
end;

procedure TfrmDonatorProfile.TabFavorHistoryShow(Sender: TObject);
begin
  ShowFavorHistory(FdonatorID);
end;

procedure TfrmDonatorProfile.btnNewClick(Sender: TObject);
begin
  if not btnNew.Enabled then  exit;

  SetControl(tabDonatorInfo,true);
  tabDonatorInfo.Enabled:=true;

  if not FMainForm.cdsDonator.Active then
  begin
    FMainForm.cdsDonator.Close;
    FMainForm.cdsDonator.CommandText:='select top 1 * from donator';
    FMainForm.cdsDonator.Open;
    FMainForm.cdsDonator.EmptyDataSet;
  end;


  if FMainForm.cdsDonator.Active then
  begin
    FMainForm.cdsDonator.Append;
    FMainForm.cdsDonator.FieldByName('do_id').AsString:=FormatCurr('00000000',getNewDonatorId(FMainForm.cdsTemp));
    cmbPreName.SetFocus;
    btnSave.Enabled:=true;
  end;
end;

procedure TfrmDonatorProfile.btnRepHistoryClick(Sender: TObject);
{var dllParams : TDLLParameter;
begin
  dllParams.ReportCode:='RPT0501';
  ShowReportGenerator(Application,nil,swModal,dllParams,nil);
end; }

var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('DONA',FdonatorID));
  dllParams.ReportCode:='RPT0501';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmDonatorProfile.cxGridDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridBillDetailsDBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridDBTableView2CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridDBTableView3CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridDBTableView4CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridDBTableView5CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmDonatorProfile.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
          with FMainForm.cdsDonatorHistoryDtl do
          begin
            close;
            //CommandText:='select * from billdetail where bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            CommandText:=''+

            '  select a.*,b.o_title,c.fd_title from billdetail a '+
            '  LEFT join object_code b on a.bdobject=b.o_code '+
            '  left join found_code c on a.bdfound=c.fd_code '+
            '  where '+
            '  a.bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+''' ';
            open;
          end;
end;

procedure TfrmDonatorProfile.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
          with FMainForm.cdsDonatorHistoryDtl do
          begin
            close;
            //CommandText:='select * from billdetail where bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            CommandText:=''+

            '  select a.*,b.o_title,c.fd_title from billdetail a '+
            '  LEFT join object_code b on a.bdobject=b.o_code '+
            '  left join found_code c on a.bdfound=c.fd_code '+
            '  where '+
            '  a.bdno='''+FMainForm.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+''' ';
            open;
          end;
end;

procedure TfrmDonatorProfile.btnSelectProvinceClick(Sender: TObject);
var frm:TfrmSearchLocation;
begin
  if trim(edProvince.Text)<>'' then
  begin
    getAutoLocation(FMainForm.cdsAutoLocation,'','',edProvince.Text,'','40');
    if FMainForm.cdsAutoLocation.Active then
    begin
      if FMainForm.cdsAutoLocation.RecordCount>0 then
      begin
        FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString:=FMainForm.cdsAutoLocation.FieldByName('code1').AsString;
        FMainForm.cdsDonator.FieldByName('do_province1').AsString:=FMainForm.cdsAutoLocation.FieldByName('describe').AsString;
      end;
    end;
  end
  else
  begin
    frm:=TfrmSearchLocation.Create(self);
    frm.MainForm:=FMainForm;
    frm.selectTypecode:='40';
    frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString);
    frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString);
    frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString);

    frm.ShowModal;

    if frm.IsOK then
      if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
      begin
        FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString:=frm.selectCode;
        FMainForm.cdsDonator.FieldByName('do_province1').AsString:=frm.selectName;
      end;
    frm.Free;
  end;
  edProvince.SetFocus;

end;

{var frmSelProvince:TfrmSelectPrivince;
begin
  frmSelProvince:=TfrmSelectPrivince.Create(self);
  frmSelProvince.MainForm:=FMainForm;
  frmSelProvince.ShowModal;

  if frmSelProvince.IsOK then
    if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
    begin
      _selectProvince :=frmSelProvince.ProvinceCode;
      FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString:=frmSelProvince.ProvinceCode;
      FMainForm.cdsDonator.FieldByName('do_province1').AsString:=frmSelProvince.ProvinceName;
    end;
  frmSelProvince.Free;
  edProvince.SetFocus;

end;
}

procedure TfrmDonatorProfile.btnSelectTambonClick(Sender: TObject);
var frm:TfrmSearchLocation;
begin

  if trim(edTambon.Text)<>'' then
  begin
    getAutoLocation(FMainForm.cdsAutoLocation,edTambon.Text,'','','','42');
    if FMainForm.cdsAutoLocation.Active then
    begin
      if FMainForm.cdsAutoLocation.RecordCount>0 then
      begin
        FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString:=FMainForm.cdsAutoLocation.FieldByName('code1').AsString;
        FMainForm.cdsDonator.FieldByName('do_tambon1').AsString:=FMainForm.cdsAutoLocation.FieldByName('describe').AsString;


          getAutoLocation(FMainForm.cdsAutoLocation1,FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString,'','','','41');

          if FMainForm.cdsAutoLocation1.Active then
            if FMainForm.cdsAutoLocation1.RecordCount>0 then
            begin
              FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString:=FMainForm.cdsAutoLocation1.FieldByName('code1').AsString;
              btnSelectAmphurClick(sender);
            end;


      end;
    end;
  end
  else
     begin

      frm:=TfrmSearchLocation.Create(self);
      frm.MainForm:=FMainForm;
      frm.selectTypecode:='42';
      frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString);
      frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString);
      frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString);

      frm.ShowModal;

      if frm.IsOK then
        if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
        begin
          FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString:=frm.selectCode;
          FMainForm.cdsDonator.FieldByName('do_tambon1').AsString:=frm.selectName;

          getAutoLocation(FMainForm.cdsAutoLocation1,frm.selectCode,'','','','41');

          if FMainForm.cdsAutoLocation1.Active then
            if FMainForm.cdsAutoLocation1.RecordCount>0 then
            begin
              FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString:=FMainForm.cdsAutoLocation1.FieldByName('code1').AsString;
              btnSelectAmphurClick(sender);
            end;

        end;
      frm.Free;

     end;

  edTambon.SetFocus;

end;
{
var frm:TfrmSelectTambon;

begin
  frm:=TfrmSelectTambon.Create(self);
  frm.MainForm:=FMainForm;

  if FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString<>'' then
    frm.parentCode:=FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString;

  frm.ShowModal;

  if frm.IsOK then
  if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
  begin
    _selectTambon :=frm.TambonCode;
    FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString:=frm.TambonCode;
    FMainForm.cdsDonator.FieldByName('do_tambon1').AsString:=frm.TambonName;
  end;
  edTambon.SetFocus;
  frm.Free;
end;
}

procedure TfrmDonatorProfile.btnSelectAmphurClick(Sender: TObject);
var frm:TfrmSearchLocation;
begin
  if trim(edAmphur.Text)<>'' then
  begin
    getAutoLocation(FMainForm.cdsAutoLocation,edAmphur.Text,'','','','41');
    if FMainForm.cdsAutoLocation.Active then
    begin
      if FMainForm.cdsAutoLocation.RecordCount>0 then
      begin
        FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString:=FMainForm.cdsAutoLocation.FieldByName('code1').AsString;
        FMainForm.cdsDonator.FieldByName('do_amphor1').AsString:=FMainForm.cdsAutoLocation.FieldByName('describe').AsString;


          getAutoLocation(FMainForm.cdsAutoLocation1,'',FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString,'','','40');

          if FMainForm.cdsAutoLocation1.Active then
            if FMainForm.cdsAutoLocation1.RecordCount>0 then
            begin
              FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString:=FMainForm.cdsAutoLocation1.FieldByName('code1').AsString;
              btnSelectProvinceClick(sender);
            end;

      end;
    end;
  end
  else
       begin
        frm:=TfrmSearchLocation.Create(self);
        frm.MainForm:=FMainForm;
        frm.selectTypecode:='41';
        frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString);
        frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString);
        frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString);

        frm.ShowModal;

        if frm.IsOK then
          if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
          begin
            FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString:=frm.selectCode;
            FMainForm.cdsDonator.FieldByName('do_amphor1').AsString:=frm.selectName;

            getAutoLocation(FMainForm.cdsAutoLocation1,'',FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString,'','','40');

            if FMainForm.cdsAutoLocation1.Active then
              if FMainForm.cdsAutoLocation1.RecordCount>0 then
              begin
                FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString:=FMainForm.cdsAutoLocation1.FieldByName('code1').AsString;
                btnSelectProvinceClick(sender);
              end;

          end;
        frm.Free;
       end;
  edAmphur.SetFocus;

end;
{
var frm:TfrmSelectAmphur;

begin
  frm:=TfrmSelectAmphur.Create(self);
  frm.MainForm:=FMainForm;

  if FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString<>'' then
    frm.parentCode:=FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString;

  frm.ShowModal;

  if frm.IsOK then
  if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
  begin
    _selectAmphur := frm.AmphurCode;
    FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString:=frm.AmphurCode;
    FMainForm.cdsDonator.FieldByName('do_amphor1').AsString:=frm.AmphurName;
  end;
  edAmphur.SetFocus;
  frm.Free;
end;
}

procedure TfrmDonatorProfile.btnSelectProvince2Click(Sender: TObject);
var frm:TfrmSearchLocation;
begin
  frm:=TfrmSearchLocation.Create(self);
  frm.MainForm:=FMainForm;
  frm.selectTypecode:='40';
  frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode2').AsString);
  frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode2').AsString);
  frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode2').AsString);

  frm.ShowModal;

  if frm.IsOK then
    if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
    begin
      FMainForm.cdsDonator.FieldByName('do_provincecode2').AsString:=frm.selectCode;
      FMainForm.cdsDonator.FieldByName('do_province2').AsString:=frm.selectName;
    end;
  frm.Free;
  edProvince1.SetFocus;

end;

procedure TfrmDonatorProfile.btnSelectTambon2Click(Sender: TObject);
var frm:TfrmSearchLocation;
begin
  frm:=TfrmSearchLocation.Create(self);
  frm.MainForm:=FMainForm;
  frm.selectTypecode:='42';
  frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode2').AsString);
  frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode2').AsString);
  frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode2').AsString);

  frm.ShowModal;

  if frm.IsOK then
    if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
    begin
      FMainForm.cdsDonator.FieldByName('do_tamboncode2').AsString:=frm.selectCode;
      FMainForm.cdsDonator.FieldByName('do_tambon2').AsString:=frm.selectName;
    end;
  frm.Free;
  edTambon1.SetFocus;

end;
procedure TfrmDonatorProfile.btnSelectAmphur2Click(Sender: TObject);
var frm:TfrmSearchLocation;
begin
  frm:=TfrmSearchLocation.Create(self);
  frm.MainForm:=FMainForm;
  frm.selectTypecode:='41';
  frm.AmphurCode:=trim(FMainForm.cdsDonator.FieldByName('do_amphorcode2').AsString);
  frm.ProvinceCode:=trim(FMainForm.cdsDonator.FieldByName('do_provincecode2').AsString);
  frm.TambonCode:=trim(FMainForm.cdsDonator.FieldByName('do_tamboncode2').AsString);

  frm.ShowModal;

  if frm.IsOK then
    if FMainForm.cdsDonator.State in [dsEdit,dsInsert] then
    begin
      FMainForm.cdsDonator.FieldByName('do_amphorcode2').AsString:=frm.selectCode;
      FMainForm.cdsDonator.FieldByName('do_amphor2').AsString:=frm.selectName;
    end;
  frm.Free;
  edAmphur1.SetFocus;

end;

procedure TfrmDonatorProfile.edTambonKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectTambonClick(sender);
end;

procedure TfrmDonatorProfile.edAmphurKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectAmphurClick(sender);
end;

procedure TfrmDonatorProfile.edProvinceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectProvinceClick(sender);
end;

procedure TfrmDonatorProfile.edProvince1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectProvince2Click(sender);
end;

procedure TfrmDonatorProfile.edTambon1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectTambon2Click(sender);
end;

procedure TfrmDonatorProfile.edAmphur1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSelectAmphur2Click(sender);
end;

procedure TfrmDonatorProfile.btnCopyClick(Sender: TObject);
begin
  if FMainForm.cdsDonator.State in [dsedit,dsinsert] then
  begin
    FMainForm.cdsDonator.FieldByName('do_addr2').AsString:=FMainForm.cdsDonator.FieldByName('do_addr1').AsString;
    FMainForm.cdsDonator.FieldByName('do_street2').AsString:=FMainForm.cdsDonator.FieldByName('do_street1').AsString;
    FMainForm.cdsDonator.FieldByName('do_provincecode2').AsString:=FMainForm.cdsDonator.FieldByName('do_provincecode1').AsString;
    FMainForm.cdsDonator.FieldByName('do_province2').AsString:=FMainForm.cdsDonator.FieldByName('do_province1').AsString;
    FMainForm.cdsDonator.FieldByName('do_remark2').AsString:=FMainForm.cdsDonator.FieldByName('do_remark1').AsString;
    FMainForm.cdsDonator.FieldByName('do_mu2').AsString:=FMainForm.cdsDonator.FieldByName('do_mu1').AsString;
    FMainForm.cdsDonator.FieldByName('do_tamboncode2').AsString:=FMainForm.cdsDonator.FieldByName('do_tamboncode1').AsString;
    FMainForm.cdsDonator.FieldByName('do_tambon2').AsString:=FMainForm.cdsDonator.FieldByName('do_tambon1').AsString;
    FMainForm.cdsDonator.FieldByName('do_zipcode2').AsString:=FMainForm.cdsDonator.FieldByName('do_zipcode1').AsString;
    FMainForm.cdsDonator.FieldByName('do_soi2').AsString:=FMainForm.cdsDonator.FieldByName('do_soi1').AsString;
    FMainForm.cdsDonator.FieldByName('do_amphorcode2').AsString:=FMainForm.cdsDonator.FieldByName('do_amphorcode1').AsString;
    FMainForm.cdsDonator.FieldByName('do_amphor2').AsString:=FMainForm.cdsDonator.FieldByName('do_amphor1').AsString;
  end;
end;

procedure TfrmDonatorProfile.initForm;
begin
  if IsShowInfo then
  begin

    pgDonator.ActivePage:=tabDonatorHistory;

          with FMainForm.cdsDonator do
          begin
            close;
            CommandText:='select * from donator where do_id='''+donatorID+'''';
            open;

            if FMainForm.cdsDonator.Active then
              if FMainForm.cdsDonator.RecordCount>0 then
               begin
                  if trim(donatorID)<>'' then
                  begin
                    //FdonatorID := _donatorID;
                    //FdonatorName := trim(_donatorPreName)+' '+trim(_donatorName)+' '+ trim(_donatorLName);

                    edSearchName.Text:=trim(FMainForm.cdsDonator.fieldbyname('do_name').AsString);
                    edSearchLName.Text:=trim(FMainForm.cdsDonator.fieldbyname('do_lname').AsString);
                    //lbDonatorName.Caption:=_donatorName;
                    //lbDonatorLName.Caption:=_donatorLName;
                    btnEditProfile.Enabled:=true;

                    self.Caption:='ข้อมูลผู้บริจาค ('+donatorID+')';


                  end;
               end;
          end;

  end
  else
  begin
     if trim(donatorID)<>'' then
          with FMainForm.cdsDonator do
          begin
            close;
            CommandText:='select * from donator where do_id='''+donatorID+'''';
            open;
            

            if FMainForm.cdsDonator.Active then
              if FMainForm.cdsDonator.RecordCount>0 then
               begin
                  if trim(donatorID)<>'' then
                  begin
                    //FdonatorID := _donatorID;
                    //FdonatorName := trim(_donatorPreName)+' '+trim(_donatorName)+' '+ trim(_donatorLName);

                    edSearchName.Text:=trim(FMainForm.cdsDonator.fieldbyname('do_name').AsString);
                    edSearchLName.Text:=trim(FMainForm.cdsDonator.fieldbyname('do_lname').AsString);
                    //lbDonatorName.Caption:=_donatorName;
                    //lbDonatorLName.Caption:=_donatorLName;
                    btnEditProfile.Enabled:=true;

                  end;
               end;
          end;


    pgDonator.ActivePage:=tabDonatorInfo;
    edSearchName.SetFocus;
  end;

end;

procedure TfrmDonatorProfile.getAutoLocation(cds: TClientDataSet;
  _tamboncode, _amphurcode,_provincecode, _codetype, typecode: string);
var strSQL:string;
begin
    strSQL:=''+

    ' declare @provincecode varchar(12) '+
    ' declare @amphurcode varchar(12) '+
    ' declare @tamboncode varchar(12) '+
    ' declare @codetype varchar(2) '+
    ' declare @searchcode varchar(50) '+
   // ' declare @searchtext varchar(255) '+

    ' set @searchcode='''' '+
  //  ' set @searchtext='''++''' '+


    ' set @provincecode='''+_provincecode+''' /* -- 34		=40 */ '+
    ' set @amphurcode='''+_amphurcode+''' /* -- 3415		=41   3401,3402 */ '+
    ' set @tamboncode='''+_tamboncode+''' /*-- 341521		=42 */ '+
    ' set @codetype='''+typecode+''' '+


    ' select * from ( '+
    ' select * from lookup_code '+
    ' where '+
    ' (   '+
    ' 	/* provice */ '+
    ' 	(      '+
    ' 		(( @provincecode <> '''' and code1 =@provincecode ) and code_type=''40''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @amphurcode <> '''' and code1 like left(@amphurcode,2)+''%'' ) and code_type=''40''  ) '+
    ' 		or (code_type=''40'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 like left(@tamboncode,2)+''%'' ) and code_type=''40''  ) '+
    ' 		or (code_type=''40'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+



    ' ) and used_flag<>''C'' '+
    ' union select * from lookup_code where '+
    ' ( '+
    ' 	/* amphur */ '+

    ' 	( '+
    ' 		(( @amphurcode <> '''' and code1 =@amphurcode ) and code_type=''41''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @provincecode <> '''' and @amphurcode='''' and code1 like @provincecode+''%'' ) and code_type=''41''  ) '+
    ' 		or (code_type=''41'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or  '+
    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 like left(@tamboncode,4)+''%'' ) and code_type=''41''  ) '+
    ' 		or (code_type=''41'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+

    ' )and used_flag<>''C'' '+
    ' union select * from lookup_code where '+
    ' ( '+
    ' 	/* tambon */ '+

    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 =@tamboncode ) and code_type=''42''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @provincecode <> '''' and @amphurcode='''' and @tamboncode='''' and  code1 like @provincecode+''%'' ) and code_type=''42''  ) '+
    ' 		or (code_type=''42'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @amphurcode <> '''' and @tamboncode='''' and code1 like @amphurcode+''%'' ) and code_type=''42''  ) '+
    ' 		or (code_type=''42'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+

    ' ) and used_flag<>''C'' '+
    ' ) xx where xx.code_type=@codetype ';

    cds.Close;
    cds.CommandText:=strSQL;
    cds.Open;

end;

end.
