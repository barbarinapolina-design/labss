unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var r,V:real; AllFilled:boolean;
begin
  AllFilled := True;
  if Edit5.Text = '' then
  begin
    Edit5.Color := clred;
    AllFilled := False;
  end
  else
    Edit5.Color := clWindow;
  if not AllFilled then
  begin
    ShowMessage('Заполните выделенные поля!');
    Exit;
  end;
  r:=StrTofloat(Edit5.Text);
  V:=3/4*3.14*r*r*r;
  Edit4.text:=floattostr(V);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var r,h,V:real; AllFilled:boolean;
begin
  AllFilled := True;
  if Edit5.Text = '' then
  begin
    Edit5.Color := clred;
    AllFilled := False;
  end
  else
    Edit5.Color := clWindow;
  if Edit6.Text = '' then
  begin
    Edit6.Color := clred;
    AllFilled := False;
  end
  else
    Edit6.Color := clWindow;
  if not AllFilled then
  begin
    ShowMessage('Заполните выделенные поля!');
    Exit;
  end;
  r:=StrTofloat(Edit5.Text);
  h:=StrTofloat(Edit6.Text);
  V:=3.14*r*r*h;
  Edit4.text:=floattostr(V);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var r,h,V:real; AllFilled:boolean;
begin
  AllFilled := True;
  if Edit5.Text = '' then
  begin
    Edit5.Color := clred;
    AllFilled := False;
  end
  else
    Edit5.Color := clWindow;
  if Edit6.Text = '' then
  begin
    Edit6.Color := clred;
    AllFilled := False;
  end
  else
    Edit6.Color := clWindow;
  if not AllFilled then
  begin
    ShowMessage('Заполните выделенные поля!');
    Exit;
  end;
  r:=StrTofloat(Edit5.Text);
  h:=StrTofloat(Edit6.Text);
  V:=1/3*3.14*r*r*h;
  Edit4.text:=floattostr(V);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit1.Color := clWindow;
  Edit2.Color := clWindow;
  Edit3.Color := clWindow;
  Edit5.Color := clWindow;
  Edit6.Color := clWindow;

  Image3.Visible:=True;
  BitBtn2.Visible:=True;
  Label5.Visible:=True;
  Edit4.Visible:=True;
  Edit5.Visible:=True;
  Label6.Visible:=True;
  BitBtn5.Visible:=True;
  Edit6.Visible:=True;
  Label7.Visible:=True;
  BitBtn3.Visible:=True;

  Label1.Visible:=False;
  Image4.Visible:=False;
  BitBtn6.Visible:=False;
  BitBtn4.Visible:=False;
  Image2.Visible:=False;
  BitBtn1.Visible:=False;
  Image1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  Edit1.Visible:=False;
  Edit2.Visible:=False;
  Edit3.Visible:=False;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit1.Color := clWindow;
  Edit2.Color := clWindow;
  Edit3.Color := clWindow;
  Edit5.Color := clWindow;
  Edit6.Color := clWindow;

  Image4.Visible:=True;
  BitBtn2.Visible:=True;
  Label5.Visible:=True;
  Edit4.Visible:=True;
  Edit5.Visible:=True;
  Label6.Visible:=True;
  BitBtn6.Visible:=True;
  Edit6.Visible:=True;
  Label7.Visible:=True;
  BitBtn3.Visible:=True;

  Label1.Visible:=False;
  BitBtn5.Visible:=False;
  Image3.Visible:=False;
  BitBtn4.Visible:=False;
  Image2.Visible:=False;
  BitBtn1.Visible:=False;
  Image1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  Edit1.Visible:=False;
  Edit2.Visible:=False;
  Edit3.Visible:=False;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var a,b,h,V:real; AllFilled: boolean;
begin
  AllFilled := True;
  if Edit1.Text = '' then
  begin
    Edit1.Color := clred;
    AllFilled := False;
  end
  else
    Edit1.Color := clWindow;
  if Edit2.Text = '' then
  begin
    Edit2.Color := clred;
    AllFilled := False;
  end
  else
    Edit2.Color := clWindow;
  if Edit3.Text = '' then
  begin
    Edit3.Color := clred;
    AllFilled := False;
  end
  else
    Edit3.Color := clWindow;
  if not AllFilled then
  begin
    ShowMessage('Заполните выделенные поля!');
    Exit;
  end;
  a:=StrTofloat(Edit1.Text);
  b:=StrTofloat(Edit2.Text);
  h:=StrTofloat(Edit3.Text);
  V:=a*b*h;
  Edit4.text:=floattostr(V);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit1.Color := clWindow;
  Edit2.Color := clWindow;
  Edit3.Color := clWindow;
  Edit5.Color := clWindow;
  Edit6.Color := clWindow;

  Image1.Visible:=True;
  BitBtn1.Visible:=True;
  BitBtn2.Visible:=True;
  Label2.Visible:=True;
  Label3.Visible:=True;
  Label4.Visible:=True;
  Label5.Visible:=True;
  Edit1.Visible:=True;
  Edit2.Visible:=True;
  Edit3.Visible:=True;
  Edit4.Visible:=True;
  BitBtn3.Visible:=True;

  Label1.Visible:=False;
  Image4.Visible:=False;
  BitBtn6.Visible:=False;
  Image3.Visible:=False;
  Edit5.Visible:=False;
  BitBtn4.Visible:=False;
  Label6.Visible:=False;
  Image2.Visible:=False;
  Edit6.Visible:=False;
  Label7.Visible:=False;
  BitBtn5.Visible:=False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit1.Color := clWindow;
  Edit2.Color := clWindow;
  Edit3.Color := clWindow;
  Edit5.Color := clWindow;
  Edit6.Color := clWindow;

  Image2.Visible:=True;
  BitBtn2.Visible:=True;
  Label5.Visible:=True;
  Edit4.Visible:=True;
  Edit5.Visible:=True;
  Label6.Visible:=True;
  BitBtn4.Visible:=True;
  BitBtn3.Visible:=True;

  Label1.Visible:=False;
  Image4.Visible:=False;
  BitBtn6.Visible:=False;
  Image3.Visible:=False;
  BitBtn1.Visible:=False;
  Image1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  Edit1.Visible:=False;
  Edit2.Visible:=False;
  Edit3.Visible:=False;
  Edit6.Visible:=False;
  Label7.Visible:=False;
end;


end.

