type PNode = ^Node;
     Node = record
       data: integer;
       next: PNode;
     end;

// Добавление элемента в стек (на вершину)
procedure Push(var Head: PNode; x: integer);
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := x;
  NewNode^.next := Head;
  Head := NewNode;
end;

// Извлечение элемента из стека (с вершины)
function Pop(var Head: PNode): integer;
var q: PNode;
begin
  if Head = nil then
  begin
    writeln('Ошибка: стек пуст!');
    Result := 0;
    Exit;
  end;
  
  Result := Head^.data;
  q := Head;
  Head := Head^.next;
  Dispose(q);
end;

// Проверка, пуст ли стек
function IsEmpty(Head: PNode): boolean;
begin
  Result := (Head = nil);
end;

var InputFile, OutputFile: Text;
    StackHead: PNode;
    num: integer;
begin
  StackHead := nil;
  assign(InputFile, 'input.txt');
  reset(InputFile);
  writeln('Читаем числа из файла input.txt:');
  while not eof(InputFile) do
  begin
    read(InputFile, num);
    write(num, ' ');
    Push(StackHead, num);
  end;
  writeln;
  close(InputFile);

  assign(OutputFile, 'output.txt');
  rewrite(OutputFile);
  writeln('Записываем числа в обратном порядке в файл output.txt:');
  while not IsEmpty(StackHead) do
  begin
    num := Pop(StackHead);
    write(num, ' ');
    write(OutputFile, num, ' ');
  end;
  writeln;
  close(OutputFile);
  
  while not IsEmpty(StackHead) do
    Pop(StackHead);
end.