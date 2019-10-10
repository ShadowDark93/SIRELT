object dm: Tdm
  OldCreateOrder = False
  Height = 410
  Width = 605
  object qryLoggin: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM loggin'
      'WHERE USR =:usr AND PASS =:pwd')
    Left = 40
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usr'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pwd'
        Value = nil
      end>
  end
  object qryIngreso: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO USO_LIBRE_NVO'
      
        '  (NUM_REGISTRO, TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, EQUIP' +
        'O, FECHA_INICIO, HORA_INICIO)'
      'VALUES'
      
        '  (:NUM_REGISTRO, :TIPO_PERSONA, :ID_PERSONA, :PROGRAMA, :SALA, ' +
        ':EQUIPO, :FECHA_INICIO, :HORA_INICIO)')
    SQLDelete.Strings = (
      'DELETE FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO')
    SQLUpdate.Strings = (
      'UPDATE USO_LIBRE_NVO'
      'SET'
      
        '  NUM_REGISTRO = :NUM_REGISTRO, TIPO_PERSONA = :TIPO_PERSONA, ID' +
        '_PERSONA = :ID_PERSONA, PROGRAMA = :PROGRAMA, SALA = :SALA, EQUI' +
        'PO = :EQUIPO, FECHA_INICIO = :FECHA_INICIO, HORA_INICIO = :HORA_' +
        'INICIO, OBSERVACIONES = :OBSERVACIONES, FECHA_SALIDA = :FECHA_SA' +
        'LIDA, HORA_SALIDA = :HORA_SALIDA, DURACION = :DURACION, ESTADO =' +
        ' :ESTADO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO')
    SQLLock.Strings = (
      'SELECT * FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NUM_REGISTRO, TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, E' +
        'QUIPO, FECHA_INICIO, HORA_INICIO, OBSERVACIONES, FECHA_SALIDA, H' +
        'ORA_SALIDA, DURACION, ESTADO FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :NUM_REGISTRO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM USO_LIBRE_NVO')
    Connection = MySQL
    SQL.Strings = (
      '')
    Left = 120
    Top = 120
  end
  object qrySalida: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      '')
    Left = 200
    Top = 120
  end
  object qryConsulta: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      
        'SELECT `TIPO_PERSONA`,`ID_PERSONA`,`PROGRAMA`,`SALA`,`EQUIPO`,`H' +
        'ORA_INICIO` FROM `USO_LIBRE_NVO`'
      'WHERE ESTADO = 1'
      'ORDER BY SALA AND `EQUIPO` ASC ')
    Active = True
    Left = 280
    Top = 120
  end
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
  object qryExportar: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM USO_LIBRE_NVO')
    Left = 280
    Top = 48
  end
  object qryEstudiante: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM PERSONA')
    Left = 120
    Top = 208
  end
  object qryEquipo: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM EQUIPO')
    Active = True
    Left = 200
    Top = 208
  end
  object qrySala: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM SALA')
    Active = True
    Left = 280
    Top = 208
  end
  object qryTiempo: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO USO_LIBRE_NVO'
      
        '  (NUM_REGISTRO, TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, EQUIP' +
        'O, FECHA_INICIO, HORA_INICIO)'
      'VALUES'
      
        '  (:NUM_REGISTRO, :TIPO_PERSONA, :ID_PERSONA, :PROGRAMA, :SALA, ' +
        ':EQUIPO, :FECHA_INICIO, :HORA_INICIO)')
    SQLDelete.Strings = (
      'DELETE FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO')
    SQLUpdate.Strings = (
      'UPDATE USO_LIBRE_NVO'
      'SET'
      
        '  NUM_REGISTRO = :NUM_REGISTRO, TIPO_PERSONA = :TIPO_PERSONA, ID' +
        '_PERSONA = :ID_PERSONA, PROGRAMA = :PROGRAMA, SALA = :SALA, EQUI' +
        'PO = :EQUIPO, FECHA_INICIO = :FECHA_INICIO, HORA_INICIO = :HORA_' +
        'INICIO, OBSERVACIONES = :OBSERVACIONES, FECHA_SALIDA = :FECHA_SA' +
        'LIDA, HORA_SALIDA = :HORA_SALIDA, DURACION = :DURACION, ESTADO =' +
        ' :ESTADO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO')
    SQLLock.Strings = (
      'SELECT * FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NUM_REGISTRO, TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, E' +
        'QUIPO, FECHA_INICIO, HORA_INICIO, OBSERVACIONES, FECHA_SALIDA, H' +
        'ORA_SALIDA, DURACION, ESTADO FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :NUM_REGISTRO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM USO_LIBRE_NVO')
    Connection = MySQL
    SQL.Strings = (
      '')
    Left = 200
    Top = 48
  end
  object prvEstudiantes: TDataSetProvider
    DataSet = qryEstudiante
    Left = 120
    Top = 272
  end
  object cdsEstudiantes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEstudiantes'
    Left = 120
    Top = 328
  end
  object prvEquipos: TDataSetProvider
    DataSet = qryEquipo
    Left = 200
    Top = 272
  end
  object cdsEquipos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEquipos'
    Left = 200
    Top = 328
  end
  object prvSalas: TDataSetProvider
    DataSet = qrySala
    Left = 280
    Top = 272
  end
  object cdsSalas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSalas'
    Left = 280
    Top = 328
  end
end
