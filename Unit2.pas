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
  Proxy: string;

implementation

{$R *.dfm}

uses

Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Proxy := edit1.Text;
  inicio.Show;
  WinExec('cmd.exe /C git config --global http.proxy http://aluno:aluno@192.168.0.1:8080', sw_hide);
  if (inicio.Ativar1.Checked = false) or (inicio.Ativar1.Checked = true) then
  begin
    inicio.Ativar1.Checked := true;
    inicio.Ativar1.caption := 'Desativar';
    inicio.Memo1.Visible := true;
    inicio.Bitbtn2.visible := true;
    form2.Hide;
    inicio.Memo1.Lines.Add('git config --global http.proxy http://'+proxy);
    sleep(1200);
    if (Pos('Tainara', proxy)) or Pos('Victoria', proxy) or Pos('Santos', proxy) or (Pos('Guidorizzi', proxy)) or Pos('Bardelin', proxy) or Pos('Lima', proxy) <> 0 then
      begin
        inicio.Memo1.Lines.Add('Humm, esse nome me parece familiar.')
      end
        else
      begin
        if MessageDlg('Proxy aual: ('+proxy+') Confirmar? ', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
          begin
            inicio.BitBtn2.Click;
          end;
      end;
  end
    else
  begin
    inicio.Ativar1.Checked := false;
    inicio.Ativar1.caption := 'Ativar';
    inicio.Memo1.Visible := false;
    inicio.Bitbtn2.visible := false;
  end;
  Form2.Close;
end;

end.
