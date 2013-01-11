unit FavorFrm;

interface

uses
  Windows, Messages, SysUtils ,StrUtils , DBXpress, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBClient,
  RzRadChk, RzPanel, RzEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Provider, SqlExpr, StdCtrls, Mask, RzButton,
  RzLabel, Controls, ExtCtrls, Classes ,Variants, Graphics,  Forms,
  Dialogs;

type
  TfrmFavor = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    BtnDelFavor: TRzBitBtn;
    procedure R3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure CdsHistReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDelFavorClick(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid2DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    FEd_Fname: String;
    FEd_Lname: String;
    procedure SetEd_Fname(const Value: String);
    procedure SetEd_Lname(const Value: String);
  published
  published
    xTopPanel: TPanel;
    rzTopPanel: TRzPanel;
    pnClientContainer: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    pnButtom: TRzPanel;
    btnAddFavor: TRzBitBtn;
    BtnEditFavor: TRzBitBtn;
    BtnHistFavor: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    pnBody: TRzPanel;
    Splitter3: TSplitter;
    pnTop: TRzPanel;
    Label39: TLabel;
    Label40: TLabel;
    edSearchName: TRzEdit;
    edSearchLName: TRzEdit;
    btnSearch: TRzBitBtn;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    RzPanel1: TRzPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    DtStart: TRzDateTimeEdit;
    DtEnd: TRzDateTimeEdit;
    RzGroupBox1: TRzGroupBox;
    R1: TRzRadioButton;
    R2: TRzRadioButton;
    R3: TRzRadioButton;
    CdsSp: TClientDataSet;
    DsSp: TDataSource;
    RzLabel1: TRzLabel;
    TxtJ: TRzLabel;
    RzLabel3: TRzLabel;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    CdsSearch: TClientDataSet;
    DsSearch: TDataSource;
    CdsBill: TClientDataSet;
    DsBill: TDataSource;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    LbB: TRzLabel;
    RzLabel5: TRzLabel;
    CdsHist: TClientDataSet;
    DsHist: TDataSource;
    CdsSp_Code: TClientDataSet;
    DsSpCode: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAddFavorClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchLNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsSpAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BtnEditFavorClick(Sender: TObject);
    procedure BtnHistFavorClick(Sender: TObject);
    procedure R1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure R2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FChkRb: String;
    procedure SetChkRb(const Value: String);
    procedure LoadDonator ;
    procedure LoadSupport(Str,strIf:String)  ;
    Procedure LoadSupportDate(DtS,DtE:TDateTime) ;
    procedure LoadBill(Str:String) ;
    property Ed_Fname :String  read FEd_Fname write SetEd_Fname;
    property Ed_Lname :String  read FEd_Lname write SetEd_Lname;


  public
    Property ChkRb : String  read FChkRb write SetChkRb;
    procedure LoadHist(Str:String) ;
    procedure LoadSpCode ;

  end;

var
  frmFavor: TfrmFavor;
  StrSqlSearch,StrIf : String ;
  _ParaSupport : String ;
  _Status : TColor ;

implementation

uses CommonUtils, CommonLIB, SearchSupportFrm, HistorySupportFrm;

{$R *.dfm}

procedure TfrmFavor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmFavor.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  initDataset(self,conn) ;                                      /////////////////////// Not Provider Clash
  initSqlConnection(Conn) ;
end;

procedure TfrmFavor.btnAddFavorClick(Sender: TObject);
begin
  ShowFavorRegister(Application,nil,swModal,LeftStr(_ParaSupport,8));
  if CdsSp.Active = True then
    begin
     CdsSp.Refresh ;
     cxGrid1.SetFocus ;
    end;
end;

procedure TfrmFavor.btnSearchClick(Sender: TObject);
var Frm : TFrmSearchSupport ;
begin
  if R1.Checked = True then
    begin
      StrSqlSearch := 'select * from donator where '+
                        '     do_name like ' +QuotedStr(edSearchName.Text+'%')+
                        ' and do_lname like '+ QuotedStr(edSearchLName.Text+'%') ;
      cxGrid1DBTableView1DBColumn4.DataBinding.FieldName := 'FName1' ;
      cxGrid1DBTableView1DBColumn5.DataBinding.FieldName := 'FName2' ;
      ChkRb := '1'  ;
    end
  else if R2.Checked = True then
    beGin
      StrSqlSearch :=  'select * from support '+
                        'where spname like '+ QuotedStr(edSearchName.Text+'%') +
                        ' and spfname like '+ QuotedStr(edSearchLName.Text+'%') +
                        ' order by spid ' ;
      cxGrid1DBTableView1DBColumn4.DataBinding.FieldName := 'FName1' ;
      cxGrid1DBTableView1DBColumn5.DataBinding.FieldName := 'FName2' ;
      ChkRb := '2' ;
    end ;

  if R3.Checked = True Then
    begin
      cxGrid1DBTableView1DBColumn4.DataBinding.FieldName := 'funame1' ;
      cxGrid1DBTableView1DBColumn5.DataBinding.FieldName := 'funame2' ;
      LoadSupportDate(DtStart.Date,DtEnd.Date) ;
    end
  else
    begin
      LoadDonator ;
      frm := TFrmSearchSupport.Create(self);
      frm.MainForm := Self ;
      frm.ShowModal;

      if frm.SelectSpId ='' then exit ;

      if r2.Checked = true then
        begin
          StrIf := ' and spname='+ QuotedStr(frm.SelectSpName)+' and spfname='+QuotedStr(frm.SelectSpLName) ;   ;
          Ed_Fname := Frm.SelectSpName ;
          Ed_Lname := frm.SelectSpLName  ;
        end
      else if r1.Checked = true then
        begin
          StrIf := '' ;
          Ed_Fname := Frm.Select_DoName ;
          Ed_Lname := frm.Select_DoLName ;
        end;
        LoadSupport(frm.SelectSpId,StrIf) ;
        LoadBill(CdsSp.FieldByName('spiid').AsString) ;
      frm.Free;
    end;
  TxtJ.Caption := IntToStr(CdsSp.RecordCount) ;
  _ParaSupport := CdsSp.fieldbyname('spid').AsString  + CdsSp.fieldbyname('spiid').AsString ;

  if _ParaSupport <> '' then cxGrid1.SetFocus
  else edSearchName.SetFocus ;
end;

procedure TfrmFavor.SetChkRb(const Value: String);
begin
  FChkRb := Value;
end;

procedure TfrmFavor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure TfrmFavor.LoadDonator ;
begin
  CdsSearch.Close ;
  CdsSearch.CommandText := StrSqlSearch  ;
  try
    Screen.Cursor := crHourGlass ;
    CdsSearch.Open ;
  finally
    Screen.Cursor := crDefault ;
  end;
end;

procedure TfrmFavor.LoadSupport(Str,strIf:String) ;
begin
  CdsSp.Close ;
  CdsSp.CommandText := ' select (d.do_name +'+QuotedStr(' ')+' + d.do_lname ) as FName1,'+
                       '(s.spname+'+QuotedStr(' ')+' + s.spfname ) as FName2,*'+
                       'from support S '+
                       'left join donator d on s.spid = d.do_id '+
                       'left join sp_code sp on s.spcode=sp.sp_code '+
                       'where spid='+QuotedStr(str) + strIf  ;
  try
    Screen.Cursor := crHourGlass ;
    CdsSp.Open ;
  finally
    Screen.Cursor := crDefault ;
  end;
end;

procedure TfrmFavor.edSearchNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     btnSearch.Click  ;
end;

procedure TfrmFavor.edSearchLNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     btnSearch.Click  ;
end;

procedure TfrmFavor.LoadSupportDate(DtS, DtE: TDateTime);
begin
  CdsSp.Close ;
  CdsSp.CommandText := 'select s.spiid,s.spid,s.spamass ,s.spdate,d.do_id,d.do_prename,d.do_name,d.do_lname '+
                       ',(d.do_prename + '+QuotedStr(' ')+' + d.do_name + '+QuotedStr(' ')+' + d.do_lname) as funame1 '+
                       ',(s.spininame + '+QuotedStr(' ')+' + s.spname + '+QuotedStr(' ')+' + s.spfname) as funame2 '+
                       ',s.spcode,c.sp_title '+
                       ',s.spappdate ,s.spowner ,s.spbirth ,s.spdate1 '+
                       ',s.spdate2 ,s.spdate3 ,s.spdate4 ,s.sptotal '+
                       'from support S Left join donator D on  s.spid = d.do_id '+
                       'left join sp_code C on s.spcode = c.sp_code '+
                       ' where s.spdate between '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DtStart.Date)) +
                       ' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',DtEnd.Date)) ;
  CdsSp.Open ;
end;

procedure TfrmFavor.LoadBill(Str: String);
begin
  CdsBill.Close ;
  CdsBill.CommandText := ' select B.bspiid,B.bid,B.bno,B.bdate,Oc.o_title,Oc.o_abbr,bdt.bdamount,b.btotal    '+
                         ' from bill B left join billdetail Bdt on B.bno = bdt.bdno '+
                         ' left join object_code Oc on bdt.bdobject = Oc.o_code '+
                         ' where B.bspiid=' + QuotedStr(Str) +
                         ' group by B.bspiid,B.bid,B.bno,B.bdate,Oc.o_title,Oc.o_abbr,bdt.bdamount,b.btotal    '+
                         ' order by B.bno ' ;
  CdsBill.Open ;
//  InputBox('','',CdsBill.CommandText ) ;
  LbB.Caption := IntToStr(CdsBill.RecordCount) ;
end;

procedure TfrmFavor.CdsSpAfterScroll(DataSet: TDataSet);
begin
  LoadBill(CdsSp.FieldByName('spiid').AsString) ;
  _ParaSupport := CdsSp.fieldbyname('spid').AsString  + CdsSp.fieldbyname('spiid').AsString ;
end;

procedure TfrmFavor.FormShow(Sender: TObject);
begin
  DtStart.Date := Now ;
  DtEnd.Date   := Now ;
  _Status := RGB(105,105,105) ;
  edSearchName.SetFocus ;
end;

procedure TfrmFavor.BtnEditFavorClick(Sender: TObject);
begin
  if _ParaSupport <> '' then
    begin
     ShowFavorRegister(Application,nil,swModal,_ParaSupport);
     if CdsSp.RecordCount > 0 then cxGrid1.SetFocus
     else edSearchName.SetFocus ;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการบัตรอุปการคุณ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end ;
end;

procedure TfrmFavor.BtnHistFavorClick(Sender: TObject);
var frm : TFrmHistorySupport ;
begin
  if Trim(_ParaSupport) <> '' then
    begin
      LoadHist(CdsSp.FieldByName('spiid').AsString) ;
      LoadSpCode ;
      frm := TFrmHistorySupport.Create(self);
      frm.MainForm := Self ;
      frm.ShowModal;
      frm.Free;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการบัตรอุปการคุณ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end ;
end;

procedure TfrmFavor.LoadHist(Str: String);
begin
  CdsHist.Close ;
  CdsHist.CommandText := 'select * from support where spiid=' + QuotedStr(Str) ;
  CdsHist.Open ;
end;

procedure TfrmFavor.LoadSpCode;
begin
  CdsSp_Code.Close ;
  CdsSp_Code.CommandText := 'select * from sp_code' ;
  CdsSp_Code.Open ;
end;

procedure TfrmFavor.R1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     btnSearch.Click  ;
end;

procedure TfrmFavor.R2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     btnSearch.Click  ;
end;

procedure TfrmFavor.R3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     btnSearch.Click  ;
end;

procedure TfrmFavor.SetEd_Fname(const Value: String);
begin
  FEd_Fname := Value;
  edSearchName.Text := Value ;
end;

procedure TfrmFavor.SetEd_Lname(const Value: String);
begin
  FEd_Lname := Value;
  edSearchLName.Text := Value ;
end;

procedure TfrmFavor.R1Click(Sender: TObject);
begin
  edSearchName.SetFocus ;
end;

procedure TfrmFavor.R2Click(Sender: TObject);
begin
  edSearchName.SetFocus ;
end;

procedure TfrmFavor.R3Click(Sender: TObject);
begin
  DtStart.SetFocus ;
end;

procedure TfrmFavor.CdsHistReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(e.Message) ;
end;

procedure TfrmFavor.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.DisplayTexts[6] = 'Y' then
  begin
    ACanvas.Brush.Color := _Status ;
  end;
end;

procedure TfrmFavor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3:
      begin
        btnAddFavorClick(Sender) ;
      end;
    vk_f7:
      begin
        BtnEditFavorClick(sender);
      end;
    vk_f9:
      begin
        BtnDelFavorClick(Sender) ;
      end;
    vk_f6:
      begin
        btnSearchClick(sender);
      end;
    vk_f8:
      begin
        BtnHistFavorClick(sender);
      end;
    VK_ESCAPE :
      begin
        if _ParaSupport <> '' then cxGrid1.SetFocus ;
      end;
  end;
end;

procedure TfrmFavor.BtnDelFavorClick(Sender: TObject);
begin
  if Trim(_ParaSupport) <> '' then
    begin
      if Application.MessageBox('ต้องการลบลบการขอบัตรอุปการคุณ','ลบการขอบัตรอุปการคุณ', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        CdsSp.Delete ;
        CdsSp.ApplyUpdates(0) ;
        if CdsSp.RecordCount > 0 then cxGrid1.SetFocus
        else edSearchName.SetFocus ;
      end;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการบัตรอุปการคุณ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end;
end;

procedure TfrmFavor.RzBitBtn4Click(Sender: TObject);
begin
  if _ParaSupport <> '' then
    begin
     ShowFavorRegister(Application,nil,swModal,_ParaSupport+'UP');
     if CdsSp.RecordCount > 0 then cxGrid1.SetFocus
     else edSearchName.SetFocus ;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการบัตรอุปการคุณ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end ;
end;

procedure TfrmFavor.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if _ParaSupport <> '' then
    begin
     ShowFavorRegister(Application,nil,swModal,_ParaSupport);
     if CdsSp.RecordCount > 0 then cxGrid1.SetFocus
     else edSearchName.SetFocus ;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการบัตรอุปการคุณ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end ;
end;

procedure TfrmFavor.cxGrid1DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmFavor.cxGrid2DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
