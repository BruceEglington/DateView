object dmDV: TdmDV
  Height = 818
  Width = 954
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
    Left = 36
    Top = 14
  end
  object Query1: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT ISORGR30.CountryAbr, ISORGR30.UnitID, ISORGR30.M' +
        'aterialAbr, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      'ISORGR30.InterpAbr, ISORGR30.PrefLevel,  '
      'ISORGR30.AgeUnits,  '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'COUNTRY.Country, MATERIAL.MaterialDescription, Interpretation.In' +
        'terpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR,'
      'SOURCELIST.SourceSHORT,SUITE.UNITNAME,SOURCEA.REFNUM,'
      'ISOFOR.WHOFORID'
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,SourceA,SOUR' +
        'CELIST,'
      '      ISOFOR'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      
        'AND ISORGR30.MethodAbr = METHODS.MethodAbr AND SOURCEA.REFNUM = ' +
        'SOURCELIST.SOURCENUM'
      'AND ISORGR30.RecordID = SourceA.RecordID'
      'AND ISORGR30.RECORDID=ISOFOR.RECORDID'
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      
        'ORDER by IsoRgr30.CountryAbr,Suite.UnitName,IsoRgr30.MaterialAbr' +
        ','
      
        '  IsoRgr30.IsotopeSystem,IsoRgr30.ApproachAbr,IsoRgr30.InterpAbr' +
        ','
      '  IsoRgr30.PrefLevel,IsoRgr30.TechAbr,IsoRgr30.IAge')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 14
    object Query1COUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object Query1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object Query1MATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object Query1ISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object Query1APPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object Query1TECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object Query1INTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object Query1PREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object Query1AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object Query1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object Query1LITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object Query1METHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Query1RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object Query1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object Query1MATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object Query1INTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object Query1APPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object Query1TECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object Query1ISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object Query1RAGE: TFloatField
      FieldName = 'RAGE'
    end
    object Query1RAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object Query1RAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object Query1SOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object Query1REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object Query1WHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Left = 154
    Top = 14
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 182
    Top = 14
    object cdsQuery1COUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsQuery1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQuery1MATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsQuery1ISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsQuery1APPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsQuery1TECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsQuery1INTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuery1PREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsQuery1AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQuery1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsQuery1LITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQuery1METHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQuery1RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQuery1MATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQuery1INTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsQuery1APPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQuery1TECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsQuery1ISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsQuery1RAGE: TFloatField
      FieldName = 'RAGE'
    end
    object cdsQuery1RAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object cdsQuery1RAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object cdsQuery1SOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsQuery1REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsQuery1WHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 210
    Top = 14
  end
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Continent')
    SQLConnection = sqlcDateView
    Left = 30
    Top = 58
    object qContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Left = 58
    Top = 58
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 86
    Top = 58
    object cdsContinentsCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TStringField
      DisplayLabel = 'Continent'
      FieldName = 'CONTINENT'
    end
  end
  object qCountries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select COUNTRY.COUNTRYABR, COUNTRY.COUNTRY, COUNTRY.COUNTRYOFFSE' +
        'T,'
      
        '  COUNTRY.COUNTRYOFFSET2, COUNTRY.COUNTRYOFFSET3, COUNTRY.CONTIN' +
        'ENTID,'
      '  CONTINENT.CONTINENT, COUNTRY.COUNTRYHASRECORDS'
      'from COUNTRY, CONTINENT'
      'where COUNTRY.CONTINENTID=CONTINENT.CONTINENTID'
      'and COUNTRY.COUNTRYHASRECORDS = '#39'Y'#39
      'order by COUNTRY.COUNTRY')
    SQLConnection = sqlcDateView
    Left = 28
    Top = 104
    object qCountriesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qCountriesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object qCountriesCOUNTRYOFFSET: TFloatField
      FieldName = 'COUNTRYOFFSET'
    end
    object qCountriesCOUNTRYOFFSET2: TFloatField
      FieldName = 'COUNTRYOFFSET2'
    end
    object qCountriesCOUNTRYOFFSET3: TFloatField
      FieldName = 'COUNTRYOFFSET3'
    end
    object qCountriesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qCountriesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qCountriesCOUNTRYHASRECORDS: TStringField
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspCountries: TDataSetProvider
    DataSet = qCountries
    Left = 56
    Top = 104
  end
  object cdsCountries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountries'
    Left = 84
    Top = 104
    object cdsCountriesCOUNTRYABR: TStringField
      DisplayLabel = 'Area ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsCountriesCOUNTRY: TStringField
      DisplayLabel = 'Area'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object cdsCountriesCOUNTRYOFFSET: TFloatField
      DisplayLabel = 'Area Ofst 1'
      FieldName = 'COUNTRYOFFSET'
      DisplayFormat = '###0.00'
    end
    object cdsCountriesCOUNTRYOFFSET2: TFloatField
      DisplayLabel = 'Area Ofst 2'
      FieldName = 'COUNTRYOFFSET2'
      DisplayFormat = '###0.00'
    end
    object cdsCountriesCOUNTRYOFFSET3: TFloatField
      DisplayLabel = 'Area Ofst 3'
      FieldName = 'COUNTRYOFFSET3'
      DisplayFormat = '###0.00'
    end
    object cdsCountriesCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsCountriesCONTINENT: TStringField
      DisplayLabel = 'Continent'
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsCountriesCOUNTRYHASRECORDS: TStringField
      DisplayLabel = 'Has Records'
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SUITE'
      'order by SUITE.UNITNAME')
    SQLConnection = sqlcDateView
    Left = 30
    Top = 146
    object qUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object qUnitsGISID: TIntegerField
      FieldName = 'GISID'
    end
    object qUnitsFORMATIONOFFSET: TFloatField
      FieldName = 'FORMATIONOFFSET'
    end
    object qUnitsFORMATIONOFFSET2: TFloatField
      FieldName = 'FORMATIONOFFSET2'
    end
    object qUnitsFORMATIONOFFSET3: TFloatField
      FieldName = 'FORMATIONOFFSET3'
    end
  end
  object dspUnits: TDataSetProvider
    DataSet = qUnits
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 60
    Top = 148
  end
  object cdsUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnits'
    Left = 88
    Top = 148
    object cdsUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Size = 5
    end
    object cdsUnitsGISID: TIntegerField
      FieldName = 'GISID'
    end
    object cdsUnitsFORMATIONOFFSET: TFloatField
      FieldName = 'FORMATIONOFFSET'
    end
    object cdsUnitsFORMATIONOFFSET2: TFloatField
      FieldName = 'FORMATIONOFFSET2'
    end
    object cdsUnitsFORMATIONOFFSET3: TFloatField
      FieldName = 'FORMATIONOFFSET3'
    end
  end
  object qLithol: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from LITHOL,LITHGROUP'
      'WHERE LITHOL.LITHGROUPID=LITHGROUP.LITHGROUPID'
      'order by LITHOL.LITHOLOGY')
    SQLConnection = sqlcDateView
    Left = 26
    Top = 178
    object qLitholLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qLitholLITHGROUPID: TSmallintField
      FieldName = 'LITHGROUPID'
      Required = True
    end
    object qLitholLITHGROUP: TStringField
      FieldName = 'LITHGROUP'
      Required = True
      Size = 30
    end
  end
  object dspLithol: TDataSetProvider
    DataSet = qLithol
    Left = 54
    Top = 178
  end
  object cdsLithol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLithol'
    Left = 82
    Top = 180
    object cdsLitholLITHOLOGY: TStringField
      DisplayLabel = 'Lithology'
      FieldName = 'LITHOLOGY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsLitholLITHGROUPID: TSmallintField
      FieldName = 'LITHGROUPID'
      Required = True
    end
    object cdsLitholLITHGROUP: TStringField
      FieldName = 'LITHGROUP'
      Required = True
      Size = 30
    end
  end
  object qInterpretations: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from INTERPRETATION'
      'order by INTERPRETATION.INTERPRETATION')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 218
    object qInterpretationsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object qInterpretationsINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Size = 30
    end
  end
  object dspInterpretations: TDataSetProvider
    DataSet = qInterpretations
    Left = 52
    Top = 218
  end
  object cdsInterpretations: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInterpretations'
    Left = 80
    Top = 218
    object cdsInterpretationsINTERPABR: TStringField
      DisplayLabel = 'Interp ID'
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsInterpretationsINTERPRETATION: TStringField
      DisplayLabel = 'Interpretation'
      FieldName = 'INTERPRETATION'
      Size = 30
    end
  end
  object qReferences: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT SOURCELIST.SOURCENUM, '
      '  SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,'
      '  CONTINENT.CONTINENT'
      'FROM SOURCELIST,CONTINENT'
      'WHERE CONTINENT.CONTINENTID = SOURCELIST.CONTINENTID'
      'order by SOURCELIST.SOURCESHORT')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 262
    object qReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object qReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ReadOnly = True
    end
  end
  object dspReferences: TDataSetProvider
    DataSet = qReferences
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 52
    Top = 262
  end
  object cdsReferences: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReferences'
    Left = 82
    Top = 262
    object cdsReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ReadOnly = True
    end
  end
  object qAgeUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from AgeUnits')
    SQLConnection = sqlcDateView
    Left = 26
    Top = 308
    object qAgeUnitsAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qAgeUnitsAGEFACTOR: TFloatField
      FieldName = 'AGEFACTOR'
    end
  end
  object dspAgeUnits: TDataSetProvider
    DataSet = qAgeUnits
    Left = 54
    Top = 308
  end
  object cdsAgeUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgeUnits'
    Left = 82
    Top = 310
    object cdsAgeUnitsAGEUNITS: TStringField
      DisplayLabel = 'Age Units'
      FieldName = 'AGEUNITS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsAgeUnitsAGEFACTOR: TFloatField
      DisplayLabel = 'Storage Factor'
      FieldName = 'AGEFACTOR'
    end
  end
  object qApproach: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from APPROACH'
      'order by APPROACH.APPROACHDESCRIPTION')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 352
    object qApproachAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object qApproachAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
  end
  object dspApproach: TDataSetProvider
    DataSet = qApproach
    Left = 50
    Top = 352
  end
  object cdsApproach: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApproach'
    Left = 78
    Top = 354
    object cdsApproachAPPROACHABR: TStringField
      DisplayLabel = 'Appr ID'
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsApproachAPPROACHDESCRIPTION: TStringField
      DisplayLabel = 'Approach'
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
  end
  object qTechniques: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from TECHNIQUE'
      'order by TECHNIQUE.TECHNIQUE')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 398
    object qTechniquesTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object qTechniquesTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
  end
  object dspTechniques: TDataSetProvider
    DataSet = qTechniques
    Left = 52
    Top = 398
  end
  object cdsTechniques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTechniques'
    Left = 80
    Top = 400
    object cdsTechniquesTECHABR: TStringField
      DisplayLabel = 'Tech ID'
      FieldName = 'TECHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsTechniquesTECHNIQUE: TStringField
      DisplayLabel = 'Technique'
      FieldName = 'TECHNIQUE'
      Size = 40
    end
  end
  object qIsoSystems: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ISOSYSTEM'
      'order by ISOSYSTEM.ISOSYSTEMNAME')
    SQLConnection = sqlcDateView
    Left = 22
    Top = 444
    object qIsoSystemsISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qIsoSystemsISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object qIsoSystemsISOSYSNO: TIntegerField
      FieldName = 'ISOSYSNO'
    end
    object qIsoSystemsDECAYCONST1: TFloatField
      FieldName = 'DECAYCONST1'
    end
    object qIsoSystemsDECAYCONST2: TFloatField
      FieldName = 'DECAYCONST2'
    end
  end
  object dspIsoSystems: TDataSetProvider
    DataSet = qIsoSystems
    Left = 50
    Top = 444
  end
  object cdsIsoSystems: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIsoSystems'
    Left = 80
    Top = 446
    object cdsIsoSystemsISOSYSTEM: TStringField
      DisplayLabel = 'Iso Sys ID'
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsIsoSystemsISOSYSTEMNAME: TStringField
      DisplayLabel = 'Isotope System'
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsIsoSystemsISOSYSNO: TIntegerField
      DisplayLabel = 'Iso Sys No'
      FieldName = 'ISOSYSNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsIsoSystemsDECAYCONST1: TFloatField
      DisplayLabel = 'Decay Const 1'
      FieldName = 'DECAYCONST1'
      DisplayFormat = '0.00000e+00'
    end
    object cdsIsoSystemsDECAYCONST2: TFloatField
      DisplayLabel = 'Decay Const 2'
      FieldName = 'DECAYCONST2'
      DisplayFormat = '0.00000e+00'
    end
  end
  object qPrefLevels: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PREFLEVEL'
      'ORDER BY PREFLEVEL.PREFLEVELNO')
    SQLConnection = sqlcDateView
    Left = 20
    Top = 490
    object qPrefLevelsPREFLEVELNO: TSmallintField
      FieldName = 'PREFLEVELNO'
      Required = True
    end
    object qPrefLevelsPREFDES: TMemoField
      FieldName = 'PREFDES'
      BlobType = ftMemo
      Size = 1
    end
    object qPrefLevelsPREFSHORT: TStringField
      FieldName = 'PREFSHORT'
      Required = True
      Size = 50
    end
  end
  object dspPrefLevels: TDataSetProvider
    DataSet = qPrefLevels
    Left = 46
    Top = 490
  end
  object cdsPrefLevels: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrefLevels'
    Left = 80
    Top = 492
    object cdsPrefLevelsPREFLEVELNO: TSmallintField
      DisplayLabel = 'Rating ID'
      FieldName = 'PREFLEVELNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrefLevelsPREFDES: TMemoField
      DisplayLabel = 'Rating'
      FieldName = 'PREFDES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPrefLevelsPREFSHORT: TStringField
      DisplayLabel = 'Rating summary'
      FieldName = 'PREFSHORT'
      Required = True
      Size = 50
    end
  end
  object qMaterial: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select MATERIAL.MATERIALABR, MATERIAL.MATERIALDESCRIPTION '
      'from MATERIAL'
      'order by MATERIAL.MATERIALDESCRIPTION')
    SQLConnection = sqlcDateView
    Left = 20
    Top = 536
    object qMaterialMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qMaterialMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Size = 50
    end
  end
  object dspMaterial: TDataSetProvider
    DataSet = qMaterial
    Left = 46
    Top = 536
  end
  object cdsMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial'
    Left = 74
    Top = 538
    object cdsMaterialMATERIALABR: TStringField
      DisplayLabel = 'Mtrl ID'
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsMaterialMATERIALDESCRIPTION: TStringField
      DisplayLabel = 'Material analysed'
      FieldName = 'MATERIALDESCRIPTION'
      Size = 50
    end
  end
  object qWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from FORLIST'
      'order by FORLIST.WHOFOR')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 584
    object qWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object qWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Size = 50
    end
  end
  object dspWhoFor: TDataSetProvider
    DataSet = qWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 584
  end
  object cdsWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWhoFor'
    Left = 70
    Top = 584
    object cdsWhoForWHOFORID: TStringField
      DisplayLabel = 'WhoFor ID'
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsWhoForWHOFOR: TStringField
      DisplayLabel = 'Who For'
      FieldName = 'WHOFOR'
      Size = 50
    end
  end
  object qValidationStatus: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ValidationStatus')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 632
    object qValidationStatusVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object qValidationStatusVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      Required = True
      Size = 30
    end
  end
  object dspValidationStatus: TDataSetProvider
    DataSet = qValidationStatus
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 632
  end
  object cdsValidationStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidationStatus'
    Left = 74
    Top = 632
    object cdsValidationStatusVALIDSTATUSID: TStringField
      DisplayLabel = 'Validation Status ID'
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidationStatusVALIDATIONSTATUS: TStringField
      DisplayLabel = 'Validation Status'
      FieldName = 'VALIDATIONSTATUS'
      Required = True
      Size = 30
    end
  end
  object qSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SMPLOC.SAMPLENO, SMPLOC.CONTINENTID , '
      '   SMPLOC.COUNTRYABR'
      'from SmpLoc'
      'order by SampleNo')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 596
    object StringField2: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSamplesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qSamplesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
  end
  object dspSamples: TDataSetProvider
    DataSet = qSamples
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 592
  end
  object cdsSamples: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSamples'
    Left = 270
    Top = 592
    object cdsSamplesSAMPLENO: TStringField
      DisplayLabel = 'Sample'
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSamplesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsSamplesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
  end
  object qBoundaries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from BOUNDARIES'
      'order by BOUNDARIES.BOUNDARYID')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 546
    object qBoundariesBOUNDARYID: TIntegerField
      FieldName = 'BOUNDARYID'
      Required = True
    end
    object qBoundariesBOUNDARYNAME: TStringField
      FieldName = 'BOUNDARYNAME'
      Required = True
      Size = 100
    end
  end
  object dspBoundaries: TDataSetProvider
    DataSet = qBoundaries
    Left = 236
    Top = 546
  end
  object cdsBoundaries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoundaries'
    Left = 264
    Top = 546
    object cdsBoundariesBOUNDARYID: TIntegerField
      DisplayLabel = 'Boundary ID'
      FieldName = 'BOUNDARYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBoundariesBOUNDARYNAME: TStringField
      DisplayLabel = 'Boundary'
      FieldName = 'BOUNDARYNAME'
      Required = True
      Size = 100
    end
  end
  object qBoundaryPositions: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from BoundaryPos'
      'order by BoundPosID')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 500
    object qBoundaryPositionsBOUNDPOSID: TStringField
      FieldName = 'BOUNDPOSID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qBoundaryPositionsBOUNDARYPOSITION: TStringField
      FieldName = 'BOUNDARYPOSITION'
      Required = True
      Size = 15
    end
  end
  object dspBoundaryPositions: TDataSetProvider
    DataSet = qBoundaryPositions
    Left = 236
    Top = 502
  end
  object cdsBoundaryPositions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoundaryPositions'
    Left = 266
    Top = 500
    object cdsBoundaryPositionsBOUNDPOSID: TStringField
      DisplayLabel = 'Boundary Position ID'
      FieldName = 'BOUNDPOSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsBoundaryPositionsBOUNDARYPOSITION: TStringField
      DisplayLabel = 'Boundary Position'
      FieldName = 'BOUNDARYPOSITION'
      Required = True
      Size = 15
    end
  end
  object qRefTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from sourcetype')
    SQLConnection = sqlcDateView
    Left = 206
    Top = 454
    object qRefTypesSOURCETYPEID: TStringField
      FieldName = 'SOURCETYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qRefTypesSOURCETYPE: TStringField
      FieldName = 'SOURCETYPE'
      Size = 15
    end
  end
  object dspRefTypes: TDataSetProvider
    DataSet = qRefTypes
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 232
    Top = 454
  end
  object cdsRefTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefTypes'
    Left = 260
    Top = 454
    object cdsRefTypesSOURCETYPEID: TStringField
      DisplayLabel = 'Reference Type ID'
      FieldName = 'SOURCETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsRefTypesSOURCETYPE: TStringField
      DisplayLabel = 'Reference Type'
      FieldName = 'SOURCETYPE'
      Size = 15
    end
  end
  object qMethods: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Methods')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 408
    object qMethodsMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qMethodsMETHODNAME: TStringField
      FieldName = 'METHODNAME'
    end
  end
  object dspMethods: TDataSetProvider
    DataSet = qMethods
    Left = 242
    Top = 408
  end
  object cdsMethods: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMethods'
    Left = 272
    Top = 408
    object cdsMethodsMETHODABR: TStringField
      FieldName = 'METHODABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsMethodsMETHODNAME: TStringField
      FieldName = 'METHODNAME'
    end
  end
  object qRefDetail: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'SOURCEID'
        ParamType = ptInput
        Size = 101
      end>
    SQL.Strings = (
      'select * from SOURCELIST'
      'where SOURCELIST.SOURCESHORT=:SourceID')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 364
    object qRefDetailSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefDetailSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object qRefDetailSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object qRefDetailSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspRefDetail: TDataSetProvider
    DataSet = qRefDetail
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 236
    Top = 364
  end
  object cdsRefDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefDetail'
    Left = 264
    Top = 364
    object cdsRefDetailSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefDetailSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsRefDetailSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object cdsRefDetailSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qOrogenicPeriods: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from OrogenicPeriod')
    SQLConnection = sqlcDateView
    Left = 210
    Top = 320
    object qOrogenicPeriodsOROGENICPERIODID: TStringField
      FieldName = 'OROGENICPERIODID'
      Required = True
      Size = 4
    end
    object qOrogenicPeriodsOROGENICPERIOD: TStringField
      FieldName = 'OROGENICPERIOD'
      Size = 30
    end
  end
  object dspOrogenicPeriods: TDataSetProvider
    DataSet = qOrogenicPeriods
    Left = 238
    Top = 320
  end
  object cdsOrogenicPeriods: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrogenicPeriods'
    Left = 268
    Top = 318
    object cdsOrogenicPeriodsOROGENICPERIODID: TStringField
      DisplayLabel = 'Orog Per ID'
      FieldName = 'OROGENICPERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object cdsOrogenicPeriodsOROGENICPERIOD: TStringField
      DisplayLabel = 'Orogenic Period'
      FieldName = 'OROGENICPERIOD'
      Size = 30
    end
  end
  object qChemTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ChemTypes')
    SQLConnection = sqlcDateView
    Left = 210
    Top = 274
    object qChemTypesCHEMTYPEABR: TStringField
      FieldName = 'CHEMTYPEABR'
      Required = True
      Size = 5
    end
    object qChemTypesCHEMICALTYPE: TStringField
      FieldName = 'CHEMICALTYPE'
      Size = 30
    end
  end
  object dspChemTypes: TDataSetProvider
    DataSet = qChemTypes
    Left = 238
    Top = 272
  end
  object cdsChemTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChemTypes'
    Left = 270
    Top = 270
    object cdsChemTypesCHEMTYPEABR: TStringField
      DisplayLabel = 'Chem Type ID'
      FieldName = 'CHEMTYPEABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsChemTypesCHEMICALTYPE: TStringField
      DisplayLabel = 'Chemical Type'
      FieldName = 'CHEMICALTYPE'
      Size = 30
    end
  end
  object qTerranes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID'
      'FROM DOMAINS,CONTINENT,DOMAINTYPE'
      'WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPE.DOMAINTYPEID'
      'AND DOMAINTYPE.DOMAINTYPELEVEL > 2'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 228
    object qTerranesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object qTerranesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qTerranesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qTerranesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object dspTerranes: TDataSetProvider
    DataSet = qTerranes
    Left = 236
    Top = 228
  end
  object cdsTerranes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTerranes'
    Left = 268
    Top = 226
    object cdsTerranesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object cdsTerranesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsTerranesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTerranesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object qProvinces: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID'
      'FROM DOMAINS,CONTINENT,DOMAINTYPE'
      'WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPE.DOMAINTYPEID'
      'AND DOMAINTYPE.DOMAINTYPELEVEL <= 2'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 186
    object qProvincesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object qProvincesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qProvincesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProvincesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object dspProvinces: TDataSetProvider
    DataSet = qProvinces
    Left = 236
    Top = 186
  end
  object cdsProvinces: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProvinces'
    Left = 264
    Top = 186
    object cdsProvincesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object cdsProvincesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsProvincesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProvincesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object qGroupingList: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from GroupingList'
      'where (USERID=:USERID'
      'OR USERID='#39'Anyody'#39')')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 146
    object qGroupingListGROUPING: TStringField
      FieldName = 'GROUPING'
      Required = True
    end
    object qGroupingListUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object qGroupingListEXPIRYDATE: TSQLTimeStampField
      FieldName = 'EXPIRYDATE'
      Required = True
    end
  end
  object dspGroupingList: TDataSetProvider
    DataSet = qGroupingList
    Left = 236
    Top = 146
  end
  object cdsGroupingList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGroupingList'
    Left = 266
    Top = 146
    object cdsGroupingListGROUPING: TStringField
      DisplayLabel = 'Group ID'
      FieldName = 'GROUPING'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGroupingListUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Required = True
    end
    object cdsGroupingListEXPIRYDATE: TSQLTimeStampField
      DisplayLabel = 'Expiry Date'
      FieldName = 'EXPIRYDATE'
      Required = True
    end
  end
  object qAreaDetail: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryAbr'
        ParamType = ptInput
        Value = 'AGP'
      end>
    SQL.Strings = (
      'select * from Country'
      'where CountryAbr=:CountryAbr')
    SQLConnection = sqlcDateView
    Left = 206
    Top = 102
    object qAreaDetailCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qAreaDetailCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object qAreaDetailCOUNTRYOFFSET: TFloatField
      FieldName = 'COUNTRYOFFSET'
    end
    object qAreaDetailCOUNTRYOFFSET2: TFloatField
      FieldName = 'COUNTRYOFFSET2'
    end
    object qAreaDetailCOUNTRYOFFSET3: TFloatField
      FieldName = 'COUNTRYOFFSET3'
    end
    object qAreaDetailCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dspAreaDetail: TDataSetProvider
    DataSet = qAreaDetail
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 234
    Top = 102
  end
  object cdsAreaDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAreaDetail'
    Left = 262
    Top = 102
    object cdsAreaDetailCOUNTRYABR: TStringField
      DisplayLabel = 'Area ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsAreaDetailCOUNTRY: TStringField
      DisplayLabel = 'Area'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object cdsAreaDetailCOUNTRYOFFSET: TFloatField
      DisplayLabel = 'Area Offset 1'
      FieldName = 'COUNTRYOFFSET'
      DisplayFormat = '###0.00'
    end
    object cdsAreaDetailCOUNTRYOFFSET2: TFloatField
      DisplayLabel = 'Area Offset 2'
      FieldName = 'COUNTRYOFFSET2'
      DisplayFormat = '###0.00'
    end
    object cdsAreaDetailCOUNTRYOFFSET3: TFloatField
      DisplayLabel = 'Area Offset 3'
      FieldName = 'COUNTRYOFFSET3'
      DisplayFormat = '###0.00'
    end
    object cdsAreaDetailCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object qImageTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ImageTypes')
    SQLConnection = sqlcDateView
    Left = 206
    Top = 60
    object qImageTypesIMAGETYPEID: TStringField
      FieldName = 'IMAGETYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qImageTypesIMAGETYPE: TStringField
      FieldName = 'IMAGETYPE'
      Size = 30
    end
  end
  object dspImageTypes: TDataSetProvider
    DataSet = qImageTypes
    Left = 234
    Top = 60
  end
  object cdsImageTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImageTypes'
    Left = 262
    Top = 60
    object cdsImageTypesIMAGETYPEID: TStringField
      DisplayLabel = 'Image Type ID'
      FieldName = 'IMAGETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsImageTypesIMAGETYPE: TStringField
      DisplayLabel = 'Image Type'
      FieldName = 'IMAGETYPE'
      Size = 30
    end
  end
  object qRecordIDs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select ISORGR30.RECORDID from ISORGR30'
      'where ISORGR30.RecordID = :RecordID')
    SQLConnection = sqlcDateView
    Left = 434
    Top = 112
    object qRecordIDsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dspRecordIDs: TDataSetProvider
    DataSet = qRecordIDs
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 460
    Top = 112
  end
  object dsRecordIDs: TDataSource
    DataSet = qRecordIDs
    Left = 488
    Top = 112
  end
  object cdsRecordIDs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDs'
    OnReconcileError = cdsAnyReconcileError
    Left = 520
    Top = 112
    object cdsRecordIDsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordIDsqResults2: TDataSetField
      FieldName = 'qResults2'
    end
    object cdsRecordIDsqIsoValid2: TDataSetField
      FieldName = 'qIsoValid2'
    end
    object cdsRecordIDsqIsoGrouping: TDataSetField
      FieldName = 'qIsoGrouping'
    end
    object cdsRecordIDsqIsoOrogenic: TDataSetField
      FieldName = 'qIsoOrogenic'
    end
    object cdsRecordIDsqIsoChemType: TDataSetField
      FieldName = 'qIsoChemType'
    end
    object cdsRecordIDsqIsoStatistics: TDataSetField
      FieldName = 'qIsoStatistics'
    end
    object cdsRecordIDsqIsoBoundary: TDataSetField
      FieldName = 'qIsoBoundary'
    end
    object cdsRecordIDsqIsoImages: TDataSetField
      FieldName = 'qIsoImages'
    end
    object cdsRecordIDsqIsoFor: TDataSetField
      FieldName = 'qIsoFor'
    end
    object cdsRecordIDsqIsoLab: TDataSetField
      FieldName = 'qIsoLab'
    end
    object cdsRecordIDsqIsoValid: TDataSetField
      FieldName = 'qIsoValid'
    end
    object cdsRecordIDsqIsoRef: TDataSetField
      FieldName = 'qIsoRef'
    end
    object cdsRecordIDsqTerrane: TDataSetField
      FieldName = 'qTerrane'
    end
    object cdsRecordIDsqProvince: TDataSetField
      FieldName = 'qProvince'
    end
    object cdsRecordIDsqIsoOther: TDataSetField
      FieldName = 'qIsoOther'
    end
    object cdsRecordIDsqIsoInit: TDataSetField
      FieldName = 'qIsoInit'
    end
    object cdsRecordIDsqResultsExtra: TDataSetField
      FieldName = 'qResultsExtra'
    end
    object cdsRecordIDsqResults: TDataSetField
      FieldName = 'qResults'
    end
    object cdsRecordIDsqIsoLIP: TDataSetField
      FieldName = 'qIsoLIP'
    end
    object cdsRecordIDsqComment: TDataSetField
      FieldName = 'qComment'
    end
  end
  object qResults: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      
        'select ISORGR30.CountryAbr, ISORGR30.UnitID, ISORGR30.MaterialAb' +
        'r, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      
        'ISORGR30.InterpAbr, ISORGR30.PrefLevel, ISORGR30.IAge, ISORGR30.' +
        'IAgePError, '
      'ISORGR30.IAgeMError, ISORGR30.AgeUnits, ISORGR30.Confidential, '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR,SUITE.UN' +
        'ITNAME  '
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      '      Technique, IsoSystem,PrefLevel,SUITE'
      'WHERE  IsoRgr30.RecordID=:RecordID '
      'AND ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'AND ISORGR30.UNITID=SUITE.UNITID'
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND ISORGR30.PrefLevel = PrefLevel.PrefLevelNo')
    SQLConnection = sqlcDateView
    Left = 490
    Top = 154
    object qResultsCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object qResultsUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qResultsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qResultsMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qResultsISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object qResultsAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object qResultsTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object qResultsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object qResultsPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object qResultsIAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object qResultsIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object qResultsIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object qResultsAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qResultsCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object qResultsLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qResultsMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qResultsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qResultsRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object qResultsRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object qResultsRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object cdsResults: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsRecordIDsqResults
    Params = <>
    OnCalcFields = cdsResultsCalcFields
    OnReconcileError = cdsAnyReconcileError
    Left = 520
    Top = 156
    object cdsResultsCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsResultsUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsResultsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsResultsMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResultsISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsResultsAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResultsTECHABR: TStringField
      FieldName = 'TECHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResultsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResultsPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResultsIAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResultsIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResultsIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsResultsAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsResultsCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object cdsResultsLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsResultsMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsResultsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsResultsRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsResultsRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsResultsRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
  end
  object qResultsExtra: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select ISORGR30.RecordID, '
      'ISORGR30.DecayConst1,ISORGR30.DecayConst2,'
      'ISORGR30.SigmaPercentDC1,ISORGR30.SigmaPercentDC2,'
      'ISORGR30.DateString,ISORGR30.RegisteredUser'
      'from isorgr30'
      'where ISORGR30.RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 246
  end
  object cdsResultsExtra: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqResultsExtra
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 524
    Top = 248
    object cdsResultsExtraRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResultsExtraDECAYCONST1: TFloatField
      FieldName = 'DECAYCONST1'
      DisplayFormat = '0.00000E-00'
    end
    object cdsResultsExtraDECAYCONST2: TFloatField
      FieldName = 'DECAYCONST2'
      DisplayFormat = '0.00000E-00'
    end
    object cdsResultsExtraSIGMAPERCENTDC1: TFloatField
      FieldName = 'SIGMAPERCENTDC1'
      DisplayFormat = '0.000'
    end
    object cdsResultsExtraSIGMAPERCENTDC2: TFloatField
      FieldName = 'SIGMAPERCENTDC2'
      DisplayFormat = '0.000'
    end
    object cdsResultsExtraDATESTRING: TSQLTimeStampField
      FieldName = 'DATESTRING'
      DisplayFormat = 'ddddd'
    end
    object cdsResultsExtraREGISTEREDUSER: TStringField
      FieldName = 'REGISTEREDUSER'
    end
  end
  object qIsoInit: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from IsoInit'
      'where recordid = :recordid')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 284
  end
  object cdsIsoInit: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoInit
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 526
    Top = 286
    object cdsIsoInitRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoInitINITRATIO: TFloatField
      FieldName = 'INITRATIO'
      DisplayFormat = '0.000000'
    end
    object cdsIsoInitINITRATIOERROR: TFloatField
      FieldName = 'INITRATIOERROR'
      DisplayFormat = '0.000000'
    end
    object cdsIsoInitEPSILON: TFloatField
      FieldName = 'EPSILON'
      DisplayFormat = '###0.00'
    end
    object cdsIsoInitEPSILONERROR: TFloatField
      FieldName = 'EPSILONERROR'
      DisplayFormat = '###0.00'
    end
    object cdsIsoInitMU: TFloatField
      FieldName = 'MU'
      DisplayFormat = '####0.000'
    end
    object cdsIsoInitMUPERROR: TFloatField
      FieldName = 'MUPERROR'
      DisplayFormat = '####0.000'
    end
    object cdsIsoInitMUMERROR: TFloatField
      FieldName = 'MUMERROR'
      DisplayFormat = '####0.000'
    end
    object cdsIsoInitMODEL: TStringField
      FieldName = 'MODEL'
    end
    object cdsIsoInitINITIALRATIO3D: TFloatField
      FieldName = 'INITIALRATIO3D'
      DisplayFormat = '0.000000'
    end
    object cdsIsoInitINITIALRATIO3DERROR: TFloatField
      FieldName = 'INITIALRATIO3DERROR'
      DisplayFormat = '0.000000'
    end
  end
  object qIsoOther: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from IsoOther'
      'where recordid = :recordid')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 332
  end
  object cdsIsoOther: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoOther
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 526
    Top = 332
    object cdsIsoOtherRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoOtherLWRINTERCEPT: TFloatField
      FieldName = 'LWRINTERCEPT'
      DisplayFormat = '###0.00'
    end
    object cdsIsoOtherLWRPERROR: TFloatField
      FieldName = 'LWRPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsIsoOtherLWRMERROR: TFloatField
      FieldName = 'LWRMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsIsoOtherWEIGHTING: TStringField
      FieldName = 'WEIGHTING'
      Size = 40
    end
  end
  object qProvince: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT * FROM ISOPROVTERR, DOMAINS,DOMAINTYPE'
      'WHERE ISOPROVTERR.RECORDID=:RecordID'
      'AND ISOPROVTERR.DOMAINID = DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID'
      'AND DOMAINTYPE.DOMAINTYPELEVEL <= 2'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDateView
    Left = 498
    Top = 376
    object qProvinceRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProvinceDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProvinceCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qProvinceDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 65
    end
    object qProvinceDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qProvinceNUMRECORDSLINKED: TIntegerField
      FieldName = 'NUMRECORDSLINKED'
      ProviderFlags = []
      ReadOnly = True
    end
    object qProvinceDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qProvinceDOMAINTYPELEVEL: TIntegerField
      FieldName = 'DOMAINTYPELEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsProvince: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqProvince
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 524
    Top = 380
    object cdsProvinceRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProvinceDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProvinceDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsProvinceCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsProvinceDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsProvinceDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProvinceDOMAINTYPELEVEL: TIntegerField
      FieldName = 'DOMAINTYPELEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProvinceNUMRECORDSLINKED: TIntegerField
      FieldName = 'NUMRECORDSLINKED'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qTerrane: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT * FROM ISOPROVTERR, DOMAINS,DOMAINTYPE'
      'WHERE ISOPROVTERR.RECORDID=:RecordID'
      'AND ISOPROVTERR.DOMAINID = DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID'
      'AND DOMAINTYPE.DOMAINTYPELEVEL > 2'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 422
    object qTerraneRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qTerraneDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qTerraneCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qTerraneDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 65
    end
    object qTerraneDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qTerraneNUMRECORDSLINKED: TIntegerField
      FieldName = 'NUMRECORDSLINKED'
      ProviderFlags = []
      ReadOnly = True
    end
    object qTerraneDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qTerraneDOMAINTYPELEVEL: TIntegerField
      FieldName = 'DOMAINTYPELEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsTerrane: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqTerrane
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 526
    Top = 420
    object cdsTerraneRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTerraneDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTerraneDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsTerraneCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsTerraneDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsTerraneDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTerraneDOMAINTYPELEVEL: TIntegerField
      FieldName = 'DOMAINTYPELEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsTerraneNUMRECORDSLINKED: TIntegerField
      FieldName = 'NUMRECORDSLINKED'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qIsoRef: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SOURCEA.RECORDID, SOURCEA.SOURCETYPEID, '
      '  SOURCEA.REFNUM,'
      '  SOURCETYPE.SOURCETYPE, SOURCELIST.SOURCESHORT,'
      '  SOURCELIST.SOURCEDESCRIPTION'
      'from SOURCEA, SOURCETYPE, SOURCELIST'
      'where SOURCEA.RECORDID=:RECORDID'
      'AND SOURCEA.SOURCETYPEID = SOURCETYPE.SOURCETYPEID'
      'and SOURCEA.REFNUM=SOURCELIST.SOURCENUM'
      'order by SOURCEA.RECORDID, SOURCEA.SOURCETYPEID'
      '')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 472
    object qIsoRefRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoRefSOURCETYPEID: TStringField
      FieldName = 'SOURCETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qIsoRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object qIsoRefSOURCETYPE: TStringField
      FieldName = 'SOURCETYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qIsoRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qIsoRefSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
      Size = -1
    end
  end
  object cdsIsoRef: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoRef
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 524
    Top = 472
    object cdsIsoRefRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoRefSOURCETYPEID: TStringField
      FieldName = 'SOURCETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsIsoRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsIsoRefSOURCETYPE: TStringField
      FieldName = 'SOURCETYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsIsoRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsIsoRefSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object qIsoValid: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      
        'select IsoValid.RecordID, IsoValid.ValidStatusID, IsoValid.DateD' +
        'one,'
      '  IsoValid.DoneBy, IsoValid.Comments,'
      '  ValidationStatus.ValidationStatus'
      'from IsoValid, ValidationStatus'
      'where IsoValid.RecordID = :RecordID'
      'AND IsoValid.ValidStatusID=ValidationStatus.ValidStatusID'
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 520
    object qIsoValidRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qIsoValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object qIsoValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object qIsoValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object qIsoValidCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = -1
    end
    object qIsoValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsIsoValid: TClientDataSet
    Aggregates = <>
    Filter = 'ValidStatusID='#39'Check'#39
    FilterOptions = [foCaseInsensitive]
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 524
    Top = 518
    object cdsIsoValidRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsIsoValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsIsoValidCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object cdsIsoValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qIsoLab: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      
        'select IsoLab.RecordID, IsoLab.LaboratoryAbr, Laboratories.Labor' +
        'atoryName'
      'FROM IsoLab, Laboratories'
      'WHERE IsoLab.RecordID = :RecordID'
      'AND IsoLab.LaboratoryAbr=Laboratories.LaboratoryAbr '
      '')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 560
    object qIsoLabRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qIsoLabLABORATORYABR: TStringField
      FieldName = 'LABORATORYABR'
      Required = True
      Size = 10
    end
    object qIsoLabLABORATORYNAME: TStringField
      FieldName = 'LABORATORYNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsIsoLab: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoLab
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 522
    Top = 564
    object cdsIsoLabRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoLabLABORATORYABR: TStringField
      FieldName = 'LABORATORYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsIsoLabLABORATORYNAME: TStringField
      FieldName = 'LABORATORYNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qSmpLoc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FirstSample'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LastSample'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select SmpLoc.SampleNo, SmpLoc.ContinentID, SmpLoc.CountryAbr,'
      '  SmpLoc.Latitude, SmpLoc.Longitude, SmpLoc.Elevation,'
      '  SmpLoc.LatitudePrecision, SmpLoc.LongitudePrecision, '
      '  SmpLoc.ElevationPrecision, SmpLoc.ORIGINALNO,'
      '  SmpLoc.Lithology, SmpLoc.IGSN,'
      '  Continent.Continent, Country.Country,'
      '  LithClasses.LithClassID,LithClasses.LithClass'
      'from SmpLoc, Continent, Country,Lithol,LithClasses'
      'where SmpLoc.ContinentID=Continent.ContinentID'
      'and SmpLoc.CountryAbr=Country.CountryAbr'
      'and SmpLoc.Lithology=Lithol.Lithology'
      'and Lithol.LithClassID=LithClasses.LithClassID'
      'and SmpLoc.SampleNo >= :FirstSample'
      'and SmpLoc.SampleNo <= :LastSample'
      'order by SmpLoc.SampleNo')
    SQLConnection = sqlcDateView
    Left = 358
    Top = 564
    object qSmpLocSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object qSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object qSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object qSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
    object qSmpLocLATITUDEPRECISION: TFloatField
      FieldName = 'LATITUDEPRECISION'
    end
    object qSmpLocLONGITUDEPRECISION: TFloatField
      FieldName = 'LONGITUDEPRECISION'
    end
    object qSmpLocELEVATIONPRECISION: TFloatField
      FieldName = 'ELEVATIONPRECISION'
    end
    object qSmpLocCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpLocCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qSmpLocORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object qSmpLocLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qSmpLocLITHCLASSID: TStringField
      FieldName = 'LITHCLASSID'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qSmpLocLITHCLASS: TStringField
      FieldName = 'LITHCLASS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpLocIGSN: TStringField
      FieldName = 'IGSN'
      Required = True
      Size = 50
    end
  end
  object dspSmpLoc: TDataSetProvider
    DataSet = qSmpLoc
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 386
    Top = 564
  end
  object cdsSmpLoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpLoc'
    OnReconcileError = cdsAnyReconcileError
    Left = 416
    Top = 564
    object cdsSmpLocSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
      DisplayFormat = '#####0.00'
    end
    object cdsSmpLocLATITUDEPRECISION: TFloatField
      FieldName = 'LATITUDEPRECISION'
      DisplayFormat = '###0.00000'
    end
    object cdsSmpLocLONGITUDEPRECISION: TFloatField
      FieldName = 'LONGITUDEPRECISION'
      DisplayFormat = '###0.00000'
    end
    object cdsSmpLocELEVATIONPRECISION: TFloatField
      FieldName = 'ELEVATIONPRECISION'
      DisplayFormat = '#####0.00'
    end
    object cdsSmpLocCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsSmpLocCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsSmpLocORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object cdsSmpLocLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsSmpLocLITHCLASSID: TStringField
      FieldName = 'LITHCLASSID'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsSmpLocLITHCLASS: TStringField
      FieldName = 'LITHCLASS'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsSmpLocIGSN: TStringField
      FieldName = 'IGSN'
      Required = True
      Size = 50
    end
  end
  object qIsoFor: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select ISOFOR.RECORDID, ISOFOR.WHOFORID, FORLIST.WHOFOR'
      'from ISOFOR, FORLIST'
      'where ISOFOR.RECORDID=:RECORDID'
      'and ISOFOR.WHOFORID=FORLIST.WHOFORID')
    SQLConnection = sqlcDateView
    Left = 622
    Top = 492
    object qIsoForRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qIsoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsIsoFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoFor
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 650
    Top = 494
    object cdsIsoForRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qIsoRef2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RecordID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SourceA'
      'where RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 590
    Top = 446
  end
  object dspIsoRef2: TDataSetProvider
    DataSet = qIsoRef2
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 618
    Top = 446
  end
  object cdsIsoRef2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIsoRef2'
    OnReconcileError = cdsAnyReconcileError
    Left = 646
    Top = 448
    object cdsIsoRef2RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsIsoRef2REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsIsoRef2SOURCETYPEID: TStringField
      FieldName = 'SOURCETYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qIsoImages: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select IsoImages.RecordID, IsoImages.ImageTypeID,'
      '  IsoImages.ImageID, ImageTypes.ImageType'
      'from IsoImages, ImageTypes'
      'where IsoImages.RecordID=:RecordID'
      'AND IsoImages.ImageTypeID=ImageTypes.ImageTypeID '
      '')
    SQLConnection = sqlcDateView
    Left = 624
    Top = 402
    object qIsoImagesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qIsoImagesIMAGETYPEID: TStringField
      FieldName = 'IMAGETYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qIsoImagesIMAGEID: TIntegerField
      FieldName = 'IMAGEID'
      Required = True
    end
    object qIsoImagesIMAGETYPE: TStringField
      FieldName = 'IMAGETYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsIsoImages: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoImages
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 664
    Top = 400
    object cdsIsoImagesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoImagesIMAGETYPEID: TStringField
      FieldName = 'IMAGETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsIsoImagesIMAGEID: TIntegerField
      FieldName = 'IMAGEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoImagesIMAGETYPE: TStringField
      FieldName = 'IMAGETYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qSmpReg: TSQLQuery
    DataSource = dsResults2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SMPREG.RECORDID, SMPREG.SAMPLENO, SMPREG.FRAC, '
      '  SMPREG.INCLUDED, SMPREG.ISOSYSTEM, '
      '  SMPLOC.LATITUDE, SMPLOC.LATITUDEPRECISION,'
      '  SMPLOC.LONGITUDE, SMPLOC.LONGITUDEPRECISION,'
      '  SMPLOC.ELEVATION, SMPLOC.ELEVATIONPRECISION,'
      '  SMPLOC.ORIGINALNO,SMPLOC.LITHOLOGY,'
      '  SMPLOC.IGSN'
      'from SMPREG, SMPLOC'
      'where SMPREG.RECORDID=:RECORDID'
      'and SMPREG.SAMPLENO=SMPLOC.SAMPLENO'
      'Order by SMPREG.SAMPLENO, SMPREG.FRAC')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 356
    object qSmpRegRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSmpRegSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSmpRegFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qSmpRegINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qSmpRegISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qSmpRegLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegLATITUDEPRECISION: TFloatField
      FieldName = 'LATITUDEPRECISION'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegLONGITUDEPRECISION: TFloatField
      FieldName = 'LONGITUDEPRECISION'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegELEVATIONPRECISION: TFloatField
      FieldName = 'ELEVATIONPRECISION'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSmpRegLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qSmpRegIGSN: TStringField
      FieldName = 'IGSN'
      Size = 50
    end
  end
  object cdsSmpReg: TClientDataSet
    Aggregates = <>
    DataSetField = cdsResults2qSmpReg
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 664
    Top = 354
    object cdsSmpRegRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpRegSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpRegFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpRegINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSmpRegISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsSmpRegLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpRegLATITUDEPRECISION: TFloatField
      FieldName = 'LATITUDEPRECISION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpRegLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpRegLONGITUDEPRECISION: TFloatField
      FieldName = 'LONGITUDEPRECISION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsSmpRegELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.00'
    end
    object cdsSmpRegELEVATIONPRECISION: TFloatField
      FieldName = 'ELEVATIONPRECISION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.00'
    end
    object cdsSmpRegORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsSmpRegLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsSmpRegIGSN: TStringField
      FieldName = 'IGSN'
      Size = 50
    end
  end
  object qIsoBoundary: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT ISOBOUNDARY.RECORDID, ISOBOUNDARY.BOUNDARYID,'
      '  ISOBOUNDARY.BOUNDPOSID, BOUNDARIES.BOUNDARYNAME,'
      '  BOUNDARYPOS.BOUNDARYPOSITION'
      'FROM ISOBOUNDARY, BOUNDARIES,BOUNDARYPOS'
      'WHERE ISOBOUNDARY.RECORDID=:RECORDID'
      'AND ISOBOUNDARY.BOUNDARYID=BOUNDARIES.BOUNDARYID'
      'AND ISOBOUNDARY.BOUNDPOSID=BOUNDARYPOS.BOUNDPOSID'
      '')
    SQLConnection = sqlcDateView
    Left = 628
    Top = 308
    object qIsoBoundaryRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoBoundaryBOUNDARYID: TIntegerField
      FieldName = 'BOUNDARYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoBoundaryBOUNDPOSID: TStringField
      FieldName = 'BOUNDPOSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qIsoBoundaryBOUNDARYNAME: TStringField
      FieldName = 'BOUNDARYNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qIsoBoundaryBOUNDARYPOSITION: TStringField
      FieldName = 'BOUNDARYPOSITION'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object cdsIsoBoundary: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoBoundary
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 660
    Top = 306
    object cdsIsoBoundaryRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoBoundaryBOUNDARYID: TIntegerField
      FieldName = 'BOUNDARYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoBoundaryBOUNDPOSID: TStringField
      FieldName = 'BOUNDPOSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsIsoBoundaryBOUNDARYNAME: TStringField
      FieldName = 'BOUNDARYNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsIsoBoundaryBOUNDARYPOSITION: TStringField
      FieldName = 'BOUNDARYPOSITION'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object qIsoStatistics: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from isostatistics'
      'where recordid=:recordid')
    SQLConnection = sqlcDateView
    Left = 628
    Top = 260
  end
  object cdsIsoStatistics: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoStatistics
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 662
    Top = 260
    object cdsIsoStatisticsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoStatisticsMSWD: TFloatField
      FieldName = 'MSWD'
      DisplayFormat = '###0.000'
    end
    object cdsIsoStatisticsNREG: TFloatField
      FieldName = 'NREG'
      DisplayFormat = '###0.00'
    end
    object cdsIsoStatisticsNSAMPLES: TIntegerField
      FieldName = 'NSAMPLES'
    end
    object cdsIsoStatisticsALPHA: TFloatField
      FieldName = 'ALPHA'
      DisplayFormat = '0.000'
    end
    object cdsIsoStatisticsNREPLICATES: TIntegerField
      FieldName = 'NREPLICATES'
    end
    object cdsIsoStatisticsDEGFREEDOM: TIntegerField
      FieldName = 'DEGFREEDOM'
    end
    object cdsIsoStatisticsFCUTOFF: TFloatField
      FieldName = 'FCUTOFF'
      DisplayFormat = '##0.000'
    end
    object cdsIsoStatisticsPROBOFFIT: TFloatField
      FieldName = 'PROBOFFIT'
      DisplayFormat = '0.000'
    end
    object cdsIsoStatisticsPROBOFCONCORDANCE: TFloatField
      FieldName = 'PROBOFCONCORDANCE'
      DisplayFormat = '0.000'
    end
    object cdsIsoStatisticsLUDWIGP: TFloatField
      FieldName = 'LUDWIGP'
      DisplayFormat = '##0.000'
    end
    object cdsIsoStatisticsXCENTROID: TFloatField
      FieldName = 'XCENTROID'
      DisplayFormat = '###0.000000'
    end
    object cdsIsoStatisticsYCENTROID: TFloatField
      FieldName = 'YCENTROID'
      DisplayFormat = '###0.000000'
    end
    object cdsIsoStatisticsCONSTRAINTS: TStringField
      FieldName = 'CONSTRAINTS'
    end
    object cdsIsoStatisticsXCONSTRAIN: TFloatField
      FieldName = 'XCONSTRAIN'
      DisplayFormat = '###0.000000'
    end
    object cdsIsoStatisticsYCONSTRAIN: TFloatField
      FieldName = 'YCONSTRAIN'
      DisplayFormat = '###0.000000'
    end
    object cdsIsoStatisticsAGECONSTRAIN: TFloatField
      FieldName = 'AGECONSTRAIN'
      DisplayFormat = '###0.00'
    end
    object cdsIsoStatisticsAUGMENTATION: TStringField
      FieldName = 'AUGMENTATION'
      Size = 50
    end
    object cdsIsoStatisticsSIGMAPERCENTDC1: TFloatField
      FieldName = 'SIGMAPERCENTDC1'
      DisplayFormat = '#0.000'
    end
    object cdsIsoStatisticsSIGMAPERCENTDC2: TFloatField
      FieldName = 'SIGMAPERCENTDC2'
      DisplayFormat = '#0.000'
    end
    object cdsIsoStatisticsPROGNAME: TStringField
      FieldName = 'PROGNAME'
      Size = 10
    end
    object cdsIsoStatisticsZCENTROID: TFloatField
      FieldName = 'ZCENTROID'
      DisplayFormat = '###0.000000'
    end
    object cdsIsoStatisticsZCONSTRAIN: TFloatField
      FieldName = 'ZCONSTRAIN'
      DisplayFormat = '###0.000000'
    end
  end
  object qIsoChemType: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from IsoChemType, ChemTypes'
      'where IsoChemType.RecordID=:RecordID'
      'AND IsoChemType.ChemTypeAbr=ChemTypes.ChemTypeAbr'
      '')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 222
    object qIsoChemTypeRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoChemTypeCHEMTYPEABR: TStringField
      FieldName = 'CHEMTYPEABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qIsoChemTypeCHEMTYPEABR_1: TStringField
      FieldName = 'CHEMTYPEABR_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qIsoChemTypeCHEMICALTYPE: TStringField
      FieldName = 'CHEMICALTYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsIsoChemType: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoChemType
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 654
    Top = 224
    object cdsIsoChemTypeRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoChemTypeCHEMTYPEABR: TStringField
      FieldName = 'CHEMTYPEABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoChemTypeCHEMICALTYPE: TStringField
      FieldName = 'CHEMICALTYPE'
      ProviderFlags = []
      Size = 30
    end
  end
  object qIsoOrogenic: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT ISOOROGENIC.RECORDID, ISOOROGENIC.OROGENICPERIODID,'
      '  OROGENICPERIOD.OROGENICPERIOD'
      'FROM ISOOROGENIC,OROGENICPERIOD'
      'WHERE ISOOROGENIC.RECORDID=:RECORDID'
      'AND ISOOROGENIC.OROGENICPERIODID=OROGENICPERIOD.OROGENICPERIODID'
      '')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 176
    object qIsoOrogenicRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoOrogenicOROGENICPERIODID: TStringField
      FieldName = 'OROGENICPERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qIsoOrogenicOROGENICPERIOD: TStringField
      FieldName = 'OROGENICPERIOD'
      ProviderFlags = []
      Size = 30
    end
  end
  object cdsIsoOrogenic: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoOrogenic
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 654
    Top = 176
    object cdsIsoOrogenicRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoOrogenicOROGENICPERIODID: TStringField
      FieldName = 'OROGENICPERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object cdsIsoOrogenicOROGENICPERIOD: TStringField
      FieldName = 'OROGENICPERIOD'
      ProviderFlags = []
      Size = 30
    end
  end
  object qIsoGrouping: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT * FROM GROUPING'
      'WHERE RECORDID=:RECORDID')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 132
    object qIsoGroupingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoGroupingGROUPING: TStringField
      FieldName = 'GROUPING'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsIsoGrouping: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoGrouping
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 654
    Top = 132
    object cdsIsoGroupingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoGroupingGROUPING: TStringField
      FieldName = 'GROUPING'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qSmpRegDetails: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RecordID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsoSystem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SmpReg'
      'where RecordID=:RecordID'
      'and IsoSystem=:IsoSystem')
    SQLConnection = sqlcDateView
    Left = 776
    Top = 380
    object qSmpRegDetailsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qSmpRegDetailsISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qSmpRegDetailsSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qSmpRegDetailsFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qSmpRegDetailsINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspSmpRegDetails: TDataSetProvider
    DataSet = qSmpRegDetails
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 802
    Top = 380
  end
  object cdsSmpRegDetails: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpRegDetails'
    Left = 830
    Top = 380
    object cdsSmpRegDetailsRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpRegDetailsISOSYSTEM: TStringField
      DisplayLabel = 'Isotope System'
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpRegDetailsSAMPLENO: TStringField
      DisplayLabel = 'Sample No'
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpRegDetailsFRAC: TStringField
      DisplayLabel = 'Fraction'
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpRegDetailsINCLUDED: TStringField
      DisplayLabel = 'Included'
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qImageDetails: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RecordID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from IsoImages'
      'where RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 784
    Top = 424
    object qImageDetailsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qImageDetailsIMAGETYPEID: TStringField
      FieldName = 'IMAGETYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qImageDetailsIMAGEID: TIntegerField
      FieldName = 'IMAGEID'
      Required = True
    end
    object qImageDetailsIMAGECAPTION: TMemoField
      FieldName = 'IMAGECAPTION'
      BlobType = ftMemo
      Size = 1
    end
    object qImageDetailsIMAGE: TBlobField
      FieldName = 'IMAGE'
      Size = 1
    end
  end
  object dspImageDetails: TDataSetProvider
    DataSet = qImageDetails
    Left = 812
    Top = 424
  end
  object cdsImageDetails: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImageDetails'
    Left = 840
    Top = 424
    object cdsImageDetailsRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsImageDetailsIMAGETYPEID: TStringField
      DisplayLabel = 'Image Type ID'
      FieldName = 'IMAGETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsImageDetailsIMAGEID: TIntegerField
      DisplayLabel = 'Image ID'
      FieldName = 'IMAGEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsImageDetailsIMAGECAPTION: TMemoField
      DisplayLabel = 'Image Caption'
      FieldName = 'IMAGECAPTION'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImageDetailsIMAGE: TBlobField
      DisplayLabel = 'Image'
      DisplayWidth = 90
      FieldName = 'IMAGE'
      BlobType = ftGraphic
      Size = 1
    end
  end
  object qRefFull: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'SOURCESHORT'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SOURCELIST'
      'where SOURCELIST.SOURCESHORT=:SOURCESHORT')
    SQLConnection = sqlcDateView
    Left = 780
    Top = 474
  end
  object dspRefFull: TDataSetProvider
    DataSet = qRefFull
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 812
    Top = 474
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 840
    Top = 474
    object cdsRefFullSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsRefFullDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
    object cdsRefFullSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsRefFullSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object cdsRefFullSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qDisplayImages: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ImageID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ImageID,DisplayImage from DisplayImages'
      'where ImageID=:ImageID')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 60
    object qDisplayImagesIMAGEID: TIntegerField
      FieldName = 'IMAGEID'
      Required = True
    end
    object qDisplayImagesDISPLAYIMAGE: TBlobField
      FieldName = 'DISPLAYIMAGE'
      Size = 1
    end
  end
  object cdsDisplayImages: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDisplayImages'
    Left = 448
    Top = 60
    object cdsDisplayImagesIMAGEID: TIntegerField
      FieldName = 'IMAGEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDisplayImagesDISPLAYIMAGE: TBlobField
      FieldName = 'DISPLAYIMAGE'
      Size = 1
    end
  end
  object dsDisplayImages: TDataSource
    DataSet = cdsDisplayImages
    Left = 476
    Top = 62
  end
  object dsContinents: TDataSource
    AutoEdit = False
    DataSet = cdsContinents
    Left = 114
    Top = 58
  end
  object dsCountries: TDataSource
    DataSet = cdsCountries
    Left = 112
    Top = 104
  end
  object dsUnits: TDataSource
    DataSet = cdsUnits
    Left = 116
    Top = 148
  end
  object dsLithol: TDataSource
    DataSet = cdsLithol
    Left = 110
    Top = 182
  end
  object dsInterpretations: TDataSource
    DataSet = cdsInterpretations
    Left = 108
    Top = 218
  end
  object dsReferences: TDataSource
    DataSet = cdsReferences
    Left = 110
    Top = 262
  end
  object dsAgeUnits: TDataSource
    DataSet = cdsAgeUnits
    Left = 110
    Top = 310
  end
  object dsApproach: TDataSource
    DataSet = cdsApproach
    Left = 106
    Top = 352
  end
  object dsTechniques: TDataSource
    DataSet = cdsTechniques
    Left = 108
    Top = 400
  end
  object dsIsoSystems: TDataSource
    DataSet = cdsIsoSystems
    Left = 108
    Top = 446
  end
  object dsPrefLevels: TDataSource
    DataSet = cdsPrefLevels
    Left = 106
    Top = 492
  end
  object dsMaterial: TDataSource
    DataSet = cdsMaterial
    Left = 102
    Top = 538
  end
  object dsWhoFor: TDataSource
    DataSet = cdsWhoFor
    Left = 98
    Top = 584
  end
  object dsValidationStatus: TDataSource
    DataSet = cdsValidationStatus
    Left = 102
    Top = 630
  end
  object dscdsRecordIDs: TDataSource
    DataSet = cdsRecordIDs
    Left = 548
    Top = 112
  end
  object dscdsResults: TDataSource
    DataSet = cdsResults
    Left = 548
    Top = 156
  end
  object dsResultsExtra: TDataSource
    DataSet = cdsResultsExtra
    Left = 552
    Top = 248
  end
  object dsIsoInit: TDataSource
    DataSet = cdsIsoInit
    Left = 554
    Top = 286
  end
  object dsIsoOther: TDataSource
    DataSet = cdsIsoOther
    Left = 554
    Top = 332
  end
  object dsProvince: TDataSource
    DataSet = cdsProvince
    Left = 552
    Top = 380
  end
  object dsTerrane: TDataSource
    DataSet = cdsTerrane
    Left = 554
    Top = 420
  end
  object dsIsoRef: TDataSource
    DataSet = cdsIsoRef
    Left = 552
    Top = 472
  end
  object dsIsoValid: TDataSource
    DataSet = cdsIsoValid
    Left = 552
    Top = 518
  end
  object dsIsoOrogenic: TDataSource
    DataSet = cdsIsoOrogenic
    Left = 684
    Top = 176
  end
  object dsIsoGrouping: TDataSource
    DataSet = cdsIsoGrouping
    Left = 682
    Top = 132
  end
  object dsIsoLab: TDataSource
    DataSet = cdsIsoLab
    Left = 550
    Top = 564
  end
  object dsIsoChemType: TDataSource
    DataSet = cdsIsoChemType
    Left = 682
    Top = 224
  end
  object dsIsoStatistics: TDataSource
    DataSet = cdsIsoStatistics
    Left = 690
    Top = 260
  end
  object dsIsoBoundary: TDataSource
    DataSet = cdsIsoBoundary
    Left = 688
    Top = 306
  end
  object dsSmpReg: TDataSource
    DataSet = cdsSmpReg
    OnDataChange = dsSmpRegDataChange
    Left = 692
    Top = 354
  end
  object dsIsoImages: TDataSource
    DataSet = cdsIsoImages
    Left = 692
    Top = 400
  end
  object dsIsoRef2: TDataSource
    DataSet = cdsIsoRef2
    Left = 674
    Top = 448
  end
  object dsIsoFor: TDataSource
    DataSet = cdsIsoFor
    Left = 678
    Top = 494
  end
  object dsSmpLoc: TDataSource
    DataSet = cdsSmpLoc
    OnDataChange = dsSmpLocDataChange
    Left = 444
    Top = 562
  end
  object dsSmpRegDetails: TDataSource
    DataSet = cdsSmpRegDetails
    Left = 858
    Top = 380
  end
  object dsImageDetails: TDataSource
    DataSet = cdsImageDetails
    Left = 868
    Top = 424
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 866
    Top = 474
  end
  object dsImageTypes: TDataSource
    DataSet = cdsImageTypes
    Left = 290
    Top = 60
  end
  object dsRefTypes: TDataSource
    DataSet = cdsRefTypes
    Left = 288
    Top = 454
  end
  object dsAreaDetail: TDataSource
    DataSet = cdsAreaDetail
    Left = 290
    Top = 102
  end
  object dsGroupingList: TDataSource
    DataSet = cdsGroupingList
    Left = 294
    Top = 146
  end
  object dsProvinces: TDataSource
    DataSet = cdsProvinces
    Left = 292
    Top = 186
  end
  object dsTerranes: TDataSource
    DataSet = cdsTerranes
    Left = 296
    Top = 226
  end
  object dsChemTypes: TDataSource
    DataSet = cdsChemTypes
    Left = 298
    Top = 272
  end
  object dsOrogenicPeriods: TDataSource
    DataSet = cdsOrogenicPeriods
    Left = 296
    Top = 320
  end
  object dsRefDetail: TDataSource
    DataSet = cdsRefDetail
    Left = 292
    Top = 364
  end
  object dsMethods: TDataSource
    DataSet = cdsMethods
    Left = 300
    Top = 408
  end
  object dsBoundaryPositions: TDataSource
    DataSet = cdsBoundaryPositions
    Left = 294
    Top = 500
  end
  object dsBoundaries: TDataSource
    DataSet = cdsBoundaries
    Left = 292
    Top = 546
  end
  object dsSamples: TDataSource
    DataSet = cdsSamples
    Left = 298
    Top = 594
  end
  object qUnitCountry: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryAbr'
        ParamType = ptInput
        Size = 3
        Value = 'TST'
      end>
    SQL.Strings = (
      
        'select SUITE.UNITNAME,SUITECOUNTRY.UNITID,SUITECOUNTRY.COUNTRYAB' +
        'R'
      'FROM SUITE, SUITECOUNTRY'
      'where SUITECOUNTRY.COUNTRYABR=:COUNTRYABR'
      'AND SUITE.UNITID=SUITECOUNTRY.UNITID'
      'order by SUITE.UNITNAME, SUITECOUNTRY.COUNTRYABR')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 641
    object qUnitCountryUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qUnitCountryCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dspUnitCountry: TDataSetProvider
    DataSet = qUnitCountry
    Left = 238
    Top = 638
  end
  object cdsUnitCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitCountry'
    Left = 266
    Top = 638
    object cdsUnitCountryUNITNAME: TStringField
      DisplayLabel = 'Stratigraphic Unit'
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsUnitCountryCOUNTRYABR: TStringField
      DisplayLabel = 'Area ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUnitCountry: TDataSource
    DataSet = cdsUnitCountry
    Left = 294
    Top = 640
  end
  object qUnitArea: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SUITECOUNTRY.UNITID, SUITECOUNTRY.COUNTRYABR,'
      '  SUITE.UNITNAME'
      'FROM SUITECOUNTRY,SUITE'
      'WHERE SUITECOUNTRY.UNITID=SUITE.UNITID'
      'ORDER BY SUITE.UNITNAME')
    SQLConnection = sqlcDateView
    Left = 740
    Top = 14
    object qUnitAreaUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitAreaCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qUnitAreaUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dspUnitArea: TDataSetProvider
    DataSet = qUnitArea
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 770
    Top = 16
  end
  object cdsUnitArea: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitArea'
    Left = 798
    Top = 16
    object cdsUnitAreaUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitAreaCOUNTRYABR: TStringField
      DisplayLabel = 'Area ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsUnitAreaUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dsUnitArea: TDataSource
    DataSet = cdsUnitArea
    Left = 826
    Top = 16
  end
  object qLaboratories: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select Laboratories.LaboratoryAbr, Laboratories.LaboratoryName '
      'from Laboratories'
      'order by Laboratories.LaboratoryName')
    SQLConnection = sqlcDateView
    Left = 742
    Top = 64
  end
  object dspLaboratories: TDataSetProvider
    DataSet = qLaboratories
    Left = 770
    Top = 64
  end
  object cdsLaboratories: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLaboratories'
    Left = 798
    Top = 64
    object cdsLaboratoriesLABORATORYABR: TStringField
      DisplayLabel = 'Lab ID'
      FieldName = 'LABORATORYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsLaboratoriesLABORATORYNAME: TStringField
      DisplayLabel = 'Laboratory'
      FieldName = 'LABORATORYNAME'
      Size = 50
    end
  end
  object dsLaboratories: TDataSource
    DataSet = cdsLaboratories
    Left = 826
    Top = 64
  end
  object qYesNo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from YesNo')
    SQLConnection = sqlcDateView
    Left = 742
    Top = 108
    object qYesNoYESNOID: TStringField
      FieldName = 'YESNOID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qYesNoYESNO: TStringField
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dspYesNo: TDataSetProvider
    DataSet = qYesNo
    Left = 770
    Top = 108
  end
  object cdsYesNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspYesNo'
    Left = 798
    Top = 108
    object cdsYesNoYESNOID: TStringField
      DisplayLabel = 'Y / N'
      FieldName = 'YESNOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsYesNoYESNO: TStringField
      DisplayLabel = 'Yes / No'
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 826
    Top = 108
  end
  object qIsoValid2: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      
        'select IsoValid.RecordID, IsoValid.ValidStatusID, IsoValid.DateD' +
        'one,'
      '  IsoValid.DoneBy, IsoValid.Comments'
      'from IsoValid'
      'where IsoValid.RecordID = :RecordID')
    SQLConnection = sqlcDateView
    Left = 498
    Top = 608
    object qIsoValid2RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qIsoValid2VALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object qIsoValid2DATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object qIsoValid2DONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object qIsoValid2COMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = -1
    end
  end
  object cdsIsoValid2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoValid2
    Filter = 'ValidStatusID='#39'Check'#39
    FilterOptions = [foCaseInsensitive]
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 526
    Top = 610
    object cdsIsoValid2RECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoValid2VALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoValid2DATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsIsoValid2DONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsIsoValid2COMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
  end
  object dsIsoValid2: TDataSource
    DataSet = cdsIsoValid2
    Left = 554
    Top = 610
  end
  object qUsersWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT USERSWHOFOR.USERID, USERSWHOFOR.WHOFORID, '
      '  FORLIST.WHOFOR,FORLIST.OWNER'
      'from USERSWHOFOR, FORLIST'
      'where USERSWHOFOR.WHOFORID = FORLIST.WHOFORID'
      'and (USERSWHOFOR.USERID=:USERID'
      'OR FORLIST.OWNER='#39'Anybody'#39')'
      'order by FORLIST.WHOFOR')
    SQLConnection = sqlcDateView
    Left = 744
    Top = 154
    object qUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object qUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object qUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Size = 50
    end
  end
  object dspUsersWhoFor: TDataSetProvider
    DataSet = qUsersWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 772
    Top = 154
  end
  object cdsUsersWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsersWhoFor'
    Left = 800
    Top = 154
    object cdsUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Size = 50
    end
  end
  object dsUsersWhoFor: TDataSource
    DataSet = cdsUsersWhoFor
    Left = 828
    Top = 154
  end
  object qRecordIDsAll: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'RecordID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ISORGR30.RecordID from ISORGR30'
      'where ISORGR30.RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 746
    Top = 200
    object qRecordIDsAllRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dspRecordIDsAll: TDataSetProvider
    DataSet = qRecordIDsAll
    Left = 774
    Top = 200
  end
  object cdsRecordIDsAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsAll'
    Left = 802
    Top = 200
    object cdsRecordIDsAllRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dsRecordIDsAll: TDataSource
    DataSet = cdsRecordIDsAll
    Left = 830
    Top = 200
  end
  object qResults2: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      
        'select ISORGR30.CountryAbr, ISORGR30.UnitID, ISORGR30.MaterialAb' +
        'r, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      
        'ISORGR30.InterpAbr, ISORGR30.PrefLevel, ISORGR30.IAge, ISORGR30.' +
        'IAgePError, '
      'ISORGR30.IAgeMError, ISORGR30.AgeUnits, ISORGR30.Confidential, '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      'Methods.MethodName,SUITE.UNITNAME,'
      
        'country.countryabr,COUNTRY.Country, MATERIAL.MaterialDescription' +
        ', Interpretation.Interpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'PrefLevel.PrefShort,'
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR  '
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      '      Technique, IsoSystem,PrefLevel,SUITE'
      'WHERE  IsoRgr30.RecordID=:RecordID'
      'AND ISORGR30.CountryAbr = COUNTRY.CountryAbr'
      'AND ISORGR30.UNITID=SUITE.UNITID '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND ISORGR30.PrefLevel = PrefLevel.PrefLevelNo'
      '')
    SQLConnection = sqlcDateView
    Left = 460
    Top = 204
    object qResults2COUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object qResults2UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qResults2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qResults2MATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qResults2ISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object qResults2APPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object qResults2TECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object qResults2INTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object qResults2PREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object qResults2IAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object qResults2IAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object qResults2IAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object qResults2AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qResults2CONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object qResults2LITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qResults2METHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qResults2RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qResults2METHODNAME: TStringField
      FieldName = 'METHODNAME'
    end
    object qResults2COUNTRYABR_1: TStringField
      FieldName = 'COUNTRYABR_1'
      Required = True
      Size = 3
    end
    object qResults2COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object qResults2MATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Size = 50
    end
    object qResults2INTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Size = 30
    end
    object qResults2APPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object qResults2TECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object qResults2ISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object qResults2PREFSHORT: TStringField
      FieldName = 'PREFSHORT'
      Required = True
      Size = 50
    end
    object qResults2RAGE: TFloatField
      FieldName = 'RAGE'
    end
    object qResults2RAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object qResults2RAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dsResults2: TDataSource
    DataSet = qResults2
    Left = 490
    Top = 204
  end
  object cdsResults2: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsRecordIDsqResults2
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 522
    Top = 204
    object cdsResults2COUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsResults2UNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResults2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsResults2MATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResults2ISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsResults2APPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResults2TECHABR: TStringField
      FieldName = 'TECHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResults2INTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsResults2PREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResults2IAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResults2IAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsResults2IAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsResults2AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsResults2CONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object cdsResults2LITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsResults2METHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsResults2RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsResults2METHODNAME: TStringField
      FieldName = 'METHODNAME'
    end
    object cdsResults2COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object cdsResults2MATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Size = 50
    end
    object cdsResults2INTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Size = 30
    end
    object cdsResults2APPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsResults2TECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsResults2ISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsResults2PREFSHORT: TStringField
      FieldName = 'PREFSHORT'
      Required = True
      Size = 50
    end
    object cdsResults2RAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsResults2RAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsResults2RAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsResults2qSmpReg: TDataSetField
      FieldName = 'qSmpReg'
    end
    object cdsResults2qStratDBLink: TDataSetField
      FieldName = 'qStratDBLink'
    end
  end
  object dscdsResults2: TDataSource
    DataSet = cdsResults2
    Left = 550
    Top = 204
  end
  object qRecordIDsMax: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select Max(ISORGR30.RecordID) from ISORGR30')
    SQLConnection = sqlcDateView
    Left = 748
    Top = 246
    object IntegerField12: TIntegerField
      FieldName = 'MAX'
    end
  end
  object dspRecordIDsMax: TDataSetProvider
    DataSet = qRecordIDsMax
    Left = 776
    Top = 246
  end
  object dsRecordIDsMax: TDataSource
    DataSet = cdsRecordIDsMax
    Left = 832
    Top = 246
  end
  object cdsRecordIDsMax: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsMax'
    Left = 804
    Top = 246
    object cdsRecordIDsMaxMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qUsers: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from Users'
      'where USERID=:USERID')
    SQLConnection = sqlcDateView
    Left = 746
    Top = 292
    object qUsersUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object qUsersNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
    object qUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
    end
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
    Left = 774
    Top = 292
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    Left = 802
    Top = 292
    object cdsUsersUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUsersNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
    object cdsUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
      DisplayFormat = 'yyyy/mm/dd'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 830
    Top = 292
  end
  object qClosureTemperatures: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select BlockingT.MaterialAbr, BlockingT.IsoSystem, BlockingT.App' +
        'roachAbr,'
      '  BlockingT.BlockingT, BlockingT.blockingTUncertainty,'
      '  Material.MaterialDescription, IsoSystem.IsoSystemName,'
      '  Approach.ApproachDescription  '
      'from BlockingT, Material, IsoSystem, Approach'
      'where BlockingT.MaterialAbr=Material.MaterialAbr'
      'and BlockingT.IsoSystem=IsoSystem.IsoSystem'
      'and BlockingT.ApproachAbr=Approach.ApproachAbr')
    SQLConnection = sqlcDateView
    Left = 582
    Top = 8
  end
  object dspClosureTemperatures: TDataSetProvider
    DataSet = qClosureTemperatures
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 610
    Top = 8
  end
  object cdsClosureTemperatures: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClosureTemperatures'
    Left = 638
    Top = 8
    object cdsClosureTemperaturesMATERIALABR: TStringField
      DisplayLabel = 'Material ID'
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsClosureTemperaturesISOSYSTEM: TStringField
      DisplayLabel = 'Iso. System'
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsClosureTemperaturesAPPROACHABR: TStringField
      DisplayLabel = 'Approach ID'
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsClosureTemperaturesBLOCKINGT: TFloatField
      DisplayLabel = 'Closure Temp.'
      FieldName = 'BLOCKINGT'
      DisplayFormat = '###0.0'
    end
    object cdsClosureTemperaturesBLOCKINGTUNCERTAINTY: TFloatField
      DisplayLabel = 'Uncertainty'
      FieldName = 'BLOCKINGTUNCERTAINTY'
      DisplayFormat = '###0.0'
    end
    object cdsClosureTemperaturesMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      ProviderFlags = []
      Size = 50
    end
    object cdsClosureTemperaturesISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsClosureTemperaturesAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      ProviderFlags = []
      Required = True
      Size = 50
    end
  end
  object dsClosureTemperatures: TDataSource
    DataSet = cdsClosureTemperatures
    Left = 666
    Top = 8
  end
  object SQLQuery3: TSQLQuery
    Params = <>
    Left = 784
    Top = 610
  end
  object DataSetProvider3: TDataSetProvider
    Left = 812
    Top = 610
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 840
    Top = 610
  end
  object DataSource3: TDataSource
    Left = 866
    Top = 610
  end
  object qNewResult: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 582
    Top = 58
  end
  object dspDisplayImages: TDataSetProvider
    DataSet = qDisplayImages
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 420
    Top = 60
  end
  object Query1Rec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'select  COUNT(ISORGR30.RecordID)'
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,SourceA,SOUR' +
        'CELIST'
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
      'AND SOURCEA.REFNUM=SOURCELIST.SOURCENUM'
      'AND ISORGR30.RecordID = SourceA.RecordID'
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      '')
    SQLConnection = sqlcDateView
    Left = 620
    Top = 688
  end
  object dspQuery1Rec: TDataSetProvider
    DataSet = Query1Rec
    Options = [poReadOnly]
    Left = 648
    Top = 688
  end
  object cdsQuery1Rec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1Rec'
    Left = 676
    Top = 688
    object cdsQuery1RecCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
    end
  end
  object qRefNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID'
      'from SOURCELIST')
    SQLConnection = sqlcDateView
    Left = 876
    Top = 668
    object qRefNewSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object qRefNewCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object qUnitRanks: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from UnitRanks'
      'order by UnitRanks.UnitRank')
    SQLConnection = sqlcDateView
    Left = 16
    Top = 680
  end
  object dspUnitRanks: TDataSetProvider
    DataSet = qUnitRanks
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 44
    Top = 680
  end
  object cdsUnitRanks: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitRanks'
    Left = 74
    Top = 680
    object cdsUnitRanksUNITRANKID: TStringField
      FieldName = 'UNITRANKID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUnitRanksUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 30
    end
  end
  object dsUnitRanks: TDataSource
    DataSet = cdsUnitRanks
    Left = 102
    Top = 678
  end
  object qNumRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from NumRecords')
    SQLConnection = sqlcDateView
    Left = 384
    Top = 4
  end
  object dspNumRecords: TDataSetProvider
    DataSet = qNumRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 412
    Top = 4
  end
  object dsNumRecords: TDataSource
    DataSet = cdsNumRecords
    Left = 468
    Top = 4
  end
  object cdsNumRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNumRecords'
    Left = 440
    Top = 4
    object cdsNumRecordsDATECOUNTED: TSQLTimeStampField
      DisplayLabel = 'Date'
      FieldName = 'DATECOUNTED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = 'yyyy/mm/dd'
    end
    object cdsNumRecordsNUMTOTALRECORDS: TIntegerField
      DisplayLabel = 'Total number of records'
      FieldName = 'NUMTOTALRECORDS'
      Required = True
    end
    object cdsNumRecordsNUMPUBLRECORDS: TIntegerField
      DisplayLabel = 'Total public records'
      FieldName = 'NUMPUBLRECORDS'
      Required = True
    end
  end
  object qNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 776
    Top = 668
  end
  object qSmpFrac: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SMPFRAC.SAMPLENO, SMPFRAC.FRAC,SMPFRAC.ZONEID'
      'from SMPFRAC'
      'order by SampleNo')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 688
    object qSmpFracSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qSmpFracFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qSmpFracZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
  end
  object dspSmpFrac: TDataSetProvider
    DataSet = qSmpFrac
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 688
  end
  object cdsSmpFrac: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpFrac'
    Left = 270
    Top = 688
    object cdsSmpFracSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpFracFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpFracZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
  end
  object dsSmpFrac: TDataSource
    DataSet = cdsSmpFrac
    Left = 298
    Top = 690
  end
  object qFracsForSample: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select SMPFRAC.FRAC'
      'from SMPFRAC'
      'where SMPFRAC.SAMPLENO = :SampleNO'
      'order by FRAC')
    SQLConnection = sqlcDateView
    Left = 364
    Top = 688
  end
  object dspFracsForSample: TDataSetProvider
    DataSet = qFracsForSample
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 392
    Top = 688
  end
  object cdsFracsForSample: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFracsForSample'
    Left = 422
    Top = 688
    object cdsFracsForSampleFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
  end
  object dsFracsForSample: TDataSource
    DataSet = cdsFracsForSample
    Left = 450
    Top = 690
  end
  object qStratDBLink: TSQLQuery
    DataSource = dsResults2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT SUITE.GISID'
      'FROM SUITE,SUITECOUNTRY,ISORGR30'
      'WHERE ISORGR30.RECORDID=:RecordID '
      'AND SUITE.UNITID=ISORGR30.UNITID'
      'AND SUITE.UNITID=SUITECOUNTRY.UNITID'
      'AND SUITECOUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 630
    object qStratDBLinkGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
  end
  object cdsStratDBLink: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsResults2qStratDBLink
    Params = <>
    OnCalcFields = cdsResultsCalcFields
    OnReconcileError = cdsAnyReconcileError
    Left = 656
    Top = 628
    object cdsStratDBLinkGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
  end
  object dsStratDBLink: TDataSource
    DataSet = cdsStratDBLink
    Left = 684
    Top = 628
  end
  object qUsersContributed: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE USERS.NUMCONTRIBUTED >  0')
    SQLConnection = sqlcDateView
    Left = 746
    Top = 336
    object qUsersContributedUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUsersContributedNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
  end
  object dspUsersContributed: TDataSetProvider
    DataSet = qUsersContributed
    Left = 774
    Top = 336
  end
  object cdsUsersContributed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsersContributed'
    Left = 802
    Top = 336
    object cdsUsersContributedUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsersContributedNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
  end
  object dsUsersContributed: TDataSource
    DataSet = cdsUsersContributed
    Left = 830
    Top = 336
  end
  object qLIPs: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIPS'
      'ORDER BY LIPS.LIPNAME')
    SQLConnection = sqlcDateView
    Left = 330
    Top = 366
  end
  object dspLIPs: TDataSetProvider
    DataSet = qLIPs
    Left = 358
    Top = 366
  end
  object cdsLIPs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPs'
    Left = 386
    Top = 366
    object cdsLIPsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPsLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 150
    end
  end
  object dsLIPs: TDataSource
    AutoEdit = False
    DataSet = cdsLIPs
    Left = 414
    Top = 366
  end
  object qIsoLIP: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT ISOLIP.RECORDID,ISOLIP.LIPID,LIPS.LIPNAME'
      'FROM ISOLIP,LIPS'
      'WHERE ISOLIP.RECORDID= :RecordID'
      'AND LIPS.LIPID=ISOLIP.LIPID')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 656
    object qIsoLIPRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qIsoLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object qIsoLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      ProviderFlags = []
      Size = 50
    end
  end
  object cdsIsoLIP: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsqIsoLIP
    Params = <>
    Left = 526
    Top = 654
    object cdsIsoLIPRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsIsoLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dsIsoLIP: TDataSource
    DataSet = cdsIsoLIP
    Left = 554
    Top = 656
  end
  object qComment: TSQLQuery
    DataSource = dsRecordIDs
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT * FROM ISORGR30COMMENT'
      'WHERE ISORGR30COMMENT.RECORDID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 626
    Top = 102
    object qCommentRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCommentCOMMENT: TMemoField
      FieldName = 'COMMENT'
      BlobType = ftMemo
      Size = -1
    end
  end
  object cdsComment: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = cdsRecordIDsqComment
    Params = <>
    OnCalcFields = cdsResultsCalcFields
    OnReconcileError = cdsAnyReconcileError
    Left = 656
    Top = 104
    object cdsCommentRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCommentCOMMENT: TMemoField
      FieldName = 'COMMENT'
      BlobType = ftMemo
    end
  end
  object dsComment: TDataSource
    DataSet = cdsComment
    Left = 684
    Top = 104
  end
  object qSmpFracRange: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FirstSample'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LastSample'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select SMPFRAC.SAMPLENO, SMPFRAC.FRAC,'
      '  SMPFRAC.ZONEID'
      'from SMPFRAC'
      'where SMPFRAC.SAMPLENO >= :FirstSample'
      'and SMPFRAC.SAMPLENO <= :LastSample'
      'order by SMPFRAC.SAMPLENO,SMPFRAC.FRAC')
    SQLConnection = sqlcDateView
    Left = 354
    Top = 612
  end
  object dspSmpFracRange: TDataSetProvider
    DataSet = qSmpFracRange
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 382
    Top = 612
  end
  object cdsSmpFracRange: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpFracRange'
    OnReconcileError = cdsAnyReconcileError
    Left = 412
    Top = 612
    object cdsSmpFracRangeSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpFracRangeFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsSmpFracRangeZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
  end
  object dsSmpFracRange: TDataSource
    DataSet = cdsSmpFracRange
    Left = 440
    Top = 610
  end
  object qUserAccount: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERACCOUNT.USERID, USERACCOUNT.ACCOUNTID'
      'FROM  USERACCOUNT'
      'WHERE USERACCOUNT.USERID = :UserID')
    SQLConnection = sqlcDateView
    Left = 358
    Top = 170
  end
  object dspUserAccount: TDataSetProvider
    DataSet = qUserAccount
    Left = 386
    Top = 170
  end
  object cdsUserAccount: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserAccount'
    Left = 414
    Top = 170
    object cdsUserAccountUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserAccountACCOUNTID: TStringField
      FieldName = 'ACCOUNTID'
      Required = True
    end
  end
  object dsUserAccount: TDataSource
    AutoEdit = False
    DataSet = cdsUserAccount
    Left = 442
    Top = 170
  end
  object QuerySamples: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select distinct isorgr30.recordid,'
      
        '  smploc.continentid, smploc.countryabr,smploc.sampleno,smpreg.f' +
        'rac,'
      '  smploc.originalno,smpreg.included,'
      '  smploc.longitude,smploc.latitude,smploc.elevation,'
      
        '  smploc.longitudeprecision,smploc.latitudeprecision,smploc.elev' +
        'ationprecision,'
      '  smploc.lithology'
      'from isorgr30'
      'join smpreg ON (IsoRGR30.recordid = smpreg.recordid)'
      'join smploc ON (smpreg.sampleno = smploc.sampleno)'
      'order by isorgr30.recordid,smpreg.sampleno,smpreg.frac')
    SQLConnection = sqlcDateView
    Left = 252
    Top = 6
  end
  object dspQuerySamples: TDataSetProvider
    DataSet = QuerySamples
    Left = 282
    Top = 6
  end
  object cdsQuerySamples: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerySamples'
    Left = 310
    Top = 6
    object cdsQuerySamplesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQuerySamplesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsQuerySamplesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsQuerySamplesSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsQuerySamplesFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsQuerySamplesORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object cdsQuerySamplesINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQuerySamplesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsQuerySamplesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsQuerySamplesELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
    object cdsQuerySamplesLONGITUDEPRECISION: TFloatField
      FieldName = 'LONGITUDEPRECISION'
    end
    object cdsQuerySamplesLATITUDEPRECISION: TFloatField
      FieldName = 'LATITUDEPRECISION'
    end
    object cdsQuerySamplesELEVATIONPRECISION: TFloatField
      FieldName = 'ELEVATIONPRECISION'
    end
    object cdsQuerySamplesLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
  end
  object dsQuerySamples: TDataSource
    DataSet = cdsQuerySamples
    Left = 338
    Top = 6
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT DISTINCT DOMAINS.DOMAINNAME || '#39' ('#39' || DOMAINS.CONTINENTI' +
        'D || '#39')'#39' AS DOMAINNAME,'
      'DOMAINS.DOMAINID, DOMAINS.CONTINENTID'
      'FROM DOMAINS'
      'WHERE DOMAINS.DOMAINNAME >= '#39'00'#39
      'AND DOMAINS.DOMAINNAME <= '#39'zz'#39
      'AND ( DOMAINS.CONTINENTID = '#39'UND'#39
      'OR DOMAINS.CONTINENTID = '#39'AFR'#39
      ' ) '
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDateView
    Left = 348
    Top = 268
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    Left = 372
    Top = 268
  end
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 404
    Top = 266
    object cdsDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object cdsDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
  end
  object dsDomains: TDataSource
    DataSet = cdsDomains
    Left = 432
    Top = 266
  end
  object qThisUnit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM SUITE'
      'WHERE SUITE.UNITID = :UnitID')
    SQLConnection = sqlcDateView
    Left = 344
    Top = 416
  end
  object dspThisUnit: TDataSetProvider
    DataSet = qThisUnit
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 372
    Top = 416
  end
  object cdsThisUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspThisUnit'
    Left = 402
    Top = 416
    object cdsThisUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsThisUnitUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsThisUnitUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object cdsThisUnitGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object cdsThisUnitFORMATIONOFFSET: TFloatField
      FieldName = 'FORMATIONOFFSET'
    end
    object cdsThisUnitFORMATIONOFFSET2: TFloatField
      FieldName = 'FORMATIONOFFSET2'
    end
    object cdsThisUnitFORMATIONOFFSET3: TFloatField
      FieldName = 'FORMATIONOFFSET3'
    end
    object cdsThisUnitPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsThisUnit: TDataSource
    DataSet = cdsThisUnit
    Left = 430
    Top = 414
  end
  object qThisUnitCountry: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM SUITECOUNTRY'
      'WHERE SUITECOUNTRY.UNITID = :UnitID'
      'AND (SUITECOUNTRY.COUNTRYABR = :CountryID'
      '  OR SUITECOUNTRY.COUNTRYABR = '#39'UND'#39')')
    SQLConnection = sqlcDateView
    Left = 344
    Top = 464
  end
  object dspThisUnitCountry: TDataSetProvider
    DataSet = qThisUnitCountry
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 372
    Top = 464
  end
  object cdsThisUnitCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspThisUnitCountry'
    Left = 402
    Top = 464
    object cdsThisUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsThisUnitCountryCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsThisUnitCountryUNITHASRECORDS: TStringField
      FieldName = 'UNITHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsThisUnitCountry: TDataSource
    DataSet = cdsThisUnitCountry
    Left = 430
    Top = 462
  end
  object QueryInit: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT ISORGR30.CountryAbr, ISORGR30.UnitID, ISORGR30.M' +
        'aterialAbr, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      
        'ISORGR30.InterpAbr, ISORGR30.PrefLevel, ISORGR30.IAge, ISORGR30.' +
        'IAgePError, '
      'ISORGR30.IAgeMError, ISORGR30.AgeUnits, ISORGR30.Confidential, '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'COUNTRY.Country, MATERIAL.MaterialDescription, Interpretation.In' +
        'terpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR,'
      'SOURCELIST.SourceSHORT,SUITE.UNITNAME,SOURCEA.REFNUM,'
      'ISOFOR.WHOFORID,'
      
        'isoinit.initratio,isoinit.initratioerror, isoinit.epsilon,isoini' +
        't.epsilonerror,'
      'isoinit.mu,isoinit.muperror,isoinit.mumerror,isoinit.model'
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,SourceA,SOUR' +
        'CELIST,'
      '      IsoFor,isoinit'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      
        'AND ISORGR30.MethodAbr = METHODS.MethodAbr AND SOURCEA.REFNUM = ' +
        'SOURCELIST.SOURCENUM'
      'AND ISORGR30.RecordID = SourceA.RecordID'
      'AND ISORGR30.RECORDID=ISOFOR.RECORDID'
      'and isorgr30.recordid=isoinit.recordid'
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      
        'ORDER by IsoRgr30.CountryAbr,Suite.UnitName,IsoRgr30.MaterialAbr' +
        ','
      
        '  IsoRgr30.IsotopeSystem,IsoRgr30.ApproachAbr,IsoRgr30.InterpAbr' +
        ','
      '  IsoRgr30.PrefLevel,IsoRgr30.TechAbr,IsoRgr30.RAge')
    SQLConnection = sqlcDateView
    Left = 12
    Top = 726
  end
  object dspQueryInit: TDataSetProvider
    DataSet = QueryInit
    Left = 42
    Top = 726
  end
  object cdsQueryInit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryInit'
    Left = 70
    Top = 726
    object cdsQueryInitCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsQueryInitUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQueryInitMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsQueryInitISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsQueryInitAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsQueryInitTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsQueryInitINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQueryInitPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsQueryInitCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
      Required = True
    end
    object cdsQueryInitLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQueryInitMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQueryInitRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQueryInitCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQueryInitMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryInitINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsQueryInitAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryInitTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsQueryInitISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsQueryInitRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
    end
    object cdsQueryInitRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
    end
    object cdsQueryInitRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
    end
    object cdsQueryInitAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQueryInitSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsQueryInitUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQueryInitREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsQueryInitINITRATIO: TFloatField
      FieldName = 'INITRATIO'
    end
    object cdsQueryInitINITRATIOERROR: TFloatField
      FieldName = 'INITRATIOERROR'
    end
    object cdsQueryInitEPSILON: TFloatField
      FieldName = 'EPSILON'
    end
    object cdsQueryInitEPSILONERROR: TFloatField
      FieldName = 'EPSILONERROR'
    end
    object cdsQueryInitMU: TFloatField
      FieldName = 'MU'
    end
    object cdsQueryInitMUPERROR: TFloatField
      FieldName = 'MUPERROR'
    end
    object cdsQueryInitMUMERROR: TFloatField
      FieldName = 'MUMERROR'
    end
    object cdsQueryInitMODEL: TStringField
      FieldName = 'MODEL'
    end
    object cdsQueryInitWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object dsQueryInit: TDataSource
    DataSet = cdsQueryInit
    Left = 98
    Top = 726
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 88
    Top = 16
  end
  object qSampleZones: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM SAMPLEZONES'
      'ORDER BY SAMPLEZONES.ZONETYPE')
    SQLConnection = sqlcDateView
    Left = 348
    Top = 308
  end
  object dspSampleZones: TDataSetProvider
    DataSet = qSampleZones
    Left = 372
    Top = 308
  end
  object cdsSampleZones: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSampleZones'
    Left = 404
    Top = 306
    object cdsSampleZonesZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
    object cdsSampleZonesZONETYPE: TStringField
      FieldName = 'ZONETYPE'
      Required = True
    end
  end
  object dsSampleZones: TDataSource
    DataSet = cdsSampleZones
    Left = 432
    Top = 306
  end
  object qSameSampleResults: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ThisSample'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select isorgr30.recordid,isorgr30.interpabr,isorgr30.preflevel,'
      
        '  isorgr30.materialabr,isorgr30.isotopesystem,isorgr30.approacha' +
        'br,'
      
        '  isorgr30.rage,isorgr30.rageperror,isorgr30.ragemerror,isorgr30' +
        '.ageunits'
      'from isorgr30, smpreg'
      'where isorgr30.recordid=smpreg.recordid'
      'and isorgr30.preflevel > 0'
      'and smpreg.sampleno = :ThisSample'
      'order by isorgr30.recordid')
    SQLConnection = sqlcDateView
    Left = 622
    Top = 564
    object qSameSampleResultsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qSameSampleResultsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object qSameSampleResultsPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object qSameSampleResultsMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qSameSampleResultsISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object qSameSampleResultsAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object qSameSampleResultsRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object qSameSampleResultsRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object qSameSampleResultsRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object qSameSampleResultsAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
  end
  object dspSameSampleResults: TDataSetProvider
    DataSet = qSameSampleResults
    Options = [poReadOnly, poUseQuoteChar]
    Left = 650
    Top = 564
  end
  object cdsSameSampleResults: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSameSampleResults'
    Left = 678
    Top = 564
    object cdsSameSampleResultsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsSameSampleResultsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsSameSampleResultsPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsSameSampleResultsMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsSameSampleResultsISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsSameSampleResultsAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsSameSampleResultsRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '####0.00'
    end
    object cdsSameSampleResultsRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '####0.00'
    end
    object cdsSameSampleResultsRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '####0.00'
    end
    object cdsSameSampleResultsAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
  end
  object dsSameSampleResults: TDataSource
    DataSet = cdsSameSampleResults
    Left = 706
    Top = 564
  end
  object QueryCombined: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT ISORGR30.CountryAbr, ISORGR30.UnitID, ISORGR30.M' +
        'aterialAbr, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      'ISORGR30.InterpAbr, ISORGR30.PrefLevel, '
      'ISORGR30.AgeUnits,  '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'COUNTRY.Country, MATERIAL.MaterialDescription, Interpretation.In' +
        'terpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR,'
      'SOURCELIST.SourceSHORT,SUITE.UNITNAME,SOURCEA.REFNUM,'
      'ISOFOR.WHOFORID,SMPREG.SampleNo,SMPREG.Frac,'
      
        'SMPLOC.Longitude,SMPLOC.Latitude,SMPLOC.Elevation,SMPREG.Include' +
        'd'
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,SourceA,SOUR' +
        'CELIST,'
      '      ISOFOR,SMPREG,SMPLOC'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      
        'AND ISORGR30.MethodAbr = METHODS.MethodAbr AND SOURCEA.REFNUM = ' +
        'SOURCELIST.SOURCENUM'
      'AND ISORGR30.RecordID = SourceA.RecordID'
      'AND ISORGR30.RECORDID=ISOFOR.RECORDID'
      'AND ISORGR30.RECORDID=SMPREG.RECORDID'
      'AND ISORGR30.IsotopeSystem=SMPREG.ISOSYSTEM'
      'AND SMPREG.SampleNo=SMPLOC.SampleNo'
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      
        'ORDER by IsoRgr30.CountryAbr,Suite.UnitName,IsoRgr30.MaterialAbr' +
        ','
      
        '  IsoRgr30.IsotopeSystem,IsoRgr30.ApproachAbr,IsoRgr30.InterpAbr' +
        ','
      '  IsoRgr30.PrefLevel,IsoRgr30.TechAbr,IsoRgr30.RAge')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 742
    object QueryCombinedCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object QueryCombinedUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object QueryCombinedMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object QueryCombinedISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object QueryCombinedAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object QueryCombinedTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object QueryCombinedINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object QueryCombinedPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object QueryCombinedAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object QueryCombinedLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object QueryCombinedMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryCombinedRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QueryCombinedCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object QueryCombinedMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object QueryCombinedINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object QueryCombinedAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object QueryCombinedTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object QueryCombinedISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object QueryCombinedRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object QueryCombinedRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object QueryCombinedRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object QueryCombinedSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object QueryCombinedUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object QueryCombinedREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object QueryCombinedWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object QueryCombinedSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object QueryCombinedFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object QueryCombinedLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object QueryCombinedLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object QueryCombinedELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
    object QueryCombinedINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspQueryCombined: TDataSetProvider
    DataSet = QueryCombined
    Left = 242
    Top = 742
  end
  object cdsQueryCombined: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryCombined'
    Left = 270
    Top = 742
    object cdsQueryCombinedCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsQueryCombinedUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQueryCombinedMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsQueryCombinedISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsQueryCombinedAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsQueryCombinedTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsQueryCombinedINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQueryCombinedPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsQueryCombinedAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQueryCombinedLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQueryCombinedMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQueryCombinedRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQueryCombinedCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQueryCombinedMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryCombinedINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsQueryCombinedAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryCombinedTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsQueryCombinedISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsQueryCombinedRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object cdsQueryCombinedRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object cdsQueryCombinedRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object cdsQueryCombinedSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsQueryCombinedUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQueryCombinedREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsQueryCombinedWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsQueryCombinedSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsQueryCombinedFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsQueryCombinedLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsQueryCombinedLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsQueryCombinedELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
    object cdsQueryCombinedINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsQueryCombined: TDataSource
    DataSet = cdsQueryCombined
    Left = 298
    Top = 742
  end
  object qCheckUsersOwnRecord: TSQLQuery
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CaptStatusID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select IsoValid.RecordID, IsoValid.ValidStatusID,'
      '  IsoValid.DoneBy'
      'from IsoValid'
      'where IsoValid.RecordID = :RecordID'
      'and IsoValid.ValidStatusID = :CaptStatusID'
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 776
    Top = 728
    object qCheckUsersOwnRecordRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qCheckUsersOwnRecordVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object qCheckUsersOwnRecordDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
  end
  object cdsCheckUsersOwnRecord: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspCheckUsersOwnRecord'
    OnReconcileError = cdsAnyReconcileError
    Left = 828
    Top = 726
    object cdsCheckUsersOwnRecordRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsCheckUsersOwnRecordVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object cdsCheckUsersOwnRecordDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
  end
  object dsCheckUsersOwnRecord: TDataSource
    DataSet = cdsCheckUsersOwnRecord
    Left = 856
    Top = 726
  end
  object dspCheckUsersOwnRecord: TDataSetProvider
    DataSet = qCheckUsersOwnRecord
    Left = 800
    Top = 728
  end
end
