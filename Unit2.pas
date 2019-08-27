unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses

Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
Proxy: string;
begin
  Proxy := edit1.Text;
  inicio.Show;
  WinExec('cmd.exe /C git config --global http.proxy http://aluno:aluno@192.168.0.1:8080', sw_hide);
  Showmessage('Proxy definido para: '+proxy);
  MessageDlg('Programa em desenvolvimento, algumas parte pode não estar funcionando corretamente como esta!', mtWarning, [mbOk], 0);
  Form2.Close;
end;

end.
