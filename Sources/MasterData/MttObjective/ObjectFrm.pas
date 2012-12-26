unit ObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxStyles,  cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxDBLookupComboBox,
  cxTextEdit, cxDBEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxNavigator, cxDBNavigator, StdCtrls, cxButtons,
   ComCtrls,  ExtCtrls, ImgList,
    frxClass, frxExportXLS, frxDBSet,
  DBXpress, FMTBcd, SqlExpr, Provider, DBClient,  Grids, DBGrids, RzLabel,
  RzPanel,
  RzButton, RzTabs, RzCmboBx, RzDBCmbo, Mask, RzEdit, RzDBEdit, RzDBNav,
  DBCtrls;

type
  TFrmObject = class(TForm)
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    pnBody: TRzPanel;
    RzPanel2: TRzPanel;
    DSOJcode: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxReport1: TfrxReport;
    ds_Account: TDataSource;
    ds_Bankbook: TDataSource;
    ClientDataObject: TClientDataSet;
    DataSetProObject: TDataSetProvider;
    Conn: TSQLConnection;
    SQLDataObject: TSQLDataSet;
    DsFCode: TDataSource;
    ClientDataFound: TClientDataSet;
    Auto_Id: TClientDataSet;
    DataSetProFound: TDataSetProvider;
    ClientDataRun: TClientDataSet;
    DataSetProRun: TDataSetProvider;
    pnTop: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    RzDBComboBox3: TRzDBComboBox;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzPanel4: TRzPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1fd_code: TcxGridDBColumn;
    cxGrid1DBTableView1fd_title: TcxGridDBColumn;
    cxGrid1DBTableView1fd_acccode: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1fd_since: TcxGridDBColumn;
    cxGrid1DBTableView1fd_abbr: TcxGridDBColumn;
    cxGrid1DBTableView1fd_start: TcxGridDBColumn;
    cxGrid1DBTableView1fd_end: TcxGridDBColumn;
    cxGrid1DBTableView1fd_budget: TcxGridDBColumn;
    cxGrid1DBTableView1fd_status: TcxGridDBColumn;
    cxGrid1DBTableView1fd_codetype: TcxGridDBColumn;
    cxGrid1DBTableView1fd_owner: TcxGridDBColumn;
    cxGrid1DBTableView1fd_prefix: TcxGridDBColumn;
    cxGrid1DBTableView1fd_flagpay: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1o_acccode: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1o_desc2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    btnNew: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnSave: TRzBitBtn;
    btnCancel: TRzBitBtn;
    btnPrint: TRzBitBtn;
    btnObjNew: TRzBitBtn;
    btnObjEdit: TRzBitBtn;
    btnObjSave: TRzBitBtn;
    btnObjCancel: TRzBitBtn;
    DBNavigator1: TDBNavigator;
    SatinImg16: TImageList;
    procedure cxButton11Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxButton71Click(Sender: TObject);
    procedure aaClick(Sender: TObject);
    procedure ccccClick(Sender: TObject);
    procedure vvClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RzDBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure RzDBEdit1Change(Sender: TObject);
    procedure RzDBEdit1Exit(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnObjNewClick(Sender: TObject);
    procedure btnObjEditClick(Sender: TObject);
    procedure btnObjCancelClick(Sender: TObject);
    procedure btnObjSaveClick(Sender: TObject);
    procedure ClientDataObjectAfterScroll(DataSet: TDataSet);
  private
    procedure FocusNextCell(AView: TcxGridTableView);
    procedure setBtnObjective(_new,_edit,_save,_cancel,print:boolean);
    procedure setBtnFund(_new,_edit,_save,_cancel:boolean);
  public
    { Public declarations }
  end;

var
  FrmObject: TFrmObject;

implementation

uses CommonLIB, NewFundFrm;

{$R *.dfm}

procedure TFrmObject.cxButton11Click(Sender: TObject);
begin

DSOJcode.DataSet.Append;
RzDBEdit1.SetFocus;
end;

procedure TFrmObject.cxButton3Click(Sender: TObject);
var x : Integer ;
    str : string ;
begin
  Str := '' ;
    begin
      if ClientDataObject.fieldbyname('o_running').AsString <> '' then
        begin
          for x := 1 to  ClientDataObject.fieldbyname('o_running_len').AsInteger do
           begin
             str:= str + '0' ;
           end;
     //     DsFCode.DataSet.Append ;
          DsFCode.DataSet.FieldByName('fd_code').AsString := FormatFloat(str,StrToInt(ClientDataObject.fieldbyname('o_running').AsString)+1) ;
        end
      else
        begin
          Auto_Id.Close;
          Auto_Id.CommandText := 'select max(fd_code) as Max_Id from found_code where fd_codetype =' + QuotedStr(ClientDataObject.fieldbyname('o_codefd').AsString) ;
          Auto_Id.Open;
          ClientDataRun.Close;
          ClientDataRun.CommandText:='SELECT *  FROM MTTCDE where MTTABR = ''FNDRUNING '' ';
          ClientDataRun.Open;
          for x := 1 to  ClientDataRun.fieldbyname('MTTNM1').AsInteger do
           begin
             str:= str + '0' ;
           end;
          DsFCode.DataSet.Append;
          DsFCode.DataSet.FieldByName('fd_code').AsString := FormatFloat(str,StrToInt(Auto_Id.fieldbyname('Max_Id').AsString)+1) ;
          DsFCode.DataSet.Post ;
        end;
    end;
     
     cxGrid1.SetFocus;
     cxGrid1DBTableView1.Columns[0].Focused:=True;
end;

procedure TFrmObject.cxButton4Click(Sender: TObject);
begin
DsFCode.DataSet.Edit;
end;

procedure TFrmObject.cxButton5Click(Sender: TObject);
begin
DsFCode.DataSet.Cancel;
end;

procedure TFrmObject.cxButton6Click(Sender: TObject);
begin
ClientDataFound.ApplyUpdates(-1);
end;

procedure TFrmObject.FocusNextCell(AView: TcxGridTableView);
var
  AColumn: TcxGridColumn;
begin
  AColumn := AView.Controller.FocusedColumn;
  if AView.Controller.FocusedRow.IsData then
  begin
    if AColumn.VisibleIndex < AView.VisibleColumnCount - 1 then
      AView.VisibleColumns[AColumn.VisibleIndex + 1].Focused := True
    else
      if AView.Controller.FocusNextRecord(AView.Controller.FocusedRecordIndex, True, True, False) and AView.Controller.FocusedRecord.HasCells then
        AView.VisibleColumns[0].Focused := True;
  end
  else
    if AView.Controller.FocusNextRecord(AView.Controller.FocusedRecordIndex, True, True, False) and AView.Controller.FocusedRecord.HasCells then
      AView.VisibleColumns[0].Focused := True;
  AView.Controller.EditingController.ShowEdit();
 end;


procedure TFrmObject.cxGridDBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  var
  ASite: TcxGridSite;
begin

end;

procedure TFrmObject.FormShow(Sender: TObject);
begin

SetControl(pnTop,false);

ClientDataObject.Close;
ClientDataObject.CommandText := 'select * from object_code order by  cast(o_code as integer )';
ClientDataObject.Open;

end;

procedure TFrmObject.cxGrid1DBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  var
    Asite :TcxGridSite;
begin
 if Key = VK_RETURN then
  begin
    ASite := TcxGridSite(Sender);
    FocusNextCell(TcxGridTableView(Sender));
    Key := 0;
  end;
end;

procedure TFrmObject.cxButton71Click(Sender: TObject);
begin
DSOJcode.DataSet.Edit;
end;

procedure TFrmObject.aaClick(Sender: TObject);
begin
DSOJcode.DataSet.Cancel;
end;

procedure TFrmObject.ccccClick(Sender: TObject);
begin
ClientDataObject.ApplyUpdates(-1);
end;

procedure TFrmObject.vvClick(Sender: TObject);
var
  sRep : string;
begin
 sRep := ExtractFilePath(Application.ExeName)+'Reports\fon.fr3';
  if not FileExists( sRep ) then
  begin
    MessageDlg('หาไฟล์ Report ไม่เจอ :'+sRep,  mtWarning, [mbOK], 0);
    Exit;
  end;

//  frxReport1.LoadFromFile( sRep ) ;
//   DM_Main.Cds_Fcode.DisableControls;
//    try
//      frxReport1.PrepareReport(true);
//    if frmMain.ReportDesignMode then
//      frxReport1.DesignReport
//    else
//      frxReport1.ShowPreparedReport;
//    finally
//      DM_Main.Cds_Fcode.EnableControls;
//    end;
end;

procedure TFrmObject.btnCloseClick(Sender: TObject);
begin
Self.Close;
end;

procedure TFrmObject.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TFrmObject.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  SetupHackedNavigator(DBNavigator1, SatinImg16);
end;

procedure TFrmObject.RzDBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
  begin
    Key:=VK_TAB;
  end;
end;

procedure TFrmObject.TabSheet2Show(Sender: TObject);
begin
 if RzDBEdit1.Text='' then
   begin
     //RzButton1.Enabled :=False;
     //RzButton2.Enabled :=False;
     //RzButton3.Enabled :=False;
     //RzButton4.Enabled :=False;
   end
 else
end;

procedure TFrmObject.RzDBEdit1Change(Sender: TObject);
begin
if RzDBEdit1.Text <> '' then
   begin
     //RzButton1.Enabled :=True;
     //RzButton2.Enabled :=True;
     //RzButton3.Enabled :=True;
     //RzButton4.Enabled :=True;
   end;
end;

procedure TFrmObject.RzDBEdit1Exit(Sender: TObject);
begin

{
if RzDBEdit1.Text = '' then
   begin
    if Application.MessageBox('กรุณากรอกรหัส ?', 'Warning', MB_OKCANCEL + 
      MB_ICONWARNING) = IDOK then
    begin
      RzDBEdit1.SetFocus;
    // RzButton1.Enabled :=False;
    // RzButton2.Enabled :=False;
    // RzButton3.Enabled :=False;
     //RzButton4.Enabled :=False;
    end;
   end;

   }

end;

procedure TFrmObject.btnEditClick(Sender: TObject);
begin
  SetControl(pnTop,true);
  DSOJcode.DataSet.Edit;
end;

procedure TFrmObject.btnCancelClick(Sender: TObject);
begin
DSOJcode.DataSet.Cancel;
SetControl(pnTop,false);
end;

procedure TFrmObject.btnNewClick(Sender: TObject);
begin
SetControl(pnTop,true);
DSOJcode.DataSet.Append;
RzDBEdit1.SetFocus;
 if RzDBEdit1.Text='' then
   begin
     //RzButton1.Enabled :=False;
     //RzButton2.Enabled :=False;
     //RzButton3.Enabled :=False;
     //RzButton4.Enabled :=False;
   end ;
end;

procedure TFrmObject.btnSaveClick(Sender: TObject);
begin
 ClientDataObject.ApplyUpdates(0);
 SetControl(pnTop,false);
end;

procedure TFrmObject.btnPrintClick(Sender: TObject);
var
  sRep : string;
begin
 sRep := ExtractFilePath(Application.ExeName)+'Reports\fon.fr3';
  if not FileExists( sRep ) then
  begin
    MessageDlg('หาไฟล์ Report ไม่เจอ :'+sRep,  mtWarning, [mbOK], 0);
    Exit;
  end;
end;

procedure TFrmObject.btnObjNewClick(Sender: TObject);
var x,IDLEN : Integer ;
    str : string ;
   MAXID:string;
   frm : TfrmNewFund;
begin

  frm := TfrmNewFund.Create(self);
  frm.ShowModal;
  frm.Free;

exit;

Str := '' ;
    begin
      if ClientDataObject.fieldbyname('o_running').AsString <> '' then
        begin
          MAXID := ClientDataObject.fieldbyname('o_running').AsString;
        end
      else
        begin
          Auto_Id.Close;
          Auto_Id.CommandText := 'select max(fd_code) as Max_Id from found_code where fd_codetype =' + QuotedStr(ClientDataObject.fieldbyname('o_codefd').AsString) ;
          Auto_Id.Open;

          if trim(Auto_Id.fieldbyname('Max_Id').AsString) <> '' then
            MAXID := Auto_Id.fieldbyname('Max_Id').AsString
          else  MAXID := '1';
        end;

        if Trim(ClientDataObject.fieldbyname('o_running_len').AsString) <> '' then
        begin
          IDLEN := ClientDataObject.fieldbyname('o_running_len').AsInteger;
        end
        else
        begin
          ClientDataRun.Close;
          ClientDataRun.CommandText:='SELECT  *  FROM found_code where fd_codetype = ''' + ClientDataObject.fieldbyname('o_codefd').AsString + '''';
          ClientDataRun.Open;
          if not ClientDataRun.IsEmpty then
          begin
            IDLEN := Length(ClientDataRun.fieldbyname('fd_code').AsString);
          end
          else
          begin
            ClientDataRun.Close;
            ClientDataRun.CommandText:='SELECT *  FROM MTTCDE where MTTABR = ''FNDRUNING'' ';
            ClientDataRun.Open;

            if not ClientDataRun.IsEmpty then
            begin
              IDLEN := ClientDataRun.fieldbyname('MTTNM1').AsInteger;
            end
            else IDLEN := 4;
          end;
        end;

        for x := 1 to IDLEN  do
        begin
          str:= str + '0' ;
        end;

        DsFCode.DataSet.Append ;
        DsFCode.DataSet.FieldByName('fd_code').AsString := FormatFloat(str,StrToInt(MAXID)+1) ;
        ClientDataFound.ApplyUpdates(-1);
        DSOJcode.DataSet.Edit;
        ClientDataObject.FieldByName('O_RUNNING_LEN').AsInteger := IDLEN;
        ClientDataObject.FIELDBYNAME('O_RUNNING').AsInteger:=StrToInt( DsFCode.DataSet.FieldByName('fd_code').AsString);
        ClientDataObject.ApplyUpdates(-1);
        DSOJcode.DataSet.Edit;
    end;

     cxGrid1.SetFocus;
     cxGrid1DBTableView1.Columns[1].Focused:=True;

end;

procedure TFrmObject.btnObjEditClick(Sender: TObject);
begin
  DsFCode.DataSet.Edit;
end;

procedure TFrmObject.btnObjCancelClick(Sender: TObject);
begin
  DsFCode.DataSet.Cancel;
end;

procedure TFrmObject.btnObjSaveClick(Sender: TObject);
begin
  ClientDataFound.ApplyUpdates(0);
end;

procedure TFrmObject.ClientDataObjectAfterScroll(DataSet: TDataSet);
begin
  if UpperCase(trim(DataSet.FieldByName('o_flag').AsString))='I' then
  begin
    ClientDataFound.Close;
    ClientDataFound.CommandText := 'select * from found_code where fd_codetype='''+DataSet.FieldByName('o_codefd').AsString+''' order by fd_code';
    ClientDataFound.Open;
    setBtnFund(true,true,false,false);
  end else
  begin
   setBtnFund(false,false,false,false);
   ClientDataFound.Close;
  end;
end;


procedure TFrmObject.setBtnFund(_new, _edit, _save, _cancel: boolean);
begin
  btnObjNew.Enabled:=_new;
  btnObjEdit.Enabled:=_edit;
  btnObjSave.Enabled:=_save;
  btnObjCancel.Enabled:=_cancel;
end;

procedure TFrmObject.setBtnObjective(_new, _edit, _save, _cancel,
  print: boolean);
begin
 btnNew.Enabled:=_new;
 btnEdit.Enabled:=_edit;
 btnSave.Enabled:=_save;
 btnCancel.Enabled:=_cancel;
 btnPrint.Enabled:=print;
end;

end.
