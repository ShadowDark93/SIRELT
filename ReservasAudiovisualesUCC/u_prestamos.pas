unit u_prestamos;

interface

var
  cedula, tipo_doc, apellido1, apellido2, nombre1, nombre2, codigo,
    tipo_persona, cargo, sede: string;
  // Prestamos
  prCedula, prNombre1, prNombre2, prApellido1, prApellido2: string;

procedure buscarInterno(cedula: string);
procedure buscarExterno(cedula: string);
procedure cargarInventarioPrestamo(idProducto: string);

implementation

uses DataModule;

procedure buscarInterno(cedula: string);
begin
  with dm do
  begin
    cdsInternos.Active := true;
    cdsInternos.Filter := 'ID_PERSONA= ' + cedula;
    cdsInternos.Filtered := true;
    cedula := cdsInternosID_PERSONA.AsString;
    tipo_doc := cdsInternosTIPO_DOCUMENTO.AsString;
    apellido1 := cdsInternosPRIMER_APELLIDO.AsString;
    apellido2 := cdsInternosSEGUNDO_APELLIDO.AsString;
    nombre1 := cdsInternosPRIMER_NOMBRE.AsString;
    nombre2 := cdsInternosSEGUNDO_NOMBRE.AsString;
    codigo := cdsInternosID_INTERNO.AsString;
    tipo_persona := cdsInternosDESC_TIPO_PERSONA.AsString;
    cargo := cdsInternosCARGO_INTERNO.AsString;
    sede := cdsInternosSEDE_INTERNO.AsString;
  end;
end;

procedure buscarExterno(cedula: string);
begin
  with dm do
  begin
    cdsExternos.Active := true;
    cdsExternos.Filter := 'ID_PERSONA_EXTERNA= ' + cedula;
    cdsExternos.Filtered := true;
    cedula := cdsExternosID_PERSONA_EXTERNA.AsString;
    tipo_doc := cdsExternosTIPO_DOCUMENTO.AsString;
    tipo_persona := cdsExternosDESC_TIPO_PERSONA.AsString;
    apellido1 := cdsExternosPRIMER_APELLIDO.AsString;
    apellido2 := cdsExternosSEGUNDO_APELLIDO.AsString;
    nombre1 := cdsExternosPRIMER_NOMBRE.AsString;
    nombre2 := cdsExternosSEGUNDO_NOMBRE.AsString;

  end;
end;

procedure cargarInventarioPrestamo(idProducto: string);
begin

end;

end.
