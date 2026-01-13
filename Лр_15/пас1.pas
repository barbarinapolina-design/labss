procedure lol (a: integer);//(a: integer)- параметризация
begin
  print(a);
  if a > 1 then //база рекурсии (a=1; lol=0)
    lol(a-2);//декомпозиция
end;
begin
  var a:= ReadInteger('Введите a:(=25)');
  lol(a);
end.

