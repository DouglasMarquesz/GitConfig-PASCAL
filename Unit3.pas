unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Image3: TImage;
    procedure Image3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
URLMON, unit2, unit4;

procedure TForm3.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and ((form2.Edit1.Text='Maria Victoria') or (form2.Edit1.Text='Tainara Guidorizzi') or (form2.Edit1.Text='Ana Carolina Lima')) then
  begin
   form4.Show;
   form3.Close;
  end;
end;

procedure TForm3.Image3Click(Sender: TObject);
begin
  HlinkNavigateString(nil,'https://github.com/DouglasMarquesz');
end;

end.
