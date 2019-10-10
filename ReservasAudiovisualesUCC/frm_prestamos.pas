unit frm_prestamos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Objects,
  FMX.Layouts;

type
  TfrmPrestamos = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    txtBuscar: TEdit;
    rbCedula: TRadioButton;
    rbCodigo: TRadioButton;
    btnBuscar: TButton;
    GroupBox1: TGroupBox;
    lblNombres: TLabel;
    cmbDispositivos: TComboBox;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure cargarNombres;
    procedure cargarAudiovisuales;
  end;

var
  frmPrestamos: TfrmPrestamos;

implementation

{$R *.fmx}

uses u_prestamos, DataModule;

procedure TfrmPrestamos.btnBuscarClick(Sender: TObject);
begin
  if rbCedula.IsChecked = true then
  begin
    u_prestamos.buscarPersonaCedula(txtBuscar.text);
    cargarNombres;
  end
  else if rbCodigo.IsChecked = true then
  begin
    u_prestamos.buscarPersonaCodigo(txtBuscar.text);
    cargarNombres;
  end;
end;

procedure TfrmPrestamos.cargarAudiovisuales;
begin
  dm.cdsAudiovisuales.Active := true;
  while not dm.cdsAudiovisuales.Eof do
  begin
    cmbDispositivos.Items.Add(dm.cdsAudiovisuales.FieldByName('NOMBRE').AsString
      + ' - Disponibles: ' + dm.cdsAudiovisuales.FieldByName('DISPONIBLES').AsString);
    dm.cdsAudiovisuales.Next;
  end;
  dm.cdsAudiovisuales.Active := false;
end;

procedure TfrmPrestamos.cargarNombres;
begin

  lblNombres.text := 'Nombres: ' + u_prestamos.nombre1 + ' ' +
    u_prestamos.nombre2 + #13#10 + 'Apellidos: ' + u_prestamos.apellido1 + ' ' +
    u_prestamos.apellido2 + #13#10 + 'Cargo: ' + u_prestamos.cargo + #13#10 +
    'Sede: ' + u_prestamos.sede;
end;

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
  cargarNombres;
  cargarAudiovisuales;
end;

procedure TfrmPrestamos.Image1Click(Sender: TObject);
begin
  ListBox1.Items.Add(cmbDispositivos.Selected.Text);
end;

end.
