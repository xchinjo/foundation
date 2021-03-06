unit InsigniaRegisterFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, StdCtrls, RzLabel, DBCtrls, RzDBCmbo, RzDBEdit, ComCtrls,
  RzDTP, RzDBDTP, StrUtils, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxCheckBox, DBXpress, FMTBcd, Provider,
  SqlExpr, DBClient, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  RzRadChk, RzEdit, RzButton, Mask;

type
  TfrmInsigniaRegister = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    pnTop: TRzPanel;
    pnBody: TRzPanel;
    pnButtom: TRzPanel;
    pnBodyRight: TRzPanel;
    pnBodyContainner: TRzPanel;
    pnBodyButtom: TRzPanel;
    Splitter1: TSplitter;
    Label39: TLabel;
    Label40: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnBodyTitle: TRzPanel;
    btnAddInsignia: TRzBitBtn;
    btnClose: TRzBitBtn;
    RzCheckBox1: TRzCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    R1: TRzRadioButton;
    R3: TRzRadioButton;
    R5: TRzRadioButton;
    R2: TRzRadioButton;
    R4: TRzRadioButton;
    R6: TRzRadioButton;
    R7: TRzRadioButton;
    Label10: TLabel;
    RzEdit7: TRzEdit;
    Label11: TLabel;
    RzEdit8: TRzEdit;
    Label12: TLabel;
    RzEdit9: TRzEdit;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    cdsBilling: TClientDataSet;
    DsBilling: TDataSource;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dspBilling: TDataSetProvider;
    cxGrid1DBTableView1chkbill: TcxGridDBColumn;
    cxGrid1DBTableView1bno: TcxGridDBColumn;
    cxGrid1DBTableView1bdate: TcxGridDBColumn;
    cxGrid1DBTableView1btotal: TcxGridDBColumn;
    RzLabel1: TRzLabel;
    TxtTotal: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    TxtRoyal: TRzDBLookupComboBox;
    Txtsearch: TRzBitBtn;
    CdsRoyal: TClientDataSet;
    DsRoyal: TDataSource;
    TxtSName: TRzEdit;
    TxtSLname: TRzEdit;
    DsSearch: TDataSource;
    RzLabel3: TRzLabel;
    RzLabel2: TRzLabel;
    CdsRYCode: TClientDataSet;
    DsRyCode: TDataSource;
    CdsSearch: TClientDataSet;
    Auto_id: TClientDataSet;
    dspRoyal: TDataSetProvider;
    dspSearch: TDataSetProvider;
    dspRYCode: TDataSetProvider;
    cdsBillingchkbill: TIntegerField;
    cdsBillingbno: TStringField;
    cdsBillingbtotal: TBCDField;
    cdsBillingbdate: TSQLTimeStampField;
    cdsBillingbid: TStringField;
    cdsBillingbperiod: TStringField;
    cdsBillingbpaytype: TStringField;
    cdsBillingbbank: TStringField;
    cdsBillingbbrance: TStringField;
    cdsBillingbrefno: TStringField;
    cdsBillingbrefdate: TSQLTimeStampField;
    cdsBillingbuserid: TStringField;
    cdsBillingbfrom: TStringField;
    cdsBillingbryid: TStringField;
    cdsBillingbloc: TStringField;
    cdsBillingbspiid: TStringField;
    RzDBEdit1: TRzDBEdit;
    RzGroupBox1: TRzGroupBox;
    RTrue: TRzRadioButton;
    RFalse: TRzRadioButton;
    CdsUpDate: TClientDataSet;
    DtRoyal: TRzDBDateTimeEdit;
    cdsTemp: TClientDataSet;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TxtsearchClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure btnAddInsigniaClick(Sender: TObject);
    procedure TxtSNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure TxtSLnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsBillingReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CdsRoyalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CdsRoyalNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1chkbillPropertiesEditValueChanged(
      Sender: TObject);
    procedure CdsSearchReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DsBillingUpdateData(Sender: TObject);
    procedure cxGrid1DBTableView1chkbillPropertiesChange(Sender: TObject);
  private
    FDo_Name: String;
    FDo_Lname: String;
    FDo_Id: String;
    FDo_PreName: String;
    FCurRyid: String;
    FCur_Do: String;
    FSetrylevel: String;
    FDo_Level: String;
    FDo_End: String;
    FcurrShowDoID: string;
    FCurrMode: String;
    { Private declarations }
    procedure LoadRoyal(_Id: String) ;
    procedure LoadBill(Str1,Str2:String) ;
    procedure LoadRyCode ;
    procedure UpdateLevel(Lv,Str:String) ;
    procedure UpdateData ;


    procedure initDataset;
    procedure Checked(CHK: integer);
    Procedure LoadLevel(Cds:TClientDataSet;SRL : String);
    procedure SetDo_Name(const Value: String);
    procedure SetDo_Lname(const Value: String);
    procedure SetDo_Id(const Value: String);
    function AUTOID(F: string ;T:string;N:string): string;
    procedure SetDo_PreName(const Value: String);
    procedure SetCurRyid(const Value: String);
    procedure SetCur_Do(const Value: String);
    procedure SetDo_Level(const Value: String);
    procedure SetDo_End(const Value: String);
    procedure DefaultCode(Str:String) ;
    procedure SetcurrShowDoID(const Value: string);
    procedure SetCurrMode(const Value: String);

  public
    { Public declarations }
    procedure LoadDonator(_FName,_Lname:String) ;

    property Do_Id : String  read FDo_Id write SetDo_Id;
    property Do_PreName : String  read FDo_PreName write SetDo_PreName;
    property Do_Name : String  read FDo_Name write SetDo_Name;
    property Do_Lname : String  read FDo_Lname write SetDo_Lname;
    property Do_Level : String  read FDo_Level write SetDo_Level;
    property Do_End : String  read FDo_End write SetDo_End;

    property Cur_Do : String  read FCur_Do write SetCur_Do;
    property CurRyid : String  read FCurRyid write SetCurRyid ;
    property currShowDoID : string read FcurrShowDoID write SetcurrShowDoID;
    property CurrMode : String  read FCurrMode write SetCurrMode;

  end;

var
  frmInsigniaRegister: TfrmInsigniaRegister;
  _rylevel ,_RyCode : String ;
  Total:Currency ;
  x : String ;


implementation

uses CommonLIB, uCiaXml, SearchDonatorFrm;

{$R *.dfm}


procedure TfrmInsigniaRegister.LoadDonator(_FName,_Lname:String) ;
//var str :String ;
begin
  CdsSearch.Close;
  CdsSearch.CommandText := ' select A.do_id ,A.do_prename, A.do_name ,A.do_lname,R.rylevel,ryend '+
                            ' from donator A '+
                            ' left join (select aa.* from '+
                            '( '+
     	                      ' select '+
                            '	min(b.ryrcode) as ryrcode,b.id  '+
                            '	from royal b '+
                            ' where b.rystatus =''A''' +
	                          ' group by b.id '+
                            ' ) bb left join royal aa on bb.ryrcode=aa.ryrcode and bb.id=bb.id '+
                            ' ) '+
                            ' R on A.do_id=R.id '+
                            ' left join bill B on A.do_id = bid '+
                            ' where do_name like '+QuotedStr(_FName + '%')+' and do_lname like ' + QuotedStr(_Lname + '%') +
                            ' group by A.do_prename,A.do_id ,A.do_name ,A.do_lname,R.rylevel,ryend  order by  A.do_id ' ;
    Screen.Cursor := crHourGlass ;
    CdsSearch.Open ;
//    InputBox('','',CdsSearch.CommandText) ;
end;

procedure TfrmInsigniaRegister.LoadRoyal(_Id: String);
begin
  CdsRoyal.Close ;
  CdsRoyal.CommandText := 'select top(1)* from royal where ryid= '+ QuotedStr(_Id) + ' order by ryid '  ;
  CdsRoyal.Open ;
end;

procedure TfrmInsigniaRegister.LoadBill(Str1,Str2: String);

begin
  cdsBilling.Close ;
  cdsBilling.CommandText := 'select * from bill where bid = '+QuotedStr(Str1)+' and (bryid='+ QuotedStr(str2)+' or bryid is null) order by bid' ;
  cdsBilling.Open ;

end;

procedure TfrmInsigniaRegister.LoadRyCode;
begin
  CdsRYCode.Close ;
  CdsRYCode.CommandText := 'select ry_code,ry_title,ry_amount from royal_code order by ry_code' ;
  CdsRYCode.Open ;
end;

procedure TfrmInsigniaRegister.initDataset;
var provName:string;
  i:integer;
begin
    with self do
    begin
      for I := 0 to self.ComponentCount - 1 do
      begin
        if ((Components[I] is TClientDataset)  and (Components[I].Tag <> 99))
          then
        begin
          AddProv(self,Conn,TClientDataSet(Components[I]).Name);
          initCDS(TClientDataSet(Components[I]).Name,TClientDataSet(Components[I]));
        end;
      end;
    end;
end;

procedure TfrmInsigniaRegister.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then self.close;
  if key=vk_escape then self.close;
    case key of
      vk_f5: btnAddInsigniaClick(Sender) ;
    end;
end;

procedure TfrmInsigniaRegister.btnCloseClick(Sender: TObject);
begin
  self.Close;                       
end;

procedure TfrmInsigniaRegister.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
  initSqlConnection(Conn);
  initDataset;
end;

procedure TfrmInsigniaRegister.FormShow(Sender: TObject);
begin
  Conn.Connected := true ;
//  FcurrShowDoID  := '00024967ADD' ; //  0002496700001
//  FcurrShowDoID  := '0002496700002' ;
//  InputBox('','',FcurrShowDoID) ;
  Cur_Do :=Trim(LeftStr(FcurrShowDoID,8))  ;
  CurRyid := Trim(MidStr(FcurrShowDoID,9,5)) ;
  CurrMode := Trim(RightStr(FcurrShowDoID,3)) ;


  if trim(FcurrShowDoID)<>'' then
    begin
        TxtsearchClick(sender) ; // autometic show from fornt
    end;


  if (Cur_Do = '') or (Cur_Do = null)   then
    begin
//      ShowMessage('xxxxxx') ;
    end
  else
    begin
      LoadRoyal(CurRyid) ;

      if CdsRoyal.FieldByName('ryend').AsString = 'Y' then
        begin
          btnAddInsignia.Enabled := False ;
          Txtsearch.Enabled      := False ;
        end ;

      LoadBill(Cur_Do,CurRyid) ;
        if (CurRyid <> '') and (CurRyid <> null) then
          begin
            while not cdsBilling.Eof do
              begin
                if cdsBilling.fieldbyname('bryid').AsString = CurRyid then
                  begin
                    x := 'BillWork' ;
                    cdsBilling.Edit ;
                    cdsBilling.fieldbyname('chkbill').AsString := '1' ;
                    cdsBilling.Post ;
                    cxGrid1DBTableView1chkbillPropertiesEditValueChanged(nil) ;
                  end
                else
                  begin
                    x := '' ;
                    cdsBilling.Edit ;
                    cdsBilling.fieldbyname('chkbill').AsString := '0' ;
                    cdsBilling.Post ;
                  end ;
                cdsBilling.Next ;
              end;
              cdsBilling.First ;
          end;
      CdsRoyal.Edit ;
      _RyCode  := CdsRoyal.fieldbyname('ryrcode').AsString ;
      LoadLevel(CdsRoyal,Trim(Do_Level));
    end;
  LoadRyCode ;
  TxtSName.SetFocus ;
  x := 'BillWork'  ;

end;

procedure TfrmInsigniaRegister.Checked(CHK: integer);
var B:TBookmark;
begin
  x := ''  ;
  Total := 0;
  with DsBilling  do
  begin
    B := DataSet.GetBookmark;
    Try
      DataSet.First;
        while not dataset.Eof do
        begin
          dataset.Edit;
          dataset.FieldByName('chkbill').AsInteger := CHK;
          dataset.Post ;
          if chk = 1 then
            Total := Total + DataSet.fieldbyname('btotal').AsCurrency ;

          dataset.Next;
        end;
      TxtTotal.Caption := FormatCurr('#,##0.00',Total);
    finally
      DataSet.GotoBookmark(B);
      DataSet.FreeBookmark(B);
    end
  end;
  x := 'BillWork'  ;
end;

procedure TfrmInsigniaRegister.TxtsearchClick(Sender: TObject);
var
  frm : TFrmSearchDonator;
  SelectID,strSQL : string;
begin
  try
    if (trim(currShowDoID)<>'')  then
      begin
 //       SelectID := LeftStr(FcurrShowDoID,8) ;
        SelectID := Cur_Do ;
      end
    else
      begin
        LoadDonator(TxtSName.Text,TxtSLname.Text) ;
        frm := TFrmSearchDonator.Create(self);
        frm.MainForm := Self ;
        frm.ShowModal;
        SelectID:=frm.SelectDonatorID;
        frm.Free;
      end;


    with cdsTemp do
    begin
      close ;
      strSQL:=''+
              ' select '+
              ' a.* '+
              ' ,b.MTTCDE,b.MTTDES '+
              ' ,ry.*,aa.ryend,aa.rylevel'+
              ' from donator  a '+
              ' left join  MTTCDE b on a.do_precde=MTTCDE and MTTGRP=''PRENAME'' '+
              ' left join ( '+
              ' 	select '+
              ' 	min(b.ryrcode) as ryrcode,b.id '+
              ' 	from royal b '+
              ' 	where b.rystatus =''A'' '+
              ' 	group by b.id '+
              ' ) ry on a.do_id=ry.id '+
              ' left join royal aa on aa.ryrcode=ry.ryrcode and aa.id=ry.id '+
              ' where a.do_id='''+SelectID+''' ';

      CommandText:=strSQL;

      open;
      if cdsTemp.Active then
        if cdsTemp.RecordCount> 0 then
          begin
              LoadRoyal('') ;
              CdsRoyal.Append ;
              LoadBill(SelectID,'') ;

              Do_Id      := trim(cdsTemp.fieldbyname('do_id').AsString);      // frm.SelectDonatorID ;
              Do_PreName := trim(cdsTemp.fieldbyname('do_prename').AsString); //frm.SelectDonatorPreName ;
              Do_Name    := trim(cdsTemp.fieldbyname('do_name').AsString);    //frm.SelectDonatorName ;
              Do_Lname   := trim(cdsTemp.fieldbyname('do_lname').AsString);   //frm.SelectDonatorLName ;
              Do_Level   := trim(cdsTemp.fieldbyname('rylevel').AsString);    //frm.SelectRylevel ;
              Do_End     := trim(cdsTemp.fieldbyname('ryend').AsString);      //frm.SelectRyEnd ;
              if Do_Level <> '' then
              begin
               DefaultCode(Do_Level) ;
              end
              else
              begin
                CdsRoyal.FieldByName('ryrcode').AsString := '7' ;
              end ;
              Checked(0) ;  Total := 0  ;
              TxtTotal.Caption := FormatCurr('#,##0.00',Total) ;
          end;
          LoadLevel(CdsSearch,Trim(Do_Level));
    end;
  finally
    Screen.Cursor := crDefault ;
    currShowDoID := '' ;
 //   Cur_Do:='';
 //   InputBox('','',cdsTemp.CommandText ) ;
  end;
end;

procedure TfrmInsigniaRegister.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_Escape then
    Self.Close;
end;

procedure TfrmInsigniaRegister.RzBitBtn2Click(Sender: TObject);
begin

  Checked(1);
end;

procedure TfrmInsigniaRegister.RzBitBtn3Click(Sender: TObject);
begin
  Checked(0);
end;

procedure TfrmInsigniaRegister.LoadLevel(Cds: TClientDataSet ; SRL : String);
begin
  try
    if (Trim(SRL) <> '0') and (Trim(SRL) <> '') then
    begin
      RTrue.Checked := True ;
      if SRL = '1' then      begin r1.Checked := True ; _rylevel := '1' ; end
      else if SRL = '2' then begin r2.Checked := True ; _rylevel := '2' ; end
      else if SRL = '3' then begin r3.Checked := True ; _rylevel := '3' ; end
      else if SRL = '4' then begin r4.Checked := True ; _rylevel := '4' ; end
      else if SRL = '5' then begin r5.Checked := True ; _rylevel := '5' ; end
      else if SRL = '6' then begin r6.Checked := True ; _rylevel := '6' ; end
      else if SRL = '7' then begin r7.Checked := True ; _rylevel := '7' ; end;
    end
    else
      begin
        _rylevel := '0' ;
        RFalse.Checked := True ;
        r1.Checked := False ;
        r2.Checked := False ;
        r3.Checked := False ;
        r4.Checked := False ;
        r5.Checked := False ;
        r6.Checked := False ;
        r7.Checked := False ;
      end;
  except end
end;

procedure TfrmInsigniaRegister.btnAddInsigniaClick(Sender: TObject);
begin
  x := '' ;
  if TxtRoyal.Text ='' then
    begin
      Application.MessageBox('��سҡ�͡���������ú', '���������ú', MB_OK or MB_ICONINFORMATION);
      Exit ;   // no royal Code
    end;

  if Total < CdsRYCode.fieldByName('ry_amount').AsFloat then
    begin
      Application.MessageBox('�ʹ�Թ������͡���� ��س����͡�������','�ʹ�Թ������͡����', MB_OK or MB_ICONINFORMATION);
      x := 'BillWork' ;
      Exit ;   // royal Code money Down
    end ;

   if (Cur_Do = '') or (Cur_Do = null) then
     begin
      if (TxtRoyal.KeyValue >= Do_Level) and (Do_Level <> '') then
        begin
          Application.MessageBox('�дѺ��鹷�����͡��ӡ����дѺ������ ��س����͡�дѺ��鹷���٧����','�дѺ���', MB_OK + MB_ICONWARNING);
          exit ;
        end;
     end
   else
     begin
      if TxtRoyal.KeyValue = _RyCode then
        begin
          UpdateData ;
          exit ;
        end;

      if (TxtRoyal.KeyValue >= Do_Level) and (Do_Level <> '') then
        begin
          Application.MessageBox('�дѺ��鹷�����͡��ӡ����дѺ������ ��س����͡�дѺ��鹷���٧����','�дѺ���', MB_OK + MB_ICONWARNING);
          exit ;
        end;
     end;  // royal Code Lavel Down

    if Do_End = 'N' then
      begin
        if Application.MessageBox('��й���ѧ����������ҧ��â�����ͧ�Ҫ ��ͧ��÷ӵ��','ѹ�֡', MB_OKCANCEL + MB_ICONQUESTION) = IDCANCEL then
          begin
            exit ;
          end;
      end;
  CdsRoyal.FieldByName('rylevel').AsString   := TxtRoyal.KeyValue ;
  Self.UpdateData ;
  UpdateLevel(TxtRoyal.KeyValue,CdsRoyal.FieldByName('id').AsString) ;
  x := 'BillWork' ;

  close;
end;

procedure TfrmInsigniaRegister.SetDo_Id(const Value: String);
begin
  FDo_Id := Value ;
  CdsRoyal.FieldByName('id').AsString := Value ;
end;

procedure TfrmInsigniaRegister.SetDo_PreName(const Value: String);
begin
  FDo_PreName := Value;
  CdsRoyal.FieldByName('ryininame').AsString := Value ;
end;

procedure TfrmInsigniaRegister.SetDo_Name(const Value: String);
begin
  FDo_Name := Value ;
  TxtSName.Text := Value ;
  CdsRoyal.FieldByName('ryname').AsString := Value ;
end;

procedure TfrmInsigniaRegister.SetDo_Lname(const Value: String);
begin
  FDo_Lname := Value ;
  TxtSLName.Text := Value ;
  CdsRoyal.FieldByName('ryfname').AsString := Value ;
end;

procedure TfrmInsigniaRegister.TxtSNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then
   Txtsearch.Click  ;
end;

procedure TfrmInsigniaRegister.TxtSLnameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then
   Txtsearch.Click  ;
end;

procedure TfrmInsigniaRegister.SetCurRyid(const Value: String);
begin
  FCurRyid := Value;
end;

function TfrmInsigniaRegister.AUTOID(F, T, N: string): string;
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

procedure TfrmInsigniaRegister.cdsBillingReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TfrmInsigniaRegister.CdsRoyalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage(e.Message) ;
end;

procedure TfrmInsigniaRegister.SetCur_Do(const Value: String);
begin
  FCur_Do := Value;
end;

procedure TfrmInsigniaRegister.CdsRoyalNewRecord(DataSet: TDataSet);
begin
  CdsRoyal.FieldByName('ryid').AsString := AUTOID('ryid','royal','00000') ;
  CdsRoyal.FieldByName('ryrdate').AsDateTime := Now ;
  CdsRoyal.FieldByName('ryamass').AsString   := '0'  ;
  CdsRoyal.FieldByName('rystatus').AsString  := 'A' ;
  CdsRoyal.FieldByName('ryend').AsString     := 'N' ;
  CdsRoyal.FieldByName('rystep').AsString    := '1' ;
end;

procedure TfrmInsigniaRegister.cxGrid1DBTableView1chkbillPropertiesEditValueChanged(
  Sender: TObject);
begin
  if DsBilling.State in [dsinsert,dsedit] then DsBilling.DataSet.Post ;
end;

procedure TfrmInsigniaRegister.SetDo_Level(const Value: String);
begin
  FDo_Level := Value;
end;

procedure TfrmInsigniaRegister.UpdateLevel(Lv,Str: String);
begin
  CdsUpDate.CommandText := 'update royal set rylevel= '''+ Lv +''' where id='''+str+'''' ;
  CdsUpDate.Execute ;
end;

procedure TfrmInsigniaRegister.SetDo_End(const Value: String);
begin
  FDo_End := Value;
end;

procedure TfrmInsigniaRegister.UpdateData;
begin

  CdsRoyal.FieldByName('ryrdate').AsDateTime := DtRoyal.Date ;
  CdsRoyal.FieldByName('ryrcode').AsString   := TxtRoyal.KeyValue ;
  CdsRoyal.FieldByName('rytotal').AsFloat    := CdsRYCode.fieldByName('ry_amount').AsFloat ;
//  ShowMessage(FloatToStr(CdsRoyal.FieldByName('rytotal').AsFloat )) ;

  CdsRoyal.ApplyUpdates(0) ;

  cdsBilling.First ;
  while not cdsBilling.Eof do
    begin
      if cdsBilling.FieldByName('chkbill').AsInteger = 1 then
        begin
          cdsBilling.Edit ;
          cdsBilling.FieldByName('bryid').AsString := CdsRoyal.FieldByName('ryid').AsString ;
          cdsBilling.Post ;
        end
      else
        begin
          cdsBilling.Edit ;
          cdsBilling.FieldByName('bryid').Clear;
          cdsBilling.Post ;
        end;
      cdsBilling.Next ;
    end;
  cdsBilling.First  ;
  cdsBilling.ApplyUpdates(0) ;
  Application.MessageBox('�ӡ�úѹ�֡��âͧ����ͧ�Ҫ���º��������','�ѹ�֡', MB_OK);

  TxtSName.Clear ;
  TxtSLname.Clear ;
  CdsRoyal.Edit ;
end;

procedure TfrmInsigniaRegister.CdsSearchReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TfrmInsigniaRegister.DefaultCode(Str: String);
begin
  CdsRoyal.FieldByName('ryrcode').AsString := IntToStr(StrToInt(Str)-1) ;
end;

procedure TfrmInsigniaRegister.SetcurrShowDoID(const Value: string);
begin
  FcurrShowDoID := Value;
end;

procedure TfrmInsigniaRegister.DsBillingUpdateData(Sender: TObject);
begin
  if x = 'BillWork' then
    begin
      Total := strToCurr(StringReplace(TxtTotal.Caption,',','',[rfReplaceAll, rfIgnoreCase]));
      if DsBilling.DataSet.FieldByName('chkbill').AsInteger = 1 then
        Total := Total + DsBilling.DataSet.fieldbyname('btotal').AsCurrency
      else
        Total := Total - DsBilling.DataSet.fieldbyname('btotal').AsCurrency;

      TxtTotal.Caption := FormatCurr('#,##0.00',Total) ;
    end;

end;

procedure TfrmInsigniaRegister.cxGrid1DBTableView1chkbillPropertiesChange(
  Sender: TObject);
begin
  x := 'BillWork' ;
end;

procedure TfrmInsigniaRegister.SetCurrMode(const Value: String);
begin
  FCurrMode := Value;
end;

end.
