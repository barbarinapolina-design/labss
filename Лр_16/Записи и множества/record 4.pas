type toy = record
  name: string[20];
  age: string[4];
  price: real;
end;
var a: array[1..100] of toy;
    f: text;
begin
  with a[1] do
  begin
    name:= 'Неволяжка';
    price:=154.99;
    age:='0+';
  end;
  with a[2] do
  begin
    name:= 'Конструктор LEGO';
    price:=2309.49;
    age:='8+';
  end;
  
  assign(f, 'toys.txt');
  rewrite(f);
  for var i := 1 to 2 do
  begin
    writeln(f, a[i].name);
    writeln(f, a[i].age);
    writeln(f, a[i].price);
  end;
  close(f);
  writeln('Данные записаны в файл');
  
  reset(f);
  var i := 1;
  while not eof(f) do
  begin
    readln(f, a[i].name);
    readln(f, a[i].age);
    readln(f, a[i].price);
    i := i + 1;
  end;
  close(f);
  
   for var j := 1 to 2 do
  begin
    writeln('Игрушка №', j);
    writeln('  Название: ', a[j].name);
    writeln('  Цена: ', a[j].price,' руб.');
    writeln('  Возраст: ', a[j].age);
  end;
end.