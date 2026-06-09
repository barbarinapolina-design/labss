unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, Menus, ComCtrls, DateTimePicker;

type
  TPatient = record
    CardNumber: Integer;
    FullName: string[50];
    Diagnosis: string[80];
    VisitDate: string[10];
    DoctorName: string[50];
  end;

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miNew: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miClose: TMenuItem;
    miExit: TMenuItem;
    miRecord: TMenuItem;
    miAdd: TMenuItem;
    miEdit: TMenuItem;
    miDelete: TMenuItem;
    miSort: TMenuItem;
    miSortAsc: TMenuItem;
    miSortDesc: TMenuItem;
    miSearch: TMenuItem;
    miClear: TMenuItem;
    StringGrid1: TStringGrid;
    edCard: TEdit;
    edName: TEdit;
    edDiagnosis: TEdit;
    edDoctor: TEdit;
    dtpDate: TDateTimePicker;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miNewClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miSortAscClick(Sender: TObject);
    procedure miSortDescClick(Sender: TObject);
    procedure miSearchClick(Sender: TObject);
    procedure miClearClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    FFileName: string;
    FPatients: array of TPatient;
    FModified: Boolean;
    FEditMode: Boolean;
    procedure LoadFile;
    procedure SaveFile;
    procedure UpdateGrid;
    procedure ClearForm;
    function ValidateInput: Boolean;
    procedure CheckModifiedAndSave;
    procedure SetEditMode(IsEdit: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.SetEditMode(IsEdit: Boolean);
begin
  FEditMode := IsEdit;
  if IsEdit then
  begin
    StringGrid1.Options := StringGrid1.Options + [goEditing];
    ShowMessage('Режим редактирования ВКЛЮЧЕН. Для выхода нажмите Enter');
  end
  else
  begin
    StringGrid1.Options := StringGrid1.Options - [goEditing];
    ShowMessage('Режим редактирования ВЫКЛЮЧЕН');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.ColCount := 5;
  StringGrid1.FixedRows := 1;
  StringGrid1.RowCount := 2;
  StringGrid1.Cells[0,0] := 'Номер карты';
  StringGrid1.Cells[1,0] := 'ФИО пациента';
  StringGrid1.Cells[2,0] := 'Диагноз';
  StringGrid1.Cells[3,0] := 'Дата приема';
  StringGrid1.Cells[4,0] := 'Фамилия врача';
  StringGrid1.ColWidths[0] := 100;
  StringGrid1.ColWidths[1] := 180;
  StringGrid1.ColWidths[2] := 150;
  StringGrid1.ColWidths[3] := 100;
  StringGrid1.ColWidths[4] := 120;

  FEditMode := False;
  FModified := False;
  StringGrid1.Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect];
  StringGrid1.OnSetEditText := @StringGrid1SetEditText;
  StringGrid1.OnKeyDown := @StringGrid1KeyDown;

  FFileName := 'patients.dat';
  if FileExists(FFileName) then
    LoadFile
  else
  begin
    if MessageDlg('Файл не найден', 'Файл "patients.dat" не существует. Создать новый?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      SetLength(FPatients, 0);
      SaveFile;
      ShowMessage('Создан новый файл: patients.dat');
    end;
  end;

  Self.Width := 850;
  Self.Height := 600;
  Self.Position := poScreenCenter;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Res: Integer;
begin
  if FModified and (Length(FPatients) > 0) then
  begin
    Res := MessageDlg('Выход', 'Есть несохраненные изменения. Сохранить?',
                      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    case Res of
      mrYes:
        begin
          if FFileName = '' then
            miSaveAsClick(Sender)
          else
            SaveFile;
          CanClose := True;
        end;
      mrNo: CanClose := True;
      mrCancel: CanClose := False;
    end;
  end;
end;

procedure TForm1.CheckModifiedAndSave;
begin
  if FModified then
  begin
    if MessageDlg('Изменения', 'Есть несохраненные изменения. Сохранить?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if FFileName = '' then
        miSaveAsClick(Self)
      else
        SaveFile;
    end;
  end;
end;

function TForm1.ValidateInput: Boolean;
var
  i: Integer;
  Num: Integer;
begin
  Result := False;

  if Trim(edCard.Text) = '' then
  begin
    ShowMessage('Ошибка: Введите номер карты');
    edCard.SetFocus;
    Exit;
  end;

  if not TryStrToInt(edCard.Text, Num) then
  begin
    ShowMessage('Ошибка: Номер карты должен быть числом');
    edCard.SetFocus;
    Exit;
  end;

  if Num <= 0 then
  begin
    ShowMessage('Ошибка: Номер карты должен быть больше 0');
    edCard.SetFocus;
    Exit;
  end;

  if Trim(edName.Text) = '' then
  begin
    ShowMessage('Ошибка: Введите ФИО пациента');
    edName.SetFocus;
    Exit;
  end;

  for i := 1 to Length(edName.Text) do
    if edName.Text[i] in ['0'..'9'] then
    begin
      ShowMessage('Ошибка: ФИО не должно содержать цифры');
      edName.SetFocus;
      Exit;
    end;

  if Trim(edDiagnosis.Text) = '' then
  begin
    ShowMessage('Ошибка: Введите диагноз');
    edDiagnosis.SetFocus;
    Exit;
  end;

  if Trim(edDoctor.Text) = '' then
  begin
    ShowMessage('Ошибка: Введите фамилию врача');
    edDoctor.SetFocus;
    Exit;
  end;

  for i := 1 to Length(edDoctor.Text) do
    if edDoctor.Text[i] in ['0'..'9'] then
    begin
      ShowMessage('Ошибка: Фамилия врача не должна содержать цифры');
      edDoctor.SetFocus;
      Exit;
    end;

  Result := True;
end;

procedure TForm1.ClearForm;
begin
  edCard.Text := '';
  edName.Text := '';
  edDiagnosis.Text := '';
  edDoctor.Text := '';
  dtpDate.Date := Date;
  edCard.SetFocus;
end;

procedure TForm1.UpdateGrid;
var i: Integer;
begin
  if Length(FPatients) = 0 then
  begin
    StringGrid1.RowCount := 2;
    for i := 0 to 4 do
      StringGrid1.Cells[i, 1] := '';
  end
  else
  begin
    StringGrid1.RowCount := Length(FPatients) + 1;
    for i := 0 to Length(FPatients) - 1 do
    begin
      StringGrid1.Cells[0, i+1] := IntToStr(FPatients[i].CardNumber);
      StringGrid1.Cells[1, i+1] := FPatients[i].FullName;
      StringGrid1.Cells[2, i+1] := FPatients[i].Diagnosis;
      StringGrid1.Cells[3, i+1] := FPatients[i].VisitDate;
      StringGrid1.Cells[4, i+1] := FPatients[i].DoctorName;
    end;
  end;
end;

procedure TForm1.LoadFile;
var
  f: file of TPatient;
  p: TPatient;
  i: Integer;
begin
  if not FileExists(FFileName) then
  begin
    ShowMessage('Файл не найден');
    Exit;
  end;

  try
    AssignFile(f, FFileName);
    Reset(f);
    SetLength(FPatients, FileSize(f));
    i := 0;
    while not EOF(f) do
    begin
      Read(f, p);
      FPatients[i] := p;
      Inc(i);
    end;
    CloseFile(f);
    UpdateGrid;
    FModified := False;
    ShowMessage('Загружено: ' + IntToStr(Length(FPatients)) + ' записей');
  except
    on E: Exception do
    begin
      ShowMessage('Ошибка: Файл имеет неверный формат или поврежден.'#13#10 + E.Message);
      SetLength(FPatients, 0);
      UpdateGrid;
    end;
  end;
end;

procedure TForm1.SaveFile;
var
  f: file of TPatient;
  i: Integer;
begin
  if FFileName = '' then
  begin
    miSaveAsClick(Self);
    Exit;
  end;

  try
    AssignFile(f, FFileName);
    Rewrite(f);
    for i := 0 to Length(FPatients) - 1 do
      Write(f, FPatients[i]);
    CloseFile(f);
    FModified := False;
    ShowMessage('Сохранено: ' + ExtractFileName(FFileName));
  except
    on E: Exception do
      ShowMessage('Ошибка ввода-вывода: ' + E.Message + #13#10'Проверьте место на диске или права доступа');
  end;
end;

procedure TForm1.miNewClick(Sender: TObject);
begin
  CheckModifiedAndSave;

  if MessageDlg('Новый файл', 'Создать новый файл? Все данные будут потеряны.',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SetLength(FPatients, 0);
  FFileName := 'patients.dat';
  FModified := False;
  UpdateGrid;
  ClearForm;
  SaveFile;
  if FEditMode then SetEditMode(False);
end;

procedure TForm1.miOpenClick(Sender: TObject);
begin
  CheckModifiedAndSave;

  OpenDialog1.Filter := 'DAT файлы|*.dat|Все файлы|*.*';
  if OpenDialog1.Execute then
  begin
    FFileName := OpenDialog1.FileName;
    LoadFile;
    if FEditMode then SetEditMode(False);
  end;
end;

procedure TForm1.miSaveClick(Sender: TObject);
begin
  if Length(FPatients) = 0 then
  begin
    ShowMessage('Нет данных для сохранения');
    Exit;
  end;

  if FFileName = '' then
    miSaveAsClick(Sender)
  else
    SaveFile;
end;

procedure TForm1.miSaveAsClick(Sender: TObject);
begin
  SaveDialog1.Filter := 'DAT файлы|*.dat|Все файлы|*.*';
  SaveDialog1.DefaultExt := 'dat';
  if SaveDialog1.Execute then
  begin
    FFileName := SaveDialog1.FileName;
    SaveFile;
  end;
end;

procedure TForm1.miCloseClick(Sender: TObject);
begin
  CheckModifiedAndSave;
  SetLength(FPatients, 0);
  FFileName := '';
  FModified := False;
  UpdateGrid;
  ClearForm;
  if FEditMode then SetEditMode(False);
end;

procedure TForm1.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.miAddClick(Sender: TObject);
begin
  if not ValidateInput then Exit;

  SetLength(FPatients, Length(FPatients) + 1);
  FPatients[Length(FPatients) - 1].CardNumber := StrToInt(edCard.Text);
  FPatients[Length(FPatients) - 1].FullName := Trim(edName.Text);
  FPatients[Length(FPatients) - 1].Diagnosis := Trim(edDiagnosis.Text);
  FPatients[Length(FPatients) - 1].VisitDate := DateToStr(dtpDate.Date);
  FPatients[Length(FPatients) - 1].DoctorName := Trim(edDoctor.Text);

  UpdateGrid;
  ClearForm;
  FModified := True;
  ShowMessage('Запись добавлена');
end;

procedure TForm1.miEditClick(Sender: TObject);
begin
  if StringGrid1.Row < 1 then
  begin
    ShowMessage('Выберите запись для редактирования');
    Exit;
  end;

  if FEditMode then
    SetEditMode(False)
  else
    SetEditMode(True);
end;

procedure TForm1.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
var
  idx: Integer;
begin
  if not FEditMode then Exit;

  idx := ARow - 1;
  if idx < 0 then Exit;

  case ACol of
    0:
      begin
        if TryStrToInt(Value, FPatients[idx].CardNumber) then
          StringGrid1.Cells[0, ARow] := IntToStr(FPatients[idx].CardNumber)
        else
          StringGrid1.Cells[0, ARow] := IntToStr(FPatients[idx].CardNumber);
      end;
    1: FPatients[idx].FullName := Value;
    2: FPatients[idx].Diagnosis := Value;
    3: FPatients[idx].VisitDate := Value;
    4: FPatients[idx].DoctorName := Value;
  end;
  FModified := True;
end;

procedure TForm1.StringGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) and FEditMode then
  begin
    SetEditMode(False);
    Key := 0;
  end;
end;

procedure TForm1.miDeleteClick(Sender: TObject);
var
  idx, i: Integer;
begin
  idx := StringGrid1.Row - 1;
  if idx < 0 then
  begin
    ShowMessage('Ошибка: Выберите запись для удаления');
    Exit;
  end;

  if MessageDlg('Удаление', 'Удалить выбранную запись?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := idx to Length(FPatients) - 2 do
      FPatients[i] := FPatients[i+1];
    SetLength(FPatients, Length(FPatients) - 1);
    UpdateGrid;
    ClearForm;
    FModified := True;
    ShowMessage('Запись удалена');
  end;
end;

procedure TForm1.miSortAscClick(Sender: TObject);
var
  i, j: Integer;
  tmp: TPatient;
begin
  if Length(FPatients) <= 1 then Exit;

  for i := 0 to Length(FPatients)-2 do
    for j := 0 to Length(FPatients)-2-i do
      if FPatients[j].CardNumber > FPatients[j+1].CardNumber then
      begin
        tmp := FPatients[j];
        FPatients[j] := FPatients[j+1];
        FPatients[j+1] := tmp;
      end;
  UpdateGrid;
  ShowMessage('Отсортировано по возрастанию');
end;

procedure TForm1.miSortDescClick(Sender: TObject);
var
  i, j: Integer;
  tmp: TPatient;
begin
  if Length(FPatients) <= 1 then Exit;

  for i := 0 to Length(FPatients)-2 do
    for j := 0 to Length(FPatients)-2-i do
      if FPatients[j].CardNumber < FPatients[j+1].CardNumber then
      begin
        tmp := FPatients[j];
        FPatients[j] := FPatients[j+1];
        FPatients[j+1] := tmp;
      end;
  UpdateGrid;
  ShowMessage('Отсортировано по убыванию');
end;

procedure TForm1.miSearchClick(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  if Length(FPatients) = 0 then
  begin
    ShowMessage('Нет записей для поиска');
    Exit;
  end;

  s := InputBox('Поиск', 'Введите номер карты или ФИО:', '');
  if s = '' then Exit;

  for i := 0 to Length(FPatients)-1 do
  begin
    if (IntToStr(FPatients[i].CardNumber) = s) or (Pos(s, FPatients[i].FullName) > 0) then
    begin
      StringGrid1.Row := i + 1;
      StringGrid1.SetFocus;
      ShowMessage('Найдено: ' + FPatients[i].FullName);
      Exit;
    end;
  end;

  ShowMessage('Не найдено');
end;

procedure TForm1.miClearClick(Sender: TObject);
begin
  ClearForm;
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  if StringGrid1.Row >= 1 then
  begin
    edCard.Text := StringGrid1.Cells[0, StringGrid1.Row];
    edName.Text := StringGrid1.Cells[1, StringGrid1.Row];
    edDiagnosis.Text := StringGrid1.Cells[2, StringGrid1.Row];
    if StringGrid1.Cells[3, StringGrid1.Row] <> '' then
      dtpDate.Date := StrToDate(StringGrid1.Cells[3, StringGrid1.Row]);
    edDoctor.Text := StringGrid1.Cells[4, StringGrid1.Row];
  end;
end;

end.
