function stepen(a, b: integer): integer;//(a, b: integer)-параметризация
begin
  if b = 0 then stepen:= 1//база рекурсии
  else
    stepen:= a * stepen(a, b - 1);//декомпозиция
end;

begin
  var x:= ReadInteger('Введите число');
  var y:= ReadInteger('Введите степень');
  println(stepen(x, y));
end.