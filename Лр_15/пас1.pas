procedure lol (a: integer);//(a: integer)- параметризация
begin
  print(a);
  if a > 1 then //база рекурсии
    lol(a-2);//декомпозиция
end;
begin
  var a:= ReadInteger('Введите a:(=25)');
  lol(a);
end.

