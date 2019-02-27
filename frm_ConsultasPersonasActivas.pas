unit frm_ConsultasPersonasActivas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects;

type
  TfrmConsultaPersonasActivas = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    txtID: TEdit;
    txtCedula: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image3: TImage;
    Image4: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPersonasActivas: TfrmConsultaPersonasActivas;

implementation

{$R *.fmx}

uses u_ConsultarEstudiante, dmConexion;

procedure TfrmConsultaPersonasActivas.Button1Click(Sender: TObject);
begin
  u_ConsultarEstudiante.consultarEstudianteId(txtID.Text);
  if dm.qryEstudiante.RecordCount > 0 then
  begin
    ShowMessage('Estudiante activo');
  end
  else
    ShowMessage('Estudiante Inactivo');
end;

procedure TfrmConsultaPersonasActivas.Button2Click(Sender: TObject);
begin
  u_ConsultarEstudiante.consultarEstudianteCedula(txtCedula.Text);
  if dm.qryEstudiante.RecordCount > 0 then
  begin
    ShowMessage('Estudiante activo');
  end
  else
    ShowMessage('Estudiante Inactivo');

end;

end.
