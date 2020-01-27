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
  FMX.ListView, System.ImageList, FMX.ImgList, FMX.Bind.Grid, Data.Bind.Grid,
  Data.Bind.Controls, FMX.Bind.Navigator;

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
    EditID_PRESTAMO: TEdit;
    LabelID_PRESTAMO: TLabel;
    LinkControlToFieldID_PRESTAMO: TLinkControlToField;
    EditID_PERSONA: TEdit;
    LabelID_PERSONA: TLabel;
    LinkControlToFieldID_PERSONA: TLinkControlToField;
    EditID_RESERVA: TEdit;
    LabelID_RESERVA: TLabel;
    LinkControlToFieldID_RESERVA: TLinkControlToField;
    EditID_AUDIOVISUAL: TEdit;
    LabelID_AUDIOVISUAL: TLabel;
    LinkControlToFieldID_AUDIOVISUAL: TLinkControlToField;
    EditTIMESTAMP_PRESTAMO: TEdit;
    LabelTIMESTAMP_PRESTAMO: TLabel;
    LinkControlToFieldTIMESTAMP_PRESTAMO: TLinkControlToField;
    EditLUGAR_PRESTAMO: TEdit;
    LabelLUGAR_PRESTAMO: TLabel;
    LinkControlToFieldLUGAR_PRESTAMO: TLinkControlToField;
    EditOBSERVACIONES_PRESTAMO: TEdit;
    LabelOBSERVACIONES_PRESTAMO: TLabel;
    LinkControlToFieldOBSERVACIONES_PRESTAMO: TLinkControlToField;
    BindNavigator1: TBindNavigator;
    EditOBSERVACIONES_ENTREGA: TEdit;
    LabelOBSERVACIONES_ENTREGA: TLabel;
    LinkControlToFieldOBSERVACIONES_ENTREGA: TLinkControlToField;
    Image2: TImage;
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
    procedure Image2Click(Sender: TObject);
    procedure lvPrestamosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure TabItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure cargarNombres;
    procedure filtrarPrestamosActivos;
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

procedure TfrmPrestamos.filtrarPrestamosActivos;
begin
  with dm.cdsPrestamos do
  begin
    Refresh;
    Filtered := false;
    Filter := 'ESTADO_PRESTAMO=1';
    Filtered := true;
  end;
end;

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
end;

procedure TfrmPrestamos.Image1Click(Sender: TObject);
begin
  dm.cdsPrestamos.ApplyUpdates(3);
  dm.cdsPrestamos.Refresh;
  ShowMessage('Se han registrado los elementos de prestamo correctamente.');
end;

procedure TfrmPrestamos.Image2Click(Sender: TObject);
begin
  with dm do
  begin
    cdsPrestamos.Edit;
    cdsPrestamos.FieldByName('OBSERVACIONES_ENTREGA').Value :=
      EditOBSERVACIONES_ENTREGA.text;
    cdsPrestamos.FieldByName('ESTADO_PRESTAMO').Value := '0';
    cdsPrestamos.post;
    cdsPrestamos.ApplyUpdates(3);
    ShowMessage('Se ha registrado la entrega correctamente.');
    tabPrestamosActivos.ActiveTab := tabPrestAct;
    filtrarPrestamosActivos;
  end;
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
    cdsPrestamos.post;
  end;
end;

procedure TfrmPrestamos.lbPrestamosActivosItemClick(const Sender
  : TCustomListBox; const Item: TListBoxItem);
begin
  tabPrestamosActivos.ActiveTab := tabDetPrestamo;
end;

procedure TfrmPrestamos.lvPrestamosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
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

procedure TfrmPrestamos.TabItem1Click(Sender: TObject);
begin
  dm.cdsPrestamos.Filtered := false;
end;

procedure TfrmPrestamos.TabItem2Click(Sender: TObject);
begin
  filtrarPrestamosActivos;
  tabPrestamosActivos.ActiveTab := tabPrestAct;
end;

procedure TfrmPrestamos.tabPrestActClick(Sender: TObject);
begin
  dm.cdsPrestamos.Refresh;
end;

end.
