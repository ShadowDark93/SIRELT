unit frm_Salas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  FMX.Layouts, FMX.Bind.Navigator, Data.Bind.Grid, FMX.ScrollBox, FMX.Grid,
  Data.Bind.DBScope, FMX.Edit, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Math.Vectors, FMX.Controls3D, FMX.Objects3D;

type
  TfrmSalas = class(TForm)
    Label1: TLabel;
    Image3: TImage;
    Image2: TImage;
    Image4: TImage;
    Image1: TImage;
    txtDesc: TEdit;
    LabelNOMBRE: TLabel;
    BindSourceDB1: TBindSourceDB;
    StringGridBindSourceDB1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    Label2: TLabel;
    Label3: TLabel;
    Grid3D1: TGrid3D;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalas: TfrmSalas;

implementation

{$R *.fmx}

uses dmConexion, u_salas;

procedure TfrmSalas.Image1Click(Sender: TObject);
begin
  txtDesc.Text := '';
  dm.cdsSalas.Refresh;
  dm.cdsSalas.Append;
  txtDesc.IsFocused;
end;

procedure TfrmSalas.Image2Click(Sender: TObject);
var
  numSala: string;
begin
  try
    numSala := InputBox('Consultar Sala Existente',
      'Ingrese el numero de la sala', '');
    u_salas.consultarSala(numSala);
    if dm.qrySala.RecordCount > 0 then
    begin
      ShowMessage('La sala se ha registrado correctamente');
    end
    else
    begin
      ShowMessage('La sala no ha sido registrada');
    end;
  except
    ShowMessage('Error, por favor intente de nuevo');
  end;
end;

procedure TfrmSalas.Image3Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmSalas.Image4Click(Sender: TObject);
begin
  try
    if txtDesc.Text = '' then
    begin
      ShowMessage('Se debe ingresar una descripcion de la sala');
      txtDesc.IsFocused;
    end
    else
    begin
      u_salas.agregarSala(txtDesc.Text);
      ShowMessage('La sala se ha guardado correctamente');
    end;
  Except
    ShowMessage('Error al guardar, por favor intente de nuevo');
  end;
end;

end.
