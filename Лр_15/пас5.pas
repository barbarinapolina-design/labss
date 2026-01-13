function NOD(a, b: integer): integer;//(a, b: integer)-параметризация
begin
  if b = 0 then NOD:= a//база рекурсии
  else NOD:= NOD(b, a mod b);//декомпозиция
end;

begin
  print('НОД(3430, 1365) =');
  println(NOD(3430, 1365));
end.