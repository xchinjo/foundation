{ *********************************************************************** }
{                                                                         }
{ The Bantung Software  Runtime Library                                   }
{ Bantung - Common Library                                 }
{                                                                         }
{ Copyright (c) 2012 Bantung Software Co., Ltd.                           }
{                                                                         }
{ *********************************************************************** }
unit CommonLIB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Provider, DBClient,SqlExpr,
  Dialogs, cxCurrencyEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, RzPanel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, RzButton, Mask, RzEdit,RzDBEdit,RzCmboBx,uCiaXml,RzDBCmbo,DBCtrls
  ,ImgList,buttons;


const
 _focusColor=$00FFD7FF;
 _disableColor=$00EAEAEA;
 _enableColor=clWhite;
 _config_file='appconfig.xml';
 _sample_db='fddb_temp';
 _frameVisivle=true;
 GridBgColor=$00D9C1BB;
 GridBgColor2=$00D2A4A4;


  // Sets UnixStartDate to TDateTime of 01/01/1970
  UnixStartDate: TDateTime = 25569.0;


type
THackDBNavigator = class(TDBNavigator);

TDLLParameter = record
    UserID : String;
    WorkStation:String;
    Company:string;
    Branch:String;
    Password : String;

    connUser:string;
    connPasswd:string;
    connDatabase:string;
    connServer:string;

    Parameters : string;

    SelectCode : string;
    SelectName : string;

    ParametersBool1 : boolean;
    ParametersBool2 : boolean;
    ParametersBool3 : boolean;
    ParametersBool4 : boolean;
    ParametersBool5 : boolean;

    SearchText1 : string;
    SearchText2 : string;
    SearchText3 : string;
    SearchText4 : string;
    SearchText5 : string;

    ReportCode : string;

    ParameterString1:string;
    ParameterString2:string;
    ParameterString3:string;
    ParameterString4:string;
    ParameterString5:string;
    ParameterString6:string;
    ParameterString7:string;
    ParameterString8:string;
    ParameterString9:string;
    ParameterString10:string;

    ParameterCurrency1:string;
    ParameterCurrency2:string;
    ParameterCurrency3:string;
    ParameterCurrency4:string;
    ParameterCurrency5:string;
    ParameterCurrency6:string;
    ParameterCurrency7:string;
    ParameterCurrency8:string;
    ParameterCurrency9:string;
    ParameterCurrency10:string;

    ParameterNum1:string;
    ParameterNum2:string;
    ParameterNum3:string;
    ParameterNum4:string;
    ParameterNum5:string;
    ParameterNum6:string;
    ParameterNum7:string;
    ParameterNum8:string;
    ParameterNum9:string;
    ParameterNum10:string;

  end;


TString = class(TObject)
   private
     fStr: String;
   public
     constructor Create(const AStr: String) ;
     property Str: String read FStr write FStr;
   end;

TStringValue = class(TObject)
  private
    FValue: string;
    FCode: string;
    procedure SetCode(const Value: string);
    procedure SetValue(const Value: string);
  public
    constructor Create(const ACode , AValue :string);
    property Code : string read FCode write SetCode;
    property Value : string read FValue write SetValue;
  end;




TRecStampData= array[0..7] of byte; 
     // App must instantiate own copy of this object for use 
     TRecStamp= class(TObject) 
       private 
         FData: TRecStampData; 
       public 
         constructor Create; 
         procedure Free; 
         function SetStamp(aField: TField): boolean; // Set the object's 
         function GetStamp: TRecStampData; // Return the stamp data
         function IsBlank: boolean; // Has the stamp data been assigned?
         function IsSameStamp(otherData: TRecStampData): boolean; // Compare
     end;

var
    InnerProv:TDataSetProvider;
    SQ:TSQLDataSet;
    xmlConn:TXMLConfig;
    _app_address,_app_hostname,
    _app_port,_system_code,
    _app_ipusing,_app_serverName,_version,
    _app_user,_app_password ,_app_database
    :string;


function  AddProv(frm:TForm;Conn:TSQLConnection;ProvName: string): boolean;
procedure initCDS(proveName:string;_cds:TClientDataSet);
function  initSqlConnection(sqlconn:TSQLConnection):boolean;
Procedure SetChildTaborders(const Parent: TWinControl) ;
Procedure SetControl(const Parent: TWinControl;_enable:boolean) ;

// foundation code
function getFoundNo(cds:TClientDataSet;objCode,CodeType:string):string;
procedure setFoundNo(cds:TClientDataSet;objCode:string;maxcode:integer);

// dis
function getRunning(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;
function setRunning(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;

// billno
function getBillNo(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;
procedure setBillNo(cds:TClientDataSet;abr,grp,cde,value_fieldname:string);


// peroid
function getPeroidNo(cds:TClientDataSet;abr,cde,value_fieldname:string):integer;
procedure setPeroidNo(cds:TClientDataSet;abr,cde,value_fieldname:string);

// get new donator id
function getNewDonatorId(cds:TClientDataSet):integer;

function getServerDate(_cds:TClientDataSet):TDateTime;
function DateTimeToUnix(ConvDate: TDateTime): Longint;
function UnixToDateTime(USec: Longint): TDateTime;

function getBookBankID(_cds:TClientDataSet;objcode:string):String;
function getUserFullName(_cds:TClientDataSet;UID:string):String;
function getDonationsPointName(_cds:TClientDataSet;cde:string):String;

procedure initDataset(frm:TForm;_conn:TSQLConnection);
procedure initDatasetA(frm:TForm;_conn:TSQLConnection;_cds:TClientDataSet);


function copyCdsA(cdsSource:TClientDataSet;cdsTarget:TClientDataSet):boolean;


procedure SetupHackedNavigator(const Navigator : TDBNavigator;const Glyphs : TImageList);
procedure HackNavMouseUp(Sender:TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
function isDate ( const DateString: string ): boolean;
procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
function IsFloat(S: string): boolean;
function IsInteger(S: string): boolean;

procedure loadCmbList(cmb:TRzComboBox;cds:TClientDataset;strSQL,fCode,fName,defaultCode:string);
function loadCmbItems(CmbITem:TStrings;cds:TClientDataset;strSQL,fCode,fName,defaultCode:string):integer;



implementation

function loadCmbItems(CmbITem:TStrings;cds:TClientDataset;strSQL,fCode,fName,defaultCode:string):integer;
var i,defaultIndex: integer;
begin
  cds.close;
  cds.CommandText:=strsql;
  cds.open;

  defaultIndex:=0;

  CmbITem.Clear;
  if cds.RecordCount>0 then
  begin
    cds.first;
    for i := 0 to cds.RecordCount-1 do
    begin
      CmbITem.AddObject(trim(cds.fieldbyname(fName).AsString),TString.Create(trim(cds.fieldbyname(fCode).AsString)));
      if trim(cds.fieldbyname(fCode).AsString)=defaultCode then  defaultIndex:=i;

      if not cds.Eof then cds.next;
    end;
  end;

  result:=defaultIndex;
end;

procedure loadCmbList(cmb:TRzComboBox;cds:TclientDataset;strSQL,fCode,fName,defaultCode:string);
var i,defaultIndex : integer;
begin
  cds.close;
  cds.CommandText:=strsql;
  cds.open;

  defaultIndex:=0;

  cmb.Items.Clear;
  if cds.RecordCount>0 then
  begin
    cds.first;
    for i := 0 to cds.RecordCount-1 do
    begin
      cmb.Items.AddObject(trim(cds.fieldbyname(fName).AsString),TString.Create(trim(cds.fieldbyname(fCode).AsString)));
      if trim(cds.fieldbyname(fCode).AsString)=defaultCode then  defaultIndex:=i;

      if not cds.Eof then cds.next;
    end;

    cmb.ItemIndex:=defaultIndex;
  end;
end;


function IsInteger(S: string): boolean;
begin
  try
    StrToInt(S);
    Result := true;
  except
    Result := false;
  end;
end;

function IsFloat(S: string): boolean;
begin
  try
    StrToFloat(S);
    Result := true;
  except
    Result := false;
  end;
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter     := Delimiter;
   ListOfStrings.DelimitedText := Str;
end;



function isDate ( const DateString: string ): boolean;
begin
  try
    StrToDate ( DateString );
    result := true;
  except
    result := false;
  end;
end;


procedure HackNavMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const MoveBy : integer = 5;
begin
 if NOT (Sender is TNavButton) then Exit;

 case TNavButton(Sender).Index of
   nbPrior:
     if (ssCtrl in Shift) then
       TDBNavigator(TNavButton(Sender).Parent).
         DataSource.DataSet.MoveBy(-MoveBy);
   nbNext:
     if (ssCtrl in Shift) then
       TDBNavigator(TNavButton(Sender).Parent).
         DataSource.DataSet.MoveBy(MoveBy);
  end;
end;

procedure SetupHackedNavigator(
  const Navigator: TDBNavigator; const Glyphs: TImageList);
const
  Captions : array[TNavigateBtn] of string = ('First', 'Previous', 'Next', 'Last', 'Add','Erase', 'Edit', 'Save', 'Cancel', 'Revive');
(*
  Captions : array[TNavigateBtn] of string =
      ('First', 'Prior', 'Next', 'Last', 'Insert',
       'Delete', 'Edit', 'Post', 'Cancel', 'Refresh');

  in Croatia (localized):
  Captions : array[TNavigateBtn] of string =
      ('Prvi', 'Prethodni', 'Slijedeci', 'Zadnji', 'Dodaj',
       'Obrisi', 'Promjeni', 'Spremi', 'Odustani', 'Osvjezi');
*)
var
  btn : TNavigateBtn;
begin
  for btn := Low(TNavigateBtn) to High(TNavigateBtn) do
  with THackDBNavigator(Navigator).Buttons[btn] do
  begin
    //from the Captions const array
    Caption := Captions[btn];

    Transparent:=true;
    //the number of images in the Glyph property
    NumGlyphs := 1;
    // Remove the old glyph.
    Glyph := nil;
    // Assign the custom one
    case Integer(btn) of
      0:Glyphs.GetBitmap(63,Glyph);
      1:Glyphs.GetBitmap(5,Glyph);
      2:Glyphs.GetBitmap(26,Glyph);
      3:Glyphs.GetBitmap(64,Glyph);
      4:Glyphs.GetBitmap(1,Glyph);
      5:Glyphs.GetBitmap(16,Glyph);
      6:Glyphs.GetBitmap(19,Glyph);
      7:Glyphs.GetBitmap(61,Glyph);
      8:Glyphs.GetBitmap(8,Glyph);
      9:Glyphs.GetBitmap(57,Glyph);
    end;


    //Glyphs.GetBitmap(Integer(btn),Glyph);
    Layout:=blGlyphTop;
    Flat:=true;
    //OnMouseUp := HackNavMouseUp;
  end;
end;

function copyCdsA(cdsSource:TClientDataSet;cdsTarget:TClientDataSet):boolean;    // for targer field
var i,k:integer;
     str:string;
begin
try
  Result := False;

    cdsSource.First();
    while (not cdsSource.Eof) do
    begin
      cdsTarget.Append();

      for i := 0 to (cdsTarget.FieldCount - 1) do
      begin
        for k := 0 to (cdsSource.FieldCount - 1) do
           if  cdsTarget.Fields[i].FieldName=cdsSource.Fields[k].FieldName then
           begin
                   // str:=str+cdsTarget.Fields[i].FieldName+ '='+cdsSource.FieldByName(cdsSource.Fields[k].FieldName).AsString+#10#13;
                    cdsTarget.FieldByName(cdsTarget.Fields[i].FieldName).Value :=
                      cdsSource.FieldByName(cdsSource.Fields[k].FieldName).Value;
           end;
      end;


      try
      cdsTarget.Post();
      except
      end;
      cdsSource.Next();
    end;



    finally
    result := True;
  end;
end;


procedure initDataset(frm:TForm;_conn:TSQLConnection);
var provName:string;
  i:integer;
begin
    with frm do
    begin
      for I := 0 to frm.ComponentCount - 1 do
      begin
        if ((Components[I] is TClientDataset)  and (Components[I].Tag <> 99))
          then
        begin
          AddProv(frm,_conn,TClientDataSet(Components[I]).Name);
          initCDS(TClientDataSet(Components[I]).Name,TClientDataSet(Components[I]));
        end;
      end;
    end;
end;

procedure initDatasetA(frm:TForm;_conn:TSQLConnection;_cds:TClientDataSet);
var provName:string;
  i:integer;
begin

    AddProv(frm,_conn,_cds.Name);
    initCDS(_cds.Name,_cds);

end;


function DateTimeToUnix(ConvDate: TDateTime): Longint; 
begin 
  Result := Round((ConvDate - UnixStartDate) * 86400); 
end; 

function UnixToDateTime(USec: Longint): TDateTime;
begin
  Result := (Usec / 86400) + UnixStartDate; 
end;



function getServerDate(_cds:TClientDataSet):TDateTime;
  var
      curr_date:TDateTime;
  begin

    with _cds do
    begin
      close;
      CommandText:='SELECT CONVERT(DATETIME, {fn CURDATE()}) curr_date';
      open;

      if recordcount>0 then
      begin
        curr_date:=FieldByName('curr_date').AsDateTime;
      end;

      Result:=curr_date;
    end;

  end;

function getBookBankID(_cds:TClientDataSet;objcode:string):String;
  var
      rep:string;
  begin

    with _cds do
    begin
      close;
      CommandText:='select a.*,b.* from object_code a left join san$BANKBOOK b  on a.o_acccode=b.accid where a.o_code='''+objcode+'''';
      open;

      if recordcount>0 then
      begin
        rep:=trim(FieldByName('o_bookbank').AsString);
      end;

      Result:=rep;
    end;

  end;


function getUserFullName(_cds:TClientDataSet;UID:string):String;
  var
      rep:string;
  begin

    with _cds do
    begin
      close;
      CommandText:='select us_name from user_account where us_code='''+UID+'''';
      open;

      if recordcount>0 then
      begin
        rep:=trim(FieldByName('us_name').AsString);
      end;

      Result:=rep;
    end;

  end;

function getDonationsPointName(_cds:TClientDataSet;cde:string):String;
  var
      rep:string;
  begin

    with _cds do
    begin
      close;
      CommandText:='select MTTCDE,MTTDES from MTTCDE where MTTGRP=''FRONT'' and MTTACT=''A'' and MTTCDE='''+cde+'''';
      open;

      if recordcount>0 then
      begin
        rep:=trim(FieldByName('MTTDES').AsString);
      end;

      Result:=rep;
    end;

  end;


// foundation code
function getFoundNo(cds:TClientDataSet;objCode,CodeType:string):string;
var rep,olen,i,maxno,lencode:integer;
    fstr,repstr:string;

begin
  fstr:='';
  rep:=0;
  with cds do
  begin

    close;
    CommandText:='select MAX(fd_code) maxcode,LEN(MAX(fd_code)) lencode from found_code where fd_codetype='''+CodeType+''' ';
   // inputbox('','',CommandText);
    open;
    if recordcount>0 then
    begin
      if not FieldByName('maxcode').IsNull then
      maxno:= FieldByName('maxcode').AsInteger;

      if not FieldByName('lencode').IsNull then
      lencode:= FieldByName('lencode').AsInteger;
    end;

    close;
    CommandText:='select o_running,o_running_len from object_code where o_code='''+objCode+'''';
    open;
      if recordcount>0 then
      begin
        if FieldByName('o_running').IsNull then
          rep :=maxno
        else
          rep:=FieldByName('o_running').AsInteger+1;

        if FieldByName('o_running_len').IsNull then
          olen :=lencode
        else
          olen := FieldByName('o_running_len').AsInteger;

      end else
        rep :=1;

      for I := 0 to olen-1 do
        fstr:=fstr+'0';

      repstr := FormatCurr(fstr,rep+1);
  end;

  result:=repstr;

end;
procedure setFoundNo(cds:TClientDataSet;objCode:string;maxcode:integer);
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      CommandText:='select o_running,o_running_len from object_code where o_code='''+objCode+'''';

      open;
        if recordcount>0 then
        begin
          if FieldByName('o_running').IsNull then  rep :=maxcode
          else
          rep:=FieldByName('o_running').AsInteger+1;
        end;

      if rep>0 then
      begin
        close;
        CommandText:='update object_code set o_running='+inttostr(rep)+'  where o_code='''+objCode+''' ';
        Execute;
      end;


    end;

  end;


// DIS
function getRunning(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;
    end;

    result:=rep;

  end;

// DIS
function setRunning(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';

      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;

      if rep>0 then
      begin
        close;
        CommandText:='update MTTCDE set MTTNM1='+inttostr(rep+1)+'  where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+'''';
        Execute;
      end;


    end;

  end;


// BILL
function getBillNo(cds:TClientDataSet;abr,grp,cde,value_fieldname:string):integer;
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      //CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';
      CommandText:='select * from MTTCDE where  MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;
    end;

    result:=rep;

  end;



procedure setBillNo(cds:TClientDataSet;abr,grp,cde,value_fieldname:string);
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      //CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';
      CommandText:='select * from MTTCDE where MTTGRP='''+grp+''' and MTTCDE='''+cde+''' ';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;

      if rep>0 then
      begin
        close;
//        CommandText:='update MTTCDE set MTTNM1='+inttostr(rep+1)+'  where MTTABR='''+abr+''' and MTTGRP='''+grp+''' and MTTCDE='''+cde+'''';
        CommandText:='update MTTCDE set MTTNM1='+inttostr(rep+1)+'  where  MTTGRP='''+grp+''' and MTTCDE='''+cde+'''';
        Execute;
      end;


    end;

  end;

// Peroid
// BILL
function getPeroidNo(cds:TClientDataSet;abr,cde,value_fieldname:string):integer;
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      //CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP=''PEROID'' and MTTCDE='''+cde+''' ';
      CommandText:='select * from MTTCDE where MTTGRP=''PEROID'' and MTTCDE='''+cde+''' ';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;
    end;

    result:=rep;

  end;


function getNewDonatorId(cds:TClientDataSet):integer;
var rep:integer;
begin

    rep:=0;
    with cds do
    begin
      close;
      CommandText:='select (MAX(do_id)+1) as newdoid from donator';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName('newdoid').AsInteger;
        end;
    end;

  result:=rep;
end;

procedure setPeroidNo(cds:TClientDataSet;abr,cde,value_fieldname:string);
var rep:integer;
  begin
    rep:=0;
    with cds do
    begin
      close;
      //CommandText:='select * from MTTCDE where MTTABR='''+abr+''' and MTTGRP=''PEROID'' and MTTCDE='''+cde+''' ';
      CommandText:='select * from MTTCDE where  MTTGRP=''PEROID'' and MTTCDE='''+cde+''' ';
      open;
        if recordcount>0 then
        begin
          rep:=FieldByName(value_fieldname).AsInteger;
        end;

      if rep>0 then
      begin
        close;
        //CommandText:='update MTTCDE set MTTNM1='+inttostr(rep+1)+'  where MTTABR='''+abr+''' and MTTGRP=''PEROID'' and MTTCDE='''+cde+'''';
        CommandText:='update MTTCDE set MTTNM1='+inttostr(rep+1)+'  where  MTTGRP=''PEROID'' and MTTCDE='''+cde+'''';
        Execute;
      end;


    end;

  end;

function initSqlConnection(sqlconn:TSQLConnection):boolean;
var rep:boolean;
begin
  try
    rep:=false;
    xmlConn:=TXMLConfig.Create(ExtractFilePath(Application.ExeName)+_config_file);
    //xmlConn:=TXMLConfig.Create(_config_file);
    if (xmlConn.ReadString('AppConfig','ADDRESS','')='') then
    begin
        // mssql connection
        xmlConn.WriteString('AppConfig','ADDRESS','127.0.0.1');
        xmlConn.WriteString('AppConfig','HOSTNAME','dev.siamdev.org');
        xmlConn.WriteString('AppConfig','USER','sa');
        xmlConn.WriteString('AppConfig','PASSWORD','123456');
        xmlConn.WriteString('AppConfig','DATABASE',_sample_db);
        xmlConn.Save;
    end;

     _app_address:= xmlConn.ReadString('AppConfig','ADDRESS','');
     _app_hostname:= xmlConn.ReadString('AppConfig','HOSTNAME','');
     _app_database:=xmlConn.ReadString('AppConfig','DATABASE','');
     _app_user:=xmlConn.ReadString('AppConfig','USER','sa');
     _app_password:=xmlConn.ReadString('AppConfig','PASSWORD','123456');

     with sqlconn do
     begin
      Connected:=false;
      {
      Params.Values['HostName']:='192.168.41.45\SQLExpress';//app_address;
      Params.Values['DataBase']:='fddb_temp2';//_app_database;
      Params.Values['User_Name']:='sa';//_app_user;
      Params.Values['Password']:='sqlserver2008';//_app_password;
}
      Params.Values['HostName']:=_app_address;
      Params.Values['DataBase']:=_app_database;
      Params.Values['User_Name']:=_app_user;
      Params.Values['Password']:=_app_password;
      Connected:=true;
      rep:=true;
     end;
  except
    on err:Exception do
    begin
      rep:=false;
      MessageDlg(err.Message,mtError,[mbOK],0);
      ShowMessage(_app_address+'-'+_app_database+'-'+_app_user+'-'+_app_password);

    end;
  end;

  result:=rep;

end;


function AddProv(frm:TForm;Conn:TSQLConnection;ProvName: string): boolean;
begin
    //if frm.FindComponent(ProvName) <> nil then


      // begin
          InnerProv      := TDataSetProvider.Create(frm);
          InnerProv.Name := 'dsp_'+ProvName;
          InnerProv.UpdateMode := UpWhereAll;
          InnerProv.Options    := [poAllowCommandText, poRetainServerOrder, poAllowMultiRecordUpdates];
          SQ := TSQLDataSet.Create(frm);
          SQ.Name := 'SQL'+ProvName;
          SQ.SQLConnection := Conn;
          InnerProv.DataSet  := SQ;
          //ShowMessage('ADD Provider :'+InnerProv.Name);
         // TServerMethods1(self).RegisterProvider(InnerProv); //fuck it did not help
       //end;
end;


procedure initCDS(proveName:string;_cds:TClientDataSet);
begin
   if _cds=nil then _cds:=TClientDataSet.Create(Application);
   
   proveName:='dsp_'+_cds.Name;

   _cds.Close;
   _cds.ProviderName:=proveName;//_ProviderName;
   //ShowMessage('ADD Provider To DataSet '+_cds.Name+' ==>'+_cds.ProviderName);
end;

Procedure SetChildTaborders(const Parent: TWinControl) ;

   procedure FixTabOrder(const Parent: TWinControl) ;
   var
     ctl, L: Integer;
     List: TList;
   begin
     List := TList.Create;
     try
       for ctl := 0 to Parent.ControlCount - 1 do
       begin
         if Parent.Controls[ctl] is TWinControl then
         begin
           if List.Count = 0 then
        L := 0
           else
           begin
             with Parent.Controls[ctl] do
               for L := 0 to List.Count - 1 do
                 if (Top < TControl(List[L]).Top) or ((Top = TControl(List[L]).Top) and (Left < TControl(List[L]).Left)) then Break;
           end;

           List.Insert(L, Parent.Controls[ctl]) ;

              if Parent.Controls[ctl].Tag<>99 then
              begin

                 //TRzEdit
                 if  Parent.Controls[ctl] is TRzEdit then
                  begin
                     TRzEdit(Parent.Controls[ctl]).FocusColor:=_focusColor;
                     TRzEdit(Parent.Controls[ctl]).FrameVisible:=_frameVisivle;
                  end;
                 //TRzDBEdit
                 if  Parent.Controls[ctl] is TRzDBEdit then
                  begin
                     TRzDBEdit(Parent.Controls[ctl]).FocusColor:=_focusColor;
                     TRzDBEdit(Parent.Controls[ctl]).FrameVisible:=_frameVisivle;
                  end;
                 //TRzComboBox
                 if  Parent.Controls[ctl] is TRzComboBox then
                  begin
                     TRzComboBox(Parent.Controls[ctl]).FocusColor:=_focusColor;
                     TRzComboBox(Parent.Controls[ctl]).FrameVisible:=_frameVisivle;
                  end;
                 //TRzDBDateTimeEdit
                 if  Parent.Controls[ctl] is TRzDBDateTimeEdit then
                  begin
                     TRzDBDateTimeEdit(Parent.Controls[ctl]).FocusColor:=_focusColor;
                     TRzDBDateTimeEdit(Parent.Controls[ctl]).FrameVisible:=_frameVisivle;
                  end;
                 //TRzDBNumericEdit
                 if  Parent.Controls[ctl] is TRzDBNumericEdit then
                  begin
                     TRzDBNumericEdit(Parent.Controls[ctl]).FocusColor:=_focusColor;
                     TRzDBNumericEdit(Parent.Controls[ctl]).FrameVisible:=_frameVisivle;
                  end;
              end;



           FixTabOrder(TWinControl(Parent.Controls[ctl])) ;
           end;
         end;

       for ctl := 0 to List.Count - 1 do
         TWinControl(List[ctl]).TabOrder := ctl;
     finally
       List.Free;
     end;
   end;
 begin
   FixTabOrder(Parent) ;
 end;


 Procedure SetControl(const Parent: TWinControl;_enable:boolean) ;
   procedure FixTabOrder(const Parent: TWinControl) ;
   var
     ctl, L: Integer;
     List: TList;
   begin
     List := TList.Create;
     try
       for ctl := 0 to Parent.ControlCount - 1 do
       begin
         if Parent.Controls[ctl] is TWinControl then
         begin
           if List.Count = 0 then
        L := 0
           else
           begin
             with Parent.Controls[ctl] do
               for L := 0 to List.Count - 1 do
                 if (Top < TControl(List[L]).Top) or ((Top = TControl(List[L]).Top) and (Left < TControl(List[L]).Left)) then Break;
           end;

           List.Insert(L, Parent.Controls[ctl]) ;
             //TRzEdit
             if  Parent.Controls[ctl] is TRzEdit then
              begin
                 TRzEdit(Parent.Controls[ctl]).Enabled:=_enable;

                 if _enable then
                  TRzEdit(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzEdit(Parent.Controls[ctl]).Color:=_disableColor;


              end;
             //TRzDBEdit
             if  Parent.Controls[ctl] is TRzDBEdit then
              begin
                 TRzDBEdit(Parent.Controls[ctl]).Enabled:=_enable;
                 if _enable then
                  TRzDBEdit(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzDBEdit(Parent.Controls[ctl]).Color:=_disableColor;
              end;
             //TRzComboBox
             if  Parent.Controls[ctl] is TRzComboBox then
              begin
                 TRzComboBox(Parent.Controls[ctl]).Enabled:=_enable;
                 if _enable then
                  TRzComboBox(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzComboBox(Parent.Controls[ctl]).Color:=_disableColor;
              end;
             //TRzDBComboBox
             if  Parent.Controls[ctl] is TRzDBComboBox then
              begin
                 TRzDBComboBox(Parent.Controls[ctl]).Enabled:=_enable;
                 if _enable then
                  TRzDBComboBox(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzDBComboBox(Parent.Controls[ctl]).Color:=_disableColor;
              end;


             //TRzDBDateTimeEdit
             if  Parent.Controls[ctl] is TRzDBDateTimeEdit then
              begin
                 TRzDBDateTimeEdit(Parent.Controls[ctl]).Enabled:=_enable;
                 if _enable then
                  TRzDBDateTimeEdit(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzDBDateTimeEdit(Parent.Controls[ctl]).Color:=_disableColor;
              end;
             //TRzDBNumericEdit
             if  Parent.Controls[ctl] is TRzDBNumericEdit then
              begin
                 TRzDBNumericEdit(Parent.Controls[ctl]).Enabled:=_enable;
                 if _enable then
                  TRzDBNumericEdit(Parent.Controls[ctl]).Color:=_enableColor
                 else
                  TRzDBNumericEdit(Parent.Controls[ctl]).Color:=_disableColor;
              end;



           FixTabOrder(TWinControl(Parent.Controls[ctl])) ;
           end;
         end;

       for ctl := 0 to List.Count - 1 do
         TWinControl(List[ctl]).TabOrder := ctl;
     finally
       List.Free;
     end;
   end;
 begin
   FixTabOrder(Parent) ;
 end;

{ TString }

constructor TString.Create(const AStr: String);
begin
    inherited Create;
   FStr := AStr;
end;

{ TRecStamp }

constructor TRecStamp.Create;
var i: integer; 
begin 
  inherited; 
  for i:=0 to 7 do FData[i]:=0; 
end;

procedure TRecStamp.Free;
begin 
Destroy; 
end;

function TRecStamp.GetStamp: TRecStampData;
begin
  Result:=FData;
end;

function TRecStamp.IsBlank: boolean;
var i: integer; 
begin 
for i:=0 to High(FData) do 
   if FData[i]<>0 
      then begin 
           Result:=false; 
           break; 
           end 
      else Result:=true;
end;
function TRecStamp.IsSameStamp(otherData: TRecStampData): boolean;
var i: integer; 
begin 
if SizeOf(FData)<>SizeOf(otherData) then exit; 
for i:=0 to High(FData) do 
  if FData[i]<>otherData[i] 
     then begin 
          Result:=false; 
          break; 
          end 
     else Result:=true; 
end;

function TRecStamp.SetStamp(aField: TField): boolean;
type pTRecStampData= ^TRecStampData; 
var Buf: pointer; 
    BufSize: word; 
    pData: pTRecStampData; 
begin 
Result:=false; 
if not Assigned(aField) then exit; 
BufSize:=aField.DataSize; 
if BufSize<>SizeOf(TRecStampData) then exit; 
try 
  GetMem(Buf,BufSize); 
  aField.GetData(Buf); 
  pData:= pTRecStampData(Buf); 
  FData:=pData^; 
finally 
  FreeMem(Buf,BufSize); 
end; 
end;


{ TStringValue }

constructor TStringValue.Create(const ACode, AValue: string);
begin
 self.Code := ACode;
 self.Value := AValue;
end;

procedure TStringValue.SetCode(const Value: string);
begin
  FCode := Value;
end;

procedure TStringValue.SetValue(const Value: string);
begin
  FValue := Value;
end;

end.
