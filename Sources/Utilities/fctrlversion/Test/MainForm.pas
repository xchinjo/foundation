unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jvuib;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    JvUIBDataBase1: TJvUIBDataBase;
    JvUIBTransaction1: TJvUIBTransaction;
    JvUIBQuery1: TJvUIBQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses fctrlversion;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  _File: TFileStream;
begin
//  FileDownload(JvUIBTransaction1, Edit1.Text, '00000000000000000000', 'NGFS');
  JvUIBQuery1.Open();
  _File := TFileStream.Create(Edit1.Text, fmCreate);
  try
    JvUIBQuery1.ReadBlob('FILE_DATA', _File);
//    _File.
  finally
    _File.Free();
    JvUIBQuery1.Close(etmCommit);
  end;
end;

end.
