unit frm_Estudiantes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  FMX.ListBox, FMX.Edit, Data.Bind.DBScope, FMX.Objects;

type
  TfrmEstudiante = class(TForm)
    lblTitulo: TLabel;
    BindSourceDB1: TBindSourceDB;
    txtIdEstudiante: TEdit;
    BindingsList1: TBindingsList;
    txtNombreEstudiante: TEdit;
    txtApellidoEstudiante: TEdit;
    cmbFacultad: TComboBox;
    txtIdUCC: TEdit;
    lblCedula: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtIdCarnet: TEdit;
    Label1: TLabel;
    Image3: TImage;
    Image2: TImage;
    Image4: TImage;
    Image1: TImage;

    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstudiante: TfrmEstudiante;

implementation

{$R *.fmx}

uses dmConexion;


procedure TfrmEstudiante.Image3Click(Sender: TObject);
begin
  self.Close;
end;

end.
