{ *********************************************************************** }
{                                                                         }
{ The Bantung Software  Runtime Library                                   }
{ Bantung - File Control Manager DLL Library                              }
{                                                                         }
{ Copyright (c) 2012 Bantung Software Co., Ltd.                           }
{                                                                         }
{ *********************************************************************** }

library fctrlversion;

uses Windows, SysUtils, JvUIB;

{$R *.res}

procedure GetFileVersion(const AFileName: String; var dwFileVersionMS,
  dwFileVersionLS: Cardinal);
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  FileName := AFileName;
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if (InfoSize <> 0) then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if (GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf)) then
        if (VerQueryValue(VerBuf, '\', Pointer(FI), VerSize)) then
        begin
          dwFileVersionMS := FI.dwFileVersionMS;
          dwFileVersionLS := FI.dwFileVersionLS;
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

function GetFileVerionString(const AFileName: String): String; stdcall;
var
  HiVer, LoVer: Cardinal;
begin
  GetFileVersion(AFileName, HiVer, LoVer);

  Result :=
    Format('%d.%d.%d.%d',
      [HiWord(HiVer), LoWord(HiVer), HiWord(LoVer), LoWord(LoVer)]);
end;

function GetFileVerionStringEx(const AFileName: String): String; stdcall;
var
  HiVer, LoVer: Cardinal;
  _Major, _Minor, _Release, _Build: String[5];
begin
  GetFileVersion(AFileName, HiVer, LoVer);

  _Major := Format('%u', [HiWord(HiVer)]);
  while (Length(_Major) < 5) do
    _Major := '0' + _Major;

  _Minor := Format('%u', [LoWord(HiVer)]);
  while (Length(_Minor) < 5) do
    _Minor := '0' + _Minor;

  _Release := Format('%u', [HiWord(LoVer)]);
  while (Length(_Release) < 5) do
    _Release := '0' + _Release;

  _Build:= Format('%u', [LoWord(LoVer)]);
  while (Length(_Build) < 5) do
    _Build := '0' + _Build;

  Result := Format('%s%s%s%s', [_Major, _Minor, _Release, _Build]);
end;

//****************************************************************************//
type
  PByteArray = ^TByteArray;
  TByteArray = array of Byte;

procedure FileDownload(const _Transaction: TJvUIBTransaction; const _FileName,
  _FileVersion, _System: String); stdcall;
var
  _dsData: TJvUIBQuery;
  _Buff: PByteArray;
  _Size: Integer;
  _fp: File;
begin
  _dsData := TJvUIBQuery.Create(nil);
  try
    _dsData.Transaction := _Transaction;

    _dsData.SQL.Text :=
      'SELECT FILE_DATA FROM SP_GET_FILE_DATA(' +
      QuotedStr(_System) + ', ' +
      QuotedStr(_FileName) + ', ' +
      QuotedStr(_FileVersion) + ')';

    try
      _dsData.Open();
    except
      Exit;
    end;

    if (not _dsData.Eof) then
    begin
      _Size := _dsData.FieldBlobSize(0);
      GetMem(_Buff, _Size);
      try
        _dsData.ReadBlob('FILE_DATA', _Buff);
        //FileMode := fmOpenWrite;
        AssignFile(_fp, _FileName);
        {$I-}Rewrite(_fp, _Size);{$I+}
        if (IOResult() = 0) then
        begin
          BlockWrite(_fp, _Buff, _Size, _Size);
          CloseFile(_fp);
        end;
      finally
        FreeMem(_Buff, _Size);
      end;
    end;

    _dsData.Close();
  finally
    _dsData.Free();
  end;
end;

procedure FileUpload(const _Transaction: TJvUIBTransaction; const _FileName,
  _System: String); stdcall;
var
  _dsData: TJvUIBQuery;
  _Buff: PByteArray;
  _Size: Integer;
  _fp: File;
begin
  AssignFile(_fp, _FileName);
  FileMode := fmOpenRead;
  {$I-}Reset(_fp);{$I+}
  if (IOResult() = 0) then
  try
    _dsData := TJvUIBQuery.Create(nil);
    try
      _dsData.Transaction := _Transaction;
      _dsData.SQL.Text :=
        'EXECUTE PROCEDURE SP_INSERT_UPDATE_FILE(' +
        '  :SYSTEM, :FILE_NAME, :FILE_DATA, :FILE_PATH, :FILE_VERSION)';

      _dsData.Params.ByNameAsString['SYSTEM'] := _System;
      _dsData.Params.ByNameAsString['FILE_NAME'] := _System;
      _Size := FileSize(_fp);
      Getmem(_Buff, _Size);
      try
        BlockRead(_fp, _Buff, _Size, _Size);
        _dsData.ParamsSetBlob('FILE_DATA', _Buff, _Size);
      finally
        FreeMem(_Buff, _Size);
      end;
      _dsData.Params.ByNameAsString['FILE_VERSION'] :=
        GetFileVerionStringEx(_FileName);
      _dsData.ExecSQL();
      _dsData.Close(etmCommit);
    finally
      _dsData.Free();
    end;
  finally
    CloseFile(_fp);
  end;
end;

exports
  GetFileVerionString,
  GetFileVerionStringEx,
  FileDownload,
  FileUpload;

end.
