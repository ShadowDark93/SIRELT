unit u_externos;

interface

uses sysutils;

var
  documento, tipoPersona, nombre1, nombre2, apellido1, apellido2: string;

function ingresarPersonalExterno(documento, lugar_destino,
  dest_opcional: string): boolean;

function registroPersonalExterno(ID_EXTERNO, TIPO_DOCUMENTO, NOMBRE1_EXTERNO,
  NOMBRE2_EXTERNO, APELLIDO1_EXTERNO, APELLIDO2_EXTERNO: string): boolean;

function registrarSalidaExterno(documento: string): boolean;

implementation

uses dmConexion;

function registroPersonalExterno(ID_EXTERNO, TIPO_DOCUMENTO, NOMBRE1_EXTERNO,
  NOMBRE2_EXTERNO, APELLIDO1_EXTERNO, APELLIDO2_EXTERNO: string): boolean;
begin
  try
    with dm do
    begin
      cdsPersona.Active := true;
      cdsPersona.Open;
      cdsPersona.Append;
      cdsPersonaDOCUMENTO.Value := StrToInt(ID_EXTERNO);
      cdsPersonaTIPO_DOCUMENTO.Value := TIPO_DOCUMENTO;
      cdsPersonaTIPO_PERSONA.Value := '5';
      cdsPersonaPRIMER_NOMBRE.Value := NOMBRE1_EXTERNO;
      cdsPersonaSEGUNDO_NOMBRE.Value := NOMBRE2_EXTERNO;
      cdsPersonaPRIMER_APELLIDO.Value := APELLIDO1_EXTERNO;
      cdsPersonaSEGUNDO_APELLIDO.Value := APELLIDO2_EXTERNO;
      cdsPersona.Post;
      cdsPersona.ApplyUpdates(3);
      cdsPersona.Close;
      cdsPersona.Active := false;
      result := true;
    end;
  except
    result := false;
  end;
end;

function ingresarPersonalExterno(documento, lugar_destino,
  dest_opcional: string): boolean;
begin
  try
    with dm do
    begin
      cdsExt.Active := true;
      cdsExt.Open;
      cdsExt.Append;
      cdsExtDOCUMENTO_PERSONA.Value := StrToInt(documento);
      cdsExtLUGAR_DESTINO_EXT.Value := lugar_destino;
      cdsExtLUGAR_DEST_OPC.Value := dest_opcional;
      cdsExtESTADO_EXTERNO.Value := '1';
      cdsExt.Post;
      cdsExt.ApplyUpdates(3);
      cdsExt.Close;
      cdsExt.Active := false;
      result := true;
    end;
  except
    result := false;
  end;
end;

function registrarSalidaExterno(documento: string): boolean;
begin
  try
    with dm do
    begin
      cdsExt.Active := true;
      cdsExt.Open;
      cdsExt.Filter := 'ESTADO_EXTERNO=1 AND DOCUMENTO_PERSONA =' + documento;
      cdsExt.Filtered := true;
      if cdsExt.RecordCount > 0 then
      begin
        cdsExt.Edit;
        cdsExtESTADO_EXTERNO.Value := '0';
        cdsExt.Post;
        cdsExt.ApplyUpdates(3);
        cdsExt.Close;
        cdsExt.Active := false;
        result := true;
        cdsExt.Filtered := false;
      end
      else
      begin
        result := false;
        cdsExt.Close;
        cdsExt.Filtered := false;
        cdsExt.Active := false;
      end;
    end;
  except
    result := false;
  end;
end;

end.
