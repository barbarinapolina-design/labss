unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    lClock: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.Timer1Timer(Sender: TObject);
var i:byte;
begin
  lclock.Caption:=timetostr(now);
  i:=random(4);
  case i of
  0: lclock.Left:=lclock.Left+50;
  1: lclock.Left:=lclock.Left-50;
  2: lclock.Top:=lclock.Top+50;
  3: lclock.Top:=lclock.Top-50;
  end;
  if lclock.Left<0 then lclock.Left:=0;
  if lclock.Top<0 then lclock.Top:=0;
  if (lclock.left + lclock.Width)>fmain.Width then
   lclock.Left:=fmain.Width-lclock.Width;
  if (lclock.Top + lclock.Height)>fmain.Height then
   lclock.Top:=fmain.Height-lclock.Height;
end;

procedure TfMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#27 then close;
end;

end.

