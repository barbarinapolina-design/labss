var n,b: integer; a: array of integer; 
begin
  write('Длина массива: '); readln(n);
  setLength(a, n);
  for var i := 0 to n-1 do
    a[i] := random(100);
  write('Mассив:'); a.println;
  write('Mасимальный:'); a.max.print; writeln;
  b:= a.IndexMax;
  a:= a[:b] + a[b+1:];
  write('Новый массив:'); a.println;
end.