var year,years: set of byte;
    number:integer;
begin
year:=[1];
years:=[5,6,7,8,9,10,11,12,13,14];
write('Количество лет:');
readln(number);
write('Ответ: ');
if number in year then
  writeln (number,' год');
if number mod 100 in years then
  writeln (number,' лет')
  else writeln (number,' года')
end.