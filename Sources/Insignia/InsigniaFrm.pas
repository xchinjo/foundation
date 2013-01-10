unit InsigniaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, StdCtrls, DBXpress, FMTBcd, Provider, DB,
  SqlExpr, RzLabel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzButton, RzRadChk, Mask, RzEdit, DBClient,StrUtils ;

type
  TfrmInsignia = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    pnButtom: TRzPanel;
    pnBody: TRzPanel;
    pnTop: TRzPanel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    btnAddInsignia: TRzBitBtn;
    btnEditInsignia: TRzBitBtn;
    BtnHistInsignia: TRzBitBtn;
    BtnPrint: TRzBitBtn;
    BtnDelInsignia: TRzBitBtn;
    BtnSearchYear: TRzBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label39: TLabel;
    edSearchName: TRzEdit;
    Label40: TLabel;
    edSearchLName: TRzEdit;
    btnSearch: TRzBitBtn;
    DtStart: TRzDateTimeEdit;
    DtDen: TRzDateTimeEdit;
    CdsRoYal: TClientDataSet;
    DsRoyal: TDataSource;
    CdsSearch: TClientDataSet;
    DsSearch: TDataSource;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    CdsBill: TClientDataSet;
    DsBill: TDataSource;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    TxtJ: TRzLabel;
    CdsRpt: TClientDataSet;
    RzGroupBox1: TRzGroupBox;
    R1: TRzRadioButton;
    R2: TRzRadioButton;
    R3: TRzRadioButton;
    RzLabel5: TRzLabel;
    LbB: TRzLabel;
    RzLabel3: TRzLabel;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    CdsHistRy: TClientDataSet;
    DsHistRy: TDataSource;
    CdsRyCode: TClientDataSet;
    DsRyCode: TDataSource;
    cdsTemp: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnAddInsigniaClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchLNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure R1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure CdsRoYalAfterScroll(DataSet: TDataSet);
    procedure btnEditInsigniaClick(Sender: TObject);
    procedure BtnHistInsigniaClick(Sender: TObject);
    procedure BtnSearchYearClick(Sender: TObject);
    procedure BtnDelInsigniaClick(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid2DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    FDo_Fname: String;
    FDo_LName: String;
    procedure SetDo_Fname(const Value: String);
    procedure SetDo_LName(const Value: String);
  private
    FRy_Id: String;
    FParaRoyal: String;
    procedure SetRy_Id(const Value: String);
    procedure SetParaRoyal(const Value: String);
    property Do_Fname : String  read FDo_Fname write SetDo_Fname;
    property Do_LName : String  read FDo_LName write SetDo_LName;



  private
    FChkRb: String;
    procedure SetChkRb(const Value: String);
    procedure LoadRoYal(Str:String) ;
    procedure LoadRoYalDate(D1,D2:TDateTime) ;
    procedure LoadBill(Str1,Str2:String) ;
    procedure LoadHistRoyal(Str:String) ;


    property SelectRy_Id : String  read FRy_Id write SetRy_Id;
        { Private declarations }
  public
    { Public declarations }
    procedure LoadDonator(StrF,STrL:String) ;
    property ChkRb : String  read FChkRb write SetChkRb;
    property ParaRoyal : String  read FParaRoyal write SetParaRoyal;
    procedure LoadRyCode ;
  end;

var
  frmInsignia: TfrmInsignia;
  StrSqlRoyal : String ;
  _Status : TColor ;

implementation

uses CommonUtils, CommonLIB, SearchDonatorFrm, HistoryRoyalFrm,
  SearchYearFrm;

{$R *.dfm}

procedure TfrmInsignia.FormShow(Sender: TObject);
begin
  R1.Checked := true ;
  DtStart.Date := Now ;
  DtDen.Date := Now ;
  edSearchName.SetFocus ;
  _Status := RGB(105,105,105) ;
end;

procedure TfrmInsignia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmInsignia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3: btnAddInsigniaClick(Sender) ;
    vk_f7: btnEditInsigniaClick(sender);
    vk_f9: BtnDelInsigniaClick(sender);
    vk_f6: btnSearchClick(sender);
    vk_f8: BtnHistInsigniaClick(sender);
    vk_f10: BtnSearchYearClick(sender);
    VK_ESCAPE :
      begin
        if ParaRoyal <> '' then cxGrid1.SetFocus
        else edSearchName.SetFocus ;
      end;
  end;
end;

procedure TfrmInsignia.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  initDataset(self,conn) ;                                 /////////////////////// Not Provider Clash
end;

procedure TfrmInsignia.btnAddInsigniaClick(Sender: TObject);
begin
  try
    ShowInsigniaRegister(Application,nil,swModal,LeftStr(ParaRoyal,8)+'ADD') ;
  finally
    edSearchName.SetFocus ;
  end;
end;
procedure TfrmInsignia.btnEditInsigniaClick(Sender: TObject);
begin
    if ParaRoyal <> '' then
      begin
        ShowInsigniaRegister(Application,nil,swModal,ParaRoyal);
        cxGrid1.SetFocus ;
        CdsRoYal.Refresh ;
      end
    else
      begin
        Application.MessageBox('กรุณาเลือกรายการขอเครื่องราชฯ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
        edSearchName.SetFocus ;
      end ;
end;

procedure TfrmInsignia.btnSearchClick(Sender: TObject);
var
  frm : TFrmSearchDonator;
begin
    if R1.Checked = True then
      begin
        StrSqlRoyal := ' select A.do_id ,'+
                       ' A.do_prename,A.do_name '+
                       ' ,A.do_lname,R.ryid'+
                       ' ,R.id,R.ryrdate '+
                       ' ,R.ryrcode,R.ryname'+
                       ' ,R.ryfname '+
                       ' ,R.ryininame,B.ry_code'+
                       ' ,B.ry_title '+
                       ' ,(R.ryname +'+ QuotedStr(' ')+ ' + R.ryfname) as FuName '+
                       ' , R.rylevel,R.ryapyear'+
                       ' ,R.rydate1 '+
                       ' ,R.ryappdate,R.ryansdate,'+
                       ' B.ry_title '+
                       ' ,R.rytotal,R.ryend '+
                       ' from donator A '+
                       ' left join (select aa.* from (select min(b.ryrcode) as ryrcode,b.id '+
                       ' from royal b  where b.rystatus ='+QuotedStr('A')+' group by b.id  ) bb '+
                       ' left join royal aa on bb.ryrcode=aa.ryrcode and bb.id=bb.id  )  R on A.do_id=R.id '+
                       ' left join royal_code B on R.ryrcode = B.ry_code '+
                       ' where A.do_name like ' + QuotedStr(edSearchName.Text+'%') +
                       ' and A.do_lname like '+ QuotedStr(edSearchLName.Text+'%') +
                       ' order by A.do_id ' ;

        cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'FuNameX' ;
      end
    else if R2.Checked = True then
      begin

           StrSqlRoyal := 'select (R.ryname +'+ QuotedStr (' ')+ ' + R.ryfname) as FuName '+
                          ',R.* from (select min(b.ryrcode) as ryrcode,b.id '+
                          'from royal b  where b.rystatus =''A'' group by b.id  ) R2 '+
                          'left join royal R on R2.ryrcode=R.ryrcode and R2.id=R2.id '+
                          'left join royal_code Rc on R2.ryrcode = Rc.ry_code '+
                          'where ryname like ' + QuotedStr(edSearchName.Text+'%')+
                          ' and ryfname like '+ QuotedStr(edSearchLName.Text+'%') +
                          ' order by R.ryid' ;

        cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'FuName' ;
      end ;

    if r3.Checked = True then
      begin
        LoadRoYalDate(DtStart.Date,DtDen.Date) ;
        LoadBill(CdsRoYal.fieldbyname('id').AsString,CdsRoYal.fieldbyname('ryid').AsString) ;
      end
    else
      begin

        LoadDonator(edSearchName.Text,edSearchLName.Text) ;
          Screen.Cursor := crDefault ;


        frm := TFrmSearchDonator.Create(self);
        frm.MainForm := Self ;
        frm.ShowModal;
        SelectRy_Id := frm.Ry_id ;


        if frm.DonatorId<>'' then
          with cdsTemp do
          begin
            cdsTemp.close;
            cdsTemp.CommandText:='select * from donator where do_id='''+frm.DonatorId+'''';
            cdsTemp.open;
            if cdsTemp.RecordCount>0 then
            begin
              Do_Fname := cdsTemp.FieldByName('do_name').AsString ;
              Do_Lname := cdsTemp.FieldByName('do_lname').AsString ;
            end;
          end;

        if (frm.Ry_id = '') then
        begin
          Application.MessageBox(pchar('ไม่พบรายการขอเครื่องราชอิสริยาภรณ์!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
          edSearchName.SelectAll;          
          exit;
        end;

        //LoadRoYal(SelectRy_Id) ;

        CdsRoYal.Close ;
        CdsRoYal.CommandText := ' select (r.ryname + ' +QuotedStr(' ') + '+ r.ryfname) as FuName '+
                                ',(d.do_name  + ' +QuotedStr(' ') + '+ d.do_lname ) as FuNamex,* '+
                                ' from royal R '+
                                ' left join royal_code C on r.ryrcode = c.ry_code '+
                                ' left join donator D on R.id = D.do_id '+
                                ' where id=''' + SelectRy_Id + '''/* and ryend=''N''*/ order by ryid' ;

        CdsRoYal.Open ;


        Do_Fname := CdsSearch.FieldByName('ryname').AsString ;
        Do_Lname := CdsSearch.FieldByName('ryfname').AsString ;
        LoadBill(SelectRy_Id,CdsRoYal.fieldbyname('ryid').AsString) ;

        frm.Free;
      end ;

    ParaRoyal := CdsRoYal.fieldbyname('id').AsString + CdsRoYal.fieldbyname('ryid').AsString  ;
    LbB.Caption := IntToStr(CdsBill.RecordCount) ;
    TxtJ.Caption := IntToStr(CdsRoYal.RecordCount) ;
    
    if CdsRoYal.RecordCount > 0 then cxGrid1.SetFocus
    else edSearchName.SetFocus ;
end;

procedure TfrmInsignia.LoadDonator(StrF,STrL: String);
begin
  CdsSearch.Close ;
  CdsSearch.CommandText := StrSqlRoyal  ;
  try
    Screen.Cursor := crHourGlass ;
    CdsSearch.open ;
  finally
    Screen.Cursor := crHourGlass ;
  end;

end;

procedure TfrmInsignia.edSearchNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then
   btnSearch.Click  ;
end;

procedure TfrmInsignia.edSearchLNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then
   btnSearch.Click  ;
end;

procedure TfrmInsignia.R1Click(Sender: TObject);
begin
  ChkRb := '1' ;
  edSearchName.SetFocus ;
end;

procedure TfrmInsignia.R2Click(Sender: TObject);
begin
  ChkRb := '2' ;
  edSearchName.SetFocus ;
end;

procedure TfrmInsignia.SetChkRb(const Value: String);
begin
  FChkRb := Value;
end;

procedure TfrmInsignia.LoadRoYal(Str: String);
begin
  CdsRoYal.Close ;
  CdsRoYal.CommandText := ' select (r.ryname + ' +QuotedStr(' ') + '+ r.ryfname) as FuName '+
                          ',(d.do_name  + ' +QuotedStr(' ') + '+ d.do_lname ) as FuNamex,* '+
                          ' from royal R '+
                          ' left join royal_code C on r.ryrcode = c.ry_code '+
                          ' left join donator D on R.id = D.do_id '+
                          ' where id=''' + str + '''/* and ryend=''N''*/ order by ryid' ;
  CdsRoYal.Open ;
end;

procedure TfrmInsignia.SetRy_Id(const Value: String);
begin
  FRy_Id := Value;
end;

procedure TfrmInsignia.LoadBill(Str1,Str2: String);
begin
  try
    CdsBill.Close ;
    CdsBill.CommandText := 'select A.bdate,A.bperiod,A.bno,b.bdno,b.bdobject,c.o_code'+
                                     ' ,c.o_abbr,c.o_title,a.btotal,b.bdamount '+
                                     ' from bill A left join billdetail B on A.bno=B.bdno '+
                                     ' left join object_code C on B.bdobject=c.o_code '+
                                     ' where bid = ' + QuotedStr(Str1) +
                                     ' and bryid='+QuotedStr(Str2) +
                                     ' group by A.bdate,A.bperiod,A.bno,b.bdno,b.bdobject,c.o_code'+
                                     ' ,c.o_abbr,c.o_title,a.btotal,b.bdamount'+
                                     ' order by A.bno'  ;
    CdsBill.open ;
  except end
end;

procedure TfrmInsignia.LoadRoYalDate(D1, D2: TDateTime);
begin
  CdsRoYal.Close ;
  CdsRoYal.CommandText := 'select A.ryid,A.id,A.ryrdate,A.ryininame,A.ryname,A.ryfname,A.rylevel,'+
            '(A.ryname +'+ QuotedStr (' ')+ ' + A.ryfname) as FuName, A.ryansdate'+
            ' ,B.ry_title ,A.rytotal from royal A '+
            ' left join royal_code B on A.ryrcode = B.ry_code where ryrdate between '+
            QuotedStr(FormatDateTime('yyyy-mm-dd',D1)) +
            ' and ' +
            QuotedStr(FormatDateTime('yyyy-mm-dd',D2)) + ' order by ryid' ;
//  InputBox('','',CdsRoYal.CommandText) ;
  CdsRoYal.Open ;
end;

procedure TfrmInsignia.CdsRoYalAfterScroll(DataSet: TDataSet);
begin
  LoadBill(CdsRoYal.fieldbyname('id').AsString,CdsRoYal.fieldbyname('ryid').AsString) ;
  LbB.Caption := IntToStr(CdsBill.RecordCount) ; 
  ParaRoyal := CdsRoYal.fieldbyname('id').AsString + CdsRoYal.fieldbyname('ryid').AsString ;
  Do_Fname := CdsRoYal.FieldByName('ryname').AsString ;
  Do_Lname := CdsRoYal.FieldByName('ryfname').AsString ;
end;

procedure TfrmInsignia.SetParaRoyal(const Value: String);
begin
  FParaRoyal := Value;
end;

procedure TfrmInsignia.SetDo_Fname(const Value: String);
begin
  FDo_Fname := Value;
  edSearchName.Text := Value ;
end;

procedure TfrmInsignia.SetDo_LName(const Value: String);
begin
  FDo_LName := Value;
  edSearchLName.Text := Value ;
end;

procedure TfrmInsignia.BtnHistInsigniaClick(Sender: TObject);
var frm : TFrmHistoryRoyal ;
begin
  try
    if ParaRoyal <> '' then
      begin
        LoadHistRoyal(CdsRoYal.FieldByName('Ryid').AsString) ;
        LoadRyCode ;
        frm := TFrmHistoryRoyal.Create(self);
        frm.MainForm := Self ;
        frm.ShowModal;
        frm.Free;
        cxGrid1.SetFocus ;
        CdsRoYal.Refresh ;
      end
    else
      begin
        Application.MessageBox('กรุณาเลือกรายการขอเครื่องราชฯ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
        edSearchName.SetFocus ;
      end;
  finally

  end;
end;

procedure TfrmInsignia.BtnSearchYearClick(Sender: TObject);
var  frm : TFrmSearchYear ;
begin
  frm := TFrmSearchYear.Create(self);
  frm.MainForm := Self ;
  frm.ShowModal;
  frm.Free;
  if ParaRoyal <> '' then cxGrid1.SetFocus
  else edSearchName.SetFocus ;
end;

procedure TfrmInsignia.BtnDelInsigniaClick(Sender: TObject);
begin
  try
    if ParaRoyal <> '' then
      begin
        if Application.MessageBox('ต้องการลบรายการขอเครื่องราชฯ','ลบการขอเครื่องราชฯ', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          CdsRoYal.Delete ;
          CdsRoYal.Refresh ;
          cxGrid1.SetFocus ;
        end;
      end
    else
      begin
        Application.MessageBox('กรุณาเลือกรายการขอเครื่องราชฯ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
        edSearchName.SetFocus
      end;


  finally

  end;
end;

procedure TfrmInsignia.R3Click(Sender: TObject);
begin
  DtStart.SetFocus ;
end;

procedure TfrmInsignia.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.DisplayTexts[9] = 'Y' then
  begin
    ACanvas.Brush.Color := _Status ;
  end;
end;

procedure TfrmInsignia.LoadHistRoyal(Str: String);
begin
  CdsHistRy.Close ;
  CdsHistRy.CommandText := 'select * from royal where ryid = ' + QuotedStr(Str) ;
  CdsHistRy.Open ;
end;

procedure TfrmInsignia.LoadRyCode;
begin
  CdsRyCode.Close ;
  CdsRyCode.CommandText := 'select * from royal_code order by ry_code' ;
  CdsRyCode.Open ; 
end;

procedure TfrmInsignia.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if ParaRoyal <> '' then
    begin
      ShowInsigniaRegister(Application,nil,swModal,ParaRoyal);
      cxGrid1.SetFocus ;
      CdsRoYal.Refresh ;
    end
  else
    begin
      Application.MessageBox('กรุณาเลือกรายการขอเครื่องราชฯ', 'ไม่มีรายการ', MB_OK + MB_ICONQUESTION);
      edSearchName.SetFocus ;
    end ;
end;

procedure TfrmInsignia.cxGrid1DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

procedure TfrmInsignia.cxGrid2DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
