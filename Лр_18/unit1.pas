unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1Function }

  TForm1Function = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1Function: TForm1Function;

implementation

{$R *.lfm}
uses Unit2;
{ TForm1Function }

procedure TForm1Function.Button1Click(Sender: TObject);
var x,y,i: integer; f:real;
begin
  x:=strtoint(edit1.text);
  y:=strtoint(edit3.text);
  f:=0;
  for i:=0 to x do
  begin
    f:=f+((x+1)/(x-1))*i;
  end;
  f:=f+18*x*y*y;
  edit2.Text:=floattostr(f);
end;

procedure TForm1Function.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
end;

procedure TForm1Function.Label1Click(Sender: TObject);
begin

end;

procedure TForm1Function.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1Function.BitBtn1Click(Sender: TObject);
begin
  Hide;
  Form1.Show;
end;

end.

