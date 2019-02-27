unit frm_personalExterno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmExterno = class(TForm)
    lblTitulo: TLabel;
    Image1: TImage;
    btnGuardar: TButton;
    Label1: TLabel;
    txtDoc: TEdit;
    txtNombres: TEdit;
    Label2: TLabel;
    txtApellidos: TEdit;
    Label3: TLabel;
    cmbCargo: TComboBox;
    Label4: TLabel;
    cmbLugar: TComboBox;
    Label5: TLabel;
    txtOtroLugar: TEdit;
    Label6: TLabel;
    Button1: TButton;
    procedure cmbLugarChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExterno: TfrmExterno;

implementation

{$R *.fmx}

uses u_externos;

procedure TfrmExterno.btnGuardarClick(Sender: TObject);
begin
  try
    u_externos.ingresarPersonalExterno(txtDoc.Text, txtNombres.Text,
      txtApellidos.Text, cmbCargo.Selected.Text, cmbLugar.Selected.Text,
      txtOtroLugar.Text);
    ShowMessage('Gracias por realizar su registro ' + txtNombres.Text +
      ', su registro es importante para nosotros.' + #13#10 +
      'Gestion Tecnologica de la Sede Ibague - Espinal.');
    frmExterno.Close;
  except
    ShowMessage
      ('Por favor intente de nuevo, sus datos no han sido registrados');
  end;
end;

procedure TfrmExterno.Button1Click(Sender: TObject);
begin
  frmExterno.Close;
end;

procedure TfrmExterno.cmbLugarChange(Sender: TObject);
begin
  if cmbLugar.Selected.Text = 'OTRO' then
  BEGIN
    txtOtroLugar.Enabled := true;
  END
  else
  begin
    txtOtroLugar.Enabled := false;
    txtOtroLugar.Text := '';
  end;

end;

end.
