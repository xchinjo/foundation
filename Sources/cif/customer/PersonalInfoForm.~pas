unit PersonalInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, jvuib,
  DBClient, Provider, DB, jvuibdataset, cxMaskEdit, cxDropDownEdit,
  cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxGraphics,
  cxLookAndFeels, Menus;

{$I CRG_WM_MSG.INC}

type
  TfrmPersonalInfo = class(TFrame)
    pnButton: TPanel;
    Label2: TLabel;
    btnClose2: TcxButton;
    btnSave: TcxButton;
    btnDependencies2: TcxButton;
    Label1: TLabel;
    Image1: TImage;
    lbAdvanceInfo: TLabel;
    Image2: TImage;
    pnAdvanceInfo: TPanel;
    gbBasicInfo: TGroupBox;
    trnsDefault: TJvUIBTransaction;
    dsPersonalData: TJvUIBDataSet;
    dspPersonalData: TDataSetProvider;
    cdsPersonalData: TClientDataSet;
    cdsPersonalDataRECORD_ID: TIntegerField;
    cdsPersonalDataSTATUS: TSmallintField;
    cdsPersonalDataPERSONAL_TYPE: TSmallintField;
    cdsPersonalDataCODE: TStringField;
    cdsPersonalDataPFX_NAME_TH: TStringField;
    cdsPersonalDataFIRST_NAME_TH: TStringField;
    cdsPersonalDataLAST_NAME_TH: TStringField;
    cdsPersonalDataPFX_NAME_EN: TStringField;
    cdsPersonalDataFIRST_NAME_EN: TStringField;
    cdsPersonalDataLAST_NAME_EN: TStringField;
    Label3: TLabel;
    dbeCODE: TcxDBTextEdit;
    dscPersonalData: TDataSource;
    pnJusritctName: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    pnIndividualName: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    cxDBComboBox3: TcxDBComboBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBComboBox4: TcxDBComboBox;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnClose2Click(Sender: TObject);
  private
    FDBConn: TJvUIBDataBase;
    FCallingForm: TForm;
    FPesonalInfoFrame: TFrame;

    FCloseEvent: TCloseEvent;

    procedure GetResult(var Message: TMessage); message WM_SENT_RESULT;
  public
    procedure InitValue(_DBConn: TJvUIBDataBase; _UserRCID: Integer;
      _IsAbleToEdit: Boolean);

    property CallingForm: TForm read FCallingForm write FCallingForm;
    property CloseEvent: TCloseEvent read FCloseEvent write FCloseEvent;
  end;

function ShowUserInfo(_DBConn: TJvUIBDataBase; _UserRCID: Integer;
  _Parent: TWinControl; _CloseEvent: TCloseEvent;
  _IsAbleToEdit: Boolean = True): TfrmPersonalInfo;

implementation

uses fbconnection;

{$R *.dfm}

function ShowUserInfo(_DBConn: TJvUIBDataBase; _UserRCID: Integer;
  _Parent: TWinControl; _CloseEvent: TCloseEvent;
  _IsAbleToEdit: Boolean = True): TfrmPersonalInfo;
var
  _Form: TWinControl;
begin
  _Form := _Parent;
  while (not(_Form is TForm)) do
    _Form := _Form.Parent;

  Result := TfrmPersonalInfo.Create(_Parent);
  with (Result) do
  begin
    CallingForm := TForm(_Form);
    CloseEvent := _CloseEvent;
    Parent := _Parent;
    Align := alClient;

    InitValue(_DBConn, _UserRCID, _IsAbleToEdit);
  end;
end;

procedure TfrmPersonalInfo.GetResult(var Message: TMessage);
var
  _Action: TCloseAction;
begin
  { Verify all child processes is successfully }
  { WParam is none zero on success case        }
  if (Boolean(Message.WParam)) then
  begin
    FCloseEvent(nil, _Action);
  end;
end;

procedure TfrmPersonalInfo.InitValue(_DBConn: TJvUIBDataBase;
  _UserRCID: Integer; _IsAbleToEdit: Boolean);
begin
  FDBConn := _DBConn;
  trnsDefault.DataBase := FDBConn;

  btnSave.Enabled := _IsAbleToEdit;
  FPesonalInfoFrame := nil;

  dsPersonalData.Params.ByNameAsInteger['CUSTOMER_ID'] := _UserRCID;
  cdsPersonalData.Open();

  if (cdsPersonalDataPERSONAL_TYPE.Value = 1) then
  begin
    pnIndividualName.Show();
    lbAdvanceInfo.Caption :=
      '         Individual Person Information';
  end else
  begin
    pnJusritctName.Show();
    lbAdvanceInfo.Caption :=
      '         Juristict Person Information';
  end;

  FCallingForm.ActiveControl := dbeCODE;
end;

procedure TfrmPersonalInfo.btnSaveClick(Sender: TObject);
begin
  PostMessage(Handle, WM_SENT_RESULT, 0, 0);
//  PostMessage(FPesonalInfoFrame.Handle, WM_OK_CLICKED, 0, 0);
end;

procedure TfrmPersonalInfo.btnClose2Click(Sender: TObject);
begin
  PostMessage(Handle, WM_SENT_RESULT, 1, 0);
//  PostMessage(FPesonalInfoFrame.Handle, WM_CANCEL_CLICKED, 0, 0);
end;

end.
