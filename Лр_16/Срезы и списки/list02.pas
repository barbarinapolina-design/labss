var a,ai: integer;
begin
  var L:= Lst(ArrRandom(10, 0, 100));
  write('Список: '); L.Print;writeln;
  a:= L.max; write('Макс: ',a);
  ai:= L.indexMax;
  L.RemoveAt(ai);writeln;
  write('Новый список: '); L.Print;
end.