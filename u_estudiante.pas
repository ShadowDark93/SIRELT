unit u_estudiante;

interface

procedure ingresarUsuario(cedula: integer; nombre: string; apellido: string;
  idUCC: integer; idFacultad: integer; estado: char);

implementation

uses dmConexion;

procedure ingresarUsuario(cedula: integer; nombre: string; apellido: string;
  idUCC: integer; idFacultad: integer; estado: char);
begin
  with dm.qryEstudiante do
  begin
    sql.Clear;
    sql.Add('INSERT INTO ESTUDIANTE (CEDULA, NOMBRES, APELLIDOS, ID_UCC, ID_FACULTAD, ESTADO) VALUES ('
      + cedula + ',' + nombre + ',' + apellido + ',' + idUCC + ',' + idFacultad
      + ',' + estado + ')');
    ExecSQL;
  end;
end;

end.
