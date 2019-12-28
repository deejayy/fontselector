unit fsunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Edit1: TEdit;
    Panel4: TPanel;
    ListBox1: TListBox;
    Splitter2: TSplitter;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var fontname: string;

{$R *.dfm}


function EnumFONTSProc(var EnumLogFont: TEnumLogFont; var TextMetric: TNewTextMetric; FontType:
  Integer; Data: LPARAM): Integer; stdcall;
begin
  fontname := StrPas(EnumLogFont.elfFullName);
  result := 1;
end;

procedure RefreshFontInfo;
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    EnumFontFamilies(DC, nil, @EnumFONTSProc, 0);
  finally
    ReleaseDC(0, DC);
  end;
end;

function getlastfont: string;
begin
  RefreshFontInfo;
  result := fontname;
end;

procedure changefont(filename: string);
begin
  AddFontResourceEx(pchar(filename), FR_PRIVATE, nil);
  GetLastFont;
end;

function draw(canvas: tcanvas; x: integer; var y: integer; size: integer; s: string): integer;
var k: string;
    h: integer;
begin
  k := inttostr(size);
  selectobject(canvas.Handle, createfont(-12, 0, 0, 0, 0, 0, 0, 0, 0, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, 5, FF_DONTCARE, pansichar(getlastfont)));
  textout(canvas.Handle, x, y, pansichar(k), length(k));

  selectobject(canvas.Handle, createfont(-size, 0, 0, 0, 0, 0, 0, 0, 0, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, 5, FF_DONTCARE, pansichar(getlastfont)));
  textout(canvas.Handle, x+40, y, pansichar(s), length(s));
  h := canvas.TextHeight(s);

  canvas.MoveTo(x, y+h+2);
  canvas.LineTo(canvas.ClipRect.Right, y+h+2);

  y := y + h + 5;
  result := y;
end;

procedure TForm1.FormCreate(Sender: TObject);
var ts: tsearchrec;
    i: integer;
begin
  findfirst( '.\*.ttf', $3F, ts );
  repeat
    ListBox1.items.add( ts.Name );
    i := findnext( ts );
  until i <> 0;
  findfirst( '.\*.otf', $3F, ts );
  repeat
    ListBox1.items.add( ts.Name );
    i := findnext( ts );
  until i <> 0;
  Listbox1.Sorted := true;
  Listbox1.ItemIndex := 0;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var h, i: integer;
begin
  changefont(ListBox1.Items[ListBox1.itemindex]);
  Image1.Picture := nil;
  h := 0;
  form1.Caption := 'Font Selector: ' + getlastfont;
  draw(Image1.Canvas, 0, h, 30, getlastfont);
  draw(Image1.Canvas, 0, h, 12, 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii11111111111');
  draw(Image1.Canvas, 0, h, 12, 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm88888888888');
  for i := 0 to memo1.Lines.Count-1 do begin
    draw(Image1.Canvas, 0, h, strtoint(memo1.Lines[i]), edit1.Text);
    Image1.Refresh;
  end;
  RemoveFontResourceEx(pansichar(ListBox1.Items[ListBox1.itemindex]), FR_PRIVATE, nil);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   listbox1.SetFocus;
   ListBox1Click(sender);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    Button1Click(sender);
    close;
  end;
end;

procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #32 then begin
    Memo2.Lines.Add(listbox1.Items[listbox1.itemindex]);
    SendMessage(listbox1.Handle, WM_KEYDOWN, VK_DOWN, 0);
  end;
  Button1.Caption := format('Copy (%d)', [memo2.Lines.Count]);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo2.SelectAll;
  memo2.CopyToClipboard;
end;

end.

