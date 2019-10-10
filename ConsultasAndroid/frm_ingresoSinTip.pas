unit frm_ingresoSinTip;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Objects;

type
  TfrmPersonalST = class(TForm)
    Image1: TImage;
    cmbMotivoST: TComboBox;
    lblNombrePersona: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPersonalST: TfrmPersonalST;

implementation

{$R *.fmx}

uses dmConexion, u_sinTIP, frm_consultas, frm_Index, u_ConsultarPersona,
  u_consultasReiterativos;

procedure TfrmPersonalST.Button1Click(Sender: TObject);
var
  motivo: string;
begin
  motivo := cmbMotivoST.Selected.Text;
  try
    u_sinTIP.ingresarRegistriSinTip(u_sinTIP.documento, motivo);
    {
      ShowMessage('Gracias por su respuesta ' + u_ConsultarPersona.nombre1 + ' ' +
      u_ConsultarPersona.nombre2 + '.' + #13#10 +
      'Recuerda que el uso de la TIP es de uso obligatorio.' + #13#10 +
      'Gestion Tecnologica de la Sede Ibague - Espinal.');
    }
    u_ConsultarPersona.limpiarVariables;
    frmPersonalST.Close;
    frmIndex.Show;
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    { ShowMessage('Por favor intente de nuevo'); }
  end;
end;

procedure TfrmPersonalST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lblNombrePersona.Text := '';
end;

procedure TfrmPersonalST.FormShow(Sender: TObject);
begin
  lblNombrePersona.Text := 'Nombres: ' + u_ConsultarPersona.nombre1 + ' ' +
    u_ConsultarPersona.nombre2 + #13#10 + 'Apellidos: ' +
    u_ConsultarPersona.apellido1 + ' ' + u_ConsultarPersona.apellido2 + #13#10 +
    'Facultad: ' + u_ConsultarPersona.cargo + ' sede ' + u_ConsultarPersona.sede;
end;

end.
