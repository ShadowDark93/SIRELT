object dm: Tdm
  OldCreateOrder = False
  Height = 458
  Width = 761
  object conexion: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'salas'
    Username = 'salas'
    Server = '10.42.1.7'
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
    EncryptedPassword = '8CFF9EFF93FF9EFF8CFF'
  end
  object qryAudiovisuales: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM AUDIOVISUALES')
    Left = 48
    Top = 88
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 696
    Top = 24
  end
  object qryPrestamos: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM PRESTAMO')
    Left = 136
    Top = 88
  end
  object qryReservas: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM RESERVA')
    Left = 224
    Top = 88
  end
  object prvAudiovisuales: TDataSetProvider
    DataSet = qryAudiovisuales
    Left = 48
    Top = 152
  end
  object prvPrestamos: TDataSetProvider
    DataSet = qryPrestamos
    Left = 136
    Top = 152
  end
  object prvReservas: TDataSetProvider
    DataSet = qryReservas
    Left = 224
    Top = 152
  end
  object cdsAudiovisuales: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAudiovisuales'
    Left = 48
    Top = 216
    object cdsAudiovisualesID_AUDIOVISUAL: TIntegerField
      FieldName = 'ID_AUDIOVISUAL'
    end
    object cdsAudiovisualesNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 70
    end
    object cdsAudiovisualesDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 250
    end
    object cdsAudiovisualesSERIAL: TStringField
      FieldName = 'SERIAL'
      Size = 50
    end
    object cdsAudiovisualesCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Required = True
    end
    object cdsAudiovisualesDISPONIBLES: TIntegerField
      FieldName = 'DISPONIBLES'
      Required = True
    end
  end
  object cdsPrestamos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPrestamos'
    Left = 136
    Top = 216
    object cdsPrestamosID_PRESTAMO: TIntegerField
      FieldName = 'ID_PRESTAMO'
    end
    object cdsPrestamosID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Required = True
    end
    object cdsPrestamosID_AUDIOVISUAL: TIntegerField
      FieldName = 'ID_AUDIOVISUAL'
      Required = True
    end
    object cdsPrestamosTIMESTAMP_PRESTAMO: TDateTimeField
      FieldName = 'TIMESTAMP_PRESTAMO'
    end
    object cdsPrestamosLUGAR_PRESTAMO: TStringField
      FieldName = 'LUGAR_PRESTAMO'
      Required = True
      Size = 45
    end
    object cdsPrestamosOBSERVACIONES_PRESTAMO: TStringField
      FieldName = 'OBSERVACIONES_PRESTAMO'
      Size = 250
    end
    object cdsPrestamosTIMESTAMP_ENTREGA: TDateTimeField
      FieldName = 'TIMESTAMP_ENTREGA'
    end
    object cdsPrestamosOBSERVACIONES_ENTREGA: TStringField
      FieldName = 'OBSERVACIONES_ENTREGA'
      Size = 250
    end
    object cdsPrestamosESTADO_PRESTAMO: TStringField
      FieldName = 'ESTADO_PRESTAMO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsReservas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReservas'
    Left = 224
    Top = 216
    object cdsReservasID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
    end
    object cdsReservasID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Required = True
    end
    object cdsReservasID_AUDIOVISUAL: TIntegerField
      FieldName = 'ID_AUDIOVISUAL'
      Required = True
    end
    object cdsReservasFECHA_RESERVA: TDateField
      FieldName = 'FECHA_RESERVA'
      Required = True
    end
    object cdsReservasHORA_RESERVA: TTimeField
      FieldName = 'HORA_RESERVA'
      Required = True
    end
    object cdsReservasLUGAR_RESERVA: TStringField
      FieldName = 'LUGAR_RESERVA'
      Required = True
      Size = 50
    end
    object cdsReservasOBSERVACIONES_RESERVA: TStringField
      FieldName = 'OBSERVACIONES_RESERVA'
      Size = 250
    end
    object cdsReservasESTADO_RESERVA: TStringField
      FieldName = 'ESTADO_RESERVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryPersona: TUniQuery
    Connection = conexion
    SQL.Strings = (
      
        'SELECT p.`DOCUMENTO`, p.`ID_INTERNO`, p.`PRIMER_NOMBRE`, p.`SEGU' +
        'NDO_NOMBRE`, p.`PRIMER_APELLIDO`, p.`SEGUNDO_APELLIDO`, p.`CARGO' +
        '`, p.`SEDE` FROM PERSONA p')
    Left = 312
    Top = 88
  end
  object prvPersonas: TDataSetProvider
    DataSet = qryPersona
    Left = 312
    Top = 152
  end
  object cdsPersonas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPersonas'
    Left = 312
    Top = 216
    object cdsPersonasDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Required = True
    end
    object cdsPersonasID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
    end
    object cdsPersonasPRIMER_NOMBRE: TStringField
      FieldName = 'PRIMER_NOMBRE'
      Size = 255
    end
    object cdsPersonasSEGUNDO_NOMBRE: TStringField
      FieldName = 'SEGUNDO_NOMBRE'
      Size = 255
    end
    object cdsPersonasPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 255
    end
    object cdsPersonasSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 255
    end
    object cdsPersonasCARGO: TStringField
      FieldName = 'CARGO'
      Size = 255
    end
    object cdsPersonasSEDE: TStringField
      FieldName = 'SEDE'
      Size = 25
    end
  end
end
