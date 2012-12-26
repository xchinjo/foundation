program ngfupload;

uses
  Forms,
  upload_main_form in 'upload_main_form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
