var n: integer; a: array of integer; 
begin
  write('Длина массива: '); readln(n);
  setLength(a, n);
  for var i := 0 to n-1 do
    a[i] := random(100);
  write('Mассив:');
  a.println;
  write('Чётные:');
  a[1::2].println;
  write('Минимальный:');
  a[1::2].min.print;
end.
  