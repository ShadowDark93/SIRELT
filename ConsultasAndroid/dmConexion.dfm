object dm: Tdm
  OldCreateOrder = False
  Height = 410
  Width = 682
  object MySQL: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'salas'
    Username = 'salas'
    Server = '10.42.1.7'
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 48
    EncryptedPassword = '8CFF9EFF93FF9EFF8CFF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 40
    Top = 48
  end
  object qryPersona: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM PERSONA')
    Left = 304
    Top = 136
  end
  object qryConsultarNombre: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM PERSONA')
    Left = 48
    Top = 128
  end
  object prvPersna: TDataSetProvider
    DataSet = qryPersona
    Left = 304
    Top = 200
  end
  object prvNombres: TDataSetProvider
    DataSet = qryConsultarNombre
    Left = 48
    Top = 192
  end
  object cdsPersona: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPersna'
    Left = 304
    Top = 272
    object cdsPersonaDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Required = True
    end
    object cdsPersonaTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Size = 2
    end
    object cdsPersonaTIPO_PERSONA: TStringField
      FieldName = 'TIPO_PERSONA'
      FixedChar = True
      Size = 1
    end
    object cdsPersonaID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
    end
    object cdsPersonaRFID: TStringField
      FieldName = 'RFID'
      Size = 10
    end
    object cdsPersonaPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Required = True
      Size = 255
    end
    object cdsPersonaSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 255
    end
    object cdsPersonaPRIMER_NOMBRE: TStringField
      FieldName = 'PRIMER_NOMBRE'
      Required = True
      Size = 255
    end
    object cdsPersonaSEGUNDO_NOMBRE: TStringField
      FieldName = 'SEGUNDO_NOMBRE'
      Size = 255
    end
    object cdsPersonaCARGO: TStringField
      FieldName = 'CARGO'
      Size = 255
    end
    object cdsPersonaSEDE: TStringField
      FieldName = 'SEDE'
      Size = 25
    end
  end
  object cdsNombres: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNombres'
    Left = 48
    Top = 264
    object cdsNombresPRIMER_NOMBRE: TStringField
      FieldName = 'PRIMER_NOMBRE'
      Required = True
      Size = 255
    end
    object cdsNombresSEGUNDO_NOMBRE: TStringField
      FieldName = 'SEGUNDO_NOMBRE'
      Size = 255
    end
    object cdsNombresPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Required = True
      Size = 255
    end
    object cdsNombresSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 255
    end
    object cdsNombresDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Required = True
    end
    object cdsNombresTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Size = 2
    end
    object cdsNombresTIPO_PERSONA: TStringField
      FieldName = 'TIPO_PERSONA'
      FixedChar = True
      Size = 1
    end
    object cdsNombresID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
    end
  end
  object qryST: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM USUARIO_SIN_TIP')
    Left = 408
    Top = 136
  end
  object prvST: TDataSetProvider
    DataSet = qryST
    Left = 408
    Top = 200
  end
  object cdsST: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvST'
    Left = 408
    Top = 272
    object cdsSTID_ST: TIntegerField
      FieldName = 'ID_ST'
      Required = True
    end
    object cdsSTMOTIVO_ST: TStringField
      FieldName = 'MOTIVO_ST'
      Required = True
      Size = 250
    end
    object cdsSTESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsSTBLOQUE: TStringField
      FieldName = 'BLOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryExt: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM USUARIO_EXTERNO')
    Left = 192
    Top = 136
  end
  object cdsExt: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvExt'
    Left = 192
    Top = 272
    object cdsExtDOCUMENTO_PERSONA: TIntegerField
      FieldName = 'DOCUMENTO_PERSONA'
      Required = True
    end
    object cdsExtLUGAR_DESTINO_EXT: TStringField
      FieldName = 'LUGAR_DESTINO_EXT'
      Size = 45
    end
    object cdsExtLUGAR_DEST_OPC: TStringField
      FieldName = 'LUGAR_DEST_OPC'
      Size = 45
    end
    object cdsExtESTADO_EXTERNO: TStringField
      FieldName = 'ESTADO_EXTERNO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object prvExt: TDataSetProvider
    DataSet = qryExt
    Left = 192
    Top = 200
  end
  object qryConsultaReiterativos: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT COUNT(*) AS C FROM USUARIO_SIN_TIP'
      
        'WHERE TIMESTAMP_INGRESO BETWEEN '#39'2019-09-17 1%'#39' AND NOW() AND ID' +
        '_ST = :id')
    Left = 560
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        Value = nil
      end>
  end
end
