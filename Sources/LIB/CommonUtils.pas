unit CommonUtils;

interface
uses
  Windows, Messages,Classes, Forms,jvUIb,CommonLIB;

type
  TShowWindowType = (swNone, swModal, swNomal);

  function ShowInsigniaRegister(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: string): TForm; stdcall;

  function ShowReportGenerator(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: TDLLParameter;DefaultValue:TList): TForm; stdcall;

  function ShowFavorRegister(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: string): TForm; stdcall;

  function SelectFund(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: TDLLParameter; out _Output : TDLLParameter): TForm;stdcall;    

implementation


const
  InsignigReg = 'InsigniaReg.dll';
  FavorReg = 'FavorReg.dll';
  FndUtils = 'FndUtils.dll';
  RGLib = 'RGLib.dll';

  function ShowInsigniaRegister(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: string):TForm; external InsignigReg name 'Execute';

  function ShowReportGenerator(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: TDLLParameter;DefaultValue:TList):TForm; external RGLib name 'Execute';

  function ShowFavorRegister(
    _MainApp: TApplication; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: string):TForm; external FavorReg name 'Execute';

  function SelectFund(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: TDLLParameter; out _Output : TDLLParameter): TForm;  external FndUtils name 'SelectFund';

end.
