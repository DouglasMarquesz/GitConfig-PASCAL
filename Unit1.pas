unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.ComCtrls, Vcl.Buttons, Vcl.Menus;

type
  Tinicio = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    MainMenu1: TMainMenu;
    Config1: TMenuItem;
    Proxy1: TMenuItem;
    Etec1: TMenuItem;
    RemoverProxy1: TMenuItem;
    Lembrar1: TMenuItem;
    Sobre1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Outro1: TMenuItem;
    GitBash1: TMenuItem;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    Novorepositrio1: TMenuItem;
    Adicionararquivos1: TMenuItem;
    Clonararquivos1: TMenuItem;
    Enviararquivos1: TMenuItem;
    AdicionarCommit1: TMenuItem;
    Ativar1: TMenuItem;
    N1: TMenuItem;
    AdicionarProxy1: TMenuItem;
    AdicionarEmail1: TMenuItem;
    AdicionarUsuario1: TMenuItem;
    N2: TMenuItem;
    Enviararquivos2: TMenuItem;
    N3: TMenuItem;
    Sair1: TMenuItem;
    RemoverProxy2: TMenuItem;
    N4: TMenuItem;
    Atualizararquivos1: TMenuItem;
    procedure ApplicationEvents1ActionExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure Etec1Click(Sender: TObject);
    procedure RemoverProxy1Click(Sender: TObject);
    procedure Outro1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Lembrar1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Ativar1Click(Sender: TObject);
    procedure Novorepositrio1Click(Sender: TObject);
    procedure Adicionararquivos1Click(Sender: TObject);
    procedure Enviararquivos1Click(Sender: TObject);
    procedure AdicionarCommit1Click(Sender: TObject);
    procedure Enviararquivos2Click(Sender: TObject);
    procedure Clonararquivos1Click(Sender: TObject);
    procedure AdicionarProxy1Click(Sender: TObject);
    procedure RemoverProxy2Click(Sender: TObject);
    procedure AdicionarEmail1Click(Sender: TObject);
    procedure AdicionarUsuario1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Atualizararquivos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  inicio: Tinicio;
  Email,Nome,Commit: string;
  GitHub,Folder: string;
  lembrar: boolean;

implementation

{$R *.dfm}

uses

Unit2, Unit3, Unit4;

//Apareça as dicas em baixo do formulario
procedure Tinicio.Adicionararquivos1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git add (nome dos arquivos ou "." para todos)');
  end;
end;

procedure Tinicio.AdicionarCommit1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git remote add origin (link https do github)');
  end;
end;

procedure Tinicio.AdicionarEmail1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git config --global user.email (seu email GitHub)');
  end;
end;

procedure Tinicio.AdicionarProxy1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git config --global http.proxy (endereço do proxy)');
  end;
end;

procedure Tinicio.AdicionarUsuario1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git config --global user.name (seu nome GitHub)');
  end;
end;

procedure Tinicio.ApplicationEvents1ActionExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  Statusbar1.Panels[0].Text := Application.Hint;
end;

//Ao Clicar no Botao
procedure Tinicio.Ativar1Click(Sender: TObject);
begin
if Ativar1.Checked = false then
  begin
    Ativar1.Checked := true;
    Ativar1.caption := 'Desativar';
    Memo1.Visible := true;
    Bitbtn2.visible := true;
  end
    else
  begin
    Ativar1.Checked := false;
    Ativar1.caption := 'Ativar';
    Memo1.Visible := false;
    Bitbtn2.visible := false;
  end;
end;

procedure Tinicio.Atualizararquivos1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git pull origin master');
  end;
end;

procedure Tinicio.BitBtn1Click(Sender: TObject);
var
bat: TextFile;
begin
  Nome:= edit1.Text;
  Email:= edit2.Text;
  Commit:= edit5.Text;
  GitHub:= edit4.Text;

  AssignFile(bat, 'Config.bat');
  Rewrite(bat);
  Writeln(bat, '@echo off');
  Writeln(bat, 'git init');
  Writeln(bat, 'git add .');
  Writeln(bat, 'git rm -r --cached Config.bat');
  Writeln(bat, 'git rm -r --cached Usuario.bat');
  Writeln(bat, 'git rm -r --cached GitConfig.exe');
  Writeln(bat, 'git commit -m "'+commit+'"');
  Writeln(bat, 'git remote add origin '+github);
  Writeln(bat, 'exit');
  CLoseFile(bat);

  if Lembrar=false then
    begin
      AssignFile(bat, 'Usuario.bat');
      Rewrite(bat);
      Writeln(bat, '@echo off');
      Writeln(bat, 'git config --global user.email '+email);
      Writeln(bat, 'git config --global user.name '+Nome);
      Writeln(bat, 'exit');
      CloseFile(bat);
    end;

  if lembrar=false then
    begin
      WinExec('cmd.exe /c start Usuario.bat', sw_hide);
    end;

  WinExec('cmd.exe /c start Config.bat', sw_hide);
  MessageDlg('Caso o arquivo não seja enviado, verifique o proxy utilizado.', mtWarning, [MbOk], 0);
  if MessageDlg('Arquivo configurado, Enviar? ', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
    begin
      WinExec('cmd.exe /c del Config.bat', sw_show);
      WinExec('git.exe push -u origin master', sw_show);
      if Lembrar=false then
        begin
          WinExec('cmd.exe /c del Usuario.bat', sw_show);
        end;
    end
      else
    begin
      WinExec('cmd.exe /c del Config.bat', sw_show);
      if Lembrar=false then
        begin
          WinExec('cmd.exe /c del Usuario.bat', sw_show);
        end;
    end;
end;

procedure Tinicio.BitBtn2Click(Sender: TObject);
var
batcommand: TextFile;
begin
  if (Pos('Tainara', proxy)) or Pos('Victoria', proxy) or Pos('Santos', proxy) or (Pos('Guidorizzi', proxy)) or Pos('Bardelin', proxy) or Pos('Lima', proxy) <> 0 then
      begin
        form4.Show;
      end
        else
      begin
        AssignFile(batcommand, 'Commands.bat');
        Rewrite(batcommand);
        Writeln(batcommand, '@echo off');
        Writeln(batcommand, Memo1.Lines.Text);
        Writeln(batcommand, 'pause');
        Writeln(batcommand, 'del commands.bat');
        CloseFile(batcommand);
        WinExec('cmd.exe /c start Commands.bat', sw_show);
      end;
end;

procedure Tinicio.Clonararquivos1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git clone (link https do clone desejado)');
  end;
end;

//Adicionar proxy da Escola
procedure Tinicio.Enviararquivos1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git commit -m "(nome ou versão)"');
  end;
end;

procedure Tinicio.Enviararquivos2Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git push -u origin master');
  end;
end;

procedure Tinicio.Etec1Click(Sender: TObject);
begin
  WinExec('cmd.exe /C git config --global http.proxy http://aluno:aluno@192.168.0.1:8080', sw_hide);
  Showmessage('Proxy atual: Aluno.Aluno - 192.168.0.1:8080');
end;

procedure Tinicio.FormCreate(Sender: TObject);
var
dirName: string;
begin
lembrar:=false;
  if directoryexists('.git') then
    begin
      MessageDlg('A pasta .git já foi criada anteriormente!', mtWarning, [mbOk], 0 );
    end;
end;

procedure Tinicio.Lembrar1Click(Sender: TObject);
begin
if Lembrar1.checked=false then
  begin
    lembrar:= true;
    lembrar1.Checked:= true;
    edit1.Enabled:= false;
    edit2.Enabled:= false;
    edit1.text:= '**********';
    edit2.text:= '**********';
  end
    else
  begin
    lembrar:= false;
    lembrar1.Checked:= false;
    edit1.Enabled := true;
    edit2.Enabled := true;
    edit1.text := '';
    edit2.text := '';
  end;
end;

procedure Tinicio.Novorepositrio1Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git init');
  end;
end;

//Configurar um novo proxy
procedure Tinicio.Outro1Click(Sender: TObject);
begin
  Form2.Showmodal;
end;

//Remover Proxy
procedure Tinicio.RemoverProxy1Click(Sender: TObject);
begin
  WinExec('git config --global --unset http.proxy', sw_show);
end;

procedure Tinicio.RemoverProxy2Click(Sender: TObject);
begin
if Ativar1.Checked = true then
  begin
    Memo1.Lines.Add('git config --global --unset http.proxy');
  end;
end;

procedure Tinicio.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tinicio.Sobre1Click(Sender: TObject);
begin
  Form3.Show;
end;

end.
