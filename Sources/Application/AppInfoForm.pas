unit AppInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxLookAndFeelPainters, ImgList, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  StdCtrls, ComCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxDBEdit, jvuib, cxGraphics, cxLookAndFeels;

type
  TfrmAppInfo = class(TForm)
    Panel4: TPanel;
    Label8: TLabel;
    Label55: TLabel;
    Label1: TLabel;
    dbeContractNo: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Panel1: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    imgList: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox5: TGroupBox;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    dbcPayBy: TcxComboBox;
    lbHead1: TLabel;
    Image1: TImage;
    trnsDefault: TJvUIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppInfo: TfrmAppInfo;

implementation

uses fshow;

{$R *.dfm}

procedure TfrmAppInfo.FormCreate(Sender: TObject);
begin
//  Left := (Screen.Width - Width) div 2;
//  Top := (Screen.Height - Height) div 2;

  WindowState := wsMaximized;
end;

procedure TfrmAppInfo.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);
end;

procedure TfrmAppInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

end.
