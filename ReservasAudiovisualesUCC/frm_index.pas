unit frm_index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmIndex = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    btnInventario: TButton;
    GridPanelLayout1: TGridPanelLayout;
    btnPrestamos: TButton;
    btnReservas: TButton;
    procedure btnPrestamosClick(Sender: TObject);
    procedure btnReservasClick(Sender: TObject);
    procedure btnInventarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}

uses frm_inventario, frm_prestamos, frm_reservas;

procedure TfrmIndex.btnInventarioClick(Sender: TObject);
begin
  if frmInventario = nil then
  begin
    frmInventario := TfrmInventario.Create(Application);
    frmInventario.Show;
  end
  else
  begin
    frmInventario.Show;
  end;
end;

procedure TfrmIndex.btnPrestamosClick(Sender: TObject);
begin
  frmPrestamos := TfrmPrestamos.Create(Application);
  frmPrestamos.Show;
end;

procedure TfrmIndex.btnReservasClick(Sender: TObject);
begin
  if frmReservas <> nil then
  begin
    frmReservas := TfrmReservas.Create(Application);
    frmReservas.Show;
  end
  else
    frmReservas.Show;
end;

end.
