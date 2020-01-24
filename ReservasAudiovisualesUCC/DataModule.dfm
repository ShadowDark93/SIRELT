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
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 240
    Top = 32
  end
  object qryReservas: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM RESERVA')
    Left = 392
    Top = 96
  end
  object prvReservas: TDataSetProvider
    DataSet = qryReservas
    Left = 392
    Top = 160
  end
  object cdsReservas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReservas'
    Left = 392
    Top = 224
  end
  object qryInternos: TUniQuery
    Connection = conexion
    SQL.Strings = (
      
        'SELECT i.ID_PERSONA, p.TIPO_DOCUMENTO,  p.PRIMER_APELLIDO, p.SEG' +
        'UNDO_APELLIDO, p.PRIMER_NOMBRE, '
      
        'p.SEGUNDO_NOMBRE, i.ID_INTERNO, tp.DESC_TIPO_PERSONA, i.CARGO_IN' +
        'TERNO, i.SEDE_INTERNO'
      
        'FROM PERSONA p INNER JOIN PERSONAL_INTERNO i INNER JOIN TIPO_PER' +
        'SONA tp ON p.DOCUMENTO = i.ID_PERSONA AND tp.ID_TIPO = i.ID_TIPO' +
        '_PERSONA'
      'WHERE i.ID_PERSONA = 1104706314')
    Left = 480
    Top = 96
  end
  object prvInternos: TDataSetProvider
    DataSet = qryInternos
    Left = 480
    Top = 160
  end
  object qryProductos: TUniQuery
    Connection = conexion
    SQL.Strings = (
      
        'SELECT i.ID_INV, i.ID_PRODUCTO, p.NOMBRE_PRODUCTO, p.DESCRIPCION' +
        '_PRODUCTO, i.SERIAL_INV, i.CANTIDAD_INV '
      
        'FROM INVENTARIOS i INNER JOIN PRODUCTOS p ON i.ID_PRODUCTO=p.ID_' +
        'PRODUCTO')
    Left = 48
    Top = 96
  end
  object prvProductos: TDataSetProvider
    DataSet = qryProductos
    Left = 48
    Top = 160
  end
  object cdsProductos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProductos'
    Left = 48
    Top = 224
    object cdsProductosID_INV: TIntegerField
      FieldName = 'ID_INV'
    end
    object cdsProductosID_PRODUCTO: TIntegerField
      FieldName = 'ID_PRODUCTO'
      Required = True
    end
    object cdsProductosNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      ReadOnly = True
      Required = True
      Size = 150
    end
    object cdsProductosDESCRIPCION_PRODUCTO: TStringField
      FieldName = 'DESCRIPCION_PRODUCTO'
      ReadOnly = True
      Required = True
      Size = 450
    end
    object cdsProductosSERIAL_INV: TStringField
      FieldName = 'SERIAL_INV'
      Required = True
      Size = 45
    end
    object cdsProductosCANTIDAD_INV: TStringField
      FieldName = 'CANTIDAD_INV'
      FixedChar = True
      Size = 4
    end
  end
  object qryProducto: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM PRODUCTOS')
    Left = 136
    Top = 96
  end
  object prvProducto: TDataSetProvider
    DataSet = qryProducto
    Left = 136
    Top = 160
  end
  object cdsProducto: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_PRODUCTO'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE_PRODUCTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 150
      end
      item
        Name = 'DESCRIPCION_PRODUCTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 450
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    ProviderName = 'prvProducto'
    StoreDefs = True
    Left = 136
    Top = 224
  end
  object qryExternos: TUniQuery
    Connection = conexion
    SQL.Strings = (
      
        'SELECT e.ID_PERSONA_EXTERNA, p.TIPO_DOCUMENTO, tp.DESC_TIPO_PERS' +
        'ONA, p.PRIMER_APELLIDO, '
      'p.SEGUNDO_APELLIDO, p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE'
      
        'FROM PERSONA p INNER JOIN PERSONAL_EXTERNO e INNER JOIN TIPO_PER' +
        'SONA tp '
      
        'ON p.DOCUMENTO = e.ID_PERSONA_EXTERNA AND tp.ID_TIPO = e.ID_TIPO' +
        '_PERSONA')
    Left = 552
    Top = 96
  end
  object prvExternos: TDataSetProvider
    DataSet = qryExternos
    Left = 552
    Top = 160
  end
  object cdsExternos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_PERSONA_EXTERNA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TIPO_DOCUMENTO'
        Attributes = [faReadonly, faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESC_TIPO_PERSONA'
        Attributes = [faReadonly, faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'PRIMER_APELLIDO'
        Attributes = [faReadonly, faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SEGUNDO_APELLIDO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRIMER_NOMBRE'
        Attributes = [faReadonly, faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SEGUNDO_NOMBRE'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvExternos'
    StoreDefs = True
    Left = 552
    Top = 224
    object cdsExternosID_PERSONA_EXTERNA: TIntegerField
      FieldName = 'ID_PERSONA_EXTERNA'
      Required = True
    end
    object cdsExternosTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      ReadOnly = True
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsExternosDESC_TIPO_PERSONA: TStringField
      FieldName = 'DESC_TIPO_PERSONA'
      ReadOnly = True
      Required = True
      Size = 45
    end
    object cdsExternosPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      ReadOnly = True
      Required = True
      Size = 255
    end
    object cdsExternosSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      ReadOnly = True
      Size = 255
    end
    object cdsExternosPRIMER_NOMBRE: TStringField
      FieldName = 'PRIMER_NOMBRE'
      ReadOnly = True
      Required = True
      Size = 255
    end
    object cdsExternosSEGUNDO_NOMBRE: TStringField
      FieldName = 'SEGUNDO_NOMBRE'
      ReadOnly = True
      Size = 255
    end
  end
  object cdsInternos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvInternos'
    Left = 480
    Top = 224
    object cdsInternosID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Required = True
    end
    object cdsInternosTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      ReadOnly = True
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsInternosPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      ReadOnly = True
      Required = True
      Size = 255
    end
    object cdsInternosSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      ReadOnly = True
      Size = 255
    end
    object cdsInternosPRIMER_NOMBRE: TStringField
      FieldName = 'PRIMER_NOMBRE'
      ReadOnly = True
      Required = True
      Size = 255
    end
    object cdsInternosSEGUNDO_NOMBRE: TStringField
      FieldName = 'SEGUNDO_NOMBRE'
      ReadOnly = True
      Size = 255
    end
    object cdsInternosID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
    end
    object cdsInternosDESC_TIPO_PERSONA: TStringField
      FieldName = 'DESC_TIPO_PERSONA'
      ReadOnly = True
      Required = True
      Size = 45
    end
    object cdsInternosCARGO_INTERNO: TStringField
      FieldName = 'CARGO_INTERNO'
      Size = 45
    end
    object cdsInternosSEDE_INTERNO: TStringField
      FieldName = 'SEDE_INTERNO'
      Size = 25
    end
  end
  object qryPrestamos: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM PRESTAMO')
    Left = 304
    Top = 96
  end
  object prvPrestamos: TDataSetProvider
    DataSet = qryPrestamos
    Left = 304
    Top = 160
  end
  object cdsPrestamos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPrestamos'
    Left = 304
    Top = 224
    object cdsPrestamosID_PRESTAMO: TIntegerField
      FieldName = 'ID_PRESTAMO'
    end
    object cdsPrestamosID_PERSONA: TIntegerField
      FieldName = 'ID_PERSONA'
      Required = True
    end
    object cdsPrestamosID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
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
  object qryInventario: TUniQuery
    Connection = conexion
    SQL.Strings = (
      'SELECT * FROM INVENTARIOS')
    Left = 224
    Top = 96
  end
  object prvInventario: TDataSetProvider
    DataSet = qryInventario
    Left = 224
    Top = 160
  end
  object cdsInventario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvInventario'
    Left = 224
    Top = 224
    object cdsInventarioID_INV: TIntegerField
      FieldName = 'ID_INV'
    end
    object cdsInventarioID_PRODUCTO: TIntegerField
      FieldName = 'ID_PRODUCTO'
      Required = True
    end
    object cdsInventarioSERIAL_INV: TStringField
      FieldName = 'SERIAL_INV'
      Required = True
      Size = 45
    end
    object cdsInventarioCANTIDAD_INV: TStringField
      FieldName = 'CANTIDAD_INV'
      FixedChar = True
      Size = 4
    end
  end
end
