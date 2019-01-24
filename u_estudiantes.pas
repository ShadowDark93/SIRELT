unit u_estudiantes;

interface

procedure agregarEstudiante(CEDULA, NOMBRES, APELLIDOS, ID_UUC,
  ID_FACULTAD: string);

implementation

uses dmConexion;

procedure agregarEstudiante(CEDULA, NOMBRES, APELLIDOS, ID_UUC,
  ID_FACULTAD: string);
begin
  with dm.cdsEstudiantes do
  begin
    Open;
    Insert;
    FieldByName('CEDULA').AsString := CEDULA;
    FieldByName('NOMBRES').AsString := NOMBRES;
    FieldByName('APELLIDOS').AsString := APELLIDOS;
    FieldByName('ID_UCC').AsString := ID_UUC;
    FieldByName('ID_FACULTAD').AsString := ID_FACULTAD;
    ApplyUpdates(3);
    Refresh;
  end;
end;

end.
