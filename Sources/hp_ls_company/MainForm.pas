unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, SmoothShow, ExtCtrls, ComCtrls, FMTBcd,
  StdCtrls, DBClient, Provider, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, Grids, DBGrids, cxDBEdit,
  DBCtrls, cxMaskEdit, cxDropDownEdit, frxClass, frxDBSet, cxCheckBox, jpeg;

type
  TfrmMain = class(TForm)
    Connection: TSQLConnection;
    ssShow: TSmoothShow;
    stbStatus: TStatusBar;
    tmTime: TTimer;
    dsData: TSQLQuery;
    dspData: TDataSetProvider;
    cdsData: TClientDataSet;
    dscData: TDataSource;
    GroupBox1: TGroupBox;
    lbTitle: TLabel;
    btnCancel: TcxButton;
    cdsDataCEO_NAME: TStringField;
    cdsDataCOMPANY_NAME: TStringField;
    cdsDataADDRESS1: TStringField;
    cdsDataADDRESS2: TStringField;
    cdsDataTELEPHONE_NO: TStringField;
    cdsDataFAX_NO: TStringField;
    cdsDataREG_INVESTMENT: TFMTBCDField;
    dbgList: TDBGrid;
    edSearchText: TcxTextEdit;
    btnSearch: TcxButton;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    DBNavigator1: TDBNavigator;
    lbHeader: TLabel;
    cbOrderBy: TcxComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    cdsDataWWW: TStringField;
    Label5: TLabel;
    btnApply: TcxButton;
    btnPrintAll: TcxButton;
    btnPrint: TcxButton;
    frData: TfrxDBDataset;
    cdsDataIS_INTERESTED: TIntegerField;
    cdsDataIS_CUSTOMER: TIntegerField;
    cxDBCheckBox1: TcxDBCheckBox;
    cxButton1: TcxButton;
    edbWWW: TcxDBTextEdit;
    imgStared: TImage;
    frPrint: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmTimeTimer(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure edSearchTextKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDataAfterPost(DataSet: TDataSet);
    procedure btnApplyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgListDblClick(Sender: TObject);
    procedure btnPrintAllClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure imgStaredDblClick(Sender: TObject);
    procedure stbStatusHint(Sender: TObject);
  private
    FFirstSearch: Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses IniFiles;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  _conf_file: String;
begin
 Left := (Screen.Width - Width) div 2;
 Top := (Screen.Height - Height) div 2;

 stbStatus.Panels[1].Text :=
    FormatDateTime(' dd/mm/eeee hh:mm:ss', Now());

  _conf_file := ExtractFileName(Application.ExeName);
  _conf_file := Copy(_conf_file, 1, Pos('.', _conf_file) - 1);
  _conf_file :=
    ExtractFilePath(Application.ExeName) +
    PathDelim + _conf_file + '.conf';

 with TIniFile.Create(_conf_file) do
 try
   Connection.Params.Values['Database'] :=
     ReadString('database', 'server', 'localhost') + ':' +
     ReadString('database', 'name', '');
   Connection.Params.Values['User_Name'] :=
     ReadString('database', 'user', '');
   Connection.Params.Values['Password'] :=
     ReadString('database', 'password', '');
 finally
   Free();
 end;

 try
   Connection.Open();
 except
   on E: Exception do
   begin
     Application.MessageBox(
       PChar('Cannot connect to datbase server with error message:'#10#10#13 +
         E.Message), 'Error', MB_OK or MB_ICONERROR);
       
     Application.Terminate();
   end;
 end;

 FFirstSearch := True;

 cdsData.Open();

 lbHeader.Caption :=
   Format(' %d Companies found.', [cdsData.RecordCount]);

 cbOrderBy.ItemIndex := 1;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ssShow.Execute();
end;

procedure TfrmMain.tmTimeTimer(Sender: TObject);
begin
  stbStatus.Panels[1].Text :=
    FormatDateTime(' dd/mm/eeee hh:mm:ss', Now());
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  if (not btnSearch.Enabled) then
  begin
    Application.MessageBox(
      'Please disable a stared filtering to enable searching.',
      'Message', MB_OK or MB_ICONINFORMATION);

    Exit;
  end;

  if (Trim(edSearchText.Text) = '') then
    Exit;

  cdsData.Filter :=
    'CEO_NAME LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'COMPANY_NAME LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'ADDRESS1 LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'ADDRESS2 LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'TELEPHONE_NO LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'FAX_NO LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%');

  if (FFirstSearch) then
  begin
    if (cdsData.FindFirst()) then
      FFirstSearch := False
    else
      Application.MessageBox(
        'ไม่พบข้อมูลที่ต้องการค้นหา',
        'Message', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    if (not cdsData.FindNext()) then
    begin
      if (Application.MessageBox(
            'การค้นหามาถึงเรคอร์ดสุดท้ายแล้ว คุณต้องการเริ่มต้นค้นใหม่หรือเปล่า?',
            'Message', MB_YESNO or MB_ICONINFORMATION) = idYes) then
        FFirstSearch := True;
    end;
  end;
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmMain.cxComboBox1PropertiesChange(Sender: TObject);
begin
  case cbOrderBy.ItemIndex of
    0: cdsData.IndexFieldNames := 'CEO_NAME';
    1: cdsData.IndexFieldNames := 'COMPANY_NAME';
    2: cdsData.IndexFieldNames := 'REG_INVESTMENT';
  end
end;

procedure TfrmMain.edSearchTextKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnSearchClick(btnSearch);

  FFirstSearch := True;
end;

procedure TfrmMain.cdsDataAfterPost(DataSet: TDataSet);
begin
  btnApply.Enabled := True;

  lbHeader.Caption :=
   Format(' %d Companies found, %d record(s) was changed',
     [cdsData.RecordCount, cdsData.ChangeCount]);
end;

procedure TfrmMain.btnApplyClick(Sender: TObject);
begin
  cdsData.ApplyUpdates(-1);

  btnApply.Enabled := False;

  lbHeader.Caption :=
   Format(' %d Companies found, no record changed found',
     [cdsData.RecordCount, cdsData.ChangeCount]);
end;

procedure TfrmMain.btnPrintClick(Sender: TObject);
var
  _CompanyName: String;
  _FilterStr: String;
  _Filtered: Boolean;
begin
  cdsData.DisableControls();
  _CompanyName := cdsDataCOMPANY_NAME.Value;
  _Filtered := cdsData.Filtered;
  _FilterStr := cdsData.Filter;
  if (_Filtered) then
    cdsData.Filter :=
      _FilterStr + 'AND COMPANY_NAME = ' + QuotedStr(_CompanyName)
  else
    cdsData.Filter := 'COMPANY_NAME = ' + QuotedStr(_CompanyName);

  cdsData.Filtered := True;
  try
    frPrint.PrepareReport();
    frPrint.ShowReport();
  finally
    cdsData.Filter := _FilterStr;
    cdsData.Filtered := _Filtered;
    cdsData.Locate('COMPANY_NAME', _CompanyName, []);
    cdsData.EnableControls();
  end;
end;

procedure TfrmMain.dbgListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  _BackGroundColor, _FontColor: TColor;
  _FontStyle: TFontStyles;
begin
  if (gdFocused in State) then
  begin
    _BackGroundColor := $000080FF;
    _FontColor := clWhite;
  end else
  if (gdSelected in State) then
  begin
    _BackGroundColor := $000080FF;
    _FontColor := clBlack;
  end else
  begin
    _BackGroundColor := clWindow;
    _FontColor := clBlack;
  end;

  _FontStyle := [];

  if (cdsDataIS_INTERESTED.Value = 1)then
  begin
    if (_BackGroundColor <> $000080FF) then
    begin
//      _FontColor := clRed;
      _FontStyle := [fsBold];
      _BackGroundColor := $00E1FFFF;
    end else
    begin
//      _FontColor := clRed;
      _FontStyle := [fsBold];
    end;
  end;

  dbgList.Canvas.Brush.Color := _BackGroundColor;
  dbgList.Canvas.Font.Color := _FontColor;
  dbgList.Canvas.Font.Style := _FontStyle;


  dbgList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.dbgListDblClick(Sender: TObject);
begin
  if not (cdsData.State in [dsEdit, dsInsert]) then
    cdsData.Edit();

  try
    if (cdsDataIS_INTERESTED.Value = 1) then
      cdsDataIS_INTERESTED.Value := 0
    else
      cdsDataIS_INTERESTED.Value := 1;
  finally
    cdsData.Post();
  end;
end;

procedure TfrmMain.btnPrintAllClick(Sender: TObject);
var
  _CompanyName: String;
  _Filtered: Boolean;
begin
  cdsData.DisableControls();
  _CompanyName := cdsDataCOMPANY_NAME.Value;
  _Filtered := cdsData.Filtered;
  try
    frPrint.PrepareReport();
    frPrint.ShowReport();
  finally
    cdsData.Filtered := _Filtered;
    cdsData.Locate('COMPANY_NAME', _CompanyName, []);
    cdsData.EnableControls();
  end;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
begin
  WinExec(PChar(Trim(edbWWW.Text)), SW_SHOW);
end;

procedure TfrmMain.imgStaredDblClick(Sender: TObject);
begin
  imgStared.Tag := Integer(not Boolean(imgStared.Tag));

  if (Boolean(imgStared.Tag)) then
  begin
     cdsData.Filter := 'IS_INTERESTED = 1';
     cdsData.Filtered := True;
  end else
  begin
     cdsData.Filter := '';
     cdsData.Filtered := False;
  end;

  btnSearch.Enabled := (imgStared.Tag = 0);

  FFirstSearch := True;
end;

procedure TfrmMain.stbStatusHint(Sender: TObject);
begin
  stbStatus.Panels[2].Text := ' ' + GetLongHint(Application.Hint);
end;

end.
