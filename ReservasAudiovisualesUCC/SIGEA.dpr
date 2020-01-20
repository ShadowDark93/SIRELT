program SIGEA;

uses
  System.StartUpCopy,
  FMX.Forms,
  frm_index in 'frm_index.pas' {frmIndex},
  frm_inventario in 'frm_inventario.pas' {frmInventario},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  frm_prestamos in 'frm_prestamos.pas' {frmPrestamos},
  u_prestamos in 'u_prestamos.pas',
  frm_reservas in 'frm_reservas.pas' {frmReservas},
  u_inventarios in 'u_inventarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
