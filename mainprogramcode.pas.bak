unit MainProgramCode;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  FileUtil;

procedure SortTextFilesInDir(strPath, strMask: string; bDoSubdirs: boolean;
                             editToUpdate: TEdit);

implementation

procedure SortTextFilesInDir(strPath, strMask: string; bDoSubdirs: boolean;
                             editToUpdate: TEdit);
var
  tstrlistTextFilesInDir, tstrlistCurrentList: TStringList;
  iCounter: integer;
begin
     tstrlistCurrentList := TStringList.Create;
     tstrlistCurrentList.Sorted := true;
     tstrlistCurrentList.Duplicates := dupIgnore;

     tstrlistTextFilesInDir := TStringList.Create;
     tstrlistTextFilesInDir := FindAllFiles(strPath, strMask, bDoSubdirs);

     for iCounter := 0 to tstrlistTextFilesInDir.Count - 1 do begin
         editToUpdate.Text := tstrlistTextFilesInDir[iCounter];
         tstrlistCurrentList.LoadFromFile(tstrlistTextFilesInDir[iCounter]);
         tstrlistCurrentList.SaveToFile(tstrlistTextFilesInDir[iCounter]);
         tstrlistCurrentList.Clear;
     end;

     tstrlistCurrentList.Free;
     tstrlistTextFilesInDir.Free;

end;

end.

