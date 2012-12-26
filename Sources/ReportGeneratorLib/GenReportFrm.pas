unit GenReportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBClient, MConnect, SConnect,
   StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  frxClass, frxDBSet, frxADOComponents, frxIBXComponents, frxBDEComponents,
  frxBarcode, frxDBXComponents, frxChart, frxExportHTML, frxDCtrl,
  frxExportPDF, frxExportXLS, frxExportCSV, ExtCtrls,ZLibEx,
  Grids, DBGrids, ListViewEx, DBXpress, SqlExpr, FMTBcd, Provider, RzPanel,
  RzLabel;

type






 TRParams = record
      Name : string;
      Value : string;
    end;


 TReportParam = Class
      public
        RParams : array of TRParams;

      constructor Create;
      procedure AddParam(Name: string; Value: string);

    End;

  TDLLParam = record
    UserID : String;
    WorkStation:String;
    Branch:String;
    PDM:String;
    PDT:String;
    Password : String;
    Param1:string;
  end;

TString = class(TObject)
   private
     fStr: String;
    procedure SetStr(const Value: String);
   public
     constructor Create(const AStr: String) ;
     property Str: String read FStr write SetStr;
   end;

  TGenParamType = (rpDate,rpString,rpStringList);

  TGenParam = class
    rpType:TGenParamType;
    rpDesc:string;
    rpCode:string;
    rpValue:string;
  //  rpList:TStrings;
  end;


  TSQLGenParam = record
    sqlParamNo:integer;
    sqlParams: array of TGenParam;
  end;

  TSQLGenParamClass = class
    public
      _params : array of TSQLGenParam;
    constructor create;
    procedure addParam(pNo:integer;Value:array of TGenParam);
  end;


  TfrmGenReport = class(Tform)
    Button1: TButton;
    cdsParamsList: TClientDataSet;
    cdsParamsObj: TClientDataSet;
    cdsRec: TClientDataSet;
    DataSource1: TDataSource;
    cdsParamsObjValue: TClientDataSet;
    cdsParamsObjValueID: TIntegerField;
    cdsParamsObjValueTYPE: TStringField;
    cdsParamsObjValueDESC: TStringField;
    cdsParamsObjValueCODE: TStringField;
    cdsParamsObjValueVALUE: TStringField;
    ClientDataSet1: TClientDataSet;
    frxCSVExport1: TfrxCSVExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxDialogControls1: TfrxDialogControls;
    frxHTMLExport1: TfrxHTMLExport;
    frxChartObject1: TfrxChartObject;
    cdsReport4: TClientDataSet;
    cdsReport2: TClientDataSet;
    cdsReport3: TClientDataSet;
    cdsReport5: TClientDataSet;
    frxDBXComponents1: TfrxDBXComponents;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxBDEComponents1: TfrxBDEComponents;
    frxIBXComponents1: TfrxIBXComponents;
    frxADOComponents1: TfrxADOComponents;
    frxReport: TfrxReport;
    frxDBDataset5: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    cdsRepTemp: TClientDataSet;
    cdsReport: TClientDataSet;
    cdsReport1: TClientDataSet;
    frxDBDataset4: TfrxDBDataset;
    Conn: TSQLConnection;
    SQLDataset: TSQLDataSet;
    dsp: TDataSetProvider;
    DBGrid1: TDBGrid;
    btnOK: TButton;
    _cdsTemp: TClientDataSet;
    pnContainer: TRzPanel;
    ListView1: TListViewEx;
    btnClose: TButton;
    RzLabel1: TRzLabel;
    dsRepTemp: TDataSource;
    DBGrid2: TDBGrid;
    CdsName: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    _params:string;
    _paramsCount:integer;
    FreportCode: string;
    _fixParam:TStringList;
    FreportTitle: string;
    FPDT: string;
    FUserID: string;
    FPDM: string;
    FBranch: string;
    FWorkStation: string;
    FdefaultValue: TList;

    procedure GenParameter(report_id:string;scon: TSQLConnection);
    procedure ShowReport(scon:TSQLConnection;reportid: string;cdsParamObjValue:TClientDataSet);
    function genReportA(scon: TSQLConnection; cds: TClientDataSet;
  sql_fieldname, reportid: string; _params: TClientDataSet): boolean;
    procedure SetreportCode(const Value: string);
    procedure SetreportTitle(const Value: string);
    procedure SetBranch(const Value: string);
    procedure SetPDM(const Value: string);
    procedure SetPDT(const Value: string);
    procedure SetUserID(const Value: string);
    procedure SetWorkStation(const Value: string);
    procedure SetdefaultValue(const Value: TList);
  public
    { Public declarations }
    property reportCode :string read FreportCode write SetreportCode;
    property reportTitle:string  read FreportTitle write SetreportTitle;

    property UserID : string  read FUserID write SetUserID;
    property Branch : string  read FBranch write SetBranch;
    property PDM : string  read FPDM write SetPDM;
    property PDT : string  read FPDT write SetPDT;
    property WorkStation : string  read FWorkStation write SetWorkStation;

    property defaultValue : TList read FdefaultValue write SetdefaultValue;
  end;

var
  frmGenReport: TfrmGenReport;

implementation

uses CommonLIB, CommonUtils;





{$R *.dfm}

{ Compress a stream }
procedure CompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  InpBytes, OutBytes: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  try
    GetMem(InpBuf, inpStream.Size);
    inpStream.Position := 0;
    InpBytes := inpStream.Read(InpBuf^, inpStream.Size);

    ZCompress(InpBuf, InpBytes, OutBuf, OutBytes);
    outStream.Write(OutBuf^, OutBytes);
  finally
    if InpBuf <> nil then FreeMem(InpBuf);
    if OutBuf <> nil then FreeMem(OutBuf);
  end;
end;





{ Decompress a stream }
procedure DecompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  OutBytes, sz: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz     := inpStream.Size - inpStream.Position;
  if sz > 0 then
    try
      GetMem(InpBuf, sz);
      inpStream.Read(InpBuf^, sz);
      ZDecompress(InpBuf, sz, OutBuf, OutBytes);
      outStream.Write(OutBuf^, OutBytes);
    finally
      if InpBuf <> nil then FreeMem(InpBuf);
      if OutBuf <> nil then FreeMem(OutBuf);
    end;
  outStream.Position := 0;
end;

procedure TfrmGenReport.btnOKClick(Sender: TObject);
var i,row:integer;

    obj,rpVariables:array of TReportParam;

begin
  frxReport.Report.Clear;

  try
    for  row:=0 to ListView1.Items.Count-1 do
    begin
        if cdsParamsObjValue.Active then
          if cdsParamsObjValue.RecordCount>0 then
           if cdsParamsObjValue.Locate('ID',TComponent(ListView1.Items[row].Data).Tag,[]) then
           begin
              cdsParamsObjValue.Edit;
              if ( TComponent(ListView1.Items[row].Data) is TEdit ) then  cdsParamsObjValueVALUE.AsString:=TEdit(ListView1.Items[row].Data).Text;
              if ( TComponent(ListView1.Items[row].Data) is TDateTimePicker ) then  cdsParamsObjValueVALUE.AsString:=FormatDateTime('yyyy-MM-dd',TDateTimePicker(ListView1.Items[row].Data).Date);
              if ( TComponent(ListView1.Items[row].Data) is TComboBox ) then  cdsParamsObjValueVALUE.AsString:=TString(TComboBox(ListView1.Items[row].Data).Items.Objects[TComboBox(ListView1.Items[row].Data).ItemIndex]).Str;

           end;
    end;

    Application.ProcessMessages;
    Screen.Cursor:=crHourGlass;
    btnOK.Enabled:=false;
    ShowReport(Conn,FreportCode,cdsParamsObjValue);
  except
    on ee:Exception do
    begin
      Screen.Cursor:=crDefault;
      Application.MessageBox(pchar(ee.Message),pchar('Warning'),MB_OK or MB_ICONWARNING);
    end;

  end;

end;

procedure TfrmGenReport.Button1Click(Sender: TObject);
var
  r: TRect;
  pb: TComboBox;
  dt: TDateTimePicker;
  ed:TEdit;
begin

  (*
  //
  Listview1.ViewStyle         := vsReport;
//  Listview1.Items.Add.Caption := 'Text';

  r := Listview1.Items[0].DisplayRect(drBounds);
  r.Left  := r.Left + Listview1.columns[0].Width;
  r.Right := r.Left + Listview1.columns[1].Width;

  pb := TComboBox.Create(Self);
  pb.Parent := Listview1;
  pb.BoundsRect := r;

  pb.Items.Add('11111');
  pb.Items.Add('2222');
  pb.Items.Add('3333');


  Listview1.Items[1].Data := pb;

  *)

  //
  Listview1.ViewStyle         := vsReport;
//  Listview1.Items.Add.Caption := 'Text';

  r := Listview1.Items[0].DisplayRect(drBounds);
  r.Left  := r.Left + Listview1.columns[0].Width;
  r.Right := r.Left + Listview1.columns[1].Width;

  dt := TDateTimePicker.Create(Self);
  dt.Parent := Listview1;
  dt.BoundsRect := r;


  Listview1.ViewStyle         := vsReport;
//  Listview1.Items.Add.Caption := 'Text';

  r := Listview1.Items[1].DisplayRect(drBounds);
  r.Left  := r.Left + Listview1.columns[0].Width;
  r.Right := r.Left + Listview1.columns[1].Width;

  dt := TDateTimePicker.Create(Self);
  dt.Parent := Listview1;
  dt.BoundsRect := r;




//  Listview1.Items[0].Data := ed;



end;


procedure TfrmGenReport.btnCancelClick(Sender: TObject);
var selectNode:TTreeNode;
    i,sqlCount,paramCount:integer;
    rptPrefix:string;
    rPStream,rptPStream:Tstream;
    GenParams: TSQLGenParamClass;

    blobF : TBlobField;
    bs,rs : TStream;

    paramStr:TStrings;
//    _sqlParams:TGenParam;

begin
  cdsRec.Close;
  cdsRec.CommandText:='SELECT * FROM  AppReport  WHERE ID=41';
  cdsRec.Open;
  if cdsRec.RecordCount>0  then
  begin
     if not (cdsRec.State in [dsInsert,dsEdit] ) then
      cdsRec.Edit;
     {parameter list}
      GenParams:=TSQLGenParamClass.create;
      cdsParamsList.Close;
      cdsParamsList.CreateDataSet;

      for sqlCount := 0 to 5 do
      begin
       {parameter object}
       cdsParamsObj.Close;
       cdsParamsObj.CreateDataSet;

      (*
       // SetLength(_sqlParams,5);
       //    GenParams[0].sqlParams
    //    GenParams[sqlCount].sqlParams     // sql parameter
        if sqlCount=0 then paramStr:=ParamListCMD0.Strings;
        if sqlCount=1 then paramStr:=ParamListCMD1.Strings;
        if sqlCount=2 then paramStr:=ParamListCMD2.Strings;
        if sqlCount=3 then paramStr:=ParamListCMD3.Strings;
        if sqlCount=4 then paramStr:=ParamListCMD4.Strings;
        if sqlCount=5 then paramStr:=ParamListCMD5.Strings;
        if paramStr.Count>0 then
        begin

          //SetLength(_sqlParams,paramStr.Count-1);
          //for paramCount := 0 to paramStr.Count-1 do  // parameter count
          {
          for paramCount := 0 to 5 do  // parameter count
            begin
              _sqlParams[paramCount]:=TGenParam.Create;
              _sqlParams[paramCount].rpType:=rpDate;
              _sqlParams[paramCount].rpDesc:='xxx';
              _sqlParams[paramCount].rpCode:='';
              _sqlParams[paramCount].rpValue:='bbb';
//            _sqlParams[paramCount].rpList:=nil;
            end;
            }
        end;
        GenParams.addParam(sqlCount,_sqlParams);
        *)
      end;

      rPStream:=TMemoryStream.Create;
      blobF := cdsRec.FieldByName('SQLPOBJ') as TBlobField;
      rPStream := cdsRec.CreateBlobStream(blobF, bmWrite) ;
      cdsParamsList.SaveToStream(rPStream);
      (cdsRec.FieldByName('SQLPOBJ') as TBlobField).LoadFromStream(rPStream);
      //rPStream.Write(GenParams,sizeof(GenParams)) ;
      //rPStream:=TMemoryStream.Create;
      //rPStream.
      //(cdsRec.FieldByName('SQLPOBJ') as TBlobField).LoadFromStream(rPStream);
      rptPStream:=TMemoryStream.Create;
      cdsParamsList.SaveToStream(rptPStream);
      CompressStream(rptPStream, rptPStream);
      //CompressStream(rPStream, rPStream);
      (cdsRec.FieldByName('SQLPOBJPARAMS') as TBlobField).LoadFromStream(rptPStream);
     // (cdsRec.FieldByName('SQLPOBJ') as TBlobField).LoadFromStream(rPStream);
      {
      cdsRec.FieldByName('PARAMS').AsString:=ValueListEditor.Strings.Text;
      cdsRec.FieldByName('SQLPARAM').AsString:= ParamListCMD0.Strings.Text;
      cdsRec.FieldByName('SQLPARAM1').AsString:=ParamListCMD1.Strings.Text;
      cdsRec.FieldByName('SQLPARAM2').AsString:=ParamListCMD2.Strings.Text;
      cdsRec.FieldByName('SQLPARAM3').AsString:=ParamListCMD3.Strings.Text;
      cdsRec.FieldByName('SQLPARAM4').AsString:=ParamListCMD4.Strings.Text;
      cdsRec.FieldByName('SQLPARAM5').AsString:=ParamListCMD5.Strings.Text;
      }
      cdsRec.FieldByName('UPDATE_ON').AsDateTime := Now;

     // if not (cdsBlobDATA.State in [dsInsert,dsEdit] ) then
     //   cdsBlobDATA.Edit;
     //   cdsBlobDATA['PARAMS']:=BlobValueListEditor.Strings.Text;

      cdsRec.Post;
      cdsRec.ApplyUpdates(0);
      ShowMessage('Save successfully.');
      selectNode.Text:='['+trim(cdsRec.fieldbyname('REPORT_ID').AsString)+'] '+cdsRec.Fieldbyname('REPORT_NAME').AsString;
      rptPrefix:=trim(cdsRec.fieldbyname('REPORT_ID').AsString);
      //btnSave.Enabled:=false;
    //end;
  end;

//  ReportsTree.Update;


  // backup

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Backup\'+FormatDateTime('ddMMyyyy',Now())) then
    ForceDirectories(ExtractFilePath(Application.ExeName)+'Backup\'+FormatDateTime('ddMMyyyy',Now()));




end;


procedure TfrmGenReport.Button3Click(Sender: TObject);
begin


  Conn.Connected:=false;
  Conn.Connected:=true;

  {
  SockCon.Address:='172.17.40.47';
  SockCon.AutoConnect:=true;
  SockCon.AutoProv:=true;
  SockCon.Deploy:=true;
  SockCon.Encoded:=true;

  SockCon.Connected:=true;
  }

  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ShowMessage(IntToStr(ClientDataSet1.RecordCount));
end;

procedure TfrmGenReport.FormShow(Sender: TObject);
begin
  GenParameter(FreportCode,Conn);
end;

function Before(SubStr, s: string): string;
var
    i: integer;
begin
    i := Pos(SubStr, s);
    if i > 0 then
        Before := Copy(s, 1, i - 1)
    else
        Before := '';
end;


function After(InpStr, s: string): string;
var
    i: integer;
begin
    i := Pos(InpStr, s);
    if i <> 0 then
        Result := Copy(s, i + Length(InpStr), Length(S));
end;



procedure TfrmGenReport.GenParameter(report_id: string;scon: TSQLConnection);
var
  r: TRect;
  pb: TComboBox;
  dt: TDateTimePicker;
  ed:TEdit;

  i,k,j,ll,iDefault:integer;

  xx:TStringList;

  blobF : TBlobField;
  rptPStream,_rptPStream,rs : TStream;

  cmbItemList: TStringList;
  cmbItemCode,cmbItemDesc : string;
begin
  //
  SetLength(_Params,5);
  _paramsCount:=0;


  cdsParamsObjValue.Close;
  cdsParamsObjValue.CreateDataSet;

  //cdsRepTemp.RemoteServer:=scon;
  //TSQLConnection(cdsRepTemp.RemoteServer).AddProv('report_prov005', 'ALL');

  //cdsRepTemp.ProviderName:='report_prov005';
  cdsRepTemp.CommandText:='select * from  AppReport  where REPORT_ID='''+report_id+'''';

  cdsRepTemp.Open;
  ListView1.Items.Clear;
  if cdsRepTemp.Active then
   if cdsRepTemp.RecordCount>0 then
    begin
        self.Caption:='Report Generator ['+cdsRepTemp.FieldByName('REPORT_ID').AsString+'-'+cdsRepTemp.FieldByName('REPORT_NAME').AsString+']';

        if ((cdsRepTemp.FieldByName('VERSION').IsNull) or (cdsRepTemp.FieldByName('VERSION').AsInteger<1))  then
        begin
          MessageDlg('Report not support !!!',mtError,[mbOK],0);
          btnOK.Enabled:=false;
        end else
        begin


          blobF := cdsRepTemp.FieldByName('SQLPOBJ') as TBlobField;
          rptPStream := cdsRepTemp.CreateBlobStream(blobF, bmRead);

          cdsParamsList.LoadFromStream(rptPStream);
          if cdsParamsList.Active then
          begin
            cdsParamsList.First;

            for I := 0 to cdsParamsList.RecordCount - 1 do     {sql params count upto 5 pack}
            //for I := 0 to 0 do
              begin
                rptPStream:=TStream.Create;

                blobF := cdsParamsList.FieldByName('OBJ') as TBlobField;
                rptPStream := cdsParamsList.CreateBlobStream(blobF, bmRead);

                _rptPStream:=TMemoryStream.Create;
                DecompressStream(rptPStream,_rptPStream);
                cdsParamsObj.LoadFromStream(_rptPStream);

                if cdsParamsObj.Active then
                begin
                  cdsParamsObj.IndexFieldNames:='ID';
                   cdsParamsObj.First;
                  for j := 0 to cdsParamsObj.RecordCount - 1 do
                  begin
                      if cdsParamsObj.FieldByName('TYPE').AsInteger<>5 then
                      begin
                      cdsParamsObj.Edit;
                      cdsParamsObj.FieldByName('VALUE').AsString:='';
                      cdsParamsObj.Post;
                      end;
                      if not cdsParamsObj.Eof then cdsParamsObj.Next;
                  end;


                  if _fixParam<>nil then
                  for ll := 0 to _fixParam.Count - 1 do
                  begin
                    if ll>0 then
                    begin
                      if cdsParamsObj.Locate('CODE',Before('=',_fixParam[ll]),[]) then
                      begin
                          cdsParamsObj.Edit;
                          cdsParamsObj.FieldByName('VALUE').AsString:=After('=',_fixParam[ll]);
                          cdsParamsObj.FieldByName('ID').AsInteger:=(99+ll);
                          cdsParamsObj.Post;
                      end;
                    end;
                  end;



                  cdsParamsObj.First;
                  //ShowMessage(inttostr(cdsParamsObj.RecordCount));
                  for j := 0 to cdsParamsObj.RecordCount - 1 do
                  begin

                    cdsParamsObjValue.Append;

                    if cdsParamsObj.FieldByName('ID').AsInteger<99 then
                      cdsParamsObjValueID.AsInteger:=_paramsCount
                    else
                      cdsParamsObjValueID.AsInteger:=cdsParamsObj.FieldByName('ID').AsInteger;

                    cdsParamsObjValueTYPE.AsString:=cdsParamsObj.FieldByName('TYPE').AsString;
                    cdsParamsObjValueDESC.AsString:=cdsParamsObj.FieldByName('DESC').AsString;
                    cdsParamsObjValueCODE.AsString:=cdsParamsObj.FieldByName('CODE').AsString;
                    cdsParamsObjValueVALUE.AsString:=cdsParamsObj.FieldByName('VALUE').AsString;
                    cdsParamsObjValue.Post;

//                    if trim(cdsParamsObjValueVALUE.AsString)='' then
                    begin
                     Listview1.Items.Add.Caption := cdsParamsObj.FieldByName('DESC').AsString;
                      case cdsParamsObj.FieldByName('TYPE').AsInteger of
                          4:
                            begin
                              r := Listview1.Items[_paramsCount].DisplayRect(drBounds);
                              r.Left  := r.Left + Listview1.columns[0].Width;
                              r.Right := r.Left + Listview1.columns[1].Width;

                              dt := TDateTimePicker.Create(Self);
                              dt.Parent := Listview1;
                              dt.BoundsRect := r;
                              Listview1.Items[_paramsCount].Data := dt;
                              TComponent(ListView1.Items[_paramsCount].Data).Tag:=_paramsCount;

                            end;
                          1,2,3:
                            begin
                              r := Listview1.Items[_paramsCount].DisplayRect(drBounds);
                              r.Left  := r.Left + Listview1.columns[0].Width;
                              r.Right := r.Left + Listview1.columns[1].Width;

                              ed := TEdit.Create(Self);
                              ed.Parent := Listview1;
                              ed.BoundsRect := r;

                              if defaultValue<> nil then
                                for iDefault := 0 to defaultValue.Count-1 do
                                begin
                                  if UpperCase(TStringValue(defaultValue[iDefault]).Code)=UpperCase(trim(cdsParamsObj.FieldByName('CODE').AsString))  then
                                    ed.Text := TStringValue(defaultValue[iDefault]).Value;
                                end;

                              Listview1.Items[_paramsCount].Data := ed;
                              TComponent(Listview1.Items[_paramsCount].Data).Tag:=_paramsCount;
                            end;
                          5:
                            begin
                              r := Listview1.Items[_paramsCount].DisplayRect(drBounds);
                              r.Left  := r.Left + Listview1.columns[0].Width;
                              r.Right := r.Left + Listview1.columns[1].Width;

                              pb := TComboBox.Create(Self);
                              pb.Parent := Listview1;
                              pb.BoundsRect := r;

                              // 1-xxxx;2-sssss;3-ddddddd
                              // select kvpcode as code ,kvpname as name from table ;

                              CdsName.Close ;
                              CdsName.CommandText := cdsParamsObj.FieldByName('VALUE').AsString ; //'select [key_id] as code, key_value as name from KVP_Table' ;
                              CdsName.Open ;
                  //            ShowMessage(IntToStr(CdsName.RecordCount)) ;

                              cmbItemList:=TStringList.Create;
                  //            Split(';',cdsParamsObj.FieldByName('VALUE').AsString, cmbItemList);
                              CdsName.First ;
                              for k := 0 to CdsName.RecordCount -1 do
                              begin
                               // ShowMessage(cmbItemList.Strings[k]);
                  //              cmbItemCode:=Before('-',cmbItemList.Strings[k]);
                  //              cmbItemDesc:=After('-',cmbItemList.Strings[k]);

                                cmbItemCode := trim(CdsName.fieldbyname('code').AsString) ;
                                cmbItemDesc := trim(CdsName.fieldbyname('name').AsString) ;

                                if (trim(cmbItemCode)<>'') and (trim(cmbItemDesc)<>'') then
                                  pb.Items.AddObject(cmbItemDesc,TString.Create(cmbItemCode)) ;
                                  CdsName.Next ;

                               //   pb.Items.AddObject(cmbItemDesc,TString.Create(cmbItemCode))
                               // pb.Items.AddObject(cmbItemList.Strings[k],TString.Create(cmbItemList.Strings[k]))
                              end;




                              {
                              for k := 0 to 5 do
                              begin
                               // cmbItemCode:=Before('-',cmbItemList.Strings[k]);
                               // cmbItemDesc:=After('-',cmbItemList.Strings[k]);

                               // pb.Items.AddObject(cmbItemDesc,TString.Create(cmbItemCode))
                                pb.Items.AddObject('aaa'+inttostr(k),TString.Create('obj'+inttostr(k))) ;
                              end;
                              }

                              if pb.Items.Count>=0 then pb.ItemIndex:=0;

                              Listview1.Items[_paramsCount].Data := pb;
                              TComponent(Listview1.Items[_paramsCount].Data).Tag := _paramsCount;
                            end;
                      end;
                       inc(_paramsCount);
                    end;



                     if not cdsParamsObj.Eof  then cdsParamsObj.Next;
                  end;

                end;


                if not cdsParamsList.Eof then cdsParamsList.Next
              end;
          end;
        end;
    end;
end;

function TfrmGenReport.genReportA(scon: TSQLConnection; cds: TClientDataSet;
  sql_fieldname, reportid: string; _params: TClientDataSet): boolean;
var p,pcount,sqlCount,paramCount:integer;
    paramName,paramValue,sqlstr:string;

    isok:boolean;

    //_cdsTemp:TClientDataSet;
    GenParams: TSQLGenParamClass;
    rptPStream:TStream;
    blobF : TBlobField;
begin

          isok:=true;
          //_cdsTemp:=TClientDataSet.Create(self);

          _cdsTemp.Close;

          
          //_cdsTemp.RemoteServer:=scon;
          //TSQLConnection(_cdsTemp.RemoteServer).AddProv('report_prov005', 'ALL');
          //_cdsTemp.ProviderName:='report_prov005';

         // if trim(_cdsTemp.ProviderName)<>'' then
         /// initDatasetA(self,Conn,_cdsTemp);
        //TSQLConnection(_cdsTemp.RemoteServer).AddProv('report_prov005', 'ALL');

        //_cdsTemp.ProviderName:='report_prov005';

         // _cdsTemp.ProviderName:='cdsRepTemp';
         // _cdsTemp.RemoteServer:=scon;
          _cdsTemp.CommandText:='select * from  AppReport  where REPORT_ID='''+reportid+'''';
          _cdsTemp.Open;

          //rptPStream:=cdsRepTemp.CreateBlobStream(cdsRepTemp.FieldByName('SQLPOBJ'), bmRead);


          blobF := _cdsTemp.FieldByName('SQLPOBJ') as TBlobField;
          rptPStream := _cdsTemp.CreateBlobStream(blobF, bmRead);
          //rptPStream.Read(GenParams,rptPStream.Size);
          rptPStream.Read(GenParams,SizeOf(TSQLGenParamClass));



          sqlstr:=_cdsTemp.fieldbyname(sql_fieldname).AsString;

          if (Trim(sqlstr)<>'') then
          begin
            cds.Close;
            //cds.RemoteServer:=scon;
            //TSQLConnection(cds.RemoteServer).AddProv('report_prov006', 'ALL');
            //cds.ProviderName:='report_prov006';

            //cds.ProviderName:='report_prov006';
            cds.CommandText:=sqlstr;
            if _params<>nil then      // have parameter
            begin
             // if High(_params.RParams)>0 then
              //ShowMessage(inttostr(cds.Params.Count));
              begin
              //if ((cds.Params.Count>0) and (_params.RecordCount>=cds.Params.Count)) then
              if (cds.Params.Count>0) then
                for p:=0 to cds.Params.Count-1 do
                begin
                  //if Trim(paramName)<>'' then
                    _params.First;
                    for pcount:=0 to _params.RecordCount-1 do
                    begin
                      paramName:= trim(_params.FieldByName('CODE').AsString);//Before('=',params.Strings[pcount]);
                      paramValue:=trim(_params.FieldByName('VALUE').AsString);//After('=',params.Strings[pcount]);

                      //ShowMessage(cds.Params[p].Name);
                      
                      if pcount<=cds.Params.Count then
                        //if cds.Params[0] [].Items[p].Name=paramName then
                        if cds.Params[p].Name=paramName then
                        begin
                           //cds.Params.Items[p].Value:=paramValue;

                           cds.Params[p].Value:=paramValue;
                           //ShowMessage(paramName+'='+paramValue);
                        end;
                      if not _params.Eof then _params.Next;                      
                    end;
                  (********* for support empty value
                  if Trim(cds.Params.Items[p].Value)='' then
                  begin

                    MessageDlg('Parameter '''+cds.Params.Items[p].Name+''' not found!!!',mtWarning,[mbOK],0);

                    //Application.MessageBox(pchar('Parameter '''+cds.Params.Items[p].Name+''' not found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                    isok:=false;
                  end;
                  *)
                end;

              end;{ else
              begin
                // no parameter found
                Application.MessageBox(pchar('No Parameter  found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                isok:=false;
              end;  }
              if isok then
                cds.open;
            end else
              begin
                // no parameter found
                MessageDlg('Parameter '''+cds.Params.Items[p].Name+''' not found!!!',mtWarning,[mbOK],0);
                //Application.MessageBox(pchar('No Parameter  found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                isok:=false;
              end;
          end;

          Result:=isok;
end;

procedure Split(const Delimiter: Char;Input: string;const Strings: TStrings) ;
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure TfrmGenReport.SetBranch(const Value: string);
begin
  FBranch := Value;
end;

procedure TfrmGenReport.SetPDM(const Value: string);
begin
  FPDM := Value;
end;

procedure TfrmGenReport.SetPDT(const Value: string);
begin
  FPDT := Value;
end;

procedure TfrmGenReport.SetreportCode(const Value: string);
begin

  if Pos(';',Value)>0 then
  begin
    _fixParam:=TStringList.Create;
    Split(';', Value,_fixParam) ;
    FreportCode := _fixParam[0];
  end else
  begin
    FreportCode := Value;
  end;
end;

procedure TfrmGenReport.SetreportTitle(const Value: string);
begin
  FreportTitle := Value;
end;

procedure TfrmGenReport.SetUserID(const Value: string);
begin
  FUserID := Value;
end;

procedure TfrmGenReport.SetWorkStation(const Value: string);
begin
  FWorkStation := Value;
end;

procedure TfrmGenReport.ShowReport(scon: TSQLConnection; reportid: string;cdsParamObjValue:TClientDataSet);
var
  I,j,reportTag,sqlCount,paramCount: Integer;
 // dsName:TStringList;
  rStream,rptStream:Tstream;
  showreport:boolean;

  rpVariable:TReportParam;
  blobF : TBlobField;
  rptPStream:TStream;
  GenParams: TSQLGenParamClass;

  //_sqlParams:TGenParam;
  bs,rs : TStream;

  // for sample write to file
  Stream: TFileStream;

begin
  showreport:=true;


  rptStream:=TMemoryStream.Create;
  rStream:=TMemoryStream.Create;
  cdsRepTemp.Close;

//  cdsRepTemp.RemoteServer:=scon;
//  TSQLConnection(cdsRepTemp.RemoteServer).AddProv('report_prov004', 'ALL');
 // cdsRepTemp.ProviderName:='report_prov004';
  cdsRepTemp.CommandText:='select * from  AppReport  where REPORT_ID='''+reportid+'''';

  cdsRepTemp.Open;

  if cdsRepTemp.Active then
    if cdsRepTemp.RecordCount>0 then
    begin

       rStream:=cdsRepTemp.CreateBlobStream(cdsRepTemp.FieldByName('REPORT_CONTEXT'), bmRead);
       reportTag:=cdsRepTemp.fieldByName('ID').AsInteger;

       if (rStream.Size>0) then
       begin
         DecompressStream(rStream,rptStream);
         frxReport.LoadFromStream(rptStream);



         cdsReport.close;
         cdsReport1.close;
         cdsReport2.close;
         cdsReport3.close;
         cdsReport4.close;
         cdsReport5.close;



                  if trim(cdsRepTemp.fieldbyname('STRSQL').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport,'STRSQL',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL1').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport1,'STRSQL1',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL2').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport2,'STRSQL2',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL3').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport3,'STRSQL3',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL4').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport4,'STRSQL4',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL5').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport5,'STRSQL5',reportid,cdsParamObjValue);


                  frxReport.Tag:= reportTag;


                  Application.ProcessMessages;
                  Screen.Cursor:=crDefault;
                  if showreport then
                  begin
                      frxReport.Variables['PARAM_UID'] :=QuotedStr(UserID);
                      frxReport.Variables['PARAM_REPORTID'] :=QuotedStr(reportid);
                      frxReport.PrepareReport();
                      frxReport.ShowReport();
                  end;


            btnOK.Enabled:=true;

       end;


    end;
end;


{ TReportParam }

procedure TReportParam.AddParam(Name, Value: string);
begin

end;

constructor TReportParam.Create;
begin

end;

{ TString }

constructor TString.Create(const AStr: String);
begin
    inherited Create;
   FStr := AStr;
end;

procedure TString.SetStr(const Value: String);
begin
  FStr := Value;
end;

{ TSQLGenParamClass }

procedure TSQLGenParamClass.addParam(pNo: integer;
  Value: array of TGenParam);
var NewCount,i:integer;
begin
  NewCount := Length(_params)+1;
  SetLength(_params, NewCount);
  _params[High(_params)].sqlParamNo:=pNo;

  SetLength(_params[High(_params)].sqlParams,High(Value));
  for i := 0 to High(Value)-1 do
  begin
    _params[High(_params)].sqlParams[i]:=TGenParam.Create;
    _params[High(_params)].sqlParams[i].rpType:=Value[i].rpType;
    _params[High(_params)].sqlParams[i].rpDesc:=Value[i].rpDesc;
    _params[High(_params)].sqlParams[i].rpCode:=Value[i].rpCode;
    _params[High(_params)].sqlParams[i].rpValue:=Value[i].rpValue;
//    _params[High(_params)].sqlParams[i].rpList:=Value[i].rpList;
  end;
end;

constructor TSQLGenParamClass.create;
begin
     inherited Create;
    _params:=nil;
end;

procedure TfrmGenReport.FormCreate(Sender: TObject);
begin
  initDataset(self,Conn);
end;

procedure TfrmGenReport.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGenReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then btnOKClick(sender);
end;

procedure TfrmGenReport.SetdefaultValue(const Value: TList);
begin
  FdefaultValue := Value;
end;

end.
