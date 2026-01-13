function sumTo(n: integer): integer;//(n: integer)-параметризация
begin
  if n = 1 then sumTo:= 1//база рекурсии
  else sumTo:= n + sumTo(n - 1);//декомпозиция
end;
begin
  var n := ReadInteger('Введите n:');
  print(sumTo(n));
end.