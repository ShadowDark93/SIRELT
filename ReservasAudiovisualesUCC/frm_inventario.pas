unit frm_inventario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.Controls, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Layouts,
  FMX.Bind.Navigator, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.ListBox,
  FMX.Objects;

type
  TfrmInventario = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    tabDesc: TTabItem;
    tabInventario: TTabItem;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    ListBox1: TListBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    tabAddInv: TTabItem;
    EditID_INV: TEdit;
    LabelID_INV: TLabel;
    LinkControlToFieldID_INV: TLinkControlToField;
    EditID_PRODUCTO: TEdit;
    LabelID_PRODUCTO: TLabel;
    LinkControlToFieldID_PRODUCTO: TLinkControlToField;
    EditNOMBRE_PRODUCTO: TEdit;
    LabelNOMBRE_PRODUCTO: TLabel;
    LinkControlToFieldNOMBRE_PRODUCTO: TLinkControlToField;
    MemoDESCRIPCION_PRODUCTO: TMemo;
    LinkControlToFieldDESCRIPCION_PRODUCTO: TLinkControlToField;
    EditSERIAL_INV: TEdit;
    LabelSERIAL_INV: TLabel;
    LinkControlToFieldSERIAL_INV: TLinkControlToField;
    EditCANTIDAD_INV: TEdit;
    LabelCANTIDAD_INV: TLabel;
    LinkControlToFieldCANTIDAD_INV: TLinkControlToField;
    Label2: TLabel;
    cmbProductos: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label3: TLabel;
    txtSerial: TEdit;
    txtCantidad: TEdit;
    Image4: TImage;
    Image5: TImage;
    Label4: TLabel;
    Label5: TLabel;
    tabElementos: TTabItem;
    ListBox2: TListBox;
    BindNavigator1: TBindNavigator;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    EditNOMBRE_PRODUCTO2: TEdit;
    LabelNOMBRE_PRODUCTO2: TLabel;
    LinkControlToFieldNOMBRE_PRODUCTO2: TLinkControlToField;
    EditDESCRIPCION_PRODUCTO: TEdit;
    LabelDESCRIPCION_PRODUCTO: TLabel;
    LinkControlToFieldDESCRIPCION_PRODUCTO2: TLinkControlToField;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure txtCantidadKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    procedure cargarProductos;
    procedure limpiarCampos;
  public
    { Public declarations }
  end;

var
  frmInventario: TfrmInventario;
  cantidad: integer;

implementation

{$R *.fmx}

uses DataModule, u_inventarios;

procedure TfrmInventario.Button1Click(Sender: TObject);
begin
  frmInventario.close;
end;

procedure TfrmInventario.cargarProductos;
begin
  with dm do
  begin
    while not cdsProducto.Eof do
    begin
      cmbProductos.Items.Add(cdsProducto.Fields[1].AsString);
      cdsProducto.next;
    end;
  end;
end;

procedure TfrmInventario.FormCreate(Sender: TObject);
begin
  cargarProductos;
  cantidad := 0;
  txtCantidad.Text := IntToStr(cantidad);
  TabControl1.ActiveTab := tabInventario;
end;

procedure TfrmInventario.Image1Click(Sender: TObject);
begin
  if u_inventarios.cargarInventario(cmbProductos.Selected.Index + 1,
    StrToInt(txtCantidad.Text), txtSerial.Text) = true then
  begin
    ShowMessage('Se ha guardado exitosamente.');
    limpiarCampos;
  end
  else
    ShowMessage
      ('Error al guardar, por favor intente de nuevo o valide la conexion a la red.');
end;

procedure TfrmInventario.Image4Click(Sender: TObject);
begin
  inc(cantidad);
  txtCantidad.Text := IntToStr(cantidad);
end;

procedure TfrmInventario.Image5Click(Sender: TObject);
begin
  if cantidad > 0 then
  begin
    dec(cantidad);
  end
  else
    cantidad := 0;
  txtCantidad.Text := IntToStr(cantidad);
end;

procedure TfrmInventario.limpiarCampos;
begin
  txtSerial.Text := '';
  txtCantidad.Text := '';
  cmbProductos.ItemIndex := 0;
  cantidad := 0;
  dm.cdsProductos.Refresh;
end;

procedure TfrmInventario.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  TabControl1.ActiveTab := tabDesc;

end;

procedure TfrmInventario.txtCantidadKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if not(KeyChar in ['0' .. '9']) then
    KeyChar := #0;

  cantidad := StrToInt(txtCantidad.Text);
end;

end.
