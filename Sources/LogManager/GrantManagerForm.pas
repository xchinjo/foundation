unit GrantManagerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, SmoothShow, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxListBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCheckBox, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, Buttons;

type
  TfrmUserHistoryLog = class(TForm)
    ssShow: TSmoothShow;
    Splitter1: TSplitter;
    pnMenuItemList: TPanel;
    Panel4: TPanel;
    pnMenuItemEditor: TPanel;
    Panel3: TPanel;
    pnBottom: TPanel;
    lbRecord: TLabel;
    btnClose: TcxButton;
    cbPrivilagesFor: TcxComboBox;
    lbPrivilagesFor: TcxListBox;
    cbGrantsOn: TcxComboBox;
    cxgGrantObjectDBTableView: TcxGridDBTableView;
    cxgGrantObjectLevel: TcxGridLevel;
    cxgGrantObject: TcxGrid;
    mnCaption: TcxGridDBColumn;
    mnDescription: TcxGridDBColumn;
    mnApplicationName: TcxGridDBColumn;
    mnAllowed: TcxGridDBColumn;
    DBTrans: TpFIBTransaction;
    dsTemp: TpFIBDataSet;
    dsObjectList: TpFIBDataSet;
    dscObjectList: TDataSource;
    mnDenied: TcxGridDBColumn;
    btnGrantToAll: TSpeedButton;
    btnRevokeToAll: TSpeedButton;
    dsObjectListRECORD_ID: TFIBIntegerField;
    dsObjectListNAME_TH: TFIBStringField;
    dsObjectListNAME_EN: TFIBStringField;
    dsObjectListAPP_NAME: TFIBStringField;
    dsObjectListDESCRIPTION: TFIBStringField;
    dsObjectListALLOWED: TFIBIntegerField;
    dsObjectListDENIED: TFIBIntegerField;
    btnDenyToAll: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure cbPrivilagesForPropertiesChange(Sender: TObject);
    procedure lbPrivilagesForClick(Sender: TObject);
    procedure dsObjectListBeforeEdit(DataSet: TDataSet);
    procedure dsObjectListAfterScroll(DataSet: TDataSet);
    procedure btnGrantToAllClick(Sender: TObject);
  private
    FIsThaiMenu: Boolean;
    FIsEdit: Boolean;
  public
    { Public declarations }
  end;

var
  frmUserHistoryLog: TfrmUserHistoryLog;

implementation

uses IniFiles, Security, CRGExtFunc;

{$R *.dfm}

procedure TfrmUserHistoryLog.FormCreate(Sender: TObject);
begin
  Left := 0; Top := 0;
  WindowState := wsMaximized;

  FIsEdit := False;
end;

procedure TfrmUserHistoryLog.FormShow(Sender: TObject);
begin
  cbPrivilagesFor.ItemIndex := 1;

  cbGrantsOn.ItemIndex := 0;

  with TIniFile.Create(SystemDir + _CRG_CONFIG) do
  try
    FIsThaiMenu := (ReadString('MENUS', 'LANGUAGE', '') = 'THA');
  finally
    Free();
  end;

  if (FIsThaiMenu) then
    mnCaption.DataBinding.FieldName := 'NAME_TH'
  else
    mnCaption.DataBinding.FieldName := 'NAME_EN';

  ssShow.Execute();
  
  lbPrivilagesFor.ItemIndex := 0;
  lbPrivilagesFor.SetFocus();
  lbPrivilagesForClick(lbPrivilagesFor);
end;

procedure TfrmUserHistoryLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmUserHistoryLog.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmUserHistoryLog.cbPrivilagesForPropertiesChange(
  Sender: TObject);
begin
  if (cbPrivilagesFor.ItemIndex = 1) then
    dsTemp.SQLs.SelectSQL.Text := 'SELECT NAME FROM SP_GET_USER_LIST(1)'
  else
    dsTemp.SQLs.SelectSQL.Text := 'SELECT NAME FROM SP_GET_ROLE_LIST';
  try
    dsTemp.Open();
    LoadDBToList(dsTemp, lbPrivilagesFor.Items, ['NAME']);
  finally
    dsTemp.Close();
  end;
end;

procedure TfrmUserHistoryLog.lbPrivilagesForClick(Sender: TObject);
begin
  if ((dsObjectList.Active) and (dsObjectList.State = dsEdit)) then
  begin
    dsObjectList.Post();
    dsObjectListAfterScroll(dsObjectList);
  end;

  dsObjectList.Close();

  dsObjectList.ParamByName('UR_TYPE').AsInteger := cbPrivilagesFor.ItemIndex;
  dsObjectList.ParamByName('REF_NAME').AsString :=
    lbPrivilagesFor.Items[lbPrivilagesFor.ItemIndex];

  dsObjectList.Open();
end;

procedure TfrmUserHistoryLog.dsObjectListBeforeEdit(DataSet: TDataSet);
begin
  DBTrans.StartTransaction();
  FIsEdit := True;
end;

procedure TfrmUserHistoryLog.dsObjectListAfterScroll(DataSet: TDataSet);
var
  _RC: Integer;
begin
  if (FIsEdit) then
  begin
    dsObjectList.AfterScroll := nil;

    _RC := dsObjectListRECORD_ID.AsInteger;
    DBTrans.Commit();
    if (not dsObjectList.Active) then
    begin
      dsObjectList.Open();
      dsObjectList.Locate('RECORD_ID', _RC, []);
    end;

    dsObjectList.AfterScroll := dsObjectListAfterScroll;
  end;

  FIsEdit := False;
end;

procedure TfrmUserHistoryLog.btnGrantToAllClick(Sender: TObject);
var
  _RC: Integer;
  _Allowed, _Denied: Integer;
begin
  Screen.Cursor := crSQLWait;

  dsObjectList.AfterScroll := nil;
  DBTrans.StartTransaction();
  try
    _RC := dsObjectListRECORD_ID.AsInteger;


    if ((Sender as TSpeedButton).Tag < 2) then
    begin
      _Allowed := (Sender as TSpeedButton).Tag;
      _Denied := 0;
    end else
    begin
      _Allowed := 0;
      _Denied := 1;
    end;

    dsObjectList.First();
    while (not dsObjectList.Eof) do
    begin
      dsObjectList.Edit();
      dsObjectListALLOWED.Value := _Allowed;
      dsObjectListDENIED.Value := _Denied;
      dsObjectList.Post();

      dsObjectList.Next();
    end;

    DBTrans.Commit();

    if (not dsObjectList.Active) then
    begin
      dsObjectList.Open();
      dsObjectList.Locate('RECORD_ID', _RC, []);
    end;

  finally
    dsObjectList.AfterScroll := dsObjectListAfterScroll;
    Screen.Cursor := crDefault;
  end;
end;

end.

