unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, System.JSON, ArshinLoader;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  ArshinLoader: TArshinLoader;
  VerificationData: TJSONObject;
begin
  Memo1.Clear; // Очистить Memo перед выводом
  ArshinLoader := TArshinLoader.Create;
  try
    try
      VerificationData := ArshinLoader.GetVerificationData(StrToInt(LabeledEdit1.Text), LabeledEdit2.Text);
      try
        // Вывод данных в TMemo
        Memo1.Lines.Add('Данные поверки:');
        Memo1.Lines.Add(VerificationData.ToString);
      finally
        VerificationData.Free;
      end;
    except
      on E: Exception do
        Memo1.Lines.Add('Ошибка: ' + E.Message);
    end;
  finally
    ArshinLoader.Free;
  end;
end;

end.
