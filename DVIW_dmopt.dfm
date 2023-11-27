object dmOpt: TdmOpt
  OldCreateOrder = False
  Height = 764
  Width = 702
  object sqlcDateView: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\dateview2021v30.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase'
      'OptimizedNumerics=false'
      'CharLength=1')
    Left = 24
    Top = 14
  end
  object dsOpt: TDataSource
    DataSet = cdsOpt
    Left = 312
    Top = 126
  end
  object qOpt: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE'
      'from USEROPTS'
      'where USEROPTS.USERID = :USERID'
      'and USEROPTS.OPTIONTYPEID = :OPTIONTYPEID')
    SQLConnection = sqlcDateView
    Left = 206
    Top = 126
    object qOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object cdsOpt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpt'
    Left = 286
    Top = 124
    object cdsOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object qOptInterp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTINTERP.USERID, USEROPTINTERP.OPTIONID,'
      '  USEROPTINTERP.INTERPABR'
      'from USEROPTINTERP'
      'where USEROPTINTERP.USERID = :USERID'
      '')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 200
  end
  object cdsOptInterp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptInterp'
    Left = 268
    Top = 198
    object cdsOptInterpUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptInterp: TDataSource
    DataSet = cdsOptInterp
    Left = 296
    Top = 198
  end
  object dsQOpt: TDataSource
    DataSet = qOpt
    Left = 230
    Top = 126
  end
  object qOptDates: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTDATES.USERID, USEROPTDATES.OPTIONID,'
      '  USEROPTDATES.DATEMIN, USEROPTDATES.DATEMAX'
      'from USEROPTDATES'
      'where USEROPTDATES.USERID = :USERID'
      '')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 252
  end
  object cdsOptDates: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptDates'
    Left = 264
    Top = 252
    object cdsOptDatesUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsOptDatesDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
      DisplayFormat = '####0.00'
    end
  end
  object dsOptDates: TDataSource
    DataSet = cdsOptDates
    Left = 292
    Top = 252
  end
  object qOptGraph: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTGRAPH.USERID, USEROPTGRAPH.MINAGEERROR,'
      '  USEROPTGRAPH.SHOWALLLOCALITIES, USEROPTGRAPH.GROUPCATEGORY,'
      '  USEROPTGRAPH.PDFTYPE'
      'from USEROPTGRAPH'
      'where USEROPTGRAPH.USERID = :USERID')
    SQLConnection = sqlcDateView
    Left = 210
    Top = 300
  end
  object cdsOptGraph: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptGraph'
    Left = 266
    Top = 300
    object cdsOptGraphUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptGraphMINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsOptGraphSHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptGraphGROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
    object cdsOptGraphPDFTYPE: TStringField
      FieldName = 'PDFTYPE'
      Required = True
      Size = 3
    end
  end
  object dsOptGraph: TDataSource
    DataSet = cdsOptGraph
    Left = 290
    Top = 300
  end
  object dspOpt: TDataSetProvider
    DataSet = qOpt
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 258
    Top = 126
  end
  object dspOptAll: TDataSetProvider
    DataSet = qOptAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 42
    Top = 126
  end
  object cdsOptAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptAll'
    Left = 70
    Top = 124
    object cdsOptAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptAllOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptAllOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptAll: TDataSource
    DataSet = cdsOptAll
    Left = 96
    Top = 126
  end
  object qOptInterpAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTINTERP.USERID, USEROPTINTERP.OPTIONID,'
      '  USEROPTINTERP.INTERPABR'
      'from USEROPTINTERP'
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 14
    Top = 186
    object qOptInterpAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptInterpAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptInterpAllINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object cdsOptInterpAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptInterpAll'
    Left = 74
    Top = 184
    object cdsOptInterpAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpAllINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptInterpAll: TDataSource
    DataSet = cdsOptInterpAll
    Left = 102
    Top = 184
  end
  object qOptDatesAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTDATES.USERID, USEROPTDATES.OPTIONID,'
      '  USEROPTDATES.DATEMIN, USEROPTDATES.DATEMAX'
      'from USEROPTDATES'
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 12
    Top = 240
    object qOptDatesAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptDatesAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptDatesAllDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
    end
    object qOptDatesAllDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
    end
  end
  object cdsOptDatesAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptDatesAll'
    Left = 64
    Top = 240
    object cdsOptDatesAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesAllDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
    end
    object cdsOptDatesAllDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
    end
  end
  object dsOptDatesAll: TDataSource
    DataSet = cdsOptDatesAll
    Left = 92
    Top = 240
  end
  object dspOptInterpAll: TDataSetProvider
    DataSet = qOptInterpAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 42
    Top = 186
  end
  object dspOptDatesAll: TDataSetProvider
    DataSet = qOptDatesAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 38
    Top = 240
  end
  object qOptAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE'
      'from USEROPTS'
      '')
    SQLConnection = sqlcDateView
    Left = 14
    Top = 126
    object qOptAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptAllOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptAllOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object qGraphAll2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTGRAPH.USERID, '
      '          USEROPTGRAPH.MINAGEERROR,'
      '          USEROPTGRAPH.SHOWALLLOCALITIES, '
      '          USEROPTGRAPH.GROUPCATEGORY'
      'from USEROPTGRAPH')
    SQLConnection = sqlcDateView
    Left = 158
    Top = 470
    object qGraphAll2USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qGraphAll2MINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
    end
    object qGraphAll2SHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qGraphAll2GROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
  end
  object qOptGraphAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from USEROPTGRAPH')
    SQLConnection = sqlcDateView
    Left = 12
    Top = 302
  end
  object dspOptGraphAll: TDataSetProvider
    DataSet = qOptGraphAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 40
    Top = 302
  end
  object cdsOptGraphAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptGraphAll'
    Left = 68
    Top = 302
    object cdsOptGraphAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptGraphAllMINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
    end
    object cdsOptGraphAllSHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptGraphAllGROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
    object cdsOptGraphAllPDFTYPE: TStringField
      FieldName = 'PDFTYPE'
      Required = True
      Size = 3
    end
  end
  object dsOptGraphAll: TDataSource
    DataSet = cdsOptGraphAll
    Left = 96
    Top = 302
  end
  object dspOptInterp: TDataSetProvider
    DataSet = qOptInterp
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 236
    Top = 200
  end
  object dspOptDates: TDataSetProvider
    DataSet = qOptDates
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 252
  end
  object dspOptGraph: TDataSetProvider
    DataSet = qOptGraph
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 236
    Top = 300
  end
  object qOptM: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID')
    SQLConnection = sqlcDateView
    Left = 400
    Top = 64
  end
  object dsqOptM: TDataSource
    DataSet = qOptM
    Left = 428
    Top = 64
  end
  object dspOptM: TDataSetProvider
    DataSet = qOptM
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 456
    Top = 64
  end
  object cdsOptM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspoptM'
    Left = 484
    Top = 64
    object cdsOptMUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsOptMqOptMInterp: TDataSetField
      FieldName = 'qOptMInterp'
    end
    object cdsOptMqOptMGraph: TDataSetField
      FieldName = 'qOptMGraph'
    end
    object cdsOptMqOptMDates: TDataSetField
      FieldName = 'qOptMDates'
    end
    object cdsOptMqOptMInitialIR: TDataSetField
      FieldName = 'qOptMInitialIR'
    end
    object cdsOptMqOptMInitialM: TDataSetField
      FieldName = 'qOptMInitialM'
    end
    object cdsOptMqOptMInitialE: TDataSetField
      FieldName = 'qOptMInitialE'
    end
    object cdsOptMqOptMInterpCap1: TDataSetField
      FieldName = 'qOptMInterpCap1'
    end
    object cdsOptMqOptMInterpCap5: TDataSetField
      FieldName = 'qOptMInterpCap5'
    end
    object cdsOptMqOptMInterpCap4: TDataSetField
      FieldName = 'qOptMInterpCap4'
    end
    object cdsOptMqOptMInterpCap3: TDataSetField
      FieldName = 'qOptMInterpCap3'
    end
    object cdsOptMqOptMInterpCap2: TDataSetField
      FieldName = 'qOptMInterpCap2'
    end
  end
  object dsOptM: TDataSource
    DataSet = cdsOptM
    Left = 512
    Top = 64
  end
  object qOptMInterp: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTINTERP'
      'where USEROPTINTERP.USERID=:USERID')
    SQLConnection = sqlcDateView
    Left = 432
    Top = 116
  end
  object cdsOptMInterp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 460
    Top = 116
    object cdsOptMInterpUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInterpOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInterpINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterp: TDataSource
    DataSet = cdsOptMInterp
    Left = 488
    Top = 116
  end
  object qOptMDates: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTDATES'
      'where USEROPTDATES.USERID=:USERID')
    SQLConnection = sqlcDateView
    Left = 432
    Top = 164
  end
  object qOptMGraph: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTGRAPH'
      'where USEROPTGRAPH.USERID=:USERID')
    SQLConnection = sqlcDateView
    Left = 432
    Top = 212
  end
  object cdsOptMDates: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptMqOptMDates
    Params = <>
    Left = 460
    Top = 164
    object cdsOptMDatesUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMDatesOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMDatesDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsOptMDatesDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object cdsOptMGraph: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 460
    Top = 212
    object cdsOptMGraphUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMGraphMINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsOptMGraphSHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMGraphGROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
    object cdsOptMGraphPDFTYPE: TStringField
      FieldName = 'PDFTYPE'
      Required = True
      Size = 3
    end
  end
  object dsOptMDates: TDataSource
    DataSet = cdsOptMDates
    Left = 488
    Top = 164
  end
  object dsOptMGraph: TDataSource
    DataSet = cdsOptMGraph
    Left = 488
    Top = 212
  end
  object qUserGroups: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from GROUPINGLIST'
      'where GROUPINGLIST.USERID=:UserID'
      'ORDER BY GROUPINGLIST.GROUPING')
    SQLConnection = sqlcDateView
    Left = 12
    Top = 354
  end
  object dspUserGroups: TDataSetProvider
    DataSet = qUserGroups
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 40
    Top = 354
  end
  object cdsUserGroups: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserGroups'
    Left = 68
    Top = 354
    object cdsUserGroupsGROUPING: TStringField
      FieldName = 'GROUPING'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserGroupsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserGroupsEXPIRYDATE: TSQLTimeStampField
      FieldName = 'EXPIRYDATE'
      Required = True
    end
  end
  object dsUserGroups: TDataSource
    DataSet = cdsUserGroups
    Left = 96
    Top = 354
  end
  object qUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from FORLIST'
      'where FORLIST.OWNER=:UserID'
      'ORDER BY FORLIST.WHOFORID')
    SQLConnection = sqlcDateView
    Left = 12
    Top = 406
  end
  object dspUserFor: TDataSetProvider
    DataSet = qUserFor
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 40
    Top = 406
  end
  object cdsUserFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserFor'
    Left = 68
    Top = 406
    object cdsUserForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUserForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Required = True
      Size = 50
    end
    object cdsUserForOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
    end
  end
  object dsUserFor: TDataSource
    DataSet = cdsUserFor
    Left = 96
    Top = 406
  end
  object qChangeUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'DELETE FROM FORLIST'
      'WHERE FORLIST.WHOFORID='#39'NEW'#39)
    SQLConnection = sqlcDateView
    Left = 12
    Top = 454
  end
  object qOptMInitialIR: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID = '#39'O'#39)
    SQLConnection = sqlcDateView
    Left = 432
    Top = 260
  end
  object cdsOptMInitialIR: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 460
    Top = 260
    object cdsOptMInitialIRUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInitialIROPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMInitialIROPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInitialIRVALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
      DisplayFormat = '####0.000000'
    end
    object cdsOptMInitialIRVALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsOptMInitialIR: TDataSource
    DataSet = cdsOptMInitialIR
    Left = 488
    Top = 260
  end
  object qOptInitial: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTINITIAL.USERID, USEROPTINITIAL.OPTIONTYPEID,'
      '  USEROPTINITIAL.OPTIONID,'
      '  USEROPTINITIAL.VALUEMIN, USEROPTINITIAL.VALUEMAX'
      'from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID = :USERID'
      'AND USEROPTINITIAL.OPTIONTYPEID = :OptionTypeID'
      '')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 356
  end
  object dspOptInitial: TDataSetProvider
    DataSet = qOptInitial
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 356
  end
  object cdsOptInitial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptInitial'
    Left = 264
    Top = 356
    object cdsOptInitialUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInitialOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptInitialOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInitialVALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptInitialVALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object dsOptInitial: TDataSource
    DataSet = cdsOptInitial
    Left = 292
    Top = 356
  end
  object qOptMInitialE: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID = '#39'E'#39)
    SQLConnection = sqlcDateView
    Left = 432
    Top = 308
  end
  object cdsOptMInitialE: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptMqOptMInitialE
    Params = <>
    Left = 460
    Top = 308
    object StringField1: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField1: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
      DisplayFormat = '####0.000000'
    end
    object FloatField2: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsOptMInitialE: TDataSource
    DataSet = cdsOptMInitialE
    Left = 488
    Top = 308
  end
  object qOptMInitialM: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID = '#39'M'#39)
    SQLConnection = sqlcDateView
    Left = 432
    Top = 356
  end
  object cdsOptMInitialM: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptMqOptMInitialM
    Params = <>
    Left = 460
    Top = 356
    object StringField3: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
      DisplayFormat = '####0.000000'
    end
    object FloatField4: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsOptMInitialM: TDataSource
    DataSet = cdsOptMInitialM
    Left = 488
    Top = 356
  end
  object qOptMInterpCap1: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID='#39'I'#39
      'and USEROPTS.OPTIONID=1')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 116
  end
  object cdsOptMInterpCap1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 116
    object StringField5: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField6: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterpCap1: TDataSource
    DataSet = cdsOptMInterpCap1
    Left = 608
    Top = 116
  end
  object qOptMInterpCap2: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID='#39'I'#39
      'and USEROPTS.OPTIONID=2')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 164
  end
  object cdsOptMInterpCap2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 164
    object StringField7: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField8: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterpCap2: TDataSource
    DataSet = cdsOptMInterpCap2
    Left = 608
    Top = 164
  end
  object qOptMInterpCap3: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID='#39'I'#39
      'and USEROPTS.OPTIONID=3')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 212
  end
  object cdsOptMInterpCap3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 212
    object StringField9: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField10: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterpCap3: TDataSource
    DataSet = cdsOptMInterpCap3
    Left = 608
    Top = 212
  end
  object qOptMInterpCap4: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID='#39'I'#39
      'and USEROPTS.OPTIONID=4')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 260
  end
  object cdsOptMInterpCap4: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 260
    object StringField11: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField12: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterpCap4: TDataSource
    DataSet = cdsOptMInterpCap4
    Left = 608
    Top = 260
  end
  object qOptMInterpCap5: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID='#39'I'#39
      'and USEROPTS.OPTIONID=5')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 308
  end
  object cdsOptMInterpCap5: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 308
    object StringField13: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField14: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptMInterpCap5: TDataSource
    DataSet = cdsOptMInterpCap5
    Left = 608
    Top = 308
  end
  object qOptionTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OPTIONTYPES'
      'WHERE OPTIONTYPES.ISRATIO = '#39'Y'#39
      'ORDER BY OPTIONTYPES.OPTIONTYPEID')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 520
  end
  object dspOptionTypes: TDataSetProvider
    DataSet = qOptionTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 48
    Top = 520
  end
  object cdsOptionTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptionTypes'
    Left = 80
    Top = 520
    object cdsOptionTypesOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptionTypesOPTIONTYPE: TStringField
      FieldName = 'OPTIONTYPE'
      Required = True
    end
  end
  object dsOptionTypes: TDataSource
    DataSet = cdsOptionTypes
    Left = 112
    Top = 520
  end
  object qOptRCap1: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTS.OPTIONID=1')
    SQLConnection = sqlcDateView
    Left = 376
    Top = 492
  end
  object cdsOptRCap1: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRCap1
    Params = <>
    Left = 404
    Top = 492
    object cdsOptRCap1USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap1OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRCap1OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap1OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptRCap1: TDataSource
    DataSet = cdsOptRCap1
    Left = 432
    Top = 492
  end
  object qOptRCap2: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTS.OPTIONID=2')
    SQLConnection = sqlcDateView
    Left = 376
    Top = 540
  end
  object cdsOptRCap2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRCap2
    Params = <>
    Left = 404
    Top = 540
    object cdsOptRCap2USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap2OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRCap2OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap2OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptRCap2: TDataSource
    DataSet = cdsOptRCap2
    Left = 432
    Top = 540
  end
  object qOptRCap3: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTS.OPTIONID=3')
    SQLConnection = sqlcDateView
    Left = 376
    Top = 588
  end
  object cdsOptRCap3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRCap3
    Params = <>
    Left = 404
    Top = 588
    object cdsOptRCap3USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap3OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRCap3OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap3OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptRCap3: TDataSource
    DataSet = cdsOptRCap3
    Left = 432
    Top = 588
  end
  object qOptRCap4: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTS.OPTIONID=4')
    SQLConnection = sqlcDateView
    Left = 376
    Top = 636
  end
  object cdsOptRCap4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRCap4
    Params = <>
    Left = 404
    Top = 636
    object cdsOptRCap4USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap4OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRCap4OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap4OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptRCap4: TDataSource
    DataSet = cdsOptRCap4
    Left = 432
    Top = 636
  end
  object qOptRCap5: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTS'
      'where USEROPTS.USERID=:USERID'
      'and USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTS.OPTIONID=5')
    SQLConnection = sqlcDateView
    Left = 376
    Top = 684
  end
  object cdsOptRCap5: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRCap5
    Params = <>
    Left = 404
    Top = 684
    object cdsOptRCap5USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap5OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRCap5OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRCap5OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptRCap5: TDataSource
    DataSet = cdsOptRCap5
    Left = 432
    Top = 684
  end
  object qOptR: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  USEROPTS.OPTIONID,USEROPTS.OPTIONTITLE'
      'from USEROPTS,OPTIONTYPES'
      'where USEROPTS.USERID=:USERID'
      'AND USEROPTS.OPTIONTYPEID=:OptionTypeID'
      'AND OPTIONTYPES.OPTIONTYPEID = USEROPTS.OPTIONTYPEID'
      'AND OPTIONTYPES.ISRATIO = '#39'Y'#39)
    SQLConnection = sqlcDateView
    Left = 360
    Top = 440
    object qOptRUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptROPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptROPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptROPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsqOptR: TDataSource
    DataSet = qOptR
    Left = 388
    Top = 440
  end
  object dspOptR: TDataSetProvider
    DataSet = qOptR
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 416
    Top = 440
  end
  object cdsOptR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptR'
    Left = 444
    Top = 440
    object cdsOptRUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptROPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptROPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptROPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsOptRqOptRCap1: TDataSetField
      FieldName = 'qOptRCap1'
    end
    object cdsOptRqOptRCap2: TDataSetField
      FieldName = 'qOptRCap2'
    end
    object cdsOptRqOptRCap3: TDataSetField
      FieldName = 'qOptRCap3'
    end
    object cdsOptRqOptRCap4: TDataSetField
      FieldName = 'qOptRCap4'
    end
    object cdsOptRqOptRCap5: TDataSetField
      FieldName = 'qOptRCap5'
    end
    object cdsOptRqOptRVal1: TDataSetField
      FieldName = 'qOptRVal1'
    end
    object cdsOptRqOptRVal2: TDataSetField
      FieldName = 'qOptRVal2'
    end
    object cdsOptRqOptRVal3: TDataSetField
      FieldName = 'qOptRVal3'
    end
    object cdsOptRqOptRVal4: TDataSetField
      FieldName = 'qOptRVal4'
    end
    object cdsOptRqOptRVal5: TDataSetField
      FieldName = 'qOptRVal5'
    end
  end
  object dsOptR: TDataSource
    DataSet = cdsOptR
    Left = 472
    Top = 440
  end
  object dsOptRVal5: TDataSource
    DataSet = cdsOptRVal5
    Left = 552
    Top = 684
  end
  object cdsOptRVal5: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRVal5
    Params = <>
    Left = 524
    Top = 684
    object cdsOptRVal5USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal5OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRVal5OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal5VALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRVal5VALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object qOptRVal5: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTINITIAL.OPTIONID=5'
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 684
  end
  object dsOptRVal4: TDataSource
    DataSet = cdsOptRVal4
    Left = 552
    Top = 636
  end
  object cdsOptRVal4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRVal4
    Params = <>
    Left = 524
    Top = 636
    object cdsOptRVal4USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal4OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRVal4OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal4VALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRVal4VALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object qOptRVal4: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTINITIAL.OPTIONID=4'
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 636
  end
  object dsOptRVal3: TDataSource
    DataSet = cdsOptRVal3
    Left = 552
    Top = 588
  end
  object cdsOptRVal3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRVal3
    Params = <>
    Left = 524
    Top = 588
    object cdsOptRVal3USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal3OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRVal3OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal3VALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRVal3VALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object qOptRVal3: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTINITIAL.OPTIONID=3'
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 588
  end
  object dsOptRVal2: TDataSource
    DataSet = cdsOptRVal2
    Left = 552
    Top = 540
  end
  object cdsOptRVal2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRVal2
    Params = <>
    Left = 524
    Top = 540
    object cdsOptRVal2USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal2OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRVal2OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal2VALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRVal2VALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object qOptRVal2: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTINITIAL.OPTIONID=2'
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 540
  end
  object dsOptRVal1: TDataSource
    DataSet = cdsOptRVal1
    Left = 552
    Top = 492
  end
  object cdsOptRVal1: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptRqOptRVal1
    Params = <>
    Left = 524
    Top = 492
    object cdsOptRVal1USERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal1OPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRVal1OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRVal1VALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRVal1VALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object qOptRVal1: TSQLQuery
    DataSource = dsqOptR
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID'
      'and USEROPTINITIAL.OPTIONTYPEID=:OptionTypeID'
      'and USEROPTINITIAL.OPTIONID=1')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 492
  end
  object qForList: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM FORLIST'
      'where FORLIST.OWNER=:UserID'
      'OR FORLIST.OWNER = '#39'Anybody'#39
      'ORDER BY FORLIST.WHOFORID')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 574
  end
  object dspForList: TDataSetProvider
    DataSet = qForList
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 574
  end
  object cdsForList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForList'
    Left = 72
    Top = 574
    object cdsForListWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsForListWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Required = True
      Size = 50
    end
    object cdsForListOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
    end
  end
  object dsForList: TDataSource
    DataSet = cdsForList
    Left = 100
    Top = 574
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 120
    Top = 16
  end
end
