unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses
unit2, unit1;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  proxy:='';
  inicio.Memo1.Lines.Clear;
  inicio.Ativar1.Checked:= false;
  inicio.Memo1.Visible:= false;
  inicio.BitBtn2.Visible:= false;
  inicio.Ativar1.Caption:= 'Ativar';
  inicio.Show;
end;

procedure TForm4.Image1Click(Sender: TObject);
var
Count, likes: integer;
begin
Count:= strToInt(label7.Caption);
if count<9 then
  begin
  Label7.Caption:=intToStr(Count+1);
  end;
if count>0 then
  begin
    image6.Hint:= 'Douglas Marques e outras '+intToStr(count)+' pessoas reagiram a sua representação!';
  end;
if count>0 then
  begin
    likes:= strToInt(label7.Caption);
    image6.Hint:= 'Douglas Marques e outras '+intToStr(likes-1)+' pessoas reagiram a sua representação!';
  end;
end;

procedure TForm4.Image2Click(Sender: TObject);
var
Count, likes: integer;
begin
Count:= strToInt(label8.Caption);
if count<9 then
  begin
  Label8.Caption:=intToStr(Count+1);
  end;
if count>0 then
  begin
    likes:= strToInt(label8.Caption);
    image5.Hint:= 'Douglas Marques e outras '+intToStr(likes-1)+' pessoas reagiram a sua representação!';
  end;
end;

procedure TForm4.Image3Click(Sender: TObject);
var
Count, likes: integer;
begin
Count:= strToInt(label9.Caption);
if count<9 then
  begin
  Label9.Caption:=intToStr(Count+1);
  end;
if count>0 then
  begin
    likes:= strToInt(label9.Caption);
    image4.Hint:= 'Douglas Marques e outras '+intToStr(likes-1)+' pessoas reagiram a sua foto!';
  end;
end;

end.
