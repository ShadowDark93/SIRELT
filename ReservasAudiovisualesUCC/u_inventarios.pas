unit u_inventarios;

interface

uses System.SysUtils;

function cargarInventario(idProducto, cantidad: integer;
  serial: string): boolean;


implementation

uses DataModule;

var
  flag: integer;

function cargarInventario(idProducto, cantidad: integer;
  serial: string): boolean;
begin
  with dm do
  begin
    flag := 0;
    cdsInventario.Open;
    cdsInventario.Append;
    cdsInventarioID_PRODUCTO.Value := idProducto;
    cdsInventarioCANTIDAD_INV.Value := inttostr(cantidad);
    cdsInventarioSERIAL_INV.Value := serial;
    cdsInventario.Post;
    cdsInventario.ApplyUpdates(3);
    cdsInventario.Close;
    flag := 1;
    if flag = 1 then
    begin
      result := true;
    end
    else
      result := false;
  end;
end;


end.
