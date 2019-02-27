object dm: Tdm
  OldCreateOrder = False
  Height = 410
  Width = 605
  object qryLoggin: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM loggin'
      'WHERE USR =:usr AND PASS =:pwd')
    Left = 144
    Top = 128
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
  object qryEstudiante: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM ESTUDIANTE')
    Active = True
    Left = 144
    Top = 208
  end
  object qryConsultarNombre: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM ESTUDIANTE')
    Active = True
    Left = 48
    Top = 128
  end
  object qrySinTip: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO USUARIO_SIN_TIP'
      '  (NUM_REGISTRO, ID_ST, MOTIVO_ST, TIMESTAMP_ST)'
      'VALUES'
      '  (:NUM_REGISTRO, :ID_ST, :MOTIVO_ST, :TIMESTAMP_ST)')
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM USUARIO_SIN_TIP')
    Left = 232
    Top = 128
  end
  object qryExternos: TUniQuery
    SQLInsert.Strings = (
      
        'INSERT INTO PERSONAL_EXTERNO (ID_EXTERNO, NOMBRES_EXTERNO, APELL' +
        'IDOS_EXTERNO, CARGO_EXTERNO, LUGAR_DESTINO_EXTERNO, OTRO_LUGAR_E' +
        'XTERNOS)'
      
        'VALUES (:ID_EXTERNO, :NOMBRES_EXTERNO, :APELLIDOS_EXTERNO, :CARG' +
        'O_EXTERNO, :LUGAR_DESTINO_EXTERNO, :OTRO_LUGAR_EXTERNOS)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONAL_EXTERNO'
      'WHERE'
      '  NUM_REGISTRO_EXTERNO = :Old_NUM_REGISTRO_EXTERNO')
    SQLUpdate.Strings = (
      'UPDATE PERSONAL_EXTERNO'
      'SET'
      
        '  NUM_REGISTRO_EXTERNO = :NUM_REGISTRO_EXTERNO, ID_EXTERNO = :ID' +
        '_EXTERNO, NOMBRES_EXTERNO = :NOMBRES_EXTERNO, APELLIDOS_EXTERNO ' +
        '= :APELLIDOS_EXTERNO, CARGO_EXTERNO = :CARGO_EXTERNO, LUGAR_DEST' +
        'INO_EXTERNO = :LUGAR_DESTINO_EXTERNO, OTRO_LUGAR_EXTERNOS = :OTR' +
        'O_LUGAR_EXTERNOS, TIMESTAMP_EXTERNO = :TIMESTAMP_EXTERNO'
      'WHERE'
      '  NUM_REGISTRO_EXTERNO = :Old_NUM_REGISTRO_EXTERNO')
    SQLLock.Strings = (
      'SELECT * FROM PERSONAL_EXTERNO'
      'WHERE'
      '  NUM_REGISTRO_EXTERNO = :Old_NUM_REGISTRO_EXTERNO'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT NUM_REGISTRO_EXTERNO, ID_EXTERNO, NOMBRES_EXTERNO, APELLI' +
        'DOS_EXTERNO, CARGO_EXTERNO, LUGAR_DESTINO_EXTERNO, OTRO_LUGAR_EX' +
        'TERNOS, TIMESTAMP_EXTERNO FROM PERSONAL_EXTERNO'
      'WHERE'
      '  NUM_REGISTRO_EXTERNO = :NUM_REGISTRO_EXTERNO')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM PERSONAL_EXTERNO')
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM PERSONAL_EXTERNO')
    Left = 232
    Top = 208
  end
end
