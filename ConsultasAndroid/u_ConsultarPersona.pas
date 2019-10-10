unit u_ConsultarPersona;

interface

type
  TSingleton = class
  strict private
    class var FInstance: TSingleton;
    constructor Create;
  public
    class function GetInstance: TSingleton;
  end;

var
  documento, tipoDocumento, tipoPersona, nombre1, nombre2, apellido1, apellido2,
    cargo, sede: String;

function consultarPorCedula(cedula: string): boolean;
procedure limpiarVariables;

implementation

uses dmConexion;

procedure limpiarVariables;
begin
  documento := '';
  tipoDocumento := '';
  tipoPersona := '';
  nombre1 := '';
  nombre2 := '';
  apellido1 := '';
  apellido2 := '';
  cargo := '';
  sede := '';
end;

function consultarPorCedula(cedula: string): boolean;
begin
  with dm do
  begin
    cdsPersona.Active := true;
    cdsPersona.close;

    // cdsPersona.Locate('nombre_campo','variable_a_buscar','opciones de busqueda' ) ;
    // variable :=  cdsPersona.Lookup('campodebusqueda','variable o valor a buscar','valor qeu devuelve') ;

    cdsPersona.Filter := '(DOCUMENTO =' + cedula + ')';
    cdsPersona.Filtered := true;
    cdsPersona.Open;
    if dm.cdsPersona.RecordCount > 0 then
    begin
      result := true;
      tipoDocumento := dm.cdsPersonaTIPO_DOCUMENTO.Text;
      tipoPersona := dm.cdsPersonaTIPO_DOCUMENTO.Value;
      nombre1 := dm.cdsPersonaPRIMER_NOMBRE.Value;
      nombre2 := dm.cdsPersonaSEGUNDO_NOMBRE.Value;
      apellido1 := dm.cdsPersonaPRIMER_APELLIDO.Value;
      apellido2 := dm.cdsPersonaSEGUNDO_APELLIDO.Value;
      cargo := dm.cdsPersonaCARGO.Value;
      sede := dm.cdsPersonaSEDE.Value;
    end
    else
    begin
      result := false;
    end;
  end;
end;

constructor TSingleton.Create;
begin
  inherited;
end;

class function TSingleton.GetInstance: TSingleton;
begin
  If FInstance = nil Then
  begin
    FInstance := TSingleton.Create();
  end;
  result := FInstance;
end;

end.
