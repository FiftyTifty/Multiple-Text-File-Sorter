unit programwindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  MainProgramCode;

type

  { TformProgramWindow }

  TformProgramWindow = class(TForm)
    buttonBegin: TButton;
    buttonGetFolder: TButton;
    checkboxDoSubdirs: TCheckBox;
    editDisplayCurrentFile: TEdit;
    editGetFolder: TEdit;
    groupboxGetFilesInDir: TGroupBox;
    dialogSelectTextFile: TOpenDialog;
    procedure buttonBeginClick(Sender: TObject);
    procedure buttonGetFolderClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  formProgramWindow: TformProgramWindow;

implementation

{$R *.lfm}

{ TformProgramWindow }

procedure TformProgramWindow.buttonGetFolderClick(Sender: TObject);
begin
     if dialogSelectTextFile.Execute() then
        if FileExists(dialogSelectTextFile.FileName) then
           editGetFolder.Text := ExtractFilePath(dialogSelectTextFile.FileName);
end;

procedure TformProgramWindow.buttonBeginClick(Sender: TObject);
begin

     if not DirectoryExists(editGetFolder.Text) then begin
        ShowMessage('Directory does not exist');
        exit;
     end;

     SortTextFilesInDir(editGetFolder.Text, '*.txt', checkboxDoSubdirs.Checked,
                        editDisplayCurrentFile);
     ShowMessage('Done!');
end;

end.

