unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  tf: TextFile;  //текстовый файл
  s: String;
begin
  //если пользователь не ввел строку в Edit1, просто выйдем:
  if Edit1.Text = '' then exit;
  //иначе в s получаем текст:
  s:= Edit1.Text;
  //затем связываем файловую переменную tf с файлом mytext.txt:
  AssignFile(tf, 'mytext.txt');
  //далее может возникнуть исключительная ситуация, поэтому
  //заключим опасный код в блок try-finally-end:
  try
    //если файла нет (кнопку нажали первый раз), создадим его:
    if not FileExists('mytext.txt') then Rewrite(tf)
    //иначе откроем для записи, установив указатель в конец файла:
    else Append(tf);
    //тут просто записываем строку в файл:
    Writeln(tf, s);
    //очищаем Edit1, чтобы пользователь видел, что событие произошло:
    Edit1.Text:= '';
  finally
    CloseFile(tf); //закрываем файл
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  tf: TextFile;  //текстовый файл
  s: String;
begin
  //если файла нет, просто выходим:
  if not FileExists('mytext.txt') then exit;
  //иначе сначала очищаем Memo1:
  Memo1.Clear;
  //связываем файловую переменную tf с файлом mytext.txt:
  AssignFile(tf, 'mytext.txt');
  //далее может возникнуть исключительная ситуация, поэтому
  //заключим опасный код в блок try-finally-end:
  try
    Reset(tf); //открыли файл для чтения, указатель в начале файла
    //делаем, пока не конец файла:
    while not Eof(tf) do begin
      Readln(tf, s); //читаем в s очередную строку
      Memo1.Lines.Add(s);  //добавляем эту строку в Memo1
    end;
  finally
    CloseFile(tf); //закрываем файл
  end;
end;

end.

