program PROJECT_SIRELT;

uses
  System.StartUpCopy,
  FMX.Forms,
  u_Loggin in 'u_Loggin.pas' {frmLoggin},
  u_Index in 'u_Index.pas' {frmIndex},
  dmConexion in 'dmConexion.pas' {dm: TDataModule},
  u_ExcelExport in 'u_ExcelExport.pas' {frmExport},
  u_salas in 'u_salas.pas',
  frm_Salas in 'frm_Salas.pas' {frmSalas},
  u_estudiantes in 'u_estudiantes.pas',
  frm_Estudiantes in 'frm_Estudiantes.pas' {frmEstudiante},
  frm_ConsultasPersonasActivas in 'frm_ConsultasPersonasActivas.pas' {frmConsultaPersonasActivas},
  u_ConsultarEstudiante in 'u_ConsultarEstudiante.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLoggin, frmLoggin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.CreateForm(TfrmSalas, frmSalas);
  Application.CreateForm(TfrmEstudiante, frmEstudiante);
  Application.CreateForm(TfrmConsultaPersonasActivas, frmConsultaPersonasActivas);
  Application.Run;
end.
