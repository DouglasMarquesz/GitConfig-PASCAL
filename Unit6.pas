unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  Vcl.AppEvnts;

type
  TForm6 = class(TForm)
    Label9: TLabel;
    RichEdit1: TRichEdit;
    ToolBar1: TToolBar;
    Label8: TLabel;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    RichEdit2: TRichEdit;
    ToolButton9: TToolButton;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Image2: TImage;
    ToolButton1: TToolButton;
    procedure Image5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  Errors: array [0..100] of integer;

implementation

{$R *.dfm}

uses
URLMON, unit1;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja manter as alterações ao GitConfig? ', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
    begin
      inicio.Memo1.Text:= richedit1.Text;
    end;
  inicio.Show;
end;

procedure TForm6.Image5Click(Sender: TObject);
begin
  HlinkNavigateString(nil,'https://tableless.com.br/tudo-que-voce-queria-saber-sobre-git-e-github-mas-tinha-vergonha-de-perguntar/');
end;

procedure TForm6.ToolButton2Click(Sender: TObject);
var
I: integer;
begin
MessageDlg('Funcao em desenvolvimento! evite utilizar... ', mtConfirmation, [mbOk], 0 );
richedit2.Clear;
richedit2.Lines.Add('Linhas que aparentam ter algum erro:');
richedit2.SelStart:= 0;
richedit2.SelLength:= 36;
richedit2.SelAttributes.style:= richedit2.SelAttributes.Style + [fsBold];
  for I := 0 to richedit1.Lines.Count-1 do
    begin
      if Errors[I]<>1 then
        begin
          richedit2.Lines.Add('Erro na linha: '+intToStr(I+1));
        end;
    end;
if richedit2.Lines.Count<2 then
  begin
    richedit2.Lines.Add('Nenhum erro encontrado..');
  end;
end;

procedure TForm6.ToolButton4Click(Sender: TObject);
var
  I: Integer;
  lines: integer;
begin
lines:= 0;
richedit2.Clear;
richedit2.Lines.Add('Linhas que aparentam estar corretas:');
richedit2.SelStart:= 0;
richedit2.SelLength:= 36;
richedit2.SelAttributes.style:= richedit2.SelAttributes.Style + [fsBold];
  for I := 0 to richedit1.Lines.Count do
    begin
       if richedit1.Lines[I]='' then
        begin
          lines:= lines+1;
          richedit1.Lines.Delete(I);
        end;
      if (Pos('git init', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Crie um novo repositório');
          Errors[I]:= 1;
        end;

      if (Pos('git add ', richedit1.Lines[I])) and (Pos('.', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Adicione TODOS os arquivos existentes');
          Errors[I]:= 1;
        end
          else
        begin
          if (Pos('git add ', richedit1.Lines[I])) <> 0 then
            begin
              richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Adicione arquivos especificos ao repositorio');
              Errors[I]:= 1;
            end;
        end;

      if (Pos('git commit', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Defina esse nome como o novo commit');
          Errors[I]:= 1;
        end;

      if (Pos('git push', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Envie tudo para o github');
          Errors[I]:= 1;
        end;

      if (Pos('git remote', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Defina o remote');
          Errors[I]:= 1;
        end;

      if (Pos('git clone', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Clone os arquivos que selecionei');
          Errors[I]:= 1;
        end;

      if (Pos('http.proxy http:', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Defina o proxy de acordo com o que programei');
          Errors[I]:= 1;
        end
          else
        begin
          if (Pos('--unset http.proxy', richedit1.Lines[I])) <> 0 then
            begin
              richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Remova o proxy');
              Errors[I]:= 1;
            end;
        end;

        if (Pos('user.name', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Defina um usario');
          Errors[I]:= 1;
        end;

        if (Pos('user.email', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Defina um email');
          Errors[I]:= 1;
        end;

        if (Pos('git rm', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Remova arquivos especificos');
          Errors[I]:= 1;
        end;

        if (Pos('git diff', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Mostre as diferenças de arquivo que ainda não foram testadas');
          Errors[I]:= 1;
        end;

        if (Pos('git reset', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Destaque o arquivo, mas preserve o conteúdo');
          Errors[I]:= 1;
        end;

        if (Pos('git status', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Liste todos os arquivos que precisam ser confirmados');
          Errors[I]:= 1;
        end;

        if (Pos('git log', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Liste o histórico de versões da ramificação atual');
          Errors[I]:= 1;
        end;

        if (Pos('git show', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Mostre os metadados e as alterações de conteúdo da confirmação especificada');
          Errors[I]:= 1;
        end;

        if (Pos('git brash', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Liste todas as ramificações locais no repositório atual.');
          Errors[I]:= 1;
        end;

        if (Pos('git tag', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Forneceça tags para a confirmação especificada');
          Errors[I]:= 1;
        end;

        if (Pos('git checkout', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Altere de uma ramificação para outra');
          Errors[I]:= 1;
        end;

        if (Pos('git merge', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Mescle o histórico da ramificação especificada na ramificação atual');
          Errors[I]:= 1;
        end;

        if (Pos('git stash', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Armazene temporariamente todos os arquivos rastreados modificados');
          Errors[I]:= 1;
        end;

        if (Pos('echo', richedit1.Lines[I])) or (Pos('pause', richedit1.Lines[I])) or
           (Pos('xcopy', richedit1.Lines[I])) <> 0 then
        begin
          richedit2.Lines.Add('Linha Numero '+intToStr(I+1)+' - Comandos do cmd?');
          Errors[I]:= 1;
        end;
    end;
    if lines<>1 then
      begin
        richedit2.Lines.Add('Linhas em branco removidas: '+intToStr(lines));
      end;

end;

procedure TForm6.ToolButton5Click(Sender: TObject);
begin
  if Savedialog1.Execute then
    begin
      richedit1.Lines.SaveToFile(savedialog1.filename);
      Caption:= 'GitConfig - '+ savedialog1.FileName;
    end;
end;

procedure TForm6.ToolButton9Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      richedit1.Lines.LoadFromFile(opendialog1.FileName);
      caption:= 'GitConfig - '+ opendialog1.FileName;
    end;
end;

end.
