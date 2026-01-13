procedure LoopFor(i, n: integer);//(i, n: integer)-параметризация
begin
  print(i);
  println('привет');
  if i < n then //база рекурсии (i=1; 1 привет)
    LoopFor(i + 1, n);//декомпозиция
end;

begin
  var i:= ReadInteger('Введите i: (=1)');
  var n:= ReadInteger('Введите n: (=10)');
  LoopFor(i, n);
end.