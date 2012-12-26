unit DonatorProfileFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCurrencyEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, RzPanel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, RzButton, Mask, RzEdit, RzDTP, RzCmboBx, RzDBEdit, DBClient,ReceiveFrm,CommonLIB;

type

  TfrmDonatorProfile = class(TForm)
    pnClientContainer: TPanel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    RzPanel1: TRzPanel;
    btnOK: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    btnEditProfile: TRzBitBtn;
    btnClose: TRzBitBtn;
    pgDonator: TPageControl;
    tabDonatorInfo: TTabSheet;
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
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbHead1: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    tabDonatorHistory: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label39: TLabel;
    Label40: TLabel;
    lbDonatorName: TLabel;
    lbDonatorLName: TLabel;
    edSearchName: TRzEdit;
    edSearchLName: TRzEdit;
    TabSheet6: TTabSheet;
    RzComboBox1: TRzComboBox;
    cdsSearch: TDataSource;
    ClientDataSet1: TClientDataSet;
    dsDonator: TDataSource;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzMaskEdit1: TRzMaskEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit21: TRzDBEdit;
    RzDBEdit22: TRzDBEdit;
    RzDBEdit23: TRzDBEdit;
    RzDBEdit24: TRzDBEdit;
    RzDBEdit25: TRzDBEdit;
    RzDBEdit26: TRzDBEdit;
    RzDBEdit27: TRzDBEdit;
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
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
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
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
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
    cxGridDBTableView1brefdate: TcxGridDBColumn;
    cxGridDBTableView1buserid: TcxGridDBColumn;
    cxGridDBTableView1bfrom: TcxGridDBColumn;
    cxGridDBTableView1bryid: TcxGridDBColumn;
    cxGridDBTableView1bloc: TcxGridDBColumn;
    cxGridDBTableView1bspiid: TcxGridDBColumn;
    cxGridDBTableView1bentry: TcxGridDBColumn;
    cxGridDBTableView1bcomid: TcxGridDBColumn;
    cxGridDBTableView1bcancelid: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdno: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1item: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdobject: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdfound: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdbankbook: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdacccode: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdfoundtype: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdpaytype: TcxGridDBColumn;
    cxGridBillDetailsDBTableView1bdflag: TcxGridDBColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edSearchNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure tabDonatorHistoryShow(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
  private
    FdonatorID: string;
    FdonatorName: string;
    FshowMode: TShowMode;
    FIsShowInfo: boolean;
    procedure SetdonatorID(const Value: string);
    procedure SetdonatorName(const Value: string);
    procedure ShowDonatorProfile(doid:string);
    procedure SetIsShowInfo(const Value: boolean);
    procedure ShowHistory(doid:string);
    { Private declarations }
  public
    { Public declarations }
    property donatorID : string read FdonatorID write SetdonatorID;
    property donatorName : string read FdonatorName write SetdonatorName;
    property IsShowInfo : boolean read FIsShowInfo write SetIsShowInfo;
  end;

var
  frmDonatorProfile: TfrmDonatorProfile;

implementation

uses SearchFrm;

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
  if IsShowInfo then
  begin
    pgDonator.ActivePage:=tabDonatorHistory;
  end
  else
  begin
    pgDonator.ActivePage:=tabDonatorInfo;
    edSearchName.SetFocus;
  end;


end;



procedure TfrmDonatorProfile.edSearchNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  frmSearch : TfrmSearch;
  _donatorID,_donatorName,_donatorLName,_donatorPreName: string;

begin
 if key=vk_return then
 begin
  if trim(edSearchName.Text)<>'' then
  with frmReceive.cdsSearch do
  begin
    close;
    CommandText:='select do_id,do_prename,do_name,do_lname from donator where do_name like '''+edSearchName.Text+'%'' and  do_lname like '''+edSearchLName.Text+'%'' ';
    Screen.Cursor:=crHourGlass;
    open;
    Screen.Cursor:=crDefault;


    if recordcount>0 then
     begin
      frmSearch:=TfrmSearch.Create(self);
      frmSearch.ShowModal;

      if not IsShowInfo then
        if trim(frmSearch.donatorID)<>'' then
        begin
          _donatorID := frmSearch.donatorID;
          _donatorName := frmSearch.donatorName;
          _donatorLName := frmSearch.donatorLName;
          _donatorPreName:= frmSearch.donatorPreName;

          with frmReceive.cdsDonator do
          begin
            close;
            CommandText:='select * from donator where do_id='''+_donatorID+'''';
            open;
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
 with frmReceive.cdsDonator do
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
 if frmReceive.cdsDonator.State in [dsInsert,dsEdit] then
 begin
  if MessageDlg('ข้อมูลถูกแก้ไข ยืนยันบันทึกรายการ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    frmReceive.cdsDonator.Post;
    FdonatorName := trim(frmReceive.cdsDonator.fieldbyname('do_prename').AsString)+' '+trim(frmReceive.cdsDonator.fieldbyname('do_name').AsString)+' '+ trim(frmReceive.cdsDonator.fieldbyname('do_lname').AsString);
    frmReceive.cdsDonator.ApplyUpdates(0);
  end else
  begin
    frmReceive.cdsDonator.Cancel;
  end;
 end;

 close;
end;

procedure TfrmDonatorProfile.tabDonatorHistoryShow(Sender: TObject);
begin
 if trim(donatorID)<>'' then
   ShowHistory(donatorID);
end;

procedure TfrmDonatorProfile.ShowHistory(doid: string);
begin
  with frmReceive.cdsDonatorHistoryHdr do
  begin
    close;
    CommandText:='select * from bill where bid='''+doid+''' ';
    open;

    if frmReceive.cdsDonatorHistoryHdr.Active then
      if frmReceive.cdsDonatorHistoryHdr.RecordCount> 0 then
      begin
          with frmReceive.cdsDonatorHistoryDtl do
          begin
            close;
            CommandText:='select * from billdetail where bdno='''+frmReceive.cdsDonatorHistoryHdr.fieldbyname('bno').AsString+'''';
            open;
          end;
      end;

  end;



end;

procedure TfrmDonatorProfile.btnEditProfileClick(Sender: TObject);
begin
  SetControl(tabDonatorInfo,true);
  tabDonatorInfo.Enabled:=true;
  frmReceive.cdsDonator.Edit;
end;

end.
