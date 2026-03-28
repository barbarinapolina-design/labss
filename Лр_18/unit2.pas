unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses Unit1;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var x1,y1,x2,y2: integer; p,s: real;
begin
   x1:=strtoint(edit1.text);
   y1:=strtoint(edit2.text);
   x2:=strtoint(edit3.text);
   y2:=strtoint(edit4.text);
   p:=4*sqrt(((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))/2);
   s:=((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))/2;
   edit5.Text:=floattostr(s);
   edit6.Text:=floattostr(p);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
   Hide;
   Form1Function.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;

end.

