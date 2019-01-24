unit u_estudiante;

interface

procedure ingresarUsuario(cedula: string; nombreEst: string; apellido: string;
  idUCC: string; idFacultad: string; estado: char);

implementation

uses dmConexion;

procedure ingresarUsuario(cedula: string; nombreEst: string; apellido: string;
  idUCC: string; idFacultad: string; estado: char);
begin
  with dm.qryEstudiante do
  begin
    sql.Clear;
    sql.Add('INSERT INTO ESTUDIANTE (CEDULA, NOMBRES, APELLIDOS, ID_UCC, ID_FACULTAD, ESTADO) VALUES ('
      + cedula + ',' + nombreEst + ',' + apellido + ',' + idUCC + ',' +
      idFacultad + ',' + estado + ')');
    ExecSQL;
  end;
end;

end.
