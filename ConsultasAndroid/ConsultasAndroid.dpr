program ConsultasAndroid;

uses
  System.StartUpCopy,
  FMX.Forms,
  frm_consultas in 'frm_consultas.pas' {Form1},
  u_ConsultarEstudiante in 'u_ConsultarEstudiante.pas',
  dmConexion in 'dmConexion.pas' {dm: TDataModule},
  frm_ingresoSinTip in 'frm_ingresoSinTip.pas' {frmPersonalST},
  frm_personalExterno in 'frm_personalExterno.pas' {frmExterno},
  u_externos in 'u_externos.pas',
  u_sinTIP in 'u_sinTIP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPersonalST, frmPersonalST);
  Application.CreateForm(TfrmExterno, frmExterno);
  Application.Run;
end.
