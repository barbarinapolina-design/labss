unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Memo1.Clear;
  edit1.Clear;
  edit2.Clear;
  edit3.clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a, b, h,y, i, x: integer;
begin
  a:=strtoint(edit1.text);
  b:=strtoint(edit2.text);
  h:=strtoint(edit3.text);
  for i:=a to b do
  begin
  x:=a;
  y:=x*x;
  a:=a+h;
  Memo1.Lines.add('Функция у=х^2 от числа '+inttostr(x)+' равна: '+inttostr(y));
  end;
end;

end.

