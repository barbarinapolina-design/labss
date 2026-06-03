unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn, FileUtil, LazUTF8;

type

  { TfMain }

  TfMain = class(TForm)
    Button1: TButton;
    DE: TDirectoryEdit;
    FNE: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.Button1Click(Sender: TObject);
var
  fIn, fOut : File; //нетипизированные файлы: исходник и копия
  NumRead, NumWritten : Word; //количество считанных и записанных байт
  Buf : Array[1..2048] of byte;  //буфер
begin
  //если файл не выбран, делаем сообщение и выходим:
  if FNE.Text = '' then begin
    ShowMessage('Внимание! Требуется указать или выбрать копируемый файл.');
    FNE.SetFocus;
    Exit;
  end;
  //если не выбрана папка, делаем сообщение и выходим:
  if DE.Text = '' then begin
    ShowMessage('Внимание! Требуется указать или выбрать папку для копии.');
    DE.SetFocus;
    Exit;
  end;
  //начинаем работу с файлами:
  try
    AssignFile(fIn, UTF8ToSys(FNE.FileName));
    AssignFile(fOut,UTF8ToSys(DE.Directory + '\' + ExtractFileName(FNE.FileName)));
    Reset (fIn,1);
    Rewrite (fOut,1);
    //изменим курсор на песочные часы:
    Screen.Cursor:= crHourGlass;
    Repeat
      BlockRead (fIn,buf,Sizeof(buf),NumRead);
      BlockWrite (fOut,Buf,NumRead,NumWritten);
    Until (NumRead=0) or (NumWritten<>NumRead);
  finally
    closeFile(fIn);
    closeFile(fOut);
    //изменим курсор на обычный вид:
    Screen.Cursor:= crDefault;
    ShowMessage('Копирование завершено!');
  end;
end;

end.

