unit frm_consultas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    txtID: TEdit;
    txtCedula: TEdit;
    btnQryId: TButton;
    btnQryDocumento: TButton;
    Image3: TImage;
    Image4: TImage;
    Button3: TButton;
    procedure btnQryDocumentoClick(Sender: TObject);
    procedure btnQryIdClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses u_ConsultarEstudiante, dmConexion, frm_ingresoSinTip, frm_personalExterno,
  u_externos, u_sinTIP;

procedure TForm1.btnQryIdClick(Sender: TObject);
begin
  try
    u_ConsultarEstudiante.consultarEstudianteId(txtID.Text);
    if dm.qryEstudiante.RecordCount > 0 then
    begin
      u_sinTIP.consultarPersonaCodigo(txtID.Text);
      ShowMessage('Estudiante activo');
      frmPersonalST.ShowModal;
    end
    else
    begin
      ShowMessage('Estudiante Inactivo');
      frmExterno.ShowModal;
    end;
  except
    ShowMessage('Debe ingresar el ID de estudiante');
  end;
end;

procedure TForm1.btnQryDocumentoClick(Sender: TObject);
begin
  try
    u_ConsultarEstudiante.consultarEstudianteCedula(txtCedula.Text);
    if dm.qryEstudiante.RecordCount > 0 then
    begin
      u_sinTIP.consultarPersonaDocumento(txtCedula.Text);
      ShowMessage('Estudiante activo');
      frmPersonalST.ShowModal;
    end
    else
    begin
      ShowMessage('Estudiante Inactivo');
      frmExterno.ShowModal;
    end;
  except
    ShowMessage('Debe ingresar el Documento para ingresar');
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  frmExterno.Show;
end;

end.
