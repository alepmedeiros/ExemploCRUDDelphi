object ModelConexaoFiredac: TModelConexaoFiredac
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Criacao\Documents\GitHub\BoasPraticasCRUDDelph' +
        'i\ExemplosCRUD\database\Dados.sdb'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 96
    Top = 40
  end
end
