unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, LazUTF8;

type

  { TfMain }

  TfMain = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnCompare: TButton;
    btnLoadExample: TButton;
    cbMode: TComboBox;
    edPercent: TEdit;
    lbResult: TListBox;
    memoRight: TMemo;
    memoLeft: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCompareClick(Sender: TObject);
    procedure btnLoadExampleClick(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.btnCompareClick(Sender: TObject);
var
  i, maxLen, matches: integer;
  s1, s2: string;
  ch1, ch2: string;
begin
  lbResult.Clear;

  if cbMode.Text = 'Построчно' then
  begin
    if memoLeft.Lines.Count > memoRight.Lines.Count then
      maxLen := memoLeft.Lines.Count
    else
      maxLen := memoRight.Lines.Count;

    matches := 0;

    for i := 0 to maxLen - 1 do
    begin
      s1 := '';
      s2 := '';

      if i < memoLeft.Lines.Count then
        s1 := memoLeft.Lines[i];
      if i < memoRight.Lines.Count then
        s2 := memoRight.Lines[i];

      if s1 = s2 then
      begin
        matches := matches + 1;
        lbResult.Items.Add('Строка ' + IntToStr(i+1) + ': ОДИНАКОВА -> "' + s1 + '"');
        lbResult.Items.Add(' ');
      end
      else
      begin
        lbResult.Items.Add('Строка ' + IntToStr(i+1) + ': РАЗНАЯ');
        lbResult.Items.Add('   [Левая]: "' + s1 + '"');
        lbResult.Items.Add('   [Правая]: "' + s2 + '"');
        lbResult.Items.Add(' ');
      end;
    end;

    if maxLen > 0 then
      edPercent.Text := IntToStr((matches * 100) div maxLen) + '% строк совпадает'
    else
      edPercent.Text := 'Нет строк для сравнения';
  end
  else if cbMode.Text = 'Посимвольно' then
  begin
    s1 := memoLeft.Text;
    s2 := memoRight.Text;

    maxLen := UTF8Length(s1);
    if UTF8Length(s2) > maxLen then
      maxLen := UTF8Length(s2);

    matches := 0;

    for i := 1 to maxLen do
    begin
      if i <= UTF8Length(s1) then
        ch1 := UTF8Copy(s1, i, 1)
      else
        ch1 := '';

      if i <= UTF8Length(s2) then
        ch2 := UTF8Copy(s2, i, 1)
      else
        ch2 := '';

      if (ch1 <> '') and (ch2 <> '') then
      begin
        if ch1 = ch2 then
        begin
          matches := matches + 1;
        end
        else
        begin
          lbResult.Items.Add('Позиция ' + IntToStr(i) + ': "' + ch1 + '" <> "' + ch2 + '"');
        end;
      end
      else if (ch1 <> '') and (ch2 = '') then
      begin
        lbResult.Items.Add('Позиция ' + IntToStr(i) + ': лишний символ слева -> "' + ch1 + '"');
      end
      else if (ch1 = '') and (ch2 <> '') then
      begin
        lbResult.Items.Add('Позиция ' + IntToStr(i) + ': лишний символ справа -> "' + ch2 + '"');
      end;
    end;

    if maxLen > 0 then
      edPercent.Text := IntToStr((matches * 100) div maxLen) + '% символов совпадает'
    else
      edPercent.Text := 'Нет текста для сравнения';

    if lbResult.Items.Count = 1 then
      lbResult.Items.Add(':)Тексты полностью совпадают!');
  end
  else
  begin
    ShowMessage('Выберите режим сравнения: "Построчно" или "Посимвольно"');
  end;
end;

procedure TfMain.btnLoadExampleClick(Sender: TObject);
begin
  memoLeft.Lines.Text := 'Привет мир!' + sLineBreak + 'Это левый текст' + sLineBreak + 'Третья строка';
  memoRight.Lines.Text := 'Привет мир!' + sLineBreak + 'Это правый текст' + sLineBreak + 'Третья строка';
  edPercent.Text := 'Загружен пример. Нажмите "Сравнить"';
end;

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
  memoLeft.Clear;
  memoRight.Clear;
  lbResult.Clear;
  edPercent.Text := '';
end;

end.

