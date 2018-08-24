object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 367
  Width = 699
  object qryLoggin: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM loggin'
      'WHERE USR =:usr AND PASS =:pwd')
    Left = 40
    Top = 176
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
    Top = 176
  end
  object qrySalida: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO USO_LIBRE_NVO'
      
        '  (NUM_REGISTRO, TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, EQUIP' +
        'O, FECHA_INICIO, HORA_INICIO, OBSERVACIONES, FECHA_SALIDA, HORA_' +
        'SALIDA, DURACION, ESTADO)'
      'VALUES'
      
        '  (:NUM_REGISTRO, :TIPO_PERSONA, :ID_PERSONA, :PROGRAMA, :SALA, ' +
        ':EQUIPO, :FECHA_INICIO, :HORA_INICIO, :OBSERVACIONES, :FECHA_SAL' +
        'IDA, :HORA_SALIDA, :DURACION, :ESTADO)')
    SQLDelete.Strings = (
      'DELETE FROM USO_LIBRE_NVO'
      'WHERE'
      '  NUM_REGISTRO = :Old_NUM_REGISTRO')
    SQLUpdate.Strings = (
      'UPDATE USO_LIBRE_NVO'
      'SET'
      
        'OBSERVACIONES = :OBSERVACIONES, FECHA_SALIDA = :FECHA_SALIDA, HO' +
        'RA_SALIDA = :HORA_SALIDA, DURACION = :DURACION, ESTADO = :ESTADO'
      'WHERE'
      '  ESTADO = 1')
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
      'UPDATE USO_LIBRE_NVO'
      'SET'
      
        'OBSERVACIONES = :OBSERVACIONES, FECHA_SALIDA = :FECHA_SALIDA, HO' +
        'RA_SALIDA = :HORA_SALIDA, ESTADO = :ESTADO'
      'WHERE ID_PERSONA =:ID AND ESTADO = 1')
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OBSERVACIONES'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_SALIDA'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'HORA_SALIDA'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
  object qryConsulta: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      
        'SELECT `TIPO_PERSONA`,`ID_PERSONA`,`PROGRAMA`,`SALA`,`EQUIPO`,`H' +
        'ORA_INICIO` FROM `USO_LIBRE_NVO`'
      'WHERE ESTADO = 1'
      'ORDER BY SALA AND `EQUIPO` ASC ')
    Left = 272
    Top = 176
  end
  object MySQL: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'salas'
    Username = 'salas'
    Server = '10.42.1.7'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 112
    EncryptedPassword = '8CFF9EFF93FF9EFF8CFF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 40
    Top = 48
  end
  object qryTiempo: TUniQuery
    Connection = MySQL
    Left = 384
    Top = 80
  end
end
