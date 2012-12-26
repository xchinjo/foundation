unit HistorySupportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs ,FavorFrm, DBCtrls, RzDBCmbo, StdCtrls, RzCmboBx, Mask, RzEdit,
  RzDBEdit, RzPanel, RzLabel, ExtCtrls, RzButton, RzRadGrp, RzDBRGrp ;

type
  TFrmHistorySupport = class(TForm)
    RzPanel1: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    G1: TRzGroupBox;
    G2: TRzGroupBox;
    G3: TRzGroupBox;
    G4: TRzGroupBox;
    G5: TRzGroupBox;
    Label39: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzComboBox1: TRzComboBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    Label11: TLabel;
    RzDBDateTimeEdit3: TRzDBDateTimeEdit;
    Label12: TLabel;
    RzDBDateTimeEdit4: TRzDBDateTimeEdit;
    Label13: TLabel;
    RzDBDateTimeEdit5: TRzDBDateTimeEdit;
    Label14: TLabel;
    RzPanel2: TRzPanel;
    btnSaveFavor: TRzBitBtn;
    BtnEditFavor: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzDBRadioGroup1: TRzDBRadioGroup;
    RzDBMemo1: TRzDBMemo;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEditFavorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveFavorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMainForm: TfrmFavor;
    procedure SetMainForm(const Value: TfrmFavor);
    procedure EnabledTxt ;
    procedure ChkStep ;
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmFavor  read FMainForm write SetMainForm;
  end;

var
  FrmHistorySupport: TFrmHistorySupport;

implementation


{$R *.dfm}

{ TFrmHistorySupport }

procedure TFrmHistorySupport.SetMainForm(const Value: TfrmFavor);
begin
  FMainForm := Value;
end;

procedure TFrmHistorySupport.RzBitBtn2Click(Sender: TObject);
begin
  self.Close ;
end;

procedure TFrmHistorySupport.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then Self.Close;
end;

procedure TFrmHistorySupport.BtnEditFavorClick(Sender: TObject);
begin
  if FMainForm.CdsHist.FieldByName('spstep').AsString = '1' then exit ;

  if Application.MessageBox('ต้องการทำการแก้ไขข้อมูลก่อนหน้า','แก้ไขใบอุปการคุณ', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    FMainForm.CdsHist.FieldByName('spstep').AsString :=  IntToStr(StrToInt(FMainForm.CdsHist.FieldByName('spstep').AsString)- 1) ;
    FMainForm.CdsHist.ApplyUpdates(0) ;
    FMainForm.CdsHist.Edit ;
    ChkStep ;
  end;
end;

procedure TFrmHistorySupport.FormShow(Sender: TObject);
begin
  if FMainForm.CdsHist.FieldByName('spowner').AsString = '1' then
      RzComboBox1.ItemIndex := 0
  else
      RzComboBox1.ItemIndex := 1 ;

  ChkStep ;

  FMainForm.CdsHist.Edit ;
end;

procedure TFrmHistorySupport.btnSaveFavorClick(Sender: TObject);
begin

  if FMainForm.CdsHist.FieldByName('spstep').AsString = '1' then
    begin

    end
  else if FMainForm.CdsHist.FieldByName('spstep').AsString = '2' then
    begin
      if RzDBDateTimeEdit3.Text = '' then Exit ;
    end
  else if FMainForm.CdsHist.FieldByName('spstep').AsString = '3' then
    begin
      if RzDBDateTimeEdit4.Text = '' then Exit ;
    end;

  if Application.MessageBox('ต้องการบันทึกการขอบัตรอุปการคุณ', 'บันทึก', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    if RzComboBox1.ItemIndex = 0 then
      FMainForm.CdsHist.FieldByName('spowner').AsString := '1'
    else if RzComboBox1.ItemIndex = 1 then
      FMainForm.CdsHist.FieldByName('spowner').AsString := '2' ;

    if StrToInt(FMainForm.CdsHist.FieldByName('spstep').AsString) < 4 then
      begin
        FMainForm.CdsHist.FieldByName('spstep').AsString :=  IntToStr(StrToInt(FMainForm.CdsHist.FieldByName('spstep').AsString)+1) ;
      end;
    FMainForm.CdsHist.ApplyUpdates(0) ;
    FMainForm.CdsSp.Refresh ;
  end;
  Self.Close ;
end;

procedure TFrmHistorySupport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f5: btnSaveFavorClick(Sender) ;
    vk_f7: BtnEditFavorClick(sender) ;
  end;
end;

procedure TFrmHistorySupport.EnabledTxt ;
begin
  RzDBLookupComboBox1.ReadOnly := True ;
  RzDBDateTimeEdit1.ReadOnly := True ;
  RzDBDateTimeEdit2.ReadOnly := True ;
  RzDBDateTimeEdit3.ReadOnly := True ;
  RzDBDateTimeEdit4.ReadOnly := True ;
  RzDBRadioGroup1.ReadOnly := True ;
  RzComboBox1.ReadOnly := True ;
  RzDBEdit2.ReadOnly := True ;
  RzDBEdit3.ReadOnly := True ;
  RzDBEdit4.ReadOnly := True ;
  RzDBEdit5.ReadOnly := True ;
  RzDBEdit6.ReadOnly := True ;
end;

procedure TFrmHistorySupport.ChkStep;
begin
  EnabledTxt ;
  g1.Color := clBtnFace ;
  g2.Color := clBtnFace ;
  g3.Color := clBtnFace ;
  g4.Color := clBtnFace ;
  if FMainForm.CdsHist.FieldByName('spstep').AsString = '1' then
    begin
      RzDBLookupComboBox1.ReadOnly := False ;
      RzDBDateTimeEdit1.ReadOnly := False ;
      RzDBDateTimeEdit2.ReadOnly := False ;
      RzComboBox1.ReadOnly := False ;
      RzDBEdit2.ReadOnly := False ;
      RzDBEdit3.ReadOnly := False ;
      RzDBEdit4.ReadOnly := False ;
      RzDBEdit5.ReadOnly := False ;
      RzDBEdit6.ReadOnly := False ;
      g1.Color := $00FDBBFF ;
      g2.Color := $00FDBBFF ;
    end
  else if FMainForm.CdsHist.FieldByName('spstep').AsString = '2' then
    begin
      RzDBDateTimeEdit3.ReadOnly := False ;
      g3.Color := $00FDBBFF ;
    end
  else if FMainForm.CdsHist.FieldByName('spstep').AsString = '3' then
    begin
      RzDBDateTimeEdit4.ReadOnly := False ;
      g4.Color := $00FDBBFF ;
    end ;
end;

end.
