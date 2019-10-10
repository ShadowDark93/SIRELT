program ConsultasAndroid;

uses
  System.StartUpCopy,
  FMX.Forms,
  frm_consultas in 'frm_consultas.pas' {frmConsultasUCC},
  u_ConsultarPersona in 'u_ConsultarPersona.pas',
  dmConexion in 'dmConexion.pas' {dm: TDataModule},
  frm_ingresoSinTip in 'frm_ingresoSinTip.pas' {frmPersonalST},
  frm_personalExterno in 'frm_personalExterno.pas' {frmExterno},
  u_externos in 'u_externos.pas',
  u_sinTIP in 'u_sinTIP.pas',
  frm_Index in 'frm_Index.pas' {frmIndex},
  u_consultasReiterativos in 'u_consultasReiterativos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.CreateForm(TfrmConsultasUCC, frmConsultasUCC);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPersonalST, frmPersonalST);
  Application.CreateForm(TfrmExterno, frmExterno);
  Application.Run;
end.
