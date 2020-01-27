unit frm_prestamos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Objects,
  FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.ImageList, FMX.ImgList, FMX.Bind.Grid, Data.Bind.Grid;

type
  TfrmPrestamos = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    txtBuscar: TEdit;
    rbInterno: TRadioButton;
    btnBuscar: TButton;
    GroupBox1: TGroupBox;
    lblNombres: TLabel;
    Panel1: TPanel;
    rbExterno: TRadioButton;
    Panel2: TPanel;
    tabPrestamosActivos: TTabControl;
    tabPrestAct: TTabItem;
    tabDetPrestamo: TTabItem;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    lvProductos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkFillControlToField: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    txtIdInventario: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    txtLugarPrestamo: TEdit;
    txtObservacionesPrestamo: TEdit;
    GridPanelLayout1: TGridPanelLayout;
    lvPrestamos: TListView;
    LinkListControlToField2: TLinkListControlToField;
    procedure btnBuscarClick(Sender: TObject);
    procedure lbPrestamosActivosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure lvProductosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure TabItem2Click(Sender: TObject);
    procedure tabPrestActClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure cargarNombres;
  end;

var
  frmPrestamos: TfrmPrestamos;

implementation

{$R *.fmx}

uses u_prestamos, DataModule, u_inventarios;

procedure TfrmPrestamos.btnBuscarClick(Sender: TObject);
begin
  // limpiar campos
  u_prestamos.cedula := '';
  u_prestamos.nombre1 := '';
  u_prestamos.nombre2 := '';
  u_prestamos.apellido1 := '';
  u_prestamos.apellido2 := '';
  u_prestamos.cargo := '';
  u_prestamos.sede := '';

  if rbInterno.IsChecked = true then
  begin
    u_prestamos.buscarInterno(txtBuscar.text);
    cargarNombres;
  end
  else if rbExterno.IsChecked = true then
  begin
    u_prestamos.buscarExterno(txtBuscar.text);
    cargarNombres;
  end;
end;

procedure TfrmPrestamos.cargarNombres;
begin
  // llena los datos desde la bd
  lblNombres.text := 'Nombres: ' + u_prestamos.nombre1 + ' ' +
    u_prestamos.nombre2 + #13#10 + 'Apellidos: ' + u_prestamos.apellido1 + ' ' +
    u_prestamos.apellido2 + #13#10 + 'Cargo: ' + u_prestamos.cargo + #13#10 +
    'Sede: ' + u_prestamos.sede;
end;

procedure TfrmPrestamos.Image1Click(Sender: TObject);
begin
  dm.cdsPrestamos.ApplyUpdates(3);
  dm.cdsPrestamos.Refresh;
end;

procedure TfrmPrestamos.Image3Click(Sender: TObject);
begin
  with dm.cdsPrestamos do
  begin
    cancel;
    close;
    open;
  end;

end;

procedure TfrmPrestamos.Image4Click(Sender: TObject);
begin
  // LLENAR EL DATASET DE LA TABLA DE PRESTAMOS..CADA CAMPO CON
  // DE LA VISTA..
  with dm do
  begin
    cdsPrestamos.append;
    cdsPrestamos.FieldByName('ID_AUDIOVISUAL').Value := txtIdInventario.text;
    cdsPrestamos.FieldByName('ID_PERSONA').Value := txtBuscar.text;
    cdsPrestamos.FieldByName('LUGAR_PRESTAMO').Value := txtLugarPrestamo.text;
    cdsPrestamos.FieldByName('OBSERVACIONES_PRESTAMO').Value :=
      txtLugarPrestamo.text;
    cdsPrestamos.Post;
  end;
end;

procedure TfrmPrestamos.lbPrestamosActivosItemClick(const Sender
  : TCustomListBox; const Item: TListBoxItem);
begin
  tabPrestamosActivos.ActiveTab := tabDetPrestamo;
end;

procedure TfrmPrestamos.lvProductosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if txtLugarPrestamo.text = '' then
  begin
    ShowMessage('Debe ingresar un lugar de destino');
  end
  else if txtObservacionesPrestamo.text = '' then
    ShowMessage('Debe tener una observación del prestamo');
end;

procedure TfrmPrestamos.TabItem2Click(Sender: TObject);
begin
  with dm.cdsPrestamos do
  begin
    Refresh;
    Filtered := false;
    Filter := 'ESTADO_PRESTAMO=1';
    Filtered := true;
  end;
end;

procedure TfrmPrestamos.tabPrestActClick(Sender: TObject);
begin
  dm.cdsPrestamos.Refresh;
end;

end.
