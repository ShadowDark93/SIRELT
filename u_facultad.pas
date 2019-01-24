unit u_facultad;

interface

procedure agregarFacultad(nombreFac: string);

procedure buscarFacultad(nombreFacultad: string);

implementation

uses dmConexion;

procedure agregarFacultad(nombreFac: string);
begin
  with dm.cdsFacultad do
  begin
    Open;
    Insert;
    FieldByName('NOMBRE_FAC').AsString := nombreFac;
    FieldByName('ESTADO').AsString := '1';
    Post;
    ApplyUpdates(3);
  end;
end;

procedure buscarFacultad(nombreFacultad: string);
begin
  with dm.qryFacultad do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM FACULTAD WHERE NOMBRE_FAC like:nombreFac');
    Params.ParamByName('nombreFac').Value := nombreFacultad;
    ExecSQL;
  end;
end;

end.
