unit ProjectsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, RzPanel, ExtCtrls, Provider, DB, SqlExpr,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBClient, RzCmboBx, RzDBEdit, DBCtrls, RzDBCmbo,
  RzRadGrp, RzDBRGrp ,StrUtils ;

type
  TfrmProjects = class(TForm)
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    pnClients: TRzPanel;
    pnTop: TRzPanel;
    grdPeroid: TcxGrid;
    grdPeroidDBTableView1: TcxGridDBTableView;
    grdPeroidLevel1: TcxGridLevel;
    Label2: TLabel;
    Label1: TLabel;
    BtnAdd: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnDel: TRzBitBtn;
    BtnSave: TRzBitBtn;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    cdsProjects: TClientDataSet;
    dsProjects: TDataSource;
    grdPeroidDBTableView1PjCode: TcxGridDBColumn;
    grdPeroidDBTableView1PjName: TcxGridDBColumn;
    grdPeroidDBTableView1PjCreateDate: TcxGridDBColumn;
    grdPeroidDBTableView1PjStatus: TcxGridDBColumn;
    Label3: TLabel;
    BtnCancel: TRzBitBtn;
    TxtCode: TRzDBEdit;
    Txt2: TRzDBEdit;
    Lbc1: TRzDBLookupComboBox;
    Label4: TLabel;
    Lbc2: TRzDBLookupComboBox;
    Label5: TLabel;
    Txt3: TRzDBEdit;
    CdsOPJ: TClientDataSet;
    CdsFund: TClientDataSet;
    DsOPJ: TDataSource;
    DsFund: TDataSource;
    RdgStatus: TRzDBRadioGroup;
    Auto_id: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure initForm();
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure cdsProjectsNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LoadProject ;
    procedure LoadOPJ ;
    procedure LoadFund ;
    function EnaBtn(E:Boolean):Boolean ;
    function AUTOID(F: string ;T:string;N:string): string;

  public
    { Public declarations }
  end;

var
  frmProjects: TfrmProjects;

implementation

uses CommonLIB, CommonUtils, uCiaXml;

{$R *.dfm}

procedure TfrmProjects.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  initDataset(self,conn);
end;

procedure TfrmProjects.initForm;
begin
  LoadProject ;
  LoadOPJ ;
  LoadFund ;
end;

procedure TfrmProjects.FormShow(Sender: TObject);
begin
  initForm ;
  TxtCode.SetFocus ;
  EnaBtn(False);
end;

procedure TfrmProjects.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmProjects.LoadProject;
begin
  cdsProjects.Close ;
  cdsProjects.CommandText := 'select * from projects order by pjcode' ;
  cdsProjects.Open ;
end;

procedure TfrmProjects.BtnAddClick(Sender: TObject);
begin
  cdsProjects.Append ;
  EnaBtn(True);
  TxtCode.SetFocus ;
end;

procedure TfrmProjects.BtnEditClick(Sender: TObject);
begin
  cdsProjects.Edit ;
  EnaBtn(True);
end;

procedure TfrmProjects.BtnDelClick(Sender: TObject);
begin
  if Application.MessageBox('ต้องการลบข้อมูล', 'ลบ', MB_OKCANCEL +
    MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  begin
    cdsProjects.Delete ;
    cdsProjects.ApplyUpdates(0) ; 
  end;
end;

procedure TfrmProjects.BtnSaveClick(Sender: TObject);
begin
  if  dsProjects.State in [dsinsert,dsedit] then
    begin
      if (cdsProjects.FieldByName('PjCode').AsString <> '') and (cdsProjects.FieldByName('PjName').AsString <> '') then
        begin
          if Application.MessageBox('ต้องการบันทึกข้อมูล', 'บันทึก', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
          begin
            cdsProjects.ApplyUpdates(0) ;
            EnaBtn(False);
          end;
        end
      else Application.MessageBox('กรุณากรอกข้อมูลให้ครบถ้วน', 'ข้อมูลไม่ครบ', MB_OK + MB_ICONQUESTION);
    end ;
end;

procedure TfrmProjects.BtnCancelClick(Sender: TObject);
begin
  cdsProjects.Cancel ;
  EnaBtn(False);
end;

function TfrmProjects.EnaBtn(E: Boolean): Boolean;
begin
  BtnAdd.Enabled := not E ;
  BtnEdit.Enabled := not E ;
  BtnSave.Enabled :=  E ;
  BtnCancel.Enabled :=  E ;
  TxtCode.ReadOnly := not E ;
  Txt2.ReadOnly := not E ;
  Txt3.ReadOnly := not E ;
  Lbc1.ReadOnly := not E ;
  lbc2.ReadOnly := not E ;
  RdgStatus.ReadOnly := not E ;
end;

procedure TfrmProjects.LoadOPJ;
begin
  CdsOPJ.Close ;
  CdsOPJ.CommandText := 'select * from object_code order by o_code' ;
  CdsOPJ.Open ;
end;

procedure TfrmProjects.LoadFund;
begin
  CdsFund.Close ;
  CdsFund.CommandText := 'select * from found_code order by fd_code' ;
  CdsFund.Open ;
end;

function TfrmProjects.AUTOID(F, T, N: string): string;
begin
  Auto_id.Close;
  Auto_id.CommandText:= 'select max( '+ F +' )as num from ' + T ;
  Auto_id.Open;
  if Auto_id.FieldByName('num').AsString = '' then
    begin Result := '00001' ; end
  else
    begin
      Result := RightStr(N + IntToStr(StrToInt(Auto_id.FieldByName('num').AsString) + 1 ),Length(N)) ;
    end;

end;

procedure TfrmProjects.cdsProjectsNewRecord(DataSet: TDataSet);
begin
  cdsProjects.FieldByName('PjCode').AsString := AUTOID('PjCode','projects','00000') ;
  cdsProjects.FieldByName('PjCreateDate').AsDateTime := Now ;
  cdsProjects.FieldByName('PjStatus').AsString := 'A' ;
end;

procedure TfrmProjects.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3: BtnAddClick(Sender) ;
    vk_f7: BtnEditClick(sender);
    vk_f9: BtnDelClick(sender);
    vk_f5: BtnSaveClick(sender);
    vk_f6: BtnCancelClick(sender);
  end;
end;

end.
