unit CustomerListFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxLookAndFeelPainters, DB, DBClient, Provider, jvuibdataset, jvuib,
  Grids, DBGrids, cxCheckBox, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, ExtCtrls, cxGraphics, cxLookAndFeels;

{$I CRG_WM_MSG.INC}

type
  TfrmCustomerList = class(TFrame)
    Panel1: TPanel;
    lbSearchText: TLabel;
    edSearchText: TcxTextEdit;
    btnSearch: TcxButton;
    cbFilter: TcxCheckBox;
    dbgList: TDBGrid;
    trnsDefault: TJvUIBTransaction;
    dsCustomer: TJvUIBDataSet;
    dspCustomer: TDataSetProvider;
    cdsCustomer: TClientDataSet;
    cdsCustomerRECORD_ID: TIntegerField;
    cdsCustomerCUSTOMER_TYPE: TSmallintField;
    cdsCustomerSTATUS_DESC: TStringField;
    cdsCustomerCODE: TStringField;
    cdsCustomerFULL_NAME: TStringField;
    cdsCustomerCUSTOMER_DESC: TStringField;
    dscCustomer: TDataSource;
    procedure FrameResize(Sender: TObject);
    procedure dbgListTitleClick(Column: TColumn);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchTextKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchTextPropertiesChange(Sender: TObject);
    procedure cbFilterPropertiesChange(Sender: TObject);
    procedure dbgListDblClick(Sender: TObject);
    procedure dbgListKeyPress(Sender: TObject; var Key: Char);
  private
    FColumnIndex: Integer;
    FMenuLanguage: String;

    FFirstSearch: Boolean;
    FSearchText: String;

    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
  public
    procedure LoadCIFlist();
    procedure FindText();

    property ColumnIndex: Integer read FColumnIndex write FColumnIndex;
    property FirstSearch: Boolean read FFirstSearch write FFirstSearch;
    property SearchText: String read FSearchText write FSearchText;
    property MenuLanguage: String read FMenuLanguage write FMenuLanguage;
  end;

function CreateCustomerListFrame(_Parent: TWinControl; _DBConn: TJvUIBDataBase;
  _SearchText: String = ''; _Alig: TAlign = alClient): TfrmCustomerList;

implementation

uses fbconnection;

{$R *.dfm}

function CreateCustomerListFrame(_Parent: TWinControl; _DBConn: TJvUIBDataBase;
  _SearchText: String = ''; _Alig: TAlign = alClient): TfrmCustomerList;
var
  _Form: TWinControl;
begin
  _Form := _Parent;
  while (not(_Form is TForm)) do
    _Form := _Form.Parent;

  Result := TfrmCustomerList.Create(_Parent);
  with (Result) do
  begin
    Parent := _Parent;
    Align := _Alig;
    trnsDefault.Database := _DBConn;

    ColumnIndex := -1;
    FirstSearch := True;
    SearchText := _SearchText;

    MenuLanguage := GetMenuLanguage();
    LoadCIFlist();

    if (Trim(SearchText) <> '') then
    begin
      edSearchText.Text := SearchText;
      btnSearchClick(btnSearch);
    end;

    TForm(_Form).ActiveControl := dbgList;
  end;
end;

procedure TfrmCustomerList.LanguageChaged(var Message: TMessage);
begin
  FMenuLanguage := GetMenuLanguage();
//  LoadComponents('cif_cus.dll', Name, FMenuLanguage, Self, trnsDefault);
//  SaveComponents('cif_cus.dll', Name, 'ENG', Self, trnsDefault);

  LoadCIFlist();
end;

procedure TfrmCustomerList.LoadCIFlist();
var
  _Form: TWinControl;
begin
  _Form := Parent;
  while (not(_Form is TForm)) do
    _Form := _Form.Parent;

  cdsCustomer.Close();
  dsCustomer.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;
  cdsCustomer.Open();

  PostMessage(
    _Form.Handle,
    WM_RELOADED_DATA,
    Integer(cdsCustomer.IsEmpty), 0);
end;

procedure TfrmCustomerList.FindText();
begin
  btnSearchClick(btnSearch);
end;

procedure TfrmCustomerList.FrameResize(Sender: TObject);
begin
  dbgList.Columns[1].Width :=
    dbgList.Width - dbgList.Columns[0].Width - dbgList.Columns[2].Width -
    dbgList.Columns[3].Width - 30;
end;

procedure TfrmCustomerList.dbgListTitleClick(Column: TColumn);
begin {
  if (FColumnIndex <> -1) then
    dbgList.Columns.Items[FColumnIndex].Title.Color := clBtnFace;

  if (Column.Index = FColumnIndex) then
  begin
    dbgList.Columns.Items[FColumnIndex].Title.Color := clBtnFace;
    FColumnIndex := -1;
  end else
  begin
    FColumnIndex := Column.Index;
    dbgList.Columns.Items[FColumnIndex].Title.Color := clOlive;
  end; }
end;

procedure TfrmCustomerList.btnSearchClick(Sender: TObject);
var
  _mbID: Integer;
begin
  if (Trim(edSearchText.Text) = '') then
    Exit;

  FSearchText := edSearchText.Text;

  cdsCustomer.Filter :=
    'STATUS_DESC LIKE ' + QuotedStr('%' + Trim(FSearchText) + '%') + ' OR ' +
    'CODE LIKE ' + QuotedStr('%' + Trim(FSearchText) + '%') + ' OR ' +
    'FULL_NAME LIKE ' + QuotedStr('%' + Trim(FSearchText) + '%') + ' OR ' +
    'PERSONAL_DESC LIKE ' + QuotedStr('%' + Trim(FSearchText) + '%');

  if (cbFilter.Checked) then
  begin
    cdsCustomer.Filtered := True;
    dbgList.Invalidate();
  end else
  if (FFirstSearch) then
  begin
    if (cdsCustomer.FindFirst()) then
    begin
      dbgList.SetFocus();
      FFirstSearch := False
    end else
      if (FMenuLanguage = 'ENG') then
        Application.MessageBox(
          'Your specified data not found',
          'Search', MB_OK or MB_ICONINFORMATION)
      else
      if (FMenuLanguage = 'THA') then
        Application.MessageBox(
          'ไม่พบข้อมูลที่ต้องการค้นหา',
          'ค้นหา', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    if (not cdsCustomer.FindNext()) then
    begin
      _mbID := 0;
      if (FMenuLanguage = 'ENG') then
      begin
        _mbID :=
          Application.MessageBox(
            PChar(
              'The search was reached to the end of found data.'#10#13 +
              'Do you want to restart searching againg?'),
            'Search', MB_YESNO or MB_ICONINFORMATION)
      end else
      if (FMenuLanguage = 'THA') then
      begin
        _mbID :=
          Application.MessageBox(
            PChar(
              'การค้นหามาถึงเรคอร์ดสุดท้ายที่อยู่ในเงื่อนไขแล้ว'#10#13 +
              'คุณต้องการเริ่มต้นค้นใหม่อีกครั้งหรือเปล่า?'),
            'ค้นหา', MB_YESNO or MB_ICONINFORMATION)
      end;

      if (_mbID = idYes) then
      begin
        FFirstSearch := True;
        btnSearchClick(btnSearch);
      end;
    end else
      dbgList.SetFocus();
  end;
end;

procedure TfrmCustomerList.edSearchTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    btnSearchClick(btnSearch);
  end;
end;

procedure TfrmCustomerList.edSearchTextPropertiesChange(Sender: TObject);
begin
  FFirstSearch := (FSearchText <> edSearchText.Text);
end;

procedure TfrmCustomerList.cbFilterPropertiesChange(Sender: TObject);
begin
  if (cbFilter.Checked) then
    btnSearchClick(btnSearch)
  else
  begin 
    cdsCustomer.Filtered := False;
    dbgList.Invalidate();
  end;

  FFirstSearch := True;
end;

procedure TfrmCustomerList.dbgListDblClick(Sender: TObject);
var
  _Form: TWinControl;
begin
  _Form := Parent;
  while (not(_Form is TForm)) do
    _Form := _Form.Parent;

  PostMessage(
    _Form.Handle,
    WM_POSTED_DBCLICK,
    cdsCustomerRECORD_ID.Value,
    cdsCustomerCUSTOMER_TYPE.Value);
end;

procedure TfrmCustomerList.dbgListKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    dbgListDblClick(dbgList);
  end;
end;

end.
