unit kvpFrm;

interface

uses
  Windows, Forms, Messages, SysUtils, DBXpress, FMTBcd, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, RzButton,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ExtCtrls, Controls, StdCtrls, RzCmboBx,
  RzDBCmbo, Mask, RzEdit, RzDBEdit, RzLabel, Classes, RzPanel ,StrUtils,
  DBCtrls, RzDBNav, Dialogs ;



type
  TFormKVP = class(TForm)
    RzPanel1: TRzPanel;
    Panel2: TPanel;
    DsKvp: TDataSource;
    conn: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    CdsKvp: TClientDataSet;
    Auto: TClientDataSet;
    Autorun: TClientDataSet;
    RzPanel2: TRzPanel;
    record_id: TRzDBEdit;
    key_id: TRzDBEdit;
    category_id: TRzDBEdit;
    sub_category_id: TRzDBEdit;
    key_name: TRzDBEdit;
    key_value: TRzDBEdit;
    Status: TRzDBComboBox;
    RzLabel2: TRzLabel;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    BtnAdd: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnSave: TRzBitBtn;
    BtnDel: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    RzPanel5: TRzPanel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MmDes1: TRzDBMemo;
    MmDes2: TRzDBMemo;
    RzDBNavigator1: TRzDBNavigator;
    rzTopPanel: TRzPanel;
    procedure FormShow(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure CdsKvpNewRecord(DataSet: TDataSet);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1CustomDrawColumnHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    procedure loadKvp ;
    function AUTOID(F: string): string;
    function AUTOVALUE(B: string): string;
    function EnaBtn (R:Boolean): Boolean ;
  public
    { Public declarations }
  end;

var
  FormKVP: TFormKVP;

implementation

uses CommonLIB;

{$R *.dfm}

{ TFormKVP }

procedure TFormKVP.loadKvp;
begin
  CdsKvp.Close ;
  CdsKvp.CommandText:='select * FROM KVP_Table';
  CdsKvp.Open;
end;

procedure TFormKVP.FormShow(Sender: TObject);
begin
  loadKvp ;
  EnaBtn(True) ;
end;

procedure TFormKVP.BtnAddClick(Sender: TObject);
begin
  EnaBtn(False);
  CdsKvp.Append;
  category_id.SetFocus ;
end;

procedure TFormKVP.CdsKvpNewRecord(DataSet: TDataSet);
begin
  CdsKvp.FieldByName('key_status').AsString := 'B';
  CdsKvp.FieldByName('record_id').AsString :=  AUTOID('record_id');
  CdsKvp.FieldByName('key_id').AsString :=  AUTOVALUE('key_id') ;
end;

procedure TFormKVP.BtnEditClick(Sender: TObject);
begin
  CdsKvp.Edit ;
  EnaBtn(False);
  category_id.SetFocus ;
end;

procedure TFormKVP.BtnDelClick(Sender: TObject);
begin
  if Application.MessageBox('��ͧ��÷ӡ��ź������', 'ź������', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    CdsKvp.Delete ;
    CdsKvp.ApplyUpdates(0) ;
  end;
end;

procedure TFormKVP.BtnSaveClick(Sender: TObject);
begin
  if Application.MessageBox('��ͧ��÷ӡ�úѹ�֡������', '�ѹ�֡������',MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    CdsKvp.ApplyUpdates(0) ;
    EnaBtn(True);
  end;
end;

procedure TFormKVP.BtnCancelClick(Sender: TObject);
begin
  CdsKvp.Cancel ;
  EnaBtn(True);
end;

function TFormKVP.AUTOID(F: string): string;
begin
  Auto.Close;
  Auto.CommandText:= 'select max('+F+')as record_id from KVP_Table' ;
  Auto.Open;
  if Auto.FieldByName('record_id').AsString = '' then
    begin
      Result :='01';
    end
  else
  Result := RightStr('00'+IntToStr(StrToInt(Auto.FieldByName('record_id').AsString) + 1 ), 2) ;
end;

function TFormKVP.AUTOVALUE(B: string): string;
begin
  Autorun.Close;
  Autorun.CommandText:= 'select max('+B+')as key_id from KVP_Table' ;
  Autorun.Open;
  if Autorun.FieldByName('key_id').AsString = '' then
    begin
      Result :='01';
    end
  else
  Result := RightStr('00'+IntToStr(StrToInt(Autorun.FieldByName('key_id').AsString) + 1 ), 2) ;
end;

function TFormKVP.EnaBtn(R: Boolean): Boolean;
begin
  BtnAdd.Enabled     := R ;
  BtnEdit.Enabled    := R ;
  BtnSave.Enabled    := not R ;
  BtnCancel.Enabled  := not R ;
  record_id.ReadOnly := R ;
  key_id.ReadOnly    := R ;
  key_name.ReadOnly  := R ;
  key_value.ReadOnly := R ;
  MmDes1.ReadOnly    := R ;
  MmDes2.ReadOnly    := R ;
  Status.ReadOnly    := R ;
  category_id.ReadOnly := R ;
  sub_category_id.ReadOnly := R ;
end;

procedure TFormKVP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3: BtnAddClick(Sender) ;
    vk_f7: BtnEditClick(sender) ;
    vk_f9: if DsKvp.State in [dsinsert,dsedit] then BtnDelClick(sender);
    vk_f5: if DsKvp.State in [dsinsert,dsedit] then BtnSaveClick(sender);
  end;
end;

procedure TFormKVP.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then Self.Close;
end;

procedure TFormKVP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TFormKVP.cxGrid1DBTableView1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  ACanvas.Canvas.Brush.Color:=GridBgColor;
  ACanvas.Canvas.Font.Color:=0;
end;

end.
