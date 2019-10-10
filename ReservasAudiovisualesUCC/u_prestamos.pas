unit u_prestamos;

interface

type
  TSingleton = class
  private
    constructor create;
  public
    class function GetInstance: TSingleton;
    procedure crearInstancia;
  strict private
    class var FInstance: TSingleton;
  end;

procedure buscarPersonaCedula(id: string);
procedure buscarPersonaCodigo(cod: string);

var
  cedula, codigo, nombre1, nombre2, apellido1, apellido2, cargo, sede: string;
  _instancia: TSingleton;

implementation

uses DataModule;

procedure buscarPersonaCedula(id: string);
begin
  with dm.cdsPersonas do
  begin
    Active := true;
    Filter := 'DOCUMENTO= ' + id;
    Filtered := true;
    cedula := dm.cdsPersonasDOCUMENTO.asstring;
    codigo := dm.cdsPersonasID_INTERNO.asstring;
    nombre1 := dm.cdsPersonasPRIMER_NOMBRE.asstring;
    nombre2 := dm.cdsPersonasSEGUNDO_NOMBRE.asstring;
    apellido1 := dm.cdsPersonasPRIMER_APELLIDO.asstring;
    apellido2 := dm.cdsPersonasSEGUNDO_APELLIDO.asstring;
    cargo := dm.cdsPersonasCARGO.asstring;
    sede := dm.cdsPersonasSEDE.asstring;
  end;
end;

procedure buscarPersonaCodigo(cod: string);
begin
  with dm.cdsPersonas do
  begin
    Active := true;
    Filter := 'ID_INTERNO= ' + cod;
    Filtered := true;
    cedula := dm.cdsPersonasDOCUMENTO.asstring;
    codigo := dm.cdsPersonasID_INTERNO.asstring;
    nombre1 := dm.cdsPersonasPRIMER_NOMBRE.asstring;
    nombre2 := dm.cdsPersonasSEGUNDO_NOMBRE.asstring;
    apellido1 := dm.cdsPersonasPRIMER_APELLIDO.asstring;
    apellido2 := dm.cdsPersonasSEGUNDO_APELLIDO.asstring;
    cargo := dm.cdsPersonasCARGO.asstring;
    sede := dm.cdsPersonasSEDE.asstring;
  end;
end;

{ TSingleton }

procedure TSingleton.crearInstancia;

begin
  inherited;

end;

constructor TSingleton.create;
begin

end;

class function TSingleton.GetInstance: TSingleton;
begin
  if _instancia = nil then
  _instancia:=TSingleton.create;
  Result:=_instancia;
end;

initialization

_instancia := nil;

finalization

if _instancia <> nil then
  _instancia.Free;

end.
