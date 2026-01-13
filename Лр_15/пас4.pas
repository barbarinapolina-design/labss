procedure LoopFor(i, n: integer);//(i, n: integer)-параметризация
begin
  println(i, ' привет');
  if i < n then //база рекурсии
    LoopFor(i + 1, n);//декомпозиция
end;

begin
  LoopFor(1, 10);
end.