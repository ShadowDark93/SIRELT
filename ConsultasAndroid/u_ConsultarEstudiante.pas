unit u_ConsultarEstudiante;

interface

procedure consultarEstudianteCedula(cedula: string);
procedure consultarEstudianteId(id: string);

implementation

uses dmConexion;

procedure consultarEstudianteCedula(cedula: string);
begin
  with dm.qryEstudiante do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM ESTUDIANTE WHERE DOCUMENTO =' + cedula);
    ExecSQL;
  end;
end;

procedure consultarEstudianteId(id: string);
begin
  with dm.qryEstudiante do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM ESTUDIANTE WHERE ID_ESTUDIANTE = ' + id);
    ExecSQL;
  end;
end;

end.
