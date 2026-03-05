type PNode = ^Node;
     Node = record
       data: integer;
       next: PNode;
     end;

function CreateNode(value: integer): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := value;
  NewNode^.next := nil;
  Result := NewNode;
end;

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

function FindMax(Head: PNode): integer;
var pp: PNode;
    maxVal: integer;
begin
  maxVal := Head^.data;
  pp := Head^.next;
  while pp <> nil do
  begin
    if pp^.data > maxVal then
      maxVal := pp^.data;
    pp := pp^.next;
  end;
  Result := maxVal;
end;

function FindMin(Head: PNode): integer;
var pp: PNode;
    minVal: integer;
begin
  minVal := Head^.data;
  pp := Head^.next;
  while pp <> nil do
  begin
    if pp^.data < minVal then
      minVal := pp^.data;
    pp := pp^.next;
  end;
  Result := minVal;
end;

procedure PrintMinMax(Head: PNode);
begin
  writeln('Мах: ', FindMax(Head));
  writeln('Мin: ', FindMin(Head));
end;

var Head: PNode; i, n: integer;
begin
  Head := nil;
  write('Длина списка: ');
  readln(n);
  for i := 1 to n do
    AddLast(Head, CreateNode(Random(100))); 

  write('Список:');
  PrintList(Head);
  PrintMinMax(Head);
  
  var pp, temp: PNode;
  pp := Head;
  while pp <> nil do
  begin
    temp := pp;
    pp := pp^.next;
    Dispose(temp);
  end;
end.
