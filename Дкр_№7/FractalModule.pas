unit FractalModule;
interface
uses GraphABC;

var
  StepLength: integer = 8;  
  RecursionDepth: integer = 3; 

procedure DrawPeano(x, y: integer);
implementation

procedure LineRel(dx, dy: Integer);
begin
  LineTo(PenX + dx, PenY + dy);
end;

procedure a(i: Integer); forward;
procedure b(i: Integer); forward;
procedure c(i: Integer); forward;
procedure d(i: Integer); forward;

procedure a(i: Integer);
begin
  if i > 0 then //база рекурсии: когда i = 0, рекурсия останавливается
  begin         // Параметризация: (i-1) - уменьшаем глубину на 1
    d(i - 1);   //декомпозиция: разделение на 4 вызова d(i-1), a(i-1), a(i-1), c(i-1)
    LineRel(StepLength, 0);
    a(i - 1);
    LineRel(0, StepLength);
    a(i - 1);
    LineRel(-StepLength, 0);
    c(i - 1);
  end;
end;
 
procedure b(i: integer);
begin
  if i > 0 then // БАЗА РЕКУРСИИ: когда i <= 0, рекурсия останавливается
  begin         // Параметризация: (i-1) - уменьшаем глубину на 1
    c(i - 1);   //декомпозиция: разделение на 4 вызова d(i-1), a(i-1), a(i-1), c(i-1)
    LineRel(-StepLength, 0);
    b(i - 1);
    LineRel(0, -StepLength);
    b(i - 1);
    LineRel(StepLength, 0);
    d(i - 1);
    end;
end;

procedure c(i: integer);
begin
  if i > 0 then // БАЗА РЕКУРСИИ: когда i <= 0, рекурсия останавливается
  begin         // Параметризация: (i-1) - уменьшаем глубину на 1
    b(i - 1);   //декомпозиция: разделение на 4 вызова d(i-1), a(i-1), a(i-1), c(i-1)
    LineRel(0, -StepLength);
    c(i - 1);
    LineRel(-StepLength, 0);
    c(i - 1);
    LineRel(0, StepLength);
    a(i - 1);
  end;
end;

procedure d(i: integer);
begin
  if i > 0 then // БАЗА РЕКУРСИИ: когда i <= 0, рекурсия останавливается
  begin         // Параметризация: (i-1) - уменьшаем глубину на 1
    a(i - 1);   //декомпозиция: разделение на 4 вызова d(i-1), a(i-1), a(i-1), c(i-1)
    LineRel(0, StepLength);
    d(i - 1);
    LineRel(StepLength, 0);
    d(i - 1);
    LineRel(0, -StepLength);
    b(i - 1);
  end;
end;

procedure DrawPeano(x, y: integer);
begin
  MoveTo(x, y);
  a(RecursionDepth);
end;

end.