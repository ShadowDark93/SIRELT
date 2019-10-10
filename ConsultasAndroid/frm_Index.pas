unit frm_Index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit;

type
  TfrmIndex = class(TForm)
    Image1: TImage;
    GridPanelLayout2: TGridPanelLayout;
    btnUCC: TButton;
    btnExterno: TButton;
    GroupBox1: TGroupBox;
    rdBloque3: TRadioButton;
    rdBloque4: TRadioButton;
    rdBloque5: TRadioButton;
    procedure btnExternoClick(Sender: TObject);
    procedure btnUCCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function validarBloque(): boolean;
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}

uses frm_personalExterno, frm_consultas, dmConexion, u_consultasReiterativos,
  u_sinTIP;

procedure TfrmIndex.btnExternoClick(Sender: TObject);
begin
  if validarBloque = true then
  begin
    frmExterno.show;
  end;
end;

procedure TfrmIndex.btnUCCClick(Sender: TObject);
begin
  if validarBloque = true then
  begin
    frmConsultasucc.Label1.Text :=
      'REGISTRO DE ESTUDIANTES, PROFESORES Y ADMINISTRATIVOS UCC';
    frmConsultasucc.show;
  end;
end;

procedure TfrmIndex.FormShow(Sender: TObject);
begin
  dm.MySQL.Connected := false;
  dm.MySQL.Connected := true;
end;

function TfrmIndex.validarBloque: boolean;
begin
  if (rdBloque3.IsChecked = false) and (rdBloque4.IsChecked = false) and
    (rdBloque5.IsChecked = false) then
  begin
    ShowMessage('Debe seleccionar un bloque');
    result := false;
  end
  else
    result := true;
  if rdBloque3.IsChecked then
  begin
    u_sinTIP.bloque := '3';
  end
  else if rdBloque4.IsChecked then
  begin
    u_sinTIP.bloque := '4';
  end
  else if rdBloque5.IsChecked then
  begin
    u_sinTIP.bloque := '5';
  end;
end;

end.
