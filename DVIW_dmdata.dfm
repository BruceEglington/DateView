object dmdDV: TdmdDV
  OldCreateOrder = False
  Height = 830
  Width = 1084
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
    Left = 32
    Top = 14
  end
  object Querydm: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT ISORGR30.CountryAbr, ISORGR30.UnitID,SUITE.UNITN' +
        'ame, ISORGR30.MaterialAbr, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      
        'ISORGR30.InterpAbr, ISORGR30.PrefLevel, ISORGR30.IAge, ISORGR30.' +
        'IAgePError, '
      'ISORGR30.IAgeMError, ISORGR30.AgeUnits, ISORGR30.Confidential, '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'COUNTRY.Country, MATERIAL.MaterialDescription, Interpretation.In' +
        'terpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR  '
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39)
    SQLConnection = sqlcDateView
    Left = 172
    Top = 18
    object QuerydmCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object QuerydmUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object QuerydmMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object QuerydmISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object QuerydmAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object QuerydmTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object QuerydmINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object QuerydmPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object QuerydmIAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object QuerydmIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object QuerydmIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object QuerydmAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object QuerydmLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object QuerydmUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QuerydmMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QuerydmRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QuerydmCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object QuerydmRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object QuerydmRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object QuerydmRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dspQuery2: TDataSetProvider
    DataSet = Querydm
    Left = 226
    Top = 18
  end
  object cdsQuerydm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery2'
    Left = 254
    Top = 18
    object cdsQuerydmCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsQuerydmUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQuerydmAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmTECHABR: TStringField
      FieldName = 'TECHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmIAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQuerydmIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsQuerydmUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsQuerydmAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQuerydmMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQuerydmRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQuerydmCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object cdsQuerydmRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object cdsQuerydmRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object cdsQuerydmRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dsQuerydm: TDataSource
    DataSet = cdsQuerydm
    Left = 282
    Top = 18
  end
  object dsQdmSmp: TDataSource
    DataSet = cdsQdmSmp
    Left = 280
    Top = 70
  end
  object QdmSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SMPREG.RECORDID, SMPLOC.SAMPLENO, SMPREG.FRAC, '
      '  SMPREG.INCLUDED, SMPREG.ISOSYSTEM, '
      '  SMPLOC.LATITUDE, SMPLOC.LATITUDEPRECISION,'
      '  SMPLOC.LONGITUDE, SMPLOC.LONGITUDEPRECISION,'
      '  SMPLOC.ELEVATION, SMPLOC.ELEVATIONPRECISION,'
      '  SMPLOC.ORIGINALNO'
      'from SMPREG, SMPLOC'
      'where SMPREG.RECORDID=:RECORDID'
      'and SMPREG.SAMPLENO=SMPLOC.SAMPLENO'
      'Order by SMPREG.SAMPLENO, SMPREG.FRAC')
    SQLConnection = sqlcDateView
    Left = 170
    Top = 70
    object QdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object QdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object QdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object QdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsQuerydmDB: TDataSource
    DataSet = Querydm
    Left = 198
    Top = 18
  end
  object cdsQdmSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQdmSmp'
    Left = 254
    Top = 68
    object cdsQdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQdmSmpqSmpDataX: TDataSetField
      FieldName = 'qSmpDataX'
    end
    object cdsQdmSmpqSmpDataXerr: TDataSetField
      FieldName = 'qSmpDataXerr'
    end
    object cdsQdmSmpqSmpDataY: TDataSetField
      FieldName = 'qSmpDataY'
    end
    object cdsQdmSmpqSmpDataYerr: TDataSetField
      FieldName = 'qSmpDataYerr'
    end
    object cdsQdmSmpqSmpDataR: TDataSetField
      FieldName = 'qSmpDataR'
    end
    object cdsQdmSmpqSmpDataPrecX: TDataSetField
      FieldName = 'qSmpDataPrecX'
    end
    object cdsQdmSmpqSmpDataPrecY: TDataSetField
      FieldName = 'qSmpDataPrecY'
    end
    object cdsQdmSmpqErrTypeX: TDataSetField
      FieldName = 'qErrTypeX'
    end
    object cdsQdmSmpqErrTypeY: TDataSetField
      FieldName = 'qErrTypeY'
    end
    object cdsQdmSmpqNormalisedValueY: TDataSetField
      FieldName = 'qNormalisedValueY'
    end
    object cdsQdmSmpqNormalisedValueX: TDataSetField
      FieldName = 'qNormalisedValueX'
    end
    object cdsQdmSmpqErrTypeZ: TDataSetField
      FieldName = 'qErrTypeZ'
    end
    object cdsQdmSmpqSmpDataZerr: TDataSetField
      FieldName = 'qSmpDataZerr'
    end
    object cdsQdmSmpqSmpDataPrecZ: TDataSetField
      FieldName = 'qSmpDataPrecZ'
    end
    object cdsQdmSmpqNormalisedValueZ: TDataSetField
      FieldName = 'qNormalisedValueZ'
    end
    object cdsQdmSmpqSmpDataZ: TDataSetField
      FieldName = 'qSmpDataZ'
    end
  end
  object qVariables: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Variables'
      'ORDER BY VARIABLES.VARIABLEABR')
    SQLConnection = sqlcDateView
    Left = 14
    Top = 90
    object qVariablesVARIABLEABR: TStringField
      FieldName = 'VARIABLEABR'
      Required = True
      Size = 5
    end
    object qVariablesVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
    end
  end
  object dspVariables: TDataSetProvider
    DataSet = qVariables
    Left = 42
    Top = 90
  end
  object cdsVariables: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariables'
    Left = 70
    Top = 90
    object cdsVariablesVARIABLEABR: TStringField
      FieldName = 'VARIABLEABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsVariablesVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
    end
  end
  object dsVariables: TDataSource
    DataSet = cdsVariables
    Left = 98
    Top = 90
  end
  object cdsTable1: TClientDataSet
    PersistDataPacket.Data = {
      330000009619E0BD010000001800000001000000000003000000330004746573
      7401004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 24
    object cdsTable1test: TStringField
      FieldName = 'test'
      Size = 50
    end
  end
  object qIsoModels: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IsoSystem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ModelTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select IsoModels.ModelID, IsoModels.IsoSystem, IsoModels.ModelPa' +
        'ram1,'
      '  IsoModels.ModelParam2, IsoModels.ModelParam3,'
      '  IsoModels.ModelParam4, IsoModels.ModelParam5,'
      '  IsoModels.ModelName, IsoSystem.IsoSystemName'
      'from IsoModels,IsoSystem'
      'where IsoModels.IsoSystem=IsoSystem.IsoSystem'
      'and IsoModels.IsoSystem = :IsoSystem'
      'and IsoModels.ModelTypeID = :ModelTypeID')
    SQLConnection = sqlcDateView
    Left = 14
    Top = 142
    object qIsoModelsMODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object qIsoModelsISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qIsoModelsMODELPARAM1: TFloatField
      FieldName = 'MODELPARAM1'
    end
    object qIsoModelsMODELPARAM2: TFloatField
      FieldName = 'MODELPARAM2'
    end
    object qIsoModelsMODELPARAM3: TFloatField
      FieldName = 'MODELPARAM3'
    end
    object qIsoModelsMODELPARAM4: TFloatField
      FieldName = 'MODELPARAM4'
    end
    object qIsoModelsMODELPARAM5: TFloatField
      FieldName = 'MODELPARAM5'
    end
    object qIsoModelsMODELNAME: TStringField
      FieldName = 'MODELNAME'
    end
    object qIsoModelsISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
  end
  object dspIsoModels: TDataSetProvider
    DataSet = qIsoModels
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 42
    Top = 142
  end
  object cdsIsoModels: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIsoModels'
    Left = 70
    Top = 142
    object cdsIsoModelsMODELID: TStringField
      DisplayLabel = 'Model ID'
      FieldName = 'MODELID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoModelsISOSYSTEM: TStringField
      DisplayLabel = 'Iso. Sys. ID'
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsIsoModelsMODELPARAM1: TFloatField
      DisplayLabel = 'Param. 1'
      FieldName = 'MODELPARAM1'
    end
    object cdsIsoModelsMODELPARAM2: TFloatField
      DisplayLabel = 'Param. 2'
      FieldName = 'MODELPARAM2'
    end
    object cdsIsoModelsMODELPARAM3: TFloatField
      DisplayLabel = 'Param. 3'
      FieldName = 'MODELPARAM3'
    end
    object cdsIsoModelsMODELPARAM4: TFloatField
      DisplayLabel = 'Param. 4'
      FieldName = 'MODELPARAM4'
    end
    object cdsIsoModelsMODELPARAM5: TFloatField
      DisplayLabel = 'Param. 5'
      FieldName = 'MODELPARAM5'
    end
    object cdsIsoModelsMODELNAME: TStringField
      DisplayLabel = 'Model Name'
      FieldName = 'MODELNAME'
    end
    object cdsIsoModelsISOSYSTEMNAME: TStringField
      DisplayLabel = 'Iso. System'
      FieldName = 'ISOSYSTEMNAME'
      ProviderFlags = []
      Size = 30
    end
  end
  object dsIsoModels: TDataSource
    DataSet = cdsIsoModels
    Left = 96
    Top = 142
  end
  object qSmpData: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'select * from SmpData'
      'where  SampleNo = :SampleNo'
      'and Frac = :Frac'
      'and IsoSystem = :IsoSystem')
    SQLConnection = sqlcDateView
    Left = 20
    Top = 548
  end
  object cdsSmpData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 548
    object cdsSmpDataSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpDataFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpDataISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpDataVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpDataDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      DisplayFormat = '###0.000000'
    end
    object cdsSmpDataNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsSmpDataNORMALISINGFACTOR: TFloatField
      FieldName = 'NORMALISINGFACTOR'
      DisplayFormat = '#0.000000'
    end
    object cdsSmpDataSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
  end
  object dsSmpData: TDataSource
    DataSet = cdsSmpData
    Left = 76
    Top = 548
  end
  object qStandards: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Standards')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 194
    object qStandardsSTANDARDID: TStringField
      FieldName = 'STANDARDID'
      Required = True
      Size = 10
    end
    object qStandardsSTANDARDNAME: TStringField
      FieldName = 'STANDARDNAME'
      Required = True
      Size = 30
    end
  end
  object qStandardValues: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'StandardID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select StandardValues.StandardID, StandardValues.VariableID,'
      '  StandardValues.AcceptedValue, Standards.Standardname,'
      '  VarVar.VariableName  '
      'from StandardValues, Standards, VarVar'
      'where StandardValues.StandardID=Standards.StandardID'
      'and StandardValues.VariableID=VarVar.VariableID'
      'and StandardValues.StandardID=:StandardID')
    SQLConnection = sqlcDateView
    Left = 18
    Top = 252
    object qStandardValuesSTANDARDID: TStringField
      FieldName = 'STANDARDID'
      Required = True
      Size = 10
    end
    object qStandardValuesVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qStandardValuesACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
    end
    object qStandardValuesSTANDARDNAME: TStringField
      FieldName = 'STANDARDNAME'
      Required = True
      Size = 30
    end
    object qStandardValuesVARIABLENAME: TStringField
      DisplayLabel = 'Variable'
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dspStandards: TDataSetProvider
    DataSet = qStandards
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 194
  end
  object cdsStandards: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStandards'
    Left = 70
    Top = 194
    object cdsStandardsSTANDARDID: TStringField
      DisplayLabel = 'Std. ID'
      FieldName = 'STANDARDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsStandardsSTANDARDNAME: TStringField
      DisplayLabel = 'Standard'
      FieldName = 'STANDARDNAME'
      Required = True
      Size = 30
    end
  end
  object dsStandards: TDataSource
    DataSet = cdsStandards
    Left = 98
    Top = 194
  end
  object dspStandardValues: TDataSetProvider
    DataSet = qStandardValues
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 46
    Top = 252
  end
  object cdsStandardValues: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStandardValues'
    Left = 74
    Top = 252
    object cdsStandardValuesSTANDARDID: TStringField
      DisplayLabel = 'Std. ID'
      FieldName = 'STANDARDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsStandardValuesVARIABLEID: TStringField
      DisplayLabel = 'Var. ID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsStandardValuesACCEPTEDVALUE: TFloatField
      DisplayLabel = 'Accepted Value'
      FieldName = 'ACCEPTEDVALUE'
      DisplayFormat = '####0.000000'
    end
    object cdsStandardValuesSTANDARDNAME: TStringField
      DisplayLabel = 'Standard'
      FieldName = 'STANDARDNAME'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object cdsStandardValuesVARIABLENAME: TStringField
      DisplayLabel = 'Variable'
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      Size = 30
    end
  end
  object dsStandardValues: TDataSource
    DataSet = cdsStandardValues
    Left = 102
    Top = 252
  end
  object qVarVar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from VarVar'
      'order by VARVAR.VARIABLENAME')
    SQLConnection = sqlcDateView
    Left = 18
    Top = 304
    object qVarVarVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qVarVarVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qVarVarISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Size = 15
    end
  end
  object dspVarVar: TDataSetProvider
    DataSet = qVarVar
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 46
    Top = 304
  end
  object cdsVarVar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVarVar'
    Left = 74
    Top = 304
    object cdsVarVarVARIABLEID: TStringField
      DisplayLabel = 'Var. ID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsVarVarVARIABLENAME: TStringField
      DisplayLabel = 'Variable'
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsVarVarISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Size = 15
    end
  end
  object dsVarVar: TDataSource
    DataSet = cdsVarVar
    Left = 102
    Top = 304
  end
  object dsQdmSmpDB: TDataSource
    DataSet = QdmSmp
    Left = 198
    Top = 70
  end
  object qVarRegTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from VarRegTypes')
    SQLConnection = sqlcDateView
    Left = 18
    Top = 354
    object qVarRegTypesVARREGTYPEID: TStringField
      FieldName = 'VARREGTYPEID'
      Required = True
      Size = 5
    end
    object qVarRegTypesVARREGTYPE: TStringField
      FieldName = 'VARREGTYPE'
      Size = 40
    end
  end
  object qVarReg: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from VarReg')
    SQLConnection = sqlcDateView
    Left = 20
    Top = 406
    object qVarRegISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qVarRegVARREGTYPEID: TStringField
      FieldName = 'VARREGTYPEID'
      Required = True
      Size = 5
    end
    object qVarRegVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
  end
  object qSmpDataX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      
        '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREGASSOC.REGASSOC' +
        'ID'
      'FROM SMPDATA,VARREG,VARVAR,VARREGASSOC'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREGASSOC.REGASSOCID = :REGASSOCID'
      'AND VARREGASSOC.REGASSOCID=VARREG.REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 168
    Top = 160
    object qSmpDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qSmpDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qSmpDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
    object qSmpDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qSmpDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qSmpDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object qSmpDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qSmpDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
    end
    object qSmpDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dspVarRegTypes: TDataSetProvider
    DataSet = qVarRegTypes
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 354
  end
  object dspVarReg: TDataSetProvider
    DataSet = qVarReg
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 48
    Top = 406
  end
  object cdsVarRegTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVarRegTypes'
    Left = 72
    Top = 354
    object cdsVarRegTypesVARREGTYPEID: TStringField
      DisplayLabel = 'Reg. Variable Type ID'
      FieldName = 'VARREGTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsVarRegTypesVARREGTYPE: TStringField
      DisplayLabel = 'Reg. Variable Type'
      FieldName = 'VARREGTYPE'
      Size = 40
    end
  end
  object cdsVarReg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVarReg'
    Left = 76
    Top = 406
    object cdsVarRegISOSYSTEM: TStringField
      DisplayLabel = 'Iso. Sys.'
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsVarRegVARREGTYPEID: TStringField
      DisplayLabel = 'Reg. Variable Type ID'
      FieldName = 'VARREGTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsVarRegVARIABLEID: TStringField
      DisplayLabel = 'Variable ID'
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
  end
  object dsVarRegTypes: TDataSource
    DataSet = cdsVarRegTypes
    Left = 100
    Top = 354
  end
  object dsVarReg: TDataSource
    DataSet = cdsVarReg
    Left = 104
    Top = 406
  end
  object cdsSmpDataX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataX
    Params = <>
    Left = 220
    Top = 160
    object cdsSmpDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsSmpDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsSmpDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
    object cdsSmpDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsSmpDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsSmpDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataXqStandardValueX: TDataSetField
      FieldName = 'qStandardValueX'
    end
  end
  object dsSmpDataX: TDataSource
    DataSet = cdsSmpDataX
    Left = 248
    Top = 160
  end
  object qSmpDataXerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'4Xerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 166
    Top = 208
  end
  object cdsSmpDataXerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataXerr
    Params = <>
    Left = 222
    Top = 208
    object cdsSmpDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsSmpDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataXerr: TDataSource
    DataSet = cdsSmpDataXerr
    Left = 246
    Top = 208
  end
  object dspQdmSmp: TDataSetProvider
    DataSet = QdmSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 226
    Top = 70
  end
  object qStandardValueX: TSQLQuery
    DataSource = dsqSmpDataX
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 162
  end
  object dsqSmpDataX: TDataSource
    DataSet = qSmpDataX
    Left = 196
    Top = 160
  end
  object cdsAcceptedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataXqStandardValueX
    Params = <>
    Left = 330
    Top = 162
    object cdsAcceptedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueX: TDataSource
    DataSet = cdsAcceptedValueX
    Left = 358
    Top = 162
  end
  object qSmpDataY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 168
    Top = 298
  end
  object dsqSmpDataY: TDataSource
    DataSet = qSmpDataY
    Left = 198
    Top = 298
  end
  object cdsSmpDataY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataY
    Params = <>
    Left = 220
    Top = 298
    object StringField1: TStringField
      DisplayLabel = 'VariableID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Value measured'
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField2: TStringField
      DisplayLabel = 'Normalising standard'
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Value measured for standard'
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField3: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataYqStandardValueY: TDataSetField
      FieldName = 'qStandardValueY'
    end
  end
  object dsSmpDataY: TDataSource
    DataSet = cdsSmpDataY
    Left = 248
    Top = 298
  end
  object qStandardValueY: TSQLQuery
    DataSource = dsqSmpDataY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 300
  end
  object cdsAcceptedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataYqStandardValueY
    Params = <>
    Left = 330
    Top = 300
    object FloatField3: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueY: TDataSource
    DataSet = cdsAcceptedValueY
    Left = 358
    Top = 300
  end
  object qSmpDataYerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'6Yerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 170
    Top = 344
  end
  object cdsSmpDataYerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataYerr
    Params = <>
    Left = 222
    Top = 344
    object StringField8: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField4: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField9: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField5: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField10: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataYerr: TDataSource
    DataSet = cdsSmpDataYerr
    Left = 250
    Top = 344
  end
  object qSmpDataR: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'7R'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 312
    Top = 396
  end
  object cdsSmpDataR: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataR
    Params = <>
    Left = 340
    Top = 396
    object StringField11: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField6: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '0.000'
    end
    object StringField12: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField7: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField13: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataR: TDataSource
    DataSet = cdsSmpDataR
    Left = 368
    Top = 396
  end
  object qNormalisedValueX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 406
    Top = 162
  end
  object cdsNormalisedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueX
    Params = <>
    Left = 434
    Top = 162
    object cdsNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsNormalisedValueX: TDataSource
    DataSet = cdsNormalisedValueX
    Left = 462
    Top = 162
  end
  object qNormalisedValueY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  smpdata.variableid, smpdata.datavalue,'
      '  smpdata.normalisingstandard,smpdata.standardvalue,'
      '  standardvalues.acceptedvalue,'
      
        '  (smpdata.datavalue * standardvalues.acceptedvalue / smpdata.st' +
        'andardvalue) as NormalisedValue'
      'FROM SMPDATA,varreg,standardvalues'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'and smpdata.frac = :FRAC'
      'and VARREG.REGASSOCID = :REGASSOCID'
      'and smpdata.variableid=varreg.variableid'
      'and smpdata.isosystem=varreg.isosystem'
      'and varreg.varregtypeid='#39'5Y'#39
      'and smpdata.normalisingstandard=standardvalues.standardid'
      'and standardvalues.variableid=smpdata.variableid')
    SQLConnection = sqlcDateView
    Left = 410
    Top = 300
  end
  object cdsNormalisedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueY
    Params = <>
    Left = 438
    Top = 300
    object cdsNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
    object cdsNormalisedValueYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsNormalisedValueYFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsNormalisedValueYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsNormalisedValueYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsNormalisedValueYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object cdsNormalisedValueYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsNormalisedValueYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
    end
    object cdsNormalisedValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
    end
  end
  object dsNormalisedValueY: TDataSource
    DataSet = cdsNormalisedValueY
    Left = 466
    Top = 300
  end
  object qErrTypeX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'CXert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 210
  end
  object cdsErrTypeX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeX
    Params = <>
    Left = 330
    Top = 210
    object cdsErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeX: TDataSource
    DataSet = cdsErrTypeX
    Left = 358
    Top = 210
  end
  object dsqSmpDataXerr: TDataSource
    DataSet = qSmpDataXerr
    Left = 196
    Top = 208
  end
  object qErrTypeY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'DYert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 346
  end
  object cdsErrTypeY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeY
    Params = <>
    Left = 330
    Top = 346
    object cdsErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeY: TDataSource
    DataSet = cdsErrTypeY
    Left = 358
    Top = 346
  end
  object dsqSmpDataYerr: TDataSource
    DataSet = qSmpDataYerr
    Left = 196
    Top = 344
  end
  object qSmpDataPrecX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'AXpre'#39)
    SQLConnection = sqlcDateView
    Left = 168
    Top = 254
  end
  object cdsSmpDataPrecX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecX
    Params = <>
    Left = 220
    Top = 254
    object cdsSmpDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object dsSmpDataPrecX: TDataSource
    DataSet = cdsSmpDataPrecX
    Left = 248
    Top = 254
  end
  object qSmpDataPrecY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'BYpre'#39)
    SQLConnection = sqlcDateView
    Left = 168
    Top = 390
  end
  object cdsSmpDataPrecY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecY
    Params = <>
    Left = 220
    Top = 390
    object StringField7: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField8: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object dsSmpDataPrecY: TDataSource
    DataSet = cdsSmpDataPrecY
    Left = 248
    Top = 390
  end
  object qErrTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from VarErrType')
    SQLConnection = sqlcDateView
    Left = 20
    Top = 454
  end
  object dspErrTypes: TDataSetProvider
    DataSet = qErrTypes
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 48
    Top = 454
  end
  object cdsErrTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspErrTypes'
    Left = 76
    Top = 454
    object cdsErrTypesERRORTYPE: TStringField
      FieldName = 'ERRORTYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsErrTypesDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypes: TDataSource
    DataSet = cdsErrTypes
    Left = 104
    Top = 454
  end
  object qSmpDataZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 172
    Top = 433
  end
  object dsqSmpDataZ: TDataSource
    DataSet = qSmpDataZ
    Left = 202
    Top = 433
  end
  object cdsSmpDataZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataZ
    Params = <>
    Left = 224
    Top = 433
    object StringField14: TStringField
      DisplayLabel = 'VariableID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Value measured'
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField15: TStringField
      DisplayLabel = 'Normalising standard'
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Value measured for standard'
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField16: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object StringField18: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object StringField19: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataZqStandardValueZ: TDataSetField
      FieldName = 'qStandardValueZ'
    end
  end
  object dsSmpDataZ: TDataSource
    DataSet = cdsSmpDataZ
    Left = 252
    Top = 433
  end
  object qStandardValueZ: TSQLQuery
    DataSource = dsqSmpDataZ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 306
    Top = 435
  end
  object cdsAcceptedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataZqStandardValueZ
    Params = <>
    Left = 334
    Top = 435
    object FloatField11: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueZ: TDataSource
    DataSet = cdsAcceptedValueZ
    Left = 362
    Top = 435
  end
  object qNormalisedValueZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 414
    Top = 435
  end
  object cdsNormalisedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueZ
    Params = <>
    Left = 442
    Top = 435
    object FloatField12: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsNormalisedValueZ: TDataSource
    DataSet = cdsNormalisedValueZ
    Left = 470
    Top = 435
  end
  object qSmpDataPrecZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'GZpre'#39)
    SQLConnection = sqlcDateView
    Left = 176
    Top = 533
  end
  object cdsSmpDataPrecZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecZ
    Params = <>
    Left = 228
    Top = 533
    object StringField20: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField13: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object dsSmpDataPrecZ: TDataSource
    DataSet = cdsSmpDataPrecZ
    Left = 256
    Top = 533
  end
  object qSmpDataZerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'9Zerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 174
    Top = 483
  end
  object cdsSmpDataZerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataZerr
    Params = <>
    Left = 226
    Top = 483
    object StringField21: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField14: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField22: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField15: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField23: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataZerr: TDataSource
    DataSet = cdsSmpDataZerr
    Left = 254
    Top = 483
  end
  object qErrTypeZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'HZert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 306
    Top = 485
  end
  object cdsErrTypeZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeZ
    Params = <>
    Left = 334
    Top = 485
    object StringField24: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField16: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeZ: TDataSource
    DataSet = cdsErrTypeZ
    Left = 362
    Top = 485
  end
  object qSamplesWithData: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IsotopeSystem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VariableID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleStartFrom'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleEndWith'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select distinct smpdata.sampleno'
      'from smpdata,smploc'
      'where smpdata.isosystem=:IsotopeSystem'
      'and smpdata.variableid=:VariableID'
      'and smpdata.sampleno=smploc.sampleno'
      'and smploc.countryabr='#39'ZAF'#39
      'and smpdata.sampleno >= :SampleStartFrom'
      'and smpdata.sampleno < :SampleEndWith'
      'order by smpdata.sampleno')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 18
  end
  object dspSamplesWithData: TDataSetProvider
    DataSet = qSamplesWithData
    Left = 714
    Top = 18
  end
  object cdsSamplesWithData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSamplesWithData'
    Left = 742
    Top = 18
    object cdsSamplesWithDataSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsSamplesWithData: TDataSource
    DataSet = cdsSamplesWithData
    Left = 770
    Top = 18
  end
  object qRawSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RegAssocID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT SMPDATA.SAMPLENO, SMPDATA.FRAC,'
      '  SMPFRAC.ZONEID,'
      '  VARREGASSOC.REGASSOCID'
      'FROM SMPDATA,SMPLOC,VARREGASSOC,SMPFRAC'
      'WHERE SMPDATA.SAMPLENO=SMPLOC.SAMPLENO'
      'AND VARREGASSOC.REGASSOCID=:RegAssocID'
      'AND SMPDATA.SAMPLENO=SMPFRAC.SAMPLENO'
      'AND SMPDATA.FRAC=SMPFRAC.FRAC'
      'AND ( SMPLOC.CONTINENTID = '#39'AFR'#39
      ' ) '
      'AND ( SMPLOC.COUNTRYABR = '#39'ZAF'#39
      ' ) '
      'AND ( SMPDATA.SAMPLENO = '#39'Zeh SR4'#39
      ' ) ')
    SQLConnection = sqlcDateView
    Left = 554
    Top = 134
    object qRawSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Required = True
      Size = 15
    end
    object qRawSmpZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
  end
  object dsqRawSmp: TDataSource
    DataSet = qRawSmp
    Left = 582
    Top = 134
  end
  object dspRawSmp: TDataSetProvider
    DataSet = qRawSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 610
    Top = 134
  end
  object cdsRawSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRawSmp'
    Left = 630
    Top = 132
    object cdsRawSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRawSmpFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsRawSmpZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
    object cdsRawSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawSmpqRawDataXerr: TDataSetField
      FieldName = 'qRawDataXerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataX: TDataSetField
      FieldName = 'qRawDataX'
    end
    object cdsRawSmpqRawDataR: TDataSetField
      FieldName = 'qRawDataR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeX: TDataSetField
      FieldName = 'qRawErrTypeX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeY: TDataSetField
      FieldName = 'qRawErrTypeY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeZ: TDataSetField
      FieldName = 'qRawErrTypeZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueZ: TDataSetField
      FieldName = 'qRawNormalisedValueZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueY: TDataSetField
      FieldName = 'qRawNormalisedValueY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataPrecZ: TDataSetField
      FieldName = 'qRawDataPrecZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataZerr: TDataSetField
      FieldName = 'qRawDataZerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataZ: TDataSetField
      FieldName = 'qRawDataZ'
    end
    object cdsRawSmpqRawDataPrecY: TDataSetField
      FieldName = 'qRawDataPrecY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataYerr: TDataSetField
      FieldName = 'qRawDataYerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataY: TDataSetField
      FieldName = 'qRawDataY'
    end
    object cdsRawSmpqRawDataPrecX: TDataSetField
      FieldName = 'qRawDataPrecX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueX: TDataSetField
      FieldName = 'qRawNormalisedValueX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawAgePref: TDataSetField
      FieldName = 'qRawAgePref'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDiscordance: TDataSetField
      FieldName = 'qRawDiscordance'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawRef: TDataSetField
      FieldName = 'qRawRef'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawSmpLoc: TDataSetField
      FieldName = 'qRawSmpLoc'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataDM: TDataSetField
      FieldName = 'qRawDataDM'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataInclude: TDataSetField
      FieldName = 'qRawDataInclude'
    end
  end
  object dsRawSmp: TDataSource
    DataSet = cdsRawSmp
    Left = 664
    Top = 134
  end
  object qRawDataX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 184
    object qRawDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataX: TDataSource
    DataSet = qRawDataX
    Left = 580
    Top = 184
  end
  object cdsRawDataX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataX
    Params = <>
    Left = 604
    Top = 184
    object cdsRawDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataXqRawStandardValueX: TDataSetField
      FieldName = 'qRawStandardValueX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataX: TDataSource
    DataSet = cdsRawDataX
    Left = 632
    Top = 184
  end
  object qRawStandardValueX: TSQLQuery
    DataSource = dsqRawDataX
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 186
    object qRawStandardValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataXqRawStandardValueX
    Params = <>
    Left = 714
    Top = 186
    object cdsRawStandardValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueX: TDataSource
    DataSet = cdsRawStandardValueX
    Left = 742
    Top = 186
  end
  object qRawNormalisedValueX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 790
    Top = 186
    object qRawNormalisedValueXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueX
    Params = <>
    Left = 818
    Top = 186
    object cdsRawNormalisedValueXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueX: TDataSource
    DataSet = cdsRawNormalisedValueX
    Left = 846
    Top = 186
  end
  object qRawDataXerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'4Xerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 550
    Top = 232
    object qRawDataXerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataXerr: TDataSource
    DataSet = qRawDataXerr
    Left = 580
    Top = 232
  end
  object cdsRawDataXerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataXerr
    Params = <>
    Left = 606
    Top = 232
    object cdsRawDataXerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataXerr: TDataSource
    DataSet = cdsRawDataXerr
    Left = 630
    Top = 232
  end
  object qRawErrTypeX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'CXert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 234
    object qRawErrTypeXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeX
    Params = <>
    Left = 714
    Top = 234
    object cdsRawErrTypeXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeX: TDataSource
    DataSet = cdsRawErrTypeX
    Left = 742
    Top = 234
  end
  object qRawDataPrecX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'AXpre'#39)
    SQLConnection = sqlcDateView
    Left = 552
    Top = 278
    object qRawDataPrecXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecX
    Params = <>
    Left = 604
    Top = 278
    object cdsRawDataPrecXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecX: TDataSource
    DataSet = cdsRawDataPrecX
    Left = 632
    Top = 278
  end
  object qRawDataY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 322
    object qRawDataYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataYFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataYREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataY: TDataSource
    DataSet = qRawDataY
    Left = 582
    Top = 322
  end
  object cdsRawDataY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataY
    Params = <>
    Left = 604
    Top = 322
    object cdsRawDataYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataYFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataYqRawStandardValueY: TDataSetField
      FieldName = 'qRawStandardValueY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataY: TDataSource
    DataSet = cdsRawDataY
    Left = 632
    Top = 322
  end
  object qRawStandardValueY: TSQLQuery
    DataSource = dsqRawDataY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 324
    object qRawStandardValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataYqRawStandardValueY
    Params = <>
    Left = 714
    Top = 324
    object cdsRawStandardValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueY: TDataSource
    DataSet = cdsRawStandardValueY
    Left = 742
    Top = 324
  end
  object qRawNormalisedValueY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 794
    Top = 324
    object qRawNormalisedValueYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueY
    Params = <>
    Left = 822
    Top = 324
    object cdsRawNormalisedValueYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueY: TDataSource
    DataSet = cdsRawNormalisedValueY
    Left = 850
    Top = 324
  end
  object qRawDataYerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'6Yerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 554
    Top = 368
    object qRawDataYerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataYerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataYerr: TDataSource
    DataSet = qRawDataYerr
    Left = 580
    Top = 368
  end
  object cdsRawDataYerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataYerr
    Params = <>
    Left = 606
    Top = 368
    object cdsRawDataYerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataYerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataYerr: TDataSource
    DataSet = cdsRawDataYerr
    Left = 634
    Top = 368
  end
  object qRawErrTypeY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'DYert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 370
    object qRawErrTypeYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeY
    Params = <>
    Left = 714
    Top = 370
    object cdsRawErrTypeYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeY: TDataSource
    DataSet = cdsRawErrTypeY
    Left = 742
    Top = 370
  end
  object qRawDataPrecY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'BYpre'#39)
    SQLConnection = sqlcDateView
    Left = 552
    Top = 414
    object qRawDataPrecYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecY
    Params = <>
    Left = 604
    Top = 414
    object cdsRawDataPrecYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecY: TDataSource
    DataSet = cdsRawDataPrecY
    Left = 632
    Top = 414
  end
  object qRawDataR: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'7R'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 688
    Top = 420
    object qRawDataRSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataRSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataR: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataR
    Params = <>
    Left = 716
    Top = 420
    object cdsRawDataRSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataRSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qRawDataZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 556
    Top = 457
    object qRawDataZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataZREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
  end
  object dsqRawDataZ: TDataSource
    DataSet = qRawDataZ
    Left = 586
    Top = 457
  end
  object cdsRawDataZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataZ
    Params = <>
    Left = 608
    Top = 457
    object cdsRawDataZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataZqRawStandardValueZ: TDataSetField
      FieldName = 'qRawStandardValueZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataZ: TDataSource
    DataSet = cdsRawDataZ
    Left = 636
    Top = 457
  end
  object dsRawDataR: TDataSource
    DataSet = cdsRawDataR
    Left = 744
    Top = 420
  end
  object qRawStandardValueZ: TSQLQuery
    DataSource = dsqRawDataZ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 690
    Top = 459
    object qRawStandardValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataZqRawStandardValueZ
    Params = <>
    Left = 718
    Top = 459
    object cdsRawStandardValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueZ: TDataSource
    DataSet = cdsRawStandardValueZ
    Left = 746
    Top = 459
  end
  object qRawNormalisedValueZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 798
    Top = 459
    object qRawNormalisedValueZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueZ
    Params = <>
    Left = 826
    Top = 459
    object cdsRawNormalisedValueZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueZ: TDataSource
    DataSet = cdsRawNormalisedValueZ
    Left = 854
    Top = 459
  end
  object qRawDataZerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'9Zerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 558
    Top = 507
    object qRawDataZerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataZerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataZerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataZerr
    Params = <>
    Left = 610
    Top = 507
    object cdsRawDataZerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataZerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataZerr: TDataSource
    DataSet = cdsRawDataZerr
    Left = 638
    Top = 507
  end
  object qRawErrTypeZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'HZert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 690
    Top = 509
    object qRawErrTypeZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeZ
    Params = <>
    Left = 718
    Top = 509
    object cdsRawErrTypeZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeZ: TDataSource
    DataSet = cdsRawErrTypeZ
    Left = 746
    Top = 509
  end
  object qRawDataPrecZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'GZpre'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 557
    object qRawDataPrecZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecZ
    Params = <>
    Left = 612
    Top = 557
    object cdsRawDataPrecZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecZ: TDataSource
    DataSet = cdsRawDataPrecZ
    Left = 640
    Top = 557
  end
  object cdsData: TClientDataSet
    PersistDataPacket.Data = {
      860100009619E0BD010000001800000010000000000003000000860104745265
      6304000100000000000853616D706C654E6F0100490000000100055749445448
      0200020014000446726163010049000000010005574944544802000200140006
      5A6F6E6549440100490000000100055749445448020002000200095062323037
      5532333508000400000000000E5062323037553233355369676D610800040000
      0000000950623230365532333808000400000000000E50623230365532333853
      69676D6108000400000000000955323338506232303608000400000000000E55
      32333850623230365369676D6108000400000000000A50623230375062323036
      08000400000000000F506232303750623230365369676D610800040000000000
      09496E636C756465594E01004900000001000557494454480200020001001250
      657263656E74436F6E636F7264616E636508000400000000000C507265666572
      7265644167650800040000000000115072656665727265644167655369676D61
      08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 120
    object cdsDatatRec: TIntegerField
      FieldName = 'tRec'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDataSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object cdsDataFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsDataZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsDataPb207U235: TFloatField
      FieldName = 'Pb207U235'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb207U235Sigma: TFloatField
      FieldName = 'Pb207U235Sigma'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb206U238: TFloatField
      FieldName = 'Pb206U238'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb206U238Sigma: TFloatField
      FieldName = 'Pb206U238Sigma'
      DisplayFormat = '###0.000'
    end
    object cdsDataU238Pb206: TFloatField
      FieldName = 'U238Pb206'
      DisplayFormat = '###0.00'
    end
    object cdsDataU238Pb206Sigma: TFloatField
      FieldName = 'U238Pb206Sigma'
      DisplayFormat = '###0.00'
    end
    object cdsDataPb207Pb206: TFloatField
      FieldName = 'Pb207Pb206'
      DisplayFormat = '#0.00000'
    end
    object cdsDataPb207Pb206Sigma: TFloatField
      FieldName = 'Pb207Pb206Sigma'
      DisplayFormat = '#0.00000'
    end
    object cdsDataIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object cdsDataPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
      DisplayFormat = '###0.0'
    end
    object cdsDataPreferredAge: TFloatField
      FieldName = 'PreferredAge'
      DisplayFormat = '###0.00'
    end
    object cdsDataPreferredAgeSigma: TFloatField
      FieldName = 'PreferredAgeSigma'
      DisplayFormat = '###0.00'
    end
  end
  object dsData: TDataSource
    DataSet = cdsData
    Left = 768
    Top = 120
  end
  object qRawDiscordance: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'IDisc'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 598
    object qRawDiscordanceSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDiscordanceFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDiscordance: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDiscordance
    Params = <>
    Left = 612
    Top = 598
    object cdsRawDiscordanceSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDiscordanceFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDiscordance: TDataSource
    DataSet = cdsRawDiscordance
    Left = 640
    Top = 598
  end
  object qRawAgePref: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 646
    object qRawAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawAgePrefREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object cdsRawAgePref: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawAgePref
    Params = <>
    Left = 612
    Top = 646
    object cdsRawAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefqRawDataAgeerr: TDataSetField
      FieldName = 'qRawDataAgeerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawAgePref: TDataSource
    DataSet = cdsRawAgePref
    Left = 640
    Top = 646
  end
  object dsqRawAgePref: TDataSource
    DataSet = qRawAgePref
    Left = 588
    Top = 648
  end
  object qRawDataAgeerr: TSQLQuery
    DataSource = dsqRawAgePref
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'KAerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 558
    Top = 696
    object qRawDataAgeerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataAgeerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataAgeerr: TDataSource
    DataSet = qRawDataAgeerr
    Left = 588
    Top = 696
  end
  object cdsRawDataAgeerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawAgePrefqRawDataAgeerr
    Params = <>
    Left = 614
    Top = 696
    object cdsRawDataAgeerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataAgeerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataAgeerr: TDataSource
    DataSet = cdsRawDataAgeerr
    Left = 638
    Top = 696
  end
  object cdsPDF: TClientDataSet
    PersistDataPacket.Data = {
      4D0000009619E0BD0100000018000000030000000000030000004D0004537465
      7004000100000000000C5044464461746156616C756508000400000000000850
      444656616C756508000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 72
    object cdsPDFStep: TIntegerField
      FieldName = 'Step'
      DisplayFormat = '###0'
    end
    object cdsPDFPDFDataValue: TFloatField
      FieldName = 'PDFDataValue'
      DisplayFormat = '####0.000'
    end
    object cdsPDFPDFValue: TFloatField
      FieldName = 'PDFValue'
      DisplayFormat = '##0.00000'
    end
  end
  object dsPDF: TDataSource
    DataSet = cdsPDF
    Left = 764
    Top = 72
  end
  object cdsPeaksFound: TClientDataSet
    PersistDataPacket.Data = {
      690000009619E0BD010000001800000005000000000003000000690001690400
      01000000000003416765080004000000000009416765506C7573393508000400
      000000000A4167654D696E7573393508000400000000000B50726F626162696C
      69747908000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 72
    object cdsPeaksFoundi: TIntegerField
      FieldName = 'i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPeaksFoundAge: TFloatField
      FieldName = 'Age'
      DisplayFormat = '###0.000'
    end
    object cdsPeaksFoundAgePlus95: TFloatField
      FieldName = 'AgePlus95'
      DisplayFormat = '###0.000'
    end
    object cdsPeaksFoundAgeMinus95: TFloatField
      FieldName = 'AgeMinus95'
      DisplayFormat = '###0.000'
    end
    object cdsPeaksFoundProbability: TFloatField
      FieldName = 'Probability'
      DisplayFormat = '##0.00'
    end
  end
  object dsPeaksFound: TDataSource
    DataSet = cdsPeaksFound
    Left = 844
    Top = 72
  end
  object qRawRef: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  DISTINCT SMPDATA.SAMPLENO,'
      '  SMPDATA.REFNUM,'
      '  SOURCELIST.SOURCESHORT'
      'FROM SMPDATA,VARREG,SOURCELIST'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39
      'AND SMPDATA.REFNUM=SOURCELIST.SOURCENUM')
    SQLConnection = sqlcDateView
    Left = 712
    Top = 598
    object qRawRefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object cdsRawRef: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawRef
    Params = <>
    Left = 740
    Top = 598
    object cdsRawRefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsRawRef: TDataSource
    DataSet = cdsRawRef
    Left = 768
    Top = 598
  end
  object qRawSmpLoc: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPLOC.COUNTRYABR, SMPLOC.CONTINENTID,'
      '  SMPLOC.LONGITUDE, SMPLOC.LATITUDE,SMPLOC.ELEVATION,'
      '  SMPLOC.LITHOLOGY,LITHCLASSES.LITHCLASS'
      'FROM SMPLOC,LITHOL,LITHCLASSES'
      'WHERE SMPLOC.SAMPLENO = :SampleNo'
      'AND SMPLOC.LITHOLOGY=LITHOL.LITHOLOGY'
      'AND LITHOL.LITHCLASSID=LITHCLASSES.LITHCLASSID')
    SQLConnection = sqlcDateView
    Left = 720
    Top = 648
    object qRawSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qRawSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qRawSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawSmpLocLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qRawSmpLocLITHCLASS: TStringField
      FieldName = 'LITHCLASS'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawSmpLoc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawSmpLoc
    Params = <>
    Left = 752
    Top = 648
    object cdsRawSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsRawSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsRawSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsRawSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsRawSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.000'
    end
    object cdsRawSmpLocLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsRawSmpLocLITHCLASS: TStringField
      FieldName = 'LITHCLASS'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawSmpLoc: TDataSource
    DataSet = cdsRawSmpLoc
    Left = 784
    Top = 648
  end
  object dsDataHf: TDataSource
    DataSet = cdsDataHf
    Left = 848
    Top = 120
  end
  object cdsDataHf: TClientDataSet
    PersistDataPacket.Data = {
      AE0100009619E0BD010000001800000013000000000003000000AE0101690400
      0100000000000853616D706C654E6F0100490000000100055749445448020002
      001E0004467261630100490000000100055749445448020002001400065A6F6E
      65494401004900000001000557494454480200020002000C5072656665727265
      644167650800040000000000115072656665727265644167655369676D610800
      0400000000001250657263656E74436F6E636F7264616E636508000400000000
      0009496E636C756465594E01004900000001000557494454480200020001000A
      3137364C75313737486608000400000000000F3137364C753137374866536967
      6D6108000400000000000A3137364866313737486608000400000000000F3137
      36486631373748665369676D61080004000000000009496E6974526174696F08
      000400000000000E496E6974526174696F5369676D6108000400000000000759
      6D6F64656C69080004000000000007457073696C6F6E08000400000000000C45
      7073696C6F6E5369676D6108000400000000000354444D080004000000000008
      54444D5369676D6108000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 120
    object cdsDataHfi: TIntegerField
      FieldName = 'i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDataHfSampleNo: TStringField
      FieldName = 'SampleNo'
      Size = 30
    end
    object cdsDataHfFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsDataHfZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsDataHfPreferredAge: TFloatField
      FieldName = 'PreferredAge'
      DisplayFormat = '###0.00'
    end
    object cdsDataHfPreferredAgeSigma: TFloatField
      FieldName = 'PreferredAgeSigma'
      DisplayFormat = '###0.00'
    end
    object cdsDataHfPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
      DisplayFormat = '##0.00'
    end
    object cdsDataHfIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object cdsDataHf176Lu177Hf: TFloatField
      FieldName = '176Lu177Hf'
      DisplayFormat = '##0.0000'
    end
    object cdsDataHf176Lu177HfSigma: TFloatField
      FieldName = '176Lu177HfSigma'
      DisplayFormat = '##0.0000'
    end
    object cdsDataHf176Hf177Hf: TFloatField
      FieldName = '176Hf177Hf'
      DisplayFormat = '##0.000000'
    end
    object cdsDataHf176Hf177HfSigma: TFloatField
      FieldName = '176Hf177HfSigma'
      DisplayFormat = '##0.000000'
    end
    object cdsDataHfInitRatio: TFloatField
      FieldName = 'InitRatio'
      DisplayFormat = '##0.000000'
    end
    object cdsDataHfInitRatioSigma: TFloatField
      FieldName = 'InitRatioSigma'
      DisplayFormat = '##0.000000'
    end
    object cdsDataHfYmodeli: TFloatField
      FieldName = 'Ymodeli'
      DisplayFormat = '#0.000000'
    end
    object cdsDataHfEpsilon: TFloatField
      FieldName = 'Epsilon'
      DisplayFormat = '##0.00'
    end
    object cdsDataHfEpsilonSigma: TFloatField
      FieldName = 'EpsilonSigma'
      DisplayFormat = '##0.00'
    end
    object cdsDataHfTDM: TFloatField
      FieldName = 'TDM'
      DisplayFormat = '###0.00'
    end
    object cdsDataHfTDMSigma: TFloatField
      FieldName = 'TDMSigma'
      DisplayFormat = '###0.00'
    end
  end
  object qRawDataDM: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'LDM'#39)
    SQLConnection = sqlcDateView
    Left = 832
    Top = 558
    object qRawDataDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
    end
    object qRawDataDMFRAC: TStringField
      FieldName = 'FRAC'
      Size = 15
    end
    object qRawDataDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Size = 15
    end
    object qRawDataDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Size = 15
    end
    object qRawDataDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object qRawDataDMREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataDM: TDataSource
    DataSet = qRawDataDM
    Left = 860
    Top = 560
  end
  object cdsRawDataDM: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataDM
    Params = <>
    Left = 884
    Top = 558
    object cdsRawDataDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
    end
    object cdsRawDataDMFRAC: TStringField
      FieldName = 'FRAC'
      Size = 15
    end
    object cdsRawDataDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Size = 15
    end
    object cdsRawDataDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Size = 15
    end
    object cdsRawDataDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object cdsRawDataDMqRawDataDMerr: TDataSetField
      FieldName = 'qRawDataDMerr'
    end
    object cdsRawDataDMREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataDM: TDataSource
    DataSet = cdsRawDataDM
    Left = 912
    Top = 558
  end
  object qRawDataDMerr: TSQLQuery
    DataSource = dsqRawDataDM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'MDMer'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 830
    Top = 600
    object qRawDataDMerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataDMerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataDMerr: TDataSource
    DataSet = qRawDataDMerr
    Left = 860
    Top = 600
  end
  object cdsRawDataDMerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataDMqRawDataDMerr
    Params = <>
    Left = 886
    Top = 600
    object cdsRawDataDMerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataDMerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataDMerr: TDataSource
    DataSet = cdsRawDataDMerr
    Left = 910
    Top = 600
  end
  object qExisting: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsotopeSystem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select distinct isorgr30.recordid,  isorgr30.countryabr,'
      '  isorgr30.unitid, isorgr30.materialabr, isorgr30.isotopesystem,'
      '  isorgr30.approachabr, isorgr30.techabr, isorgr30.interpabr,'
      '  isorgr30.rage, isorgr30.rageperror, isorgr30.ragemerror,'
      '  suite.unitname, suite.unitrank, country.continentid,'
      '  material.materialdescription, approach.approachdescription,'
      '  technique.technique, interpretation.interpretation'
      
        'from isorgr30, smpreg, suite, country, material, technique,appro' +
        'ach,interpretation'
      'where smpreg.sampleno = :SampleNo'
      'and smpreg.recordid=isorgr30.recordid'
      'and country.countryabr=isorgr30.countryabr'
      'and isorgr30.isotopesystem = :IsotopeSystem'
      'and isorgr30.unitid=suite.unitid'
      'and isorgr30.materialabr=material.materialabr'
      'and isorgr30.approachabr=approach.approachabr'
      'and isorgr30.techabr=technique.techabr'
      'and isorgr30.interpabr=interpretation.interpabr')
    SQLConnection = sqlcDateView
    Left = 832
    Top = 240
  end
  object dspExisting: TDataSetProvider
    DataSet = qExisting
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 864
    Top = 240
  end
  object cdsExisting: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExisting'
    Left = 896
    Top = 240
    object cdsExistingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsExistingCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsExistingUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsExistingMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsExistingISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsExistingAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsExistingTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsExistingINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsExistingRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsExistingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object cdsExistingCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsExistingMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsExistingAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsExistingTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsExistingINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
  end
  object dsExisting: TDataSource
    DataSet = cdsExisting
    Left = 928
    Top = 240
  end
  object qRecalcSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT SMPDATA.SAMPLENO, SMPDATA.FRAC, '
      '  SMPDATA.ISOSYSTEM,VARREGASSOC.REGASSOCID'
      'from SMPDATA,VARREGASSOC'
      'where SMPDATA.SAMPLENO='#39'A'#39
      'AND VARREGASSOC.REGASSOCID=:REGASSOCID'
      'Order by SMPDATA.SAMPLENO, SMPDATA.FRAC')
    SQLConnection = sqlcDateView
    Left = 170
    Top = 582
    object qRecalcSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
    object qRecalcSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
  end
  object dsqRecalcSmp: TDataSource
    DataSet = qRecalcSmp
    Left = 198
    Top = 582
  end
  object dspRecalcSmp: TDataSetProvider
    DataSet = qRecalcSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 226
    Top = 582
  end
  object cdsRecalcSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecalcSmp'
    Left = 254
    Top = 580
    object cdsRecalcSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
    object cdsRecalcSmpqRecalcZ: TDataSetField
      FieldName = 'qRecalcZ'
    end
    object cdsRecalcSmpqRecalcAgePref: TDataSetField
      FieldName = 'qRecalcAgePref'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcSmpqRecalcNormalisedY: TDataSetField
      FieldName = 'qRecalcNormalisedY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcSmpqRecalcY: TDataSetField
      FieldName = 'qRecalcY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcSmpqRecalcNormalisedX: TDataSetField
      FieldName = 'qRecalcNormalisedX'
    end
    object cdsRecalcSmpqRecalcX: TDataSetField
      FieldName = 'qRecalcX'
    end
    object cdsRecalcSmpqRecalcDM: TDataSetField
      FieldName = 'qRecalcDM'
    end
    object cdsRecalcSmpqRecalcInit: TDataSetField
      FieldName = 'qRecalcInit'
    end
    object cdsRecalcSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
  end
  object dsRecalcSmp: TDataSource
    DataSet = cdsRecalcSmp
    Left = 280
    Top = 582
  end
  object qRecalcY: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 168
    Top = 626
    object qRecalcYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRecalcYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRecalcY: TDataSource
    DataSet = qRecalcY
    Left = 198
    Top = 626
  end
  object cdsRecalcY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcY
    Params = <>
    Left = 220
    Top = 626
    object cdsRecalcYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsRecalcYqRecalcStandardY: TDataSetField
      FieldName = 'qRecalcStandardY'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcY: TDataSource
    DataSet = cdsRecalcY
    Left = 248
    Top = 626
  end
  object qRecalcStandardY: TSQLQuery
    DataSource = dsqRecalcY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 628
    object qRecalcStandardYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcStandardY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcYqRecalcStandardY
    Params = <>
    Left = 330
    Top = 628
  end
  object dsRecalcStandardValueY: TDataSource
    DataSet = cdsRecalcStandardY
    Left = 358
    Top = 628
  end
  object qRecalcNormalisedY: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 410
    Top = 628
    object qRecalcNormalisedYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRecalcNormalisedYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcNormalisedY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcNormalisedY
    Params = <>
    Left = 438
    Top = 628
    object cdsRecalcNormalisedYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcNormalisedYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcNormalisedY: TDataSource
    DataSet = cdsRecalcNormalisedY
    Left = 466
    Top = 628
  end
  object qRecalcAgePref: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39)
    SQLConnection = sqlcDateView
    Left = 168
    Top = 678
    object qRecalcAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsqRecalcAgePref: TDataSource
    DataSet = qRecalcAgePref
    Left = 196
    Top = 680
  end
  object cdsRecalcAgePref: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcAgePref
    Params = <>
    Left = 220
    Top = 678
    object cdsRecalcAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcAgePref: TDataSource
    DataSet = cdsRecalcAgePref
    Left = 248
    Top = 678
  end
  object qRecalcZ: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'EZ'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 164
    Top = 729
    object qRecalcZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRecalcZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRecalcZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRecalcZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRecalcZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRecalcZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsqRecalcZ: TDataSource
    DataSet = qRecalcZ
    Left = 194
    Top = 729
  end
  object cdsRecalcZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcZ
    Params = <>
    Left = 216
    Top = 729
    object cdsRecalcZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRecalcZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRecalcZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRecalcZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRecalcZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRecalcZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsRecalcZ: TDataSource
    DataSet = cdsRecalcZ
    Left = 244
    Top = 729
  end
  object cdsInitials: TClientDataSet
    PersistDataPacket.Data = {
      E50000009619E0BD01000000180000000B000000000003000000E50001690400
      0100000000000853616D706C654E6F0100490000000100055749445448020002
      0014000446726163010049000000010005574944544802000200140003416765
      080004000000000009416765506C7573393508000400000000000A4167654D69
      6E75733935080004000000000007496E697469616C08000400000000000C496E
      697469616C4572726F72080004000000000007457073696C6F6E080004000000
      00000C457073696C6F6E4572726F72080004000000000007596D6F64656C6908
      000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 904
    Top = 72
    object cdsInitialsi: TIntegerField
      FieldName = 'i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsInitialsSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object cdsInitialsFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsInitialsAge: TFloatField
      FieldName = 'Age'
      DisplayFormat = '###0.000'
    end
    object cdsInitialsAgePlus95: TFloatField
      FieldName = 'AgePlus95'
      DisplayFormat = '###0.000'
    end
    object cdsInitialsAgeMinus95: TFloatField
      FieldName = 'AgeMinus95'
      DisplayFormat = '###0.000'
    end
    object cdsInitialsInitial: TFloatField
      FieldName = 'Initial'
      DisplayFormat = '###0.000000'
    end
    object cdsInitialsInitialError: TFloatField
      FieldName = 'InitialError'
      DisplayFormat = '###0.000000'
    end
    object cdsInitialsEpsilon: TFloatField
      FieldName = 'Epsilon'
      DisplayFormat = '###0.000'
    end
    object cdsInitialsEpsilonError: TFloatField
      FieldName = 'EpsilonError'
      DisplayFormat = '###0.000'
    end
    object cdsInitialsYmodeli: TFloatField
      FieldName = 'Ymodeli'
      DisplayFormat = '###0.000000'
    end
  end
  object dsInitials: TDataSource
    DataSet = cdsInitials
    Left = 932
    Top = 72
  end
  object qNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 8
    Top = 652
  end
  object cdsDataHfyes: TClientDataSet
    PersistDataPacket.Data = {
      A40100009619E0BD010000001800000012000000000003000000A4010853616D
      706C654E6F0100490000000100055749445448020002001E0004467261630100
      490000000100055749445448020002001400065A6F6E65494401004900000001
      0005574944544802000200020007457073696C6F6E08000400000000000C4570
      73696C6F6E5369676D6108000400000000000C50726566657272656441676508
      00040000000000115072656665727265644167655369676D6108000400000000
      0009496E636C756465594E010049000000010005574944544802000200010012
      50657263656E74436F6E636F7264616E636508000400000000000354444D0800
      0400000000000854444D5369676D61080004000000000007596D6F64656C6908
      0004000000000009496E6974526174696F08000400000000000E496E69745261
      74696F5369676D6108000400000000000A3137364C7531373748660800040000
      0000000F3137364C7531373748665369676D6108000400000000000A31373648
      66313737486608000400000000000F313736486631373748665369676D610800
      0400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 120
    object cdsDataHfyesSampleNo: TStringField
      FieldName = 'SampleNo'
      Size = 30
    end
    object cdsDataHfyesFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsDataHfyesZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsDataHfyesEpsilon: TFloatField
      FieldName = 'Epsilon'
    end
    object cdsDataHfyesEpsilonSigma: TFloatField
      FieldName = 'EpsilonSigma'
    end
    object cdsDataHfyesPreferredAge: TFloatField
      FieldName = 'PreferredAge'
    end
    object cdsDataHfyesPreferredAgeSigma: TFloatField
      FieldName = 'PreferredAgeSigma'
    end
    object cdsDataHfyesIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object cdsDataHfyesPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
    end
    object cdsDataHfyesTDM: TFloatField
      FieldName = 'TDM'
    end
    object cdsDataHfyesTDMSigma: TFloatField
      FieldName = 'TDMSigma'
    end
    object cdsDataHfyesYmodeli: TFloatField
      FieldName = 'Ymodeli'
    end
    object cdsDataHfyesInitRatio: TFloatField
      FieldName = 'InitRatio'
    end
    object cdsDataHfyesInitRatioSigma: TFloatField
      FieldName = 'InitRatioSigma'
    end
    object cdsDataHfyes176Lu177Hf: TFloatField
      FieldName = '176Lu177Hf'
    end
    object cdsDataHfyes176Lu177HfSigma: TFloatField
      FieldName = '176Lu177HfSigma'
    end
    object cdsDataHfyes176Hf177Hf: TFloatField
      FieldName = '176Hf177Hf'
    end
    object cdsDataHfyes176Hf177HfSigma: TFloatField
      FieldName = '176Hf177HfSigma'
    end
  end
  object dsDataHfyes: TDataSource
    DataSet = cdsDataHfyes
    Left = 928
    Top = 120
  end
  object qRawDataInclude: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'NIncl'#39)
    SQLConnection = sqlcDateView
    Left = 558
    Top = 739
    object qRawDataIncludeSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRawDataIncludeFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#0.0'
    end
  end
  object cdsRawDataInclude: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataInclude
    Params = <>
    Left = 610
    Top = 739
    object cdsRawDataIncludeSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRawDataIncludeFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#0.0'
    end
  end
  object dsRawDataInclude: TDataSource
    DataSet = cdsRawDataInclude
    Left = 638
    Top = 739
  end
  object cdsPeaks: TClientDataSet
    PersistDataPacket.Data = {
      600000009619E0BD010000001800000004000000000003000000600008506561
      6B537465700400010000000000075065616B4167650800040000000000095065
      616B56616C756508000400000000000A5065616B4368616E6765080004000000
      00000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 984
    Top = 176
    object cdsPeaksPeakStep: TIntegerField
      FieldName = 'PeakStep'
    end
    object cdsPeaksPeakAge: TFloatField
      FieldName = 'PeakAge'
    end
    object cdsPeaksPeakValue: TFloatField
      FieldName = 'PeakValue'
    end
    object cdsPeaksPeakChange: TFloatField
      FieldName = 'PeakChange'
    end
  end
  object dsPeaks: TDataSource
    DataSet = cdsPeaks
    Left = 1016
    Top = 176
  end
  object qRecalcX: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 168
    Top = 778
    object StringField25: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField26: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField27: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField28: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FloatField17: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField29: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FloatField18: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField30: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRecalcX: TDataSource
    DataSet = qRecalcX
    Left = 198
    Top = 778
  end
  object cdsRecalcX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcX
    Params = <>
    Left = 220
    Top = 778
    object cdsRecalcXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsRecalcXqRecalcStandardX: TDataSetField
      FieldName = 'qRecalcStandardX'
    end
  end
  object dsRecalcX: TDataSource
    DataSet = cdsRecalcX
    Left = 248
    Top = 778
  end
  object qRecalcStandardX: TSQLQuery
    DataSource = dsqRecalcX
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 302
    Top = 780
    object FloatField21: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcStandardX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcXqRecalcStandardX
    Params = <>
    Left = 330
    Top = 780
  end
  object dsRecalcStandardValueX: TDataSource
    DataSet = cdsRecalcStandardX
    Left = 358
    Top = 780
  end
  object qRecalcNormalisedX: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 410
    Top = 780
    object StringField37: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField38: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField39: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField40: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FloatField22: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField41: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FloatField23: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FloatField24: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FloatField25: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcNormalisedX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcNormalisedX
    Params = <>
    Left = 438
    Top = 780
    object cdsRecalcNormalisedXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcNormalisedXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcNormalisedX: TDataSource
    DataSet = cdsRecalcNormalisedX
    Left = 466
    Top = 780
  end
  object qRecalcDM: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'LDM'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 300
    Top = 673
    object qRecalcDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcDMFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRecalcDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRecalcDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRecalcDMNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRecalcDMSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRecalcDMVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsqRecalcDM: TDataSource
    DataSet = qRecalcDM
    Left = 330
    Top = 673
  end
  object cdsRecalcDM: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcDM
    Params = <>
    Left = 352
    Top = 673
    object cdsRecalcDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcDMFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRecalcDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRecalcDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRecalcDMNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRecalcDMSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRecalcDMVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsRecalcDM: TDataSource
    DataSet = cdsRecalcDM
    Left = 380
    Top = 673
  end
  object dsRecalcInit: TDataSource
    DataSet = cdsRecalcInit
    Left = 380
    Top = 729
  end
  object cdsRecalcInit: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcInit
    Params = <>
    Left = 352
    Top = 729
    object cdsRecalcInitSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcInitFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcInitISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRecalcInitVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRecalcInitDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRecalcInitNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRecalcInitSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRecalcInitVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsqRecalcInit: TDataSource
    DataSet = qRecalcInit
    Left = 330
    Top = 729
  end
  object qRecalcInit: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'OInit'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 300
    Top = 729
    object qRecalcInitSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcInitFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcInitISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRecalcInitVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRecalcInitDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRecalcInitNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRecalcInitSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRecalcInitVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object qUpdateData: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 8
    Top = 704
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 96
    Top = 16
  end
  object cdsDataChem: TClientDataSet
    PersistDataPacket.Data = {
      3A0100009619E0BD01000000180000000E0000000000030000003A0101690400
      0100000000000853616D706C654E6F0100490000000100055749445448020002
      001E0004467261630100490000000100055749445448020002001400065A6F6E
      65494401004900000001000557494454480200020002000C5072656665727265
      644167650800040000000000115072656665727265644167655369676D610800
      0400000000001250657263656E74436F6E636F7264616E636508000400000000
      0009496E636C756465594E010049000000010005574944544802000200010004
      56617231080004000000000009566172315369676D6108000400000000000456
      617232080004000000000009566172325369676D610800040000000000045661
      7233080004000000000009566172335369676D6108000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 976
    Top = 120
    object cdsDataChemi: TIntegerField
      FieldName = 'i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDataChemSampleNo: TStringField
      FieldName = 'SampleNo'
      Size = 30
    end
    object cdsDataChemFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsDataChemZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsDataChemPreferredAge: TFloatField
      FieldName = 'PreferredAge'
      DisplayFormat = '###0.00'
    end
    object cdsDataChemPreferredAgeSigma: TFloatField
      FieldName = 'PreferredAgeSigma'
      DisplayFormat = '###0.00'
    end
    object cdsDataChemPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
      DisplayFormat = '##0.00'
    end
    object cdsDataChemIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object cdsDataChemVar1: TFloatField
      FieldName = 'Var1'
      DisplayFormat = '####0.000'
    end
    object cdsDataChemVar1Sigma: TFloatField
      FieldName = 'Var1Sigma'
      DisplayFormat = '####0.000'
    end
    object cdsDataChemVar2: TFloatField
      FieldName = 'Var2'
      DisplayFormat = '####0.000'
    end
    object cdsDataChemVar2Sigma: TFloatField
      FieldName = 'Var2Sigma'
      DisplayFormat = '####0.000'
    end
    object cdsDataChemVar3: TFloatField
      FieldName = 'Var3'
      DisplayFormat = '####0.000'
    end
    object cdsDataChemVar3Sigma: TFloatField
      FieldName = 'Var3Sigma'
      DisplayFormat = '####0.000'
    end
  end
  object dsDataChem: TDataSource
    DataSet = cdsDataChem
    Left = 1008
    Top = 120
  end
end
