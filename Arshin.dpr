program Arshin;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form3},
  ArshinLoader in 'ArshinLoader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
