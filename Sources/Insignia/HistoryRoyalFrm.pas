unit HistoryRoyalFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel,InsigniaFrm, Mask, RzEdit,
  RzDBEdit, RzButton, DBCtrls, RzDBCmbo, RzRadGrp, RzDBRGrp ;

type
  TFrmHistoryRoyal = class(TForm)
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
    Label4: TLabel;
    Label6: TLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RzDBEdit10: TRzDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    RzDBEdit13: TRzDBEdit;
    Label13: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    RzDBDateTimeEdit4: TRzDBDateTimeEdit;
    RzDBDateTimeEdit5: TRzDBDateTimeEdit;
    RzDBDateTimeEdit6: TRzDBDateTimeEdit;
    RzDBDateTimeEdit8: TRzDBDateTimeEdit;
    RzDBDateTimeEdit9: TRzDBDateTimeEdit;
    G6: TRzGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    RzDBDateTimeEdit10: TRzDBDateTimeEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBRadioGroup1: TRzDBRadioGroup;
    Label7: TLabel;
    RzPanel2: TRzPanel;
    btnSaveInsignia: TRzBitBtn;
    BtnEditInsignia: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBMemo1: TRzDBMemo;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEditInsigniaClick(Sender: TObject);
    procedure btnSaveInsigniaClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FMainForm: TfrmInsignia;
    procedure SetMainForm(const Value: TfrmInsignia);
    procedure EnableTxt ;
    procedure ChkStep ;
  public
    { Public declarations }
    property MainForm : TfrmInsignia  read FMainForm write SetMainForm ;
  end;

var
  FrmHistoryRoyal: TFrmHistoryRoyal;

implementation


{$R *.dfm}

{ TFrmHistoryRoyal }

procedure TFrmHistoryRoyal.SetMainForm(const Value: TfrmInsignia);
begin
  FMainForm := Value;
end;

procedure TFrmHistoryRoyal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then Self.Close ;
end;

procedure TFrmHistoryRoyal.BtnEditInsigniaClick(Sender: TObject);
begin
  if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '1' then exit ;

  if Application.MessageBox('ต้องการทำการแก้ไขข้อมูลก่อนหน้า', 'แก้ไข', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    FMainForm.CdsHistRy.FieldByName('rystep').AsString := IntToStr(StrToInt(FMainForm.CdsHistRy.FieldByName('rystep').AsString)- 1) ;
    FMainForm.CdsHistRy.ApplyUpdates(0) ;
    FMainForm.CdsHistRy.Edit ;
    ChkStep ;
  end;
end;

procedure TFrmHistoryRoyal.btnSaveInsigniaClick(Sender: TObject);
begin
  try
    if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '1' then
      begin
        if (RzDBDateTimeEdit5.Text ='') and (RzDBEdit10.Text ='') and (RzDBDateTimeEdit9.Text ='') then exit ;
      end;
    if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '2' then
      begin
        if (RzDBDateTimeEdit6.Text ='') and (RzDBEdit13.Text ='') and (RzDBLookupComboBox1.Text ='') then exit ;
      end;
    if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '3' then
      begin
        if (RzDBDateTimeEdit8.Text ='')then exit ;
      end;
    if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '4' then
      begin
        if (RzDBDateTimeEdit2.Text ='')then exit ;
      end;
      
    if Application.MessageBox('ต้องการบันทึกรายการขอเครื่องราชฯ','บันทึกการขอเครื่องราชฯ', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin

      if StrToInt(FMainForm.CdsHistRy.FieldByName('rystep').AsString) < 5  then
        begin
          FMainForm.CdsHistRy.FieldByName('rystep').AsString :=  IntToStr(StrToInt(FMainForm.CdsHistRy.FieldByName('rystep').AsString)+1) ;
        end;

      FMainForm.CdsHistRy.ApplyUpdates(0) ;
      FMainForm.CdsRoYal.Refresh ;
      Self.Close ;
    end;
  except
    Application.MessageBox('ไม่สามารถทำการบันทึกได้', 'ผิดพลาด', MB_OK + MB_ICONSTOP);
  end;

end;

procedure TFrmHistoryRoyal.RzBitBtn2Click(Sender: TObject) ;
begin
  self.Close ;
end;

procedure TFrmHistoryRoyal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f5: btnSaveInsigniaClick(Sender) ;
    vk_f7: BtnEditInsigniaClick(sender) ;
  end;
end;

procedure TFrmHistoryRoyal.EnableTxt ;
begin
  RzDBDateTimeEdit2.ReadOnly := True ;
  RzDBDateTimeEdit5.ReadOnly := True ;
  RzDBDateTimeEdit6.ReadOnly := True ;
  RzDBDateTimeEdit8.ReadOnly := True ;
  RzDBDateTimeEdit9.ReadOnly := True ;

  RzDBEdit10.ReadOnly := True ;
  RzDBEdit13.ReadOnly := True ;

  RzDBLookupComboBox1.ReadOnly := True ;
//  RzDBRadioGroup1.ReadOnly := True ;
end;

procedure TFrmHistoryRoyal.FormShow(Sender: TObject);
begin
  FMainForm.CdsHistRy.Edit ;
  ChkStep ;
end;

procedure TFrmHistoryRoyal.ChkStep ;
begin
  EnableTxt ;
  g1.Color := clBtnFace ;
  g2.Color := clBtnFace ;
  g3.Color := clBtnFace ;
  g4.Color := clBtnFace ;
  g5.Color := clBtnFace ;
  if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '1' then
    begin
      RzDBDateTimeEdit4.ReadOnly := False;
      RzDBEdit2.ReadOnly := False;
      RzDBLookupComboBox2.ReadOnly := False;
      RzDBEdit5.ReadOnly := False;
      RzDBEdit7.ReadOnly := False;
      RzDBDateTimeEdit5.ReadOnly := False;
      RzDBEdit10.ReadOnly := False ;
      RzDBDateTimeEdit9.ReadOnly := False ;
      g1.Color := $00FDBBFF ;
      g2.Color := $00FDBBFF ;
    end
  else if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '2' then
    begin
      RzDBDateTimeEdit6.ReadOnly := False ;
      RzDBEdit13.ReadOnly := False ;
      RzDBLookupComboBox1.ReadOnly := False ;
      g3.Color := $00FDBBFF ;
    end
  else if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '3' then
    begin
      RzDBDateTimeEdit8.ReadOnly := False ;
      g4.Color := $00FDBBFF ;
    end
  else if FMainForm.CdsHistRy.FieldByName('rystep').AsString = '4' then
    begin
      RzDBDateTimeEdit2.ReadOnly := False ;
      g5.Color := $00FDBBFF ;
    end ;
end;

end.
