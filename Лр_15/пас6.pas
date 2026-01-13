procedure fib(i, n: integer);//(i, n: integer)-параметризация
begin
  print(i + n);
  if i + n < 89 then//база рекурсии (i+n=1; fib=1)
    fib(n, i + n);//декомпозиция
end;

begin
  var a:= ReadInteger('Введите a:(=0)');
  var b:= ReadInteger('Введите b:(=1)');
  fib(a, b);
end.