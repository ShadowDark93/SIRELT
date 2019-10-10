unit u_consultasReiterativos;

interface

function buscarReiterativos(idPersona: string): Integer;

var
  cantidad: Integer;

implementation

uses dmConexion;

function buscarReiterativos(idPersona: string): Integer;
begin
  with dm.qryConsultaReiterativos do
  begin
    Active := true;
    Params.ParamByName('id').AsString := idPersona;
    Execute;
    cantidad := Fields[0].AsInteger;
    result := cantidad;
  end;
end;

end.
