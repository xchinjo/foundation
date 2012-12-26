unit AccountInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxLookAndFeelPainters, ImgList, ExtCtrls, ComCtrls, StdCtrls, cxButtons,
  jvuib, cxDropDownEdit, cxCalendar, cxDBEdit, cxMaskEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit;

{$I CRG_WM_MSG.INC}

type
  TfrmAccInfo = class(TForm)
    Panel3: TPanel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    btnEdit2: TcxButton;
    imgList: TImageList;
    gbMainInfo: TGroupBox;
    pnPage: TPageControl;
    tsInformation: TTabSheet;
    gbUserInfo: TGroupBox;
    tsCustomer: TTabSheet;
    tsMonetary: TTabSheet;
    GroupBox1: TGroupBox;
    lbIncomeExprese: TLabel;
    imgIncomeExprese: TImage;
    lbCredit: TLabel;
    imgCredit: TImage;
    Panel1: TPanel;
    imgBasicInfo: TImage;
    lbBasicInfo: TLabel;
    imgMoreInfo: TImage;
    lbMoreInfo: TLabel;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    trnsDefault: TJvUIBTransaction;
    lbBranchCode: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    lbCompanyCode: TLabel;
    cbCompany: TcxComboBox;
    Label1: TLabel;
    cbBranch: TcxComboBox;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label3: TLabel;
    cbRole: TcxComboBox;
    Label6: TLabel;
    dbdFrom: TcxDBDateEdit;
    Label4: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Bevel2: TBevel;
    Label5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label7: TLabel;
    cxDBDateEdit4: TcxDBDateEdit;
    cxDBDateEdit5: TcxDBDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEdit2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
  public
    { Public declarations }
  end;

var
  frmAccInfo: TfrmAccInfo;

implementation

uses fbconnection, ComponentTextMgr, MainAccForm;

{$R *.dfm}

procedure TfrmAccInfo.LanguageChaged(var Message: TMessage);
var
  _MenusLanguage: String;
begin
  _MenusLanguage := GetMenuLanguage();
  SetScreenText('cif_acc.dll', Name, _MenusLanguage, Self, trnsDefault);
end;

procedure TfrmAccInfo.FormCreate(Sender: TObject);
begin
  pnPage.ActivePage := tsInformation;
end;

procedure TfrmAccInfo.FormShow(Sender: TObject);
var
  _MenusLanguage: String;
begin
  _MenusLanguage := GetMenuLanguage();
  SetScreenText('cif_acc.dll', Name, _MenusLanguage, Self, trnsDefault);
end;

procedure TfrmAccInfo.btnEdit2Click(Sender: TObject);
begin
  //
end;

procedure TfrmAccInfo.btnSaveClick(Sender: TObject);
begin
//
end;

procedure TfrmAccInfo.btnCancelClick(Sender: TObject);
begin
  (Owner as TWinControl).Show();
  Close();
end;

procedure TfrmAccInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
