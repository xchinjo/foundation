{
Searching for Files
Stop. This is the one and only solution to file searching. Use Delphi to find any file in any directory and/or subdirectory that match a certain mask. Start searching.

Article:
. http://delphi.about.com/library/weekly/aa051600a.htm

********************************************
Zarko Gajic
About.com Guide to Delphi Programming
http://delphi.about.com
email: delphi.guide@about.com
********************************************
}
unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ShellAPI, xProBar, Buttons, Gauges, ComCtrls;

type

TCustomThread = class(TThread)
     private
            FMin, FMax: Integer;
            Position : integer;
            ProgressBar : TProgressBar;
            Listbox :TMemo;
     private
            procedure UpdateProgress;
            procedure SetProgressBarOptions;


            procedure FileSearch(const PathName, FileName : string; const InDir : boolean);
     public
           procedure Execute; override;
     public
           constructor Create(withProgressBar: TProgressBar;withListbox:TMemo);
           destructor Destroy; override;
end;



  TfrMain = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblNumberFound: TLabel;
    ckDelete: TCheckBox;
    xProBar1: TxProBar;
    BitBtn1: TBitBtn;
    Gauge1: TGauge;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure FileSearch(const PathName, FileName : string; const InDir : boolean);
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation
{$R *.DFM}
uses uFileInfo;

Function DelTree(DirName : string): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
   Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
   FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
   StrPCopy(DirBuf, DirName) ;
   with SHFileOpStruct do begin
    Wnd := 0;
    pFrom := @DirBuf;
    wFunc := FO_DELETE;
    fFlags := FOF_ALLOWUNDO;
    fFlags := fFlags or FOF_NOCONFIRMATION;
    fFlags := fFlags or FOF_SILENT;
   end;
    Result := (SHFileOperation(SHFileOpStruct) = 0) ;
   except
    Result := False;
  end;
end;


procedure TfrMain.FileSearch(const PathName, FileName : string; const InDir : boolean);
var Rec  : TSearchRec;
    Path : string;
begin
Path := IncludeTrailingBackslash(PathName);
if FindFirst(Path + FileName, faAnyFile, Rec) = 0 then
 try
   repeat
     if ckDelete.Checked  then
     begin
        if DirectoryExists(Path + Rec.Name) then
        begin
            DelTree(Path + Rec.Name);
            Memo1.Lines.Add('Directory Deleted..'+Path + Rec.Name);
        end else
        begin
          DeleteFile(Path + Rec.Name);
          Memo1.Lines.Add('File Deleted..'+Path + Rec.Name);
        end;
     end else begin
        Memo1.Lines.Add(Rec.Name);
     end;

   until FindNext(Rec) <> 0;
 finally
   FindClose(Rec);
 end;

If not InDir then Exit;

if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
 try
   repeat
    if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name<>'.') and (Rec.Name<>'..') then
     FileSearch(Path + Rec.Name, FileName, True);
   until FindNext(Rec) <> 0;
 finally
   FindClose(Rec);
 end;
end; //procedure FileSearch

procedure TfrMain.BitBtn1Click(Sender: TObject);
var objThread:TCustomThread;
begin
  objThread:=TCustomThread.Create(ProgressBar1,Memo1);
  objThread.Execute;
end;

procedure TfrMain.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  lblNumberFound.Caption:=Inttostr(Memo1.Lines.Count) + ' files found.';
  FileSearch(Edit1.Text, Edit2.Text, CheckBox1.State in [cbChecked]);
  lblNumberFound.Caption:=Inttostr(Memo1.Lines.Count) + ' files found.';
end;

procedure TfrMain.ListBox1DblClick(Sender: TObject);
var SelectedFile : string;
    Rec          : TSearchRec;
    frInfo       : TfrFileInfo;
begin

end;

{ TCustomThread }

constructor TCustomThread.Create(withProgressBar: TProgressBar;withListbox:TMemo);
begin
     FMin := 0;
     FMax := 30000;
     // assign the progress bar
     ProgressBar := withProgressBar;
     ProgressBar.Max:=FMax;
     Listbox:=withListbox;
     // let thread free itself
     FreeOnTerminate := True;
     // do not create suspended, let it go as soon as it is created
     //SetProgressBarOptions;
     inherited Create(False);
end;

destructor TCustomThread.Destroy;
begin
  ProgressBar.Position:=0;
  inherited;
end;

procedure TCustomThread.Execute;
var i : Integer;
begin
     // set progressbar options
     //ProgressBar.Marquee:=true;
     //Synchronize(SetProgressBarOptions);
     for i := FMin to FMax do begin
         // check if Self(thread) is terminated, if so exit
         if Terminated then
            Exit;
         Position := i;
         // call Synchronize to make sure you won't get errors
         // from VCL's
         Synchronize(UpdateProgress);
     end;// for i := ProgressBar.Min to ProgressBar.Max do begin
end;

procedure TCustomThread.FileSearch(const PathName, FileName: string;const InDir: boolean);
var Rec  : TSearchRec;
    Path : string;
begin
Path := IncludeTrailingBackslash(PathName);
if FindFirst(Path + FileName, faAnyFile, Rec) = 0 then
 try
   repeat
        if DirectoryExists(Path + Rec.Name) then
        begin
            //DelTree(Path + Rec.Name);
            //Listbox.Lines.Add(Path + Rec.Name);
        end else
        begin
          //DeleteFile(Path + Rec.Name);
          //Listbox.Lines.Add(Path + Rec.Name);
        end;
   until FindNext(Rec) <> 0;
 finally
   FindClose(Rec);
 end;

If not InDir then Exit;

if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
 try
   repeat
    if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name<>'.') and (Rec.Name<>'..') then
     FileSearch(Path + Rec.Name, FileName, True);
   until FindNext(Rec) <> 0;
 finally
   FindClose(Rec);
 end;
end;




procedure TCustomThread.SetProgressBarOptions;
begin
     ProgressBar.min := FMin;
     ProgressBar.Max := FMax;
end;



procedure TCustomThread.UpdateProgress;
begin
     // force application to repaint itself and handle messages
     Application.ProcessMessages;
     // update progress bar position
     //FileSearch('D:\SVN_nulldev\devlib', '.svn', true);

     //Listbox.Lines.Add(inttostr(Position));
     ProgressBar.Position := Position;
end;

end.
