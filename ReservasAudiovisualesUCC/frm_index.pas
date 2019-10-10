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
    procedure btnInventarioClick(Sender: TObject);
    procedure btnPrestamosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}

uses frm_inventario, frm_prestamos;

procedure TfrmIndex.btnInventarioClick(Sender: TObject);
begin
  if TSingleton.GetInstance <> nil then
  begin
    frmInventario:=TfrmInventario.Create(Application);
    frmInventario.Show;
  end
  else
    frmInventario.Show;
end;

procedure TfrmIndex.btnPrestamosClick(Sender: TObject);
begin
  frmPrestamos := TfrmPrestamos.Create(Application);
  frmPrestamos.ShowModal;
end;

end.
