unit frm_personalExterno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.VirtualKeyboard, System.math, FMX.platform,
  FMX.Effects, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox, FMX.Types, FMX.Controls,
  FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TfrmExterno = class(TForm)
    lblTitulo: TLabel;
    Image1: TImage;
    btnGuardar: TButton;
    Label1: TLabel;
    txtDoc: TEdit;
    txtNombre1: TEdit;
    Label2: TLabel;
    txtApellido1: TEdit;
    Label3: TLabel;
    cmbLugar: TComboBox;
    Label5: TLabel;
    txtOtroLugar: TEdit;
    Label6: TLabel;
    cmbTipoDocumento: TComboBox;
    Label4: TLabel;
    txtNombre2: TEdit;
    Label7: TLabel;
    txtApellido2: TEdit;
    lbla2: TLabel;
    VertScrollBox1: TVertScrollBox;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    ShadowEffect1: TShadowEffect;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    Image2: TImage;
    procedure cmbLugarChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure txtDocExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormFocusChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
    FService1: IFMXVirtualKeyboardToolbarService;
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
  public
    { Public declarations }
    procedure limpiarCampos;
    procedure inhabilitarCampos;
    procedure habilitarCampos;
    procedure validarIngreso;
  end;

var
  frmExterno: TfrmExterno;
  bandera: Boolean;

implementation

{$R *.fmx}

uses u_externos, dmConexion, frm_ingresoSinTip, frm_Index, u_ConsultarPersona;

procedure TfrmExterno.btnGuardarClick(Sender: TObject);
begin
  try
    if bandera = true then
    begin
      validarIngreso;
    end
    else
    begin
      if u_externos.registroPersonalExterno(txtDoc.Text,
        cmbTipoDocumento.Selected.Text, txtNombre1.Text, txtNombre2.Text,
        txtApellido1.Text, txtApellido2.Text) = true then
      begin
        validarIngreso;
      end
      else
      begin
        ShowMessage
          ('Por favor intente de nuevo, sus datos no han sido registrados');
      end;
    end;

  except
    ShowMessage
      ('Por favor intente de nuevo, sus datos no han sido registrados');
  end;
end;

procedure TfrmExterno.Button1Click(Sender: TObject);
begin
  try
    if u_externos.registrarSalidaExterno(txtDoc.Text) = true then
    begin
      ShowMessage('Gracias por su visita.' + #13#10 +
        'Gestion Tecnologica de la Sede Ibague - Espinal.');
      limpiarCampos;
      frmIndex.Show;
      Self.close;
    end;
  except
    ShowMessage('Error de conexion, por favor intente de nuevo');
  end;
end;

procedure TfrmExterno.CalcContentBoundsProc(Sender: TObject;
  var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
      2 * ClientHeight - FKBBounds.Top);
  end;
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

procedure TfrmExterno.FormCreate(Sender: TObject);
begin
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXVirtualKeyboardToolbarService, IInterface(FService1)) then
  begin
    FService1.SetToolbarEnabled(true);
    FService1.SetHideKeyboardButtonVisibility(true);
  end;
  VertScrollBox1.OnCalcContentBounds := CalcContentBoundsProc;
end;

procedure TfrmExterno.FormFocusChanged(Sender: TObject);
begin
  UpdateKBBounds;
end;

procedure TfrmExterno.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := false;
  RestorePosition;
end;

procedure TfrmExterno.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

procedure TfrmExterno.habilitarCampos;
begin
  txtNombre1.Enabled := true;
  txtNombre2.Enabled := true;
  txtApellido1.Enabled := true;
  txtApellido2.Enabled := true;
  cmbTipoDocumento.Enabled := true;
end;

procedure TfrmExterno.Image2Click(Sender: TObject);
begin
  limpiarCampos;
end;

procedure TfrmExterno.inhabilitarCampos;
begin
  txtNombre1.Enabled := false;
  txtNombre2.Enabled := false;
  txtApellido1.Enabled := false;
  txtApellido2.Enabled := false;
  cmbTipoDocumento.Enabled := false;
end;

procedure TfrmExterno.limpiarCampos;
begin
  txtDoc.Text := '';
  txtNombre1.Text := '';
  txtNombre2.Text := '';
  txtApellido1.Text := '';
  txtApellido2.Text := '';
  cmbLugar.ItemIndex := 0;
  cmbTipoDocumento.ItemIndex := 0;
  txtOtroLugar.Text := '';
  txtDoc.Enabled := true;
  txtNombre1.Enabled := true;
  txtNombre2.Enabled := true;
  txtApellido1.Enabled := true;
  txtApellido2.Enabled := true;
  cmbLugar.Enabled := true;
  cmbTipoDocumento.ItemIndex := -1;
  cmbTipoDocumento.Enabled := true;
end;

procedure TfrmExterno.RestorePosition;
begin
  VertScrollBox1.ViewportPosition :=
    PointF(VertScrollBox1.ViewportPosition.X, 0);

  VertScrollBox1.RealignContent;
end;

procedure TfrmExterno.txtDocExit(Sender: TObject);
begin
  try
    if u_ConsultarPersona.consultarPorCedula(txtDoc.Text) = true then
    begin
      txtNombre1.Text := u_ConsultarPersona.nombre1;
      txtNombre2.Text := u_ConsultarPersona.nombre2;
      txtApellido1.Text := u_ConsultarPersona.apellido1;
      txtApellido2.Text := u_ConsultarPersona.apellido2;
      inhabilitarCampos;
      bandera := true;
      if u_ConsultarPersona.tipoDocumento = 'TI' then
      begin
        cmbTipoDocumento.ItemIndex := 0;
      end
      else if u_ConsultarPersona.tipoDocumento = 'CC' then
      begin
        cmbTipoDocumento.ItemIndex := 1;
      end
      else if u_ConsultarPersona.tipoDocumento = 'CE' then
      begin
        cmbTipoDocumento.ItemIndex := 2;
      end;
    end
    else if u_ConsultarPersona.consultarPorCedula(txtDoc.Text) = false then
    begin
      habilitarCampos;
      bandera := false;
    end;

  except
    ShowMessage
      ('Error en la validacion del usuario, por favor verifique la conexión.');
  end;
end;

procedure TfrmExterno.UpdateKBBounds;
var
  LFocused: TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := false;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox1.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
      (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := true;
      VertScrollBox1.RealignContent;
      Application.ProcessMessages;
      VertScrollBox1.ViewportPosition :=
        PointF(VertScrollBox1.ViewportPosition.X,
        LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

procedure TfrmExterno.validarIngreso;
begin
  if u_externos.ingresarPersonalExterno(txtDoc.Text, cmbLugar.Selected.Text,
    txtOtroLugar.Text) = true then
  begin
    ShowMessage('Gracias por realizar su registro ' + txtNombre1.Text + ' ' +
      txtNombre2.Text + ', su registro es importante para nosotros.' + #13#10 +
      'Gestion Tecnologica de la Sede Ibague - Espinal.');
    limpiarCampos;
    Self.close;
  end
  else
  begin
    ShowMessage
      ('Error al registrar el ingreso, por favor verifique su conexión e intente de nuevo.');
  end;
end;

end.
