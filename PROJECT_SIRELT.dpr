program PROJECT_SIRELT;

uses
  System.StartUpCopy,
  FMX.Forms,
  u_Loggin in 'u_Loggin.pas' {frmLoggin},
  u_Index in 'u_Index.pas' {frmIndex},
  dmConexion in 'dmConexion.pas' {dm: TDataModule},
  u_ExcelExport in 'u_ExcelExport.pas' {frmExport},
  u_estudiante in 'u_estudiante.pas',
  Unit1 in 'Unit1.pas' {Form1},
  u_facultad in 'u_facultad.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLoggin, frmLoggin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
