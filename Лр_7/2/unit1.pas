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
    ListBox1: TListBox;
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
  f: File of integer;  //файл типа integer
  i: integer;  //счетчик для цикла
begin
  AssignFile(f, 'mytypefile.dat');
  Rewrite(f);
  for i:= 1 to 10 do  //делаем 10 раз
    Write(f, Random(1000));  //записываем в файл случайное целое число
  CloseFile(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  f: File of integer;
  k: integer;  //для получения значений элементов
begin
  //выходим из процедуры, если файла нет:
  if not FileExists('mytypefile.dat') then exit;
  ListBox1.Clear;
  AssignFile(f, 'mytypefile.dat');
  //Открываем для чтения:
  Reset(f);
  //делаем от первого до последнего элемента:
  while not eof(f) do begin
    Read(f, k); //считываем очередной элемент в перем. k
    ListBox1.Items.Add(IntToStr(k));  //записываем это значение в ListBox
  end;
  CloseFile(f);
end;

end.

