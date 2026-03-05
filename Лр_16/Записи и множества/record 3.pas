type toy = record
  name: string;
  age: string;
  price: real;
end;
var a: array[1..100] of toy;
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
  for var i := 1 to 2 do
  begin
    writeln('Игрушка №', i);
    writeln('  Название: ', a[i].name);
    writeln('  Возраст: ', a[i].age);
    writeln('  Цена: ', a[i].price, ' руб.');
  end;
end.