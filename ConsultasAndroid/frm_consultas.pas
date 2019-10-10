unit frm_consultas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.ListBox;

type
  TfrmConsultasUCC = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    txtCedula: TEdit;
    Image3: TImage;
    GridPanelLayout2: TGridPanelLayout;
    btnEntrada: TButton;
    btnSalida: TButton;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    procedure btnExternoClick(Sender: TObject);
    procedure txtCedulaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnEntradaClick(Sender: TObject);
    procedure btnSalidaClick(Sender: TObject);
  private
    procedure buscarPorCedula;
  public
    { Public declarations }
  end;

var
  frmConsultasUCC: TfrmConsultasUCC;
  intentos, int: integer;

implementation

{$R *.fmx}

uses u_ConsultarPersona, dmConexion, frm_ingresoSinTip, frm_personalExterno,
  u_externos, u_sinTIP, frm_Index, u_consultasReiterativos;

procedure TfrmConsultasUCC.btnSalidaClick(Sender: TObject);
begin
  // se realiza la salida de la persona por cedula

  if u_sinTIP.registrarSalidaPersona(txtCedula.Text) = true then
  begin
    {
      ShowMessage('Gracias por su respuesta ' + u_ConsultarPersona.nombre1 + ' ' +
      u_ConsultarPersona.nombre2 + '.' + #13#10 +
      'Recuerda que el uso de la TIP es de uso obligatorio.' + #13#10 +
      'Gestion Tecnologica de la Sede Ibague - Espinal.');
    }
    txtCedula.Text := '';
    frmConsultasUCC.Close;
    frmIndex.Show;
  end
  else if u_sinTIP.registrarSalidaPersona(txtCedula.Text) = false then
    ShowMessage('No tiene entradas existentes actualmente.');
  if int = 1 then
  begin
    frmConsultasUCC.Close;
    int := 0;

  end
  else
    inc(int);

end;

procedure TfrmConsultasUCC.btnEntradaClick(Sender: TObject);
begin
  buscarPorCedula;
end;

procedure TfrmConsultasUCC.btnExternoClick(Sender: TObject);
begin
  frmExterno.Show;
end;

procedure TfrmConsultasUCC.txtCedulaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if KeyChar = #13 then
  begin
    buscarPorCedula;
  end;
end;

procedure TfrmConsultasUCC.buscarPorCedula;
begin
  if u_ConsultarPersona.consultarPorCedula(txtCedula.Text) = true then
  begin
    frmpersonalst.Show;
    if u_consultasReiterativos.buscarReiterativos(txtCedula.Text) > 4 then
    begin
      ShowMessage('La cantidad de ingresos sin carnet son ' +
        IntToStr(u_consultasReiterativos.cantidad));
    end;
    u_sinTIP.documento := txtCedula.Text;
    txtCedula.Text := '';
    frmConsultasUCC.Close;

  end
  else if u_ConsultarPersona.consultarPorCedula(txtCedula.Text) = false then
  begin
    ShowMessage('Por favor valide su numero de documento');
    inc(intentos);
    if intentos = 2 then
    begin
      frmExterno.Show;
      intentos := 0;
      txtCedula.Text := '';
      self.Close;
    end;
  end;
end;

end.
