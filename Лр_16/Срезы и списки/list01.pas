var n: integer; a: array of integer;
begin
  var L1:= new List<integer>;
  var L2:= new List<integer>;
  write('Длина массива: '); readln(n);
  setLength(a, n);
  for var i := 0 to n-1 do
    a[i] := random(25)-5;
  foreach var x in a do
    if x>0 then
      L1 += x
    else L2 += x;
  write('Массив с пол. эл-ми: '); L1.println;
  write('Массив с отр. эл-ми: '); L2.println;
end.