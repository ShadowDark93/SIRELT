unit u_salas;

interface

procedure agregarSala(descripcionSala: string);
procedure consultarSala(numSala: string);

implementation

uses dmConexion;

procedure agregarSala(descripcionSala: string);
begin
  with dm.cdsSalas do
  begin
    Open;
    Insert;
    FieldByName('DESCRIPCION').AsString := descripcionSala;
    FieldByName('ESTADO').AsString := '1';
    ApplyUpdates(1);
    Refresh;
  end;
end;

procedure consultarSala(numSala: string);
begin
  with dm.qrySala do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM SALA WHERE ID_SALA =:numSala AND ESTADO = 1');
    Params.ParamByName('ID_SALA').Value := numSala;
    ExecSQL;
  end;
end;

end.
