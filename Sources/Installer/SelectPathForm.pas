unit SelectPathForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ShellCtrls;

type
  TfrmSelectPath = class(TForm)
    stvBrowse: TShellTreeView;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectPath: TfrmSelectPath;

implementation

{$R *.dfm}

procedure TfrmSelectPath.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width);
  Top := (Screen.Height - Height);
end;

end.
