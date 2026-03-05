type t_chs = set of Char;
const
  lett: t_chs = ['a'..'z','A'..'Z','_'];
  num: t_chs = ['0'..'9'];
var
  str: string;
  i: byte;
  flag: boolean;
begin
  write('Введите строку для проверки: ');
  readln(str);
  flag := true;
  if not (str[1] in lett) then
    flag := false
    else
      begin
      for i := 2 to Length(str) do
        begin
        if not (str[i] in (lett + num)) then
          begin
          flag := false;
          break;
          end;
        end;
      end;
   if flag then
        writeln('Строка корректна')
    else writeln('Строка содержит недопустимые символы');
end.