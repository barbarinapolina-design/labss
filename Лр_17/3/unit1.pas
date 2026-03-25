unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, t, k, k1: integer;
begin
  k:=strtoint(edit1.Text);
  k1:=strtoint(edit2.Text);
  i:=1;
  t:=1;
  while i <= k1 do
  begin
  t:=t*k;
  i:=i+1;
  end;
  Memo1.Lines.add('число '+edit1.text+' в степени '+edit2.text+' равно: '+IntToStr(t));
end;
end.

