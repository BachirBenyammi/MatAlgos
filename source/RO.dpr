program RO;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  UFerTrans in 'UFerTrans.pas' {FrmTrans};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
