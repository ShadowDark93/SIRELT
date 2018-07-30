object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 367
  Width = 699
  object qryLoggin: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM loggin'
      'WHERE USR =:usr AND PASS =:pwd')
    Left = 128
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
    Connection = MySQL
    Left = 184
    Top = 144
  end
  object qrySalida: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      'SELECT * FROM USO_LIBRE')
    Left = 184
    Top = 88
  end
  object qryConsulta: TUniQuery
    Connection = MySQL
    SQL.Strings = (
      
        'SELECT `TIPO_PERSONA`,`ID_PERSONA`,`PROGRAMA`,`SALA`,`EQUIPO`,`H' +
        'ORA_INICIO` FROM `USO_LIBRE`'
      'WHERE ESTADO = 1'
      'ORDER BY SALA AND `EQUIPO` ASC ')
    Active = True
    Left = 72
    Top = 144
  end
  object MySQL: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'maquinan_magel'
    Username = 'maquinan_david'
    Server = 'www.maquinandotalentos.com'
    Connected = True
    Left = 128
    Top = 112
    EncryptedPassword = 'CCFFCEFFCDFFCBFFC7FFCCFFCFFFCDFFCDFFC7FF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 128
    Top = 48
  end
  object qryTiempo: TUniQuery
    Connection = MySQL
    Left = 72
    Top = 96
  end
end
