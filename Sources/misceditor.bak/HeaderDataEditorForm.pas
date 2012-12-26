unit HeaderDataEditorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxMemo, cxMaskEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  ExtCtrls, StdCtrls, cxButtons, cxCheckBox;

type
  TfrmHeaderDataEditor = class(TForm)
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    GroupBox1: TGroupBox;
    dbeCODE: TcxDBTextEdit;
    Label3: TLabel;
    Label1: TLabel;
    dbeDECSCRIPTION: TcxDBTextEdit;
    Label4: TLabel;
    dbeFCODE_LABEL: TcxDBTextEdit;
    dcbFCODE_USED: TcxDBCheckBox;
    Label2: TLabel;
    dbeFDESC_LABEL: TcxDBTextEdit;
    dcbFDESC_USED: TcxDBCheckBox;
    Label5: TLabel;
    dbeFMONEY_LABEL: TcxDBTextEdit;
    dcbFMONEY_USED: TcxDBCheckBox;
    Label6: TLabel;
    dbeFDATE_LABEL: TcxDBTextEdit;
    dcbFDATE_USED: TcxDBCheckBox;
    Label7: TLabel;
    dbeFTEXT_EX_USED: TcxDBTextEdit;
    dcbFTEXT_EX_USED: TcxDBCheckBox;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHeaderDataEditor: TfrmHeaderDataEditor;

implementation

uses fshow, MainMiscDataForm;

{$R *.dfm}

procedure TfrmHeaderDataEditor.FormCreate(Sender: TObject);
begin
  Left := ((Owner as TForm).Width - Width) div 2;
  Top := ((Owner as TForm).Height - Height) div 2;
end;

procedure TfrmHeaderDataEditor.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);
end;

procedure TfrmHeaderDataEditor.btnSaveClick(Sender: TObject);
begin
  if (frmMainMiscData.dsMiscHeaderData.State in [dsEdit, dsInsert]) then
  begin
    frmMainMiscData.dsMiscHeaderData.Post();
    frmMainMiscData.DBTrans.CommitRetaining();
  end;

  Close();
end;

procedure TfrmHeaderDataEditor.btnCancelClick(Sender: TObject);
begin
  if (frmMainMiscData.dsMiscHeaderData.State in [dsEdit, dsInsert]) then
  begin
    frmMainMiscData.dsMiscHeaderData.Cancel();
    frmMainMiscData.DBTrans.RollbackRetaining();
  end;

  Close();
end;

procedure TfrmHeaderDataEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
