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

uses dmConexion, u_sinTIP, frm_consultas;

procedure TfrmPersonalST.Button1Click(Sender: TObject);
var
  motivo: string;
begin
  motivo := cmbMotivoST.Selected.Text;
  try
    u_sinTIP.ingresarRegistriSinTip(motivo);
    ShowMessage('Gracias por su respuesta ' + u_sinTIP.nombre1 + ' ' +
      u_sinTIP.nombre2 + '.' + #13#10 +
      'Recuerda que el uso de la TIP es de uso obligatorio.' + #13#10 +
      'Gestion Tecnologica de la Sede Ibague - Espinal.');
    frmPersonalST.Close;
  except
    ShowMessage('Por favor intente de nuevo');
  end;
end;

procedure TfrmPersonalST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lblNombrePersona.Text := '';
end;

procedure TfrmPersonalST.FormShow(Sender: TObject);
begin
  lblNombrePersona.Text := 'Cuentanos ' + u_sinTIP.nombre1 + ' ' +
    u_sinTIP.nombre2 + ' por que no tienes tu TIP?';
end;

end.
