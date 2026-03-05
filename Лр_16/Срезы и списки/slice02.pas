var n: integer; a: array of integer; 
begin
  write('Длина массива (чётная): '); readln(n);
  setLength(a, n);
  for var i := 0 to n-1 do
    a[i] := random(100);
  writeln('Mассив:');
  a.println;
  writeln('Результат:');
  a[1::2].println;
end.
  