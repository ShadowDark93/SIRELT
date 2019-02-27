unit u_sinTIP;

interface

var
  documento, nombre1, nombre2, apellido1, apellido2: string;

procedure consultarPersonaDocumento(documento: string);
procedure consultarPersonaCodigo(codigo: string);
procedure ingresarRegistriSinTip(motivoST: string);

implementation

uses dmConexion;

procedure consultarPersonaDocumento(documento: string);
begin
  with dm.qryConsultarNombre do
  begin
    Open;
    sql.Clear;
    sql.Add('SELECT * FROM ESTUDIANTE WHERE Documento =' + documento);
    ExecSQL;
    documento := FieldByName('Documento').AsString;
    nombre1 := FieldByName('PRIMER_NOMBRE').AsString;
    nombre2 := FieldByName('SEGUNDO_NOMBRE').AsString;
    apellido1 := FieldByName('PRIMER_APELLIDO').AsString;
    apellido2 := FieldByName('SEGUNDO_APELLIDO').AsString;
  end;
end;

procedure consultarPersonaCodigo(codigo: string);
begin
  with dm.qryConsultarNombre do
  begin
    Open;
    sql.Clear;
    sql.Add('SELECT * FROM ESTUDIANTE WHERE ID_ESTUDIANTE =' + codigo);
    ExecSQL;
    documento := FieldByName('Documento').AsString;
    nombre1 := FieldByName('PRIMER_NOMBRE').AsString;
    nombre2 := FieldByName('SEGUNDO_NOMBRE').AsString;
    apellido1 := FieldByName('PRIMER_APELLIDO').AsString;
    apellido2 := FieldByName('SEGUNDO_APELLIDO').AsString;
  end;
end;

procedure ingresarRegistriSinTip(motivoST: string);
begin
  with dm.qrySinTip do
  begin
    Open;
    sql.Clear;
    sql.Add('INSERT INTO USUARIO_SIN_TIP (ID_ST, MOTIVO_ST) VALUES (:ID_ST, :MOTIVO_ST)');
    Params.ParamByName('ID_ST').Value := documento;
    Params.ParamByName('MOTIVO_ST').Value := motivoST;
    ExecSQL;
  end;
end;

end.
