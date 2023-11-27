object dmStrat: TdmStrat
  OldCreateOrder = False
  Height = 729
  Width = 701
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CONTINENTS'
      'WHERE CONTINENTS.HASDATA='#39'Y'#39
      'ORDER BY CONTINENTS.CONTINENT')
    SQLConnection = sqlcStrat
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
    object qContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
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
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object qCountries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  COUNTRIES.CONTINENTID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,'
      '  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID'
      'FROM COUNTRIES, CONTINENTS'
      'WHERE COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND COUNTRIES.COUNTRYHASRECORDS = '#39'Y'#39
      'ORDER BY COUNTRIES.COUNTRY')
    SQLConnection = sqlcStrat
    Left = 28
    Top = 104
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
    object cdsCountriesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountriesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsCountriesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsCountriesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsCountriesCOUNTRYHASRECORDS: TStringField
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCountriesSTARTINGVALUE: TIntegerField
      FieldName = 'STARTINGVALUE'
    end
    object cdsCountriesDEFAULTMAPID: TStringField
      FieldName = 'DEFAULTMAPID'
      Required = True
    end
  end
  object qReferences: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FirstReference'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LastReference'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT SOURCELIST.SOURCENUM, '
      '  SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,'
      '  SOURCELIST.SOURCEYEAR,'
      '  CONTINENTS.CONTINENT'
      'FROM SOURCELIST,CONTINENTS'
      'WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID'
      'AND SOURCELIST.SOURCESHORT >= :FirstReference'
      'AND SOURCELIST.SOURCESHORT <= :LastReference')
    SQLConnection = sqlcStrat
    Left = 368
    Top = 126
    object qReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object qReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qReferencesSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
  end
  object dspReferences: TDataSetProvider
    DataSet = qReferences
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 396
    Top = 126
  end
  object cdsReferences: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReferences'
    Left = 426
    Top = 126
    object cdsReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object cdsReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsReferencesSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
  end
  object qRefDetail: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SOURCELIST'
      'WHERE SOURCELIST.SOURCENUM=:SourceNum')
    SQLConnection = sqlcStrat
    Left = 368
    Top = 172
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
    object qRefDetailSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object qRefDetailSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
    object qRefDetailCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qRefDetailDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
  end
  object dspRefDetail: TDataSetProvider
    DataSet = qRefDetail
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 396
    Top = 172
  end
  object cdsRefDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefDetail'
    Left = 424
    Top = 172
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
    object cdsRefDetailSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object cdsRefDetailSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
    object cdsRefDetailCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsRefDetailDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
  end
  object dspRefFull: TDataSetProvider
    DataSet = qRefFull
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 396
    Top = 218
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 424
    Top = 218
    object cdsRefFullSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object cdsRefFullSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object cdsRefFullSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
    end
    object cdsRefFullCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsRefFullDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
    object cdsRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
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
  object dsReferences: TDataSource
    DataSet = cdsReferences
    Left = 454
    Top = 126
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 450
    Top = 218
  end
  object dsRefDetail: TDataSource
    DataSet = cdsRefDetail
    Left = 452
    Top = 172
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 62
    Top = 228
  end
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 90
    Top = 228
    object cdsDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsDOMAINNAME: TStringField
      DisplayLabel = 'Domain Name'
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsDomains: TDataSource
    DataSet = cdsDomains
    Left = 118
    Top = 228
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME, '
      '   DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID,'
      '   DOMAINS.DOMAINTYPEID, DOMAINS.MAXAGE,'
      '  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,'
      '   DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE'
      'FROM DOMAINS,DOMAINFOR,USERSWHOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 32
    Top = 228
    object qDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object qDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object qDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object qDomainsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object qDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
  end
  object qDomainTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMAINTYPES')
    SQLConnection = sqlcStrat
    Left = 32
    Top = 176
  end
  object dspDomainTypes: TDataSetProvider
    DataSet = qDomainTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 58
    Top = 176
  end
  object cdsDomainTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainTypes'
    Left = 86
    Top = 176
    object cdsDomainTypesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDomainTypesDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDomainTypesDVLEVEL: TIntegerField
      FieldName = 'DVLEVEL'
      Required = True
    end
  end
  object dsDomainTypes: TDataSource
    DataSet = cdsDomainTypes
    Left = 114
    Top = 176
  end
  object sqlcStrat: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\stratdb2021v30.fdb'
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
    Top = 8
  end
  object qRefFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SOURCELIST'
      'where SOURCELIST.SourceNum=:SourceNum')
    SQLConnection = sqlcStrat
    Left = 368
    Top = 220
    object IntegerField1: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object SmallintField1: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object MemoField1: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = -1
    end
    object StringField2: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'DOI'
      Size = 100
    end
    object qRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object qRefNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SOURCELISTB.SOURCEID, SOURCELISTB.CONTINENTID'
      'from SOURCELISTB')
    SQLConnection = sqlcStrat
    Left = 408
    Top = 283
    object qRefNewSOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object qRefNewCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainIDID)'
      'Values (:UnitID, :DomainID)')
    SQLConnection = sqlcStrat
    Left = 81
    Top = 292
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
    Left = 16
    Top = 378
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
    Left = 44
    Top = 378
  end
  object cdsProvinces: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProvinces'
    Left = 72
    Top = 378
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
  object dsProvinces: TDataSource
    DataSet = cdsProvinces
    Left = 100
    Top = 378
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
    Left = 12
    Top = 428
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
    Left = 36
    Top = 428
  end
  object cdsTerranes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTerranes'
    Left = 68
    Top = 426
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
  object dsTerranes: TDataSource
    DataSet = cdsTerranes
    Left = 96
    Top = 426
  end
  object qUsersWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT USERSWHOFOR.USERID, USERSWHOFOR.WHOFORID, '
      '  FORLIST.WHOFOR,FORLIST.OWNER'
      'from USERSWHOFOR, FORLIST'
      'where USERSWHOFOR.WHOFORID = FORLIST.WHOFORID'
      'and USERSWHOFOR.USERID=:UserID'
      'order by FORLIST.WHOFOR')
    SQLConnection = sqlcStrat
    Left = 12
    Top = 482
    object qUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      Size = 50
    end
    object qUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
    end
  end
  object dspUsersWhoFor: TDataSetProvider
    DataSet = qUsersWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 40
    Top = 482
  end
  object cdsUsersWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsersWhoFor'
    Left = 68
    Top = 482
    object cdsUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsUsersWhoFor: TDataSource
    DataSet = cdsUsersWhoFor
    Left = 96
    Top = 482
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 104
    Top = 8
  end
end
