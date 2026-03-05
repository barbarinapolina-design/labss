type PNode = ^Node;
     Node = record
       word: string[40];
       count: integer;
       next: PNode;
     end;

function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure AddAfter(p, NewNode: PNode);
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var pp: PNode;
begin
  if p = Head then
    AddFirst(Head, NewNode)
  else begin
    pp := Head;
    while (pp <> nil) and (pp^.next <> p) do
      pp := pp^.next;
    if pp <> nil then 
      AddAfter(pp, NewNode);
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

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
  Head := nil;
  assign(f, 'text.txt');
  reset(f);
  
  while not eof(f) do
  begin
    WordRead := TakeWord(f);
    if WordRead <> '' then 
    begin
      FoundNode := Find(Head, WordRead); 
      if FoundNode <> nil then
         FoundNode^.count := FoundNode^.count + 1
      else
      begin
        NewNode := CreateNode(WordRead);
        PlaceNode := FindPlace(Head, WordRead);
        if PlaceNode = nil then
          AddBefore(Head, nil, NewNode)
        else
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
