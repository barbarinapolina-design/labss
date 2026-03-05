type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;
var student: anketa;
begin
  student.kurs:=2;
  write('ФИО: '); readln(student.fio);
  writeln('Курс: ',student.kurs);
  write('Дата рождения: ',student.birth); read(student.birth);
end.