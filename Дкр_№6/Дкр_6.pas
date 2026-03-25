const MAX_SIZE = 10; 
type
  TIndex = 0..MAX_SIZE;
  
  PNode = record
    data: integer;      
    next: TIndex;       
  end;

var list: array [1..MAX_SIZE] of PNode; 
    head: TIndex;          
    freeHead: TIndex;      
    choice: integer;       
    value: integer;        

procedure Initialize;
var i: integer; 
begin
  for i := 1 to MAX_SIZE - 1 do
    list[i].next := i + 1;
  list[MAX_SIZE].next := 0; 
  freeHead := 1; 
end;

function NewNode: TIndex;
var newNodeIndex: TIndex;
begin
  if freeHead = 0 then
    NewNode := 0 
  else
  begin
    newNodeIndex := freeHead;
    freeHead := list[freeHead].next;
    NewNode := newNodeIndex;
  end;
end;

procedure DisposeNode(var index: TIndex);
begin
  list[index].next := freeHead; 
  freeHead := index;            
  index := 0;
end;

procedure AtBeginning(val: integer);
var newNodeIndex: TIndex;
begin
  newNodeIndex := NewNode;
  if newNodeIndex = 0 then
    writeln('Ошибка: список полон')
  else
  begin
    list[newNodeIndex].data := val;
    list[newNodeIndex].next := head;
    head := newNodeIndex;
  end;
end;

procedure AtEnd(val: integer);
var newNodeIndex, current: TIndex;
begin
  newNodeIndex := NewNode;
  if newNodeIndex = 0 then
    writeln('Ошибка: список полон')
  else
  begin
    list[newNodeIndex].data := val;
    list[newNodeIndex].next := 0;
    
    if head = 0 then
      head := newNodeIndex 
    else
    begin
      current := head;
      while list[current].next <> 0 do
        current := list[current].next;
      list[current].next := newNodeIndex;
    end;
  end;
end;

procedure After(afterVal, val: integer);
var newNodeIndex, current: TIndex;
begin
  current := head;
  while (current <> 0) and (list[current].data <> afterVal) do
    current := list[current].next;
    
  if current = 0 then
    writeln('Ошибка: элемент со значением ', afterVal, ' не найден.')
  else
  begin
    newNodeIndex := NewNode;
    if newNodeIndex = 0 then
      writeln('Ошибка: список полон')
    else
    begin
      list[newNodeIndex].data := val;
      list[newNodeIndex].next := list[current].next;
      list[current].next := newNodeIndex;
      writeln('Элемент ', val, ' добавлен после элемента ', afterVal);
    end;
  end;
end;

procedure Delete(val: integer);
var current, prev: TIndex;
begin
  current := head;
  prev := 0;
  
  while (current <> 0) and (list[current].data <> val) do
  begin
    prev := current;
    current := list[current].next;
  end;
  
  if current = 0 then
    writeln('Ошибка: элемент со значением ', val, ' не найден.')
  else
  begin
    if prev = 0 then
      head := list[current].next
    else
      list[prev].next := list[current].next;
    
    DisposeNode(current);
    writeln('Элемент со значением ', val, ' удален.');
  end;
end;

procedure Search(val: integer);
var current: TIndex; position: integer;
begin
  current := head;
  position := 1;
  while (current <> 0) and (list[current].data <> val) do
  begin
    current := list[current].next;
    position := position + 1;
  end;
  if current = 0 then
    writeln('Элемент со значением ', val, ' не найден')
  else
    writeln('Элемент со значением ', val, ' найден на позиции ', position);
end;

procedure DisplayList;
var current: TIndex; i: integer; 
begin
  writeln;
  writeln('Содержимое списка');
  if head = 0 then
    writeln('Список пуст')
  else
  begin
    write('HEAD -> ');
    current := head;
    while current <> 0 do
    begin
      write('[', list[current].data, ']');
      if list[current].next <> 0 then
        write(' -> ');
      current := list[current].next;
    end;
    writeln(' -> NIL');
  end;
  
  writeln;
  writeln('Состояние статической памяти (индекс: data, next):');
  for i := 1 to MAX_SIZE do
  begin
    if i = head then write('H=');
    if i = freeHead then write('F=');
    write(i, ': [', list[i].data, ', next=');
    if list[i].next = 0 then write('0') else write(list[i].next);
    write(']  ');
    if i mod 5 = 0 then writeln;
  end;
  writeln;
end;

procedure Clear;
var temp: TIndex;
begin
  while head <> 0 do
  begin
    temp := head;
    head := list[head].next;
    DisposeNode(temp);
  end;
  writeln('Список очищен');
end;

begin
  head := 0;
  Initialize;
  repeat
    writeln('1. Добавить элемент в начало');
    writeln('2. Добавить элемент в конец');
    writeln('3. Добавить элемент после заданного');
    writeln('4. Удалить элемент по значению');
    writeln('5. Поиск элемента по значению');
    writeln('6. Показать список');
    writeln('7. Очистить список');
    writeln('0. Выход');
    writeln();
    write('Ваш выбор: ');
    readln(choice);
    
    case choice of
      1: begin
           write('Введите значение для добавления в начало: ');
           readln(value);
           AtBeginning(value);
           DisplayList;
         end;
      2: begin
           write('Введите значение для добавления в конец: ');
           readln(value);
           AtEnd(value);
           DisplayList;
         end;
      3: begin
           var afterVal: integer;
           write('Введите значение, после которого добавить: ');
           readln(afterVal);
           write('Введите значение нового элемента: ');
           readln(value);
           After(afterVal, value);
           DisplayList;
         end;
      4: begin
           write('Введите значение для удаления: ');
           readln(value);
           Delete(value);
           DisplayList;
         end;
      5: begin
           write('Введите значение для поиска: ');
           readln(value);
           Search(value);
           DisplayList;
         end;
      6: DisplayList;
      7: begin
           Clear;
           DisplayList;
         end;
      0: writeln('Конец программы.');
    else
      writeln('Неверный выбор. Введите число от 0 до 7.');
    end;
  until choice = 0;
end.