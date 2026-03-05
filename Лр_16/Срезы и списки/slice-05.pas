var n,b,c: integer; a: array of integer; 
begin
  write('Длина массива: '); readln(c);
  setLength(a, c);
  for var i := 0 to c-1 do
    a[i] := random(100);
  
  write('Введите n: '); readln(n);
  write('Mассив:'); a.println;
  write('Mасимальный:'); a.max.print; writeln;
  b:= a.IndexMax;
  a:= a[:b] +arr(n) + a[b:];
  write('Новый массив:'); a.println;
end.