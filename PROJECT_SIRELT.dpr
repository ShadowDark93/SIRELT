program PROJECT_SIRELT;

uses
  System.StartUpCopy,
  FMX.Forms,
  u_Loggin in 'u_Loggin.pas' {frmLoggin},
  u_Index in 'u_Index.pas' {frmIndex},
  dmConexion in 'dmConexion.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLoggin, frmLoggin);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
