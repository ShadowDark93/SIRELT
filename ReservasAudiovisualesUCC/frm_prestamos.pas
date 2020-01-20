unit frm_prestamos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Objects,
  FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

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
    Image2: TImage;
    rbExterno: TRadioButton;
    Panel2: TPanel;
    lbProductos: TListBox;
    lbDescripcion: TListBox;
    tabPrestamosActivos: TTabControl;
    tabPrestAct: TTabItem;
    tabDetPrestamo: TTabItem;
    lbPrestamosActivos: TListBox;
    Panel3: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    procedure btnBuscarClick(Sender: TObject);
    procedure lbPrestamosActivosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure lbProductosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure cargarNombres;
    procedure cargarProductos;
    procedure cargarElementos;
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

procedure TfrmPrestamos.cargarElementos;
begin
  with dm do
  begin
    while not cdsInventario.Eof do
    begin
      lbDescripcion.Items.Add('Serial: ' + cdsInventario.Fields[2].asstring +
        ' Disponibles: ' + cdsInventario.Fields[3].asstring);
      cdsInventario.Next;
    end;
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

procedure TfrmPrestamos.cargarProductos;
begin
  with dm do
  begin
    while not cdsProducto.Eof do
    begin
      lbProductos.Items.Add(cdsProducto.Fields[1].asstring);
      cdsProducto.Next;
    end;
  end;
end;

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
  cargarNombres;
  cargarProductos;
end;

procedure TfrmPrestamos.FormShow(Sender: TObject);
begin
  cargarNombres;
  cargarProductos;
end;

procedure TfrmPrestamos.lbPrestamosActivosItemClick(const Sender
  : TCustomListBox; const Item: TListBoxItem);
begin
  tabPrestamosActivos.ActiveTab := tabDetPrestamo;
end;

procedure TfrmPrestamos.lbProductosItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  u_prestamos.cargarInventarioPrestamo(IntToStr(lbProductos.ItemIndex + 1));
  lbDescripcion.Items.Clear;
  cargarElementos;
end;

end.
