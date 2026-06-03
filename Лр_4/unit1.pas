unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmCalculator }

  TfrmCalculator = class(TForm)
    btn0: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btnAdd: TButton;
    btnSub: TButton;
    btnMul: TButton;
    btnDiv: TButton;
    btnEquals: TButton;
    btnClearEntry: TButton;
    btnClearAll: TButton;
    btnBackspace: TButton;
    btnDecimal: TButton;     // ,  (запятая)
    btnSqrt: TButton;        // Kop (корень)
    btnSquare: TButton;      // x² (квадрат)
    btnInverse: TButton;     // 1/x (обратное число)
    edtResult: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSubClick(Sender: TObject);
    procedure btnMulClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnEqualsClick(Sender: TObject);
    procedure btnClearEntryClick(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure btnBackspaceClick(Sender: TObject);
    procedure btnDecimalClick(Sender: TObject);    // запятая
    procedure btnSqrtClick(Sender: TObject);       // корень
    procedure btnSquareClick(Sender: TObject);     // квадрат
    procedure btnInverseClick(Sender: TObject);    // 1/x

  private
    chislo: string;
    memory: real;
    operacia: string;
    new: boolean;

  public

  end;

var
  frmCalculator: TfrmCalculator;

implementation

{$R *.lfm}

procedure TfrmCalculator.FormCreate(Sender: TObject); // При запуске
begin
  chislo := '0';
  memory := 0;
  operacia := '';
  new := True;
  edtResult.Text := '';
  edtResult.ReadOnly := True;
  Scaled := False;
end;

procedure TfrmCalculator.btn1Click(Sender: TObject); // Цифра 1
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '1';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn2Click(Sender: TObject); // Цифра 2
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '2';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn3Click(Sender: TObject); // Цифра 3
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '3';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn4Click(Sender: TObject); // Цифра 4
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '4';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn5Click(Sender: TObject); // Цифра 5
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '5';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn6Click(Sender: TObject); // Цифра 6
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '6';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn7Click(Sender: TObject); // Цифра 7
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '7';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn8Click(Sender: TObject); // Цифра 8
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '8';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn9Click(Sender: TObject); // Цифра 9
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  chislo := chislo + '9';
  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btn0Click(Sender: TObject); // Цифра 0
begin
  if new = True then
  begin
    chislo := '';
    new := False;
  end;
  if chislo <> '0' then
  begin
    chislo := chislo + '0';
    edtResult.Text := chislo;
  end;
end;

procedure TfrmCalculator.btnDecimalClick(Sender: TObject); // Запятая (десятичный разделитель)
begin
  if new = True then
  begin
    chislo := '0';
    new := False;
  end;

  if Pos(',', chislo) = 0 then
    chislo := chislo + ',';

  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btnSquareClick(Sender: TObject); // Квадрат (x^2)
var
  a: real;
begin
  if chislo = '' then
    chislo := '0';

  a := StrToFloat(chislo);
  a := a * a;

  chislo := FloatToStr(a);

  while Pos('.', chislo) > 0 do
    chislo[Pos('.', chislo)] := ',';
  edtResult.Text := chislo;
  new := True;
end;

procedure TfrmCalculator.btnSqrtClick(Sender: TObject); // Корень
var
  a: real;
begin
  if chislo = '' then
    chislo := '0';

  a := StrToFloat(chislo);

  if a < 0 then
  begin
    edtResult.Text := 'Корень из отр. числа!';
    Exit;
  end;

  a := Sqrt(a);

  chislo := FloatToStr(a);
  while Pos('.', chislo) > 0 do
    chislo[Pos('.', chislo)] := ',';
  edtResult.Text := chislo;
  new := True;
end;

procedure TfrmCalculator.btnInverseClick(Sender: TObject); // Обратное число (1/x)
var
  a: real;
begin
  if chislo = '' then
    chislo := '0';

  a := StrToFloat(chislo);

  if a = 0 then
  begin
    edtResult.Text := 'На 0 делить нельзя!';
    Exit;
  end;

  a := 1 / a;

  chislo := FloatToStr(a);
  while Pos('.', chislo) > 0 do
    chislo[Pos('.', chislo)] := ',';
  edtResult.Text := chislo;
  new := True;
end;

procedure TfrmCalculator.btnBackspaceClick(Sender: TObject); // Кнопка <- (Backspace)
begin
  if new = True then Exit;

  if Length(chislo) > 0 then
    Delete(chislo, Length(chislo), 1);

  if chislo = '' then
    chislo := '0';

  edtResult.Text := chislo;
end;

procedure TfrmCalculator.btnClearEntryClick(Sender: TObject); // CE (очистить экран)
begin
  chislo := '0';
  new := True;
  edtResult.Text := '0';
end;

procedure TfrmCalculator.btnClearAllClick(Sender: TObject); // C (всё сбросить)
begin
  chislo := '0';
  memory := 0;
  operacia := '';
  new := True;
  edtResult.Text := '0';
end;

procedure TfrmCalculator.btnAddClick(Sender: TObject); // Кнопка +
begin
  if chislo = '' then
    chislo := '0';
  memory := StrToFloat(chislo);
  operacia := '+';
  new := True;
end;

procedure TfrmCalculator.btnSubClick(Sender: TObject); // Кнопка -
begin
  if chislo = '' then
    chislo := '0';
  memory := StrToFloat(chislo);
  operacia := '-';
  new := True;
end;

procedure TfrmCalculator.btnMulClick(Sender: TObject); // Кнопка *
begin
  if chislo = '' then
    chislo := '0';
  memory := StrToFloat(chislo);
  operacia := '*';
  new := True;
end;

procedure TfrmCalculator.btnDivClick(Sender: TObject); // Кнопка /
begin
  if chislo = '' then
    chislo := '0';
  memory := StrToFloat(chislo);
  operacia := '/';
  new := True;
end;

procedure TfrmCalculator.btnEqualsClick(Sender: TObject); // Кнопка =
var
  tekushee: real;
  resultat: real;
begin
  if operacia = '' then Exit;

  if chislo = '' then
    chislo := '0';

  tekushee := StrToFloat(chislo);

  if operacia = '+' then resultat := memory + tekushee;
  if operacia = '-' then resultat := memory - tekushee;
  if operacia = '*' then resultat := memory * tekushee;
  if operacia = '/' then
  begin
    if tekushee = 0 then
    begin
      edtResult.Text := 'На 0 делить нельзя!';
      Exit;
    end;
    resultat := memory / tekushee;
  end;

  chislo := FloatToStr(resultat);
  while Pos('.', chislo) > 0 do
    chislo[Pos('.', chislo)] := ',';
  edtResult.Text := chislo;

  operacia := '';
  new := True;
end;

end.
