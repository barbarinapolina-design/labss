type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;
var student:array[1..100] of anketa;
begin
  student[1].fio:= 'Барбарина П.И.';
  student[2].fio:= 'Талина А.А.';
  student[3].fio:= 'Иванов И.И.';
  student[1].kurs:=2;
  student[2].kurs:=3;
  student[3].kurs:=4;
  student[1].birth:='16.08.2008';
  student[2].birth:='22.12.2007';
  student[3].birth:='31.01.2006';
  for var i := 1 to 3 do
  begin
    writeln('Студент №', i);
    writeln('  Ф.И.О.: ', student[i].fio);
    writeln('  Курс: ', student[i].kurs);
    writeln('  Дата рождения: ', student[i].birth);
    writeln;
  end;
end.