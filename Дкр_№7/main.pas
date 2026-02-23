uses GraphABC, 
     FractalModule;
var
  offsetX, offsetY: integer;
  isDragging: boolean;
  lastX, lastY: integer;

procedure RedrawScene;
begin
  ClearWindow(Color.White);
  Pen.Color := Color.Red;
  Pen.Width := 1;
  
  try
    DrawPeano(offsetX, offsetY);
  except
  end;
  
  SetFontColor(Color.Black);
  SetFontSize(10);
  TextOut(10, 10, 'Глубина: ' + RecursionDepth + ' (+/- для изменения)');
  TextOut(10, 30, 'Шаг: ' + StepLength + ' (PageUp/Down для масштаба)');
  TextOut(10, 50, 'Зажатая ЛКМ - перемещение, R - сброс, Esc - выход');
  TextOut(10, 70, 'X: ' + offsetX + ' Y: ' + offsetY);
end;

procedure UpdateScreen;
begin
  LockDrawing;     
  RedrawScene;       
  Redraw;            
  UnlockDrawing;     
end;

procedure KeyDown(Key: integer);
begin
  if Key = VK_Add then
  begin
    if RecursionDepth < 6 then
    begin
      RecursionDepth := RecursionDepth + 1;
      UpdateScreen;
    end;
  end

  else if Key = VK_Subtract then
  begin
    if RecursionDepth > 1 then
    begin
      RecursionDepth := RecursionDepth - 1;
      UpdateScreen;
    end;
  end

  else case Key of
    VK_PageUp: 
      if StepLength > 2 then
      begin
        StepLength := StepLength - 1;
        UpdateScreen;
      end;
      
    VK_PageDown:
      if StepLength < 200 then
      begin
        StepLength := StepLength + 1;
        UpdateScreen;
      end;
      
    VK_R:  
      begin
        offsetX := Window.Width div 2;
        offsetY := Window.Height div 2;
        StepLength := 8;
        RecursionDepth := 3;
        UpdateScreen;
      end;
      
    VK_Escape:  Window.Close;
  end;
end;

procedure MouseDown(x, y, mb: integer);
begin
  if mb = 1 then 
  begin
    isDragging := true;
    lastX := x;
    lastY := y;
  end;
end;

procedure MouseMove(x, y, mb: integer);
begin
  if isDragging then
  begin
    offsetX := offsetX + (x - lastX);
    offsetY := offsetY + (y - lastY);
    lastX := x;
    lastY := y;
    UpdateScreen;
  end;
end;

procedure MouseUp(x, y, mb: integer);
begin
  if mb = 1 then
    isDragging := false;
end;

begin
  SetWindowSize(800, 600);
  Window.Title := 'ДКР №7 - Кривая Пеано';
  Window.CenterOnScreen;

  offsetX := Window.Width div 2;
  offsetY := Window.Height div 2;
  isDragging := false;
  
  OnKeyDown := KeyDown;
  OnMouseDown := MouseDown;
  OnMouseMove := MouseMove;
  OnMouseUp := MouseUp;
  
  UpdateScreen;
end.