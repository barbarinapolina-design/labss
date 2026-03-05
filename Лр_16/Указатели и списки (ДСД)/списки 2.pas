type PNode = ^Node;
     Node = record
       data: integer;
       next: PNode;
     end;
  
// Создание нового узла
function CreateNode(value: integer): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := value;
  NewNode^.next := nil;
  Result := NewNode;
end;

// Добавление узла в конец списка
procedure AddLast(var Head: PNode; NewNode: PNode);
var pp: PNode;
begin
  if Head = nil then
    Head := NewNode
  else begin
    pp := Head;
    while pp^.next <> nil do
      pp := pp^.next;
    pp^.next := NewNode;
  end;
end;

// Вывод всего списка
procedure PrintList(Head: PNode);
var pp: PNode;
begin
pp := Head;
while pp <> nil do
  begin
   write(pp^.data, ' ');
   pp := pp^.next;
  end;
writeln;
end;

// Вывод только четных элементов списка
procedure PrintEvenElements(Head: PNode);
var pp: PNode;
    found: boolean;
begin
write('Четные элементы: ');
pp := Head;
found := false;
while pp <> nil do
  begin
  if pp^.data mod 2 = 0 then
    begin
    write(pp^.data, ' ');
    found := true;
    end;
    pp := pp^.next;
  end;
end;

var Head: PNode; i: integer;
begin
  Head := nil;
  for i := 1 to 10 do
    AddLast(Head, CreateNode(Random(100)));

  write('Список: ');
  PrintList(Head);
  PrintEvenElements(Head);

  var pp, temp: PNode;
  pp := Head;
  while pp <> nil do
  begin
    temp := pp;
    pp := pp^.next;
    Dispose(temp);
  end;
end.