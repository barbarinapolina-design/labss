type PNode = ^Node;
     Node = record
       word: string[40];
       count: integer;
       next: PNode;
     end;
    
// Создание нового узла
function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

// Добавление узла в начало списка
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

// Добавление узла после заданного узла p
procedure AddAfter(p, NewNode: PNode);
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;

// Поиск места для вставки нового слова (сохраняя алфавитный порядок)
function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

// Добавление узла перед заданным узлом p
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var pp: PNode;
begin
  if p = Head then
    AddFirst(Head, NewNode)  // добавление в начало списка
  else begin
    pp := Head;
    while (pp <> nil) and (pp^.next <> p) do // поиск узла, за которым следует узел p
      pp := pp^.next;
    if pp <> nil then 
      AddAfter(pp, NewNode);
  end;
end;

// Поиск слова в списке
function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

// Чтение одного слова из файла
function TakeWord(var f: Text): string;
var c: char;
begin
  Result := '';
  c := ' ';
  while not eof(f) and (c <= ' ') do
    read(F, c);
  while not eof(f) and (c > ' ') do
  begin
    Result := Result + c;
    read(f, c);
  end;
end;

// Подсчет количества элементов в списке
function CountElements(Head: PNode): integer;
var pp: PNode;
    cnt: integer;
begin
  cnt := 0;
  pp := Head;
  while pp <> nil do
  begin
    cnt := cnt + 1;
    pp := pp^.next;
  end;
  Result := cnt;
end;

// Вывод списка на экран
procedure PrintList(Head: PNode);
var pp: PNode;
begin
  writeln('Алфавитно-частотный словарь:');
  pp := Head;
  while pp <> nil do
  begin
    writeln(pp^.word, ' - ', pp^.count, ' раз(а)');
    pp := pp^.next;
  end;
end;

var f: Text;
    WordRead: string;
    Head: PNode;
    FoundNode, PlaceNode, NewNode: PNode;
begin
  Head := nil; // инициализация пустого списка
  assign(f, 'text.txt');
  reset(f);
  
  // Основной алгоритм обработки
  while not eof(f) do
  begin
    WordRead := TakeWord(f); // считываем слово
    if WordRead <> '' then // если слово не пустое
    begin
      FoundNode := Find(Head, WordRead); // ищем слово в списке
      if FoundNode <> nil then
         FoundNode^.count := FoundNode^.count + 1
      else
      begin
        // слово не найдено - создаем новый узел
        NewNode := CreateNode(WordRead);
        // ищем место для вставки по алфавиту
        PlaceNode := FindPlace(Head, WordRead);
        if PlaceNode = nil then
          // вставляем в конец списка
          AddBefore(Head, nil, NewNode)
        else
          // вставляем перед найденным узлом
          AddBefore(Head, PlaceNode, NewNode);
      end;
    end;
  end;
  close(f);
  PrintList(Head);
  writeln('Количество различных слов: ', CountElements(Head));
  
  var pp, temp: PNode;
  pp := Head;
  while pp <> nil do
  begin
    temp := pp;
    pp := pp^.next;
    Dispose(temp);
  end;

end.