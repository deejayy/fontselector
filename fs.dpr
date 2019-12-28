program fs;

uses
  Forms,
  fsunit in 'fsunit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Font Selector';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
