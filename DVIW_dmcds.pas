unit DVIW_dmcds;

interface

uses
  Forms,
  DBXCommon, midaslib,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type
  TdmDVcds = class(TDataModule)
    sqlcDateView: TSQLConnection;
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TStringField;
    qContinentsCONTINENT: TStringField;
    dspContinents: TDataSetProvider;
    cdsContinents: TClientDataSet;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    qCountries: TSQLQuery;
    qCountriesCOUNTRYABR: TStringField;
    qCountriesCOUNTRY: TStringField;
    qCountriesCOUNTRYOFFSET: TFloatField;
    qCountriesCOUNTRYOFFSET2: TFloatField;
    qCountriesCOUNTRYOFFSET3: TFloatField;
    qCountriesCONTINENTID: TStringField;
    qCountriesCONTINENT: TStringField;
    dspCountries: TDataSetProvider;
    cdsCountries: TClientDataSet;
    cdsCountriesCOUNTRYABR: TStringField;
    cdsCountriesCOUNTRY: TStringField;
    cdsCountriesCOUNTRYOFFSET: TFloatField;
    cdsCountriesCOUNTRYOFFSET2: TFloatField;
    cdsCountriesCOUNTRYOFFSET3: TFloatField;
    cdsCountriesCONTINENTID: TStringField;
    cdsCountriesCONTINENT: TStringField;
    qUnits: TSQLQuery;
    qUnitsUNITNAME: TStringField;
    qUnitsUNITRANK: TStringField;
    qUnitsGISID: TIntegerField;
    qUnitsFORMATIONOFFSET: TFloatField;
    qUnitsFORMATIONOFFSET2: TFloatField;
    qUnitsFORMATIONOFFSET3: TFloatField;
    dspUnits: TDataSetProvider;
    cdsUnits: TClientDataSet;
    cdsUnitsUNITNAME: TStringField;
    cdsUnitsUNITRANK: TStringField;
    cdsUnitsGISID: TIntegerField;
    cdsUnitsFORMATIONOFFSET: TFloatField;
    cdsUnitsFORMATIONOFFSET2: TFloatField;
    cdsUnitsFORMATIONOFFSET3: TFloatField;
    qLithol: TSQLQuery;
    qLitholLITHOLOGY: TStringField;
    dspLithol: TDataSetProvider;
    cdsLithol: TClientDataSet;
    cdsLitholLITHOLOGY: TStringField;
    qInterpretations: TSQLQuery;
    qInterpretationsINTERPABR: TStringField;
    qInterpretationsINTERPRETATION: TStringField;
    dspInterpretations: TDataSetProvider;
    cdsInterpretations: TClientDataSet;
    cdsInterpretationsINTERPABR: TStringField;
    cdsInterpretationsINTERPRETATION: TStringField;
    qReferences: TSQLQuery;
    dspReferences: TDataSetProvider;
    cdsReferences: TClientDataSet;
    qAgeUnits: TSQLQuery;
    qAgeUnitsAGEUNITS: TStringField;
    dspAgeUnits: TDataSetProvider;
    cdsAgeUnits: TClientDataSet;
    cdsAgeUnitsAGEUNITS: TStringField;
    qApproach: TSQLQuery;
    qApproachAPPROACHABR: TStringField;
    qApproachAPPROACHDESCRIPTION: TStringField;
    dspApproach: TDataSetProvider;
    cdsApproach: TClientDataSet;
    cdsApproachAPPROACHABR: TStringField;
    cdsApproachAPPROACHDESCRIPTION: TStringField;
    qTechniques: TSQLQuery;
    qTechniquesTECHABR: TStringField;
    qTechniquesTECHNIQUE: TStringField;
    dspTechniques: TDataSetProvider;
    cdsTechniques: TClientDataSet;
    cdsTechniquesTECHABR: TStringField;
    cdsTechniquesTECHNIQUE: TStringField;
    qIsoSystems: TSQLQuery;
    qIsoSystemsISOSYSTEM: TStringField;
    qIsoSystemsISOSYSTEMNAME: TStringField;
    qIsoSystemsISOSYSNO: TIntegerField;
    qIsoSystemsDECAYCONST1: TFloatField;
    qIsoSystemsDECAYCONST2: TFloatField;
    dspIsoSystems: TDataSetProvider;
    cdsIsoSystems: TClientDataSet;
    cdsIsoSystemsISOSYSTEM: TStringField;
    cdsIsoSystemsISOSYSTEMNAME: TStringField;
    cdsIsoSystemsISOSYSNO: TIntegerField;
    cdsIsoSystemsDECAYCONST1: TFloatField;
    cdsIsoSystemsDECAYCONST2: TFloatField;
    qPrefLevels: TSQLQuery;
    qPrefLevelsPREFLEVELNO: TSmallintField;
    qPrefLevelsPREFDES: TMemoField;
    qPrefLevelsPREFSHORT: TStringField;
    dspPrefLevels: TDataSetProvider;
    cdsPrefLevels: TClientDataSet;
    cdsPrefLevelsPREFLEVELNO: TSmallintField;
    cdsPrefLevelsPREFDES: TMemoField;
    cdsPrefLevelsPREFSHORT: TStringField;
    qMaterial: TSQLQuery;
    qMaterialMATERIALABR: TStringField;
    qMaterialMATERIALDESCRIPTION: TStringField;
    dspMaterial: TDataSetProvider;
    cdsMaterial: TClientDataSet;
    cdsMaterialMATERIALABR: TStringField;
    cdsMaterialMATERIALDESCRIPTION: TStringField;
    qWhoFor: TSQLQuery;
    qWhoForWHOFORID: TStringField;
    qWhoForWHOFOR: TStringField;
    dspWhoFor: TDataSetProvider;
    cdsWhoFor: TClientDataSet;
    cdsWhoForWHOFORID: TStringField;
    cdsWhoForWHOFOR: TStringField;
    qValidationStatus: TSQLQuery;
    qValidationStatusVALIDSTATUSID: TStringField;
    qValidationStatusVALIDATIONSTATUS: TStringField;
    dspValidationStatus: TDataSetProvider;
    cdsValidationStatus: TClientDataSet;
    cdsValidationStatusVALIDSTATUSID: TStringField;
    cdsValidationStatusVALIDATIONSTATUS: TStringField;
    qSamples: TSQLQuery;
    StringField2: TStringField;
    dspSamples: TDataSetProvider;
    cdsSamples: TClientDataSet;
    qBoundaries: TSQLQuery;
    qBoundariesBOUNDARYID: TIntegerField;
    qBoundariesBOUNDARYNAME: TStringField;
    dspBoundaries: TDataSetProvider;
    cdsBoundaries: TClientDataSet;
    cdsBoundariesBOUNDARYID: TIntegerField;
    cdsBoundariesBOUNDARYNAME: TStringField;
    qBoundaryPositions: TSQLQuery;
    qBoundaryPositionsBOUNDPOSID: TStringField;
    qBoundaryPositionsBOUNDARYPOSITION: TStringField;
    dspBoundaryPositions: TDataSetProvider;
    cdsBoundaryPositions: TClientDataSet;
    cdsBoundaryPositionsBOUNDPOSID: TStringField;
    cdsBoundaryPositionsBOUNDARYPOSITION: TStringField;
    qRefTypes: TSQLQuery;
    qRefTypesSOURCETYPEID: TStringField;
    qRefTypesSOURCETYPE: TStringField;
    dspRefTypes: TDataSetProvider;
    cdsRefTypes: TClientDataSet;
    cdsRefTypesSOURCETYPEID: TStringField;
    cdsRefTypesSOURCETYPE: TStringField;
    qMethods: TSQLQuery;
    qMethodsMETHODABR: TStringField;
    qMethodsMETHODNAME: TStringField;
    dspMethods: TDataSetProvider;
    cdsMethods: TClientDataSet;
    cdsMethodsMETHODABR: TStringField;
    cdsMethodsMETHODNAME: TStringField;
    qRefDetail: TSQLQuery;
    dspRefDetail: TDataSetProvider;
    cdsRefDetail: TClientDataSet;
    qOrogenicPeriods: TSQLQuery;
    qOrogenicPeriodsOROGENICPERIODID: TStringField;
    qOrogenicPeriodsOROGENICPERIOD: TStringField;
    dspOrogenicPeriods: TDataSetProvider;
    cdsOrogenicPeriods: TClientDataSet;
    cdsOrogenicPeriodsOROGENICPERIODID: TStringField;
    cdsOrogenicPeriodsOROGENICPERIOD: TStringField;
    qChemTypes: TSQLQuery;
    qChemTypesCHEMTYPEABR: TStringField;
    qChemTypesCHEMICALTYPE: TStringField;
    dspChemTypes: TDataSetProvider;
    cdsChemTypes: TClientDataSet;
    cdsChemTypesCHEMTYPEABR: TStringField;
    cdsChemTypesCHEMICALTYPE: TStringField;
    qTerranes: TSQLQuery;
    dspTerranes: TDataSetProvider;
    cdsTerranes: TClientDataSet;
    qProvinces: TSQLQuery;
    dspProvinces: TDataSetProvider;
    cdsProvinces: TClientDataSet;
    qGroupingList: TSQLQuery;
    qGroupingListGROUPING: TStringField;
    dspGroupingList: TDataSetProvider;
    cdsGroupingList: TClientDataSet;
    cdsGroupingListGROUPING: TStringField;
    qAreaDetail: TSQLQuery;
    qAreaDetailCOUNTRYABR: TStringField;
    qAreaDetailCOUNTRY: TStringField;
    qAreaDetailCOUNTRYOFFSET: TFloatField;
    qAreaDetailCOUNTRYOFFSET2: TFloatField;
    qAreaDetailCOUNTRYOFFSET3: TFloatField;
    qAreaDetailCONTINENTID: TStringField;
    dspAreaDetail: TDataSetProvider;
    cdsAreaDetail: TClientDataSet;
    cdsAreaDetailCOUNTRYABR: TStringField;
    cdsAreaDetailCOUNTRY: TStringField;
    cdsAreaDetailCOUNTRYOFFSET: TFloatField;
    cdsAreaDetailCOUNTRYOFFSET2: TFloatField;
    cdsAreaDetailCOUNTRYOFFSET3: TFloatField;
    cdsAreaDetailCONTINENTID: TStringField;
    qImageTypes: TSQLQuery;
    qImageTypesIMAGETYPEID: TStringField;
    qImageTypesIMAGETYPE: TStringField;
    dspImageTypes: TDataSetProvider;
    cdsImageTypes: TClientDataSet;
    cdsImageTypesIMAGETYPEID: TStringField;
    cdsImageTypesIMAGETYPE: TStringField;
    qRecordIDs: TSQLQuery;
    dspRecordIDs: TDataSetProvider;
    dsRecordIDs: TDataSource;
    cdsRecordIDs: TClientDataSet;
    qResults: TSQLQuery;
    cdsResults: TClientDataSet;
    qResultsExtra: TSQLQuery;
    cdsResultsExtra: TClientDataSet;
    qIsoInit: TSQLQuery;
    cdsIsoInit: TClientDataSet;
    qIsoOther: TSQLQuery;
    cdsIsoOther: TClientDataSet;
    qProvince: TSQLQuery;
    cdsProvince: TClientDataSet;
    qTerrane: TSQLQuery;
    cdsTerrane: TClientDataSet;
    qIsoRef: TSQLQuery;
    cdsIsoRef: TClientDataSet;
    qIsoValid: TSQLQuery;
    cdsIsoValid: TClientDataSet;
    qIsoLab: TSQLQuery;
    cdsIsoLab: TClientDataSet;
    qSmpLoc: TSQLQuery;
    dspSmpLoc: TDataSetProvider;
    cdsSmpLoc: TClientDataSet;
    qIsoFor: TSQLQuery;
    cdsIsoFor: TClientDataSet;
    qIsoRef2: TSQLQuery;
    dspIsoRef2: TDataSetProvider;
    cdsIsoRef2: TClientDataSet;
    qIsoImages: TSQLQuery;
    cdsIsoImages: TClientDataSet;
    qSmpReg: TSQLQuery;
    cdsSmpReg: TClientDataSet;
    qIsoBoundary: TSQLQuery;
    cdsIsoBoundary: TClientDataSet;
    qIsoStatistics: TSQLQuery;
    cdsIsoStatistics: TClientDataSet;
    qIsoChemType: TSQLQuery;
    cdsIsoChemType: TClientDataSet;
    qIsoOrogenic: TSQLQuery;
    cdsIsoOrogenic: TClientDataSet;
    qIsoGrouping: TSQLQuery;
    cdsIsoGrouping: TClientDataSet;
    qSmpRegDetails: TSQLQuery;
    qSmpRegDetailsRECORDID: TIntegerField;
    qSmpRegDetailsISOSYSTEM: TStringField;
    qSmpRegDetailsSAMPLENO: TStringField;
    qSmpRegDetailsFRAC: TStringField;
    qSmpRegDetailsINCLUDED: TStringField;
    dspSmpRegDetails: TDataSetProvider;
    cdsSmpRegDetails: TClientDataSet;
    cdsSmpRegDetailsRECORDID: TIntegerField;
    cdsSmpRegDetailsISOSYSTEM: TStringField;
    cdsSmpRegDetailsSAMPLENO: TStringField;
    cdsSmpRegDetailsFRAC: TStringField;
    cdsSmpRegDetailsINCLUDED: TStringField;
    qImageDetails: TSQLQuery;
    qImageDetailsRECORDID: TIntegerField;
    qImageDetailsIMAGETYPEID: TStringField;
    qImageDetailsIMAGEID: TIntegerField;
    qImageDetailsIMAGECAPTION: TMemoField;
    qImageDetailsIMAGE: TBlobField;
    dspImageDetails: TDataSetProvider;
    cdsImageDetails: TClientDataSet;
    cdsImageDetailsRECORDID: TIntegerField;
    cdsImageDetailsIMAGETYPEID: TStringField;
    cdsImageDetailsIMAGEID: TIntegerField;
    cdsImageDetailsIMAGECAPTION: TMemoField;
    cdsImageDetailsIMAGE: TBlobField;
    qRefFull: TSQLQuery;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    qDisplayImages: TSQLQuery;
    qDisplayImagesDISPLAYIMAGE: TBlobField;
    cdsDisplayImages: TClientDataSet;
    dsDisplayImages: TDataSource;
    cdsDisplayImagesDISPLAYIMAGE: TBlobField;
    qDisplayImagesIMAGEID: TIntegerField;
    cdsDisplayImagesIMAGEID: TIntegerField;
    dsContinents: TDataSource;
    dsCountries: TDataSource;
    dsUnits: TDataSource;
    dsLithol: TDataSource;
    dsInterpretations: TDataSource;
    dsReferences: TDataSource;
    dsAgeUnits: TDataSource;
    dsApproach: TDataSource;
    dsTechniques: TDataSource;
    dsIsoSystems: TDataSource;
    dsPrefLevels: TDataSource;
    dsMaterial: TDataSource;
    dsWhoFor: TDataSource;
    dsValidationStatus: TDataSource;
    dscdsRecordIDs: TDataSource;
    dscdsResults: TDataSource;
    dsResultsExtra: TDataSource;
    dsIsoInit: TDataSource;
    dsIsoOther: TDataSource;
    dsProvince: TDataSource;
    dsTerrane: TDataSource;
    dsIsoRef: TDataSource;
    dsIsoValid: TDataSource;
    dsIsoOrogenic: TDataSource;
    dsIsoGrouping: TDataSource;
    dsIsoLab: TDataSource;
    dsIsoChemType: TDataSource;
    dsIsoStatistics: TDataSource;
    dsIsoBoundary: TDataSource;
    dsSmpReg: TDataSource;
    dsIsoImages: TDataSource;
    dsIsoRef2: TDataSource;
    dsIsoFor: TDataSource;
    dsSmpLoc: TDataSource;
    dsSmpRegDetails: TDataSource;
    dsImageDetails: TDataSource;
    dsRefFull: TDataSource;
    dsImageTypes: TDataSource;
    dsRefTypes: TDataSource;
    dsAreaDetail: TDataSource;
    dsGroupingList: TDataSource;
    dsProvinces: TDataSource;
    dsTerranes: TDataSource;
    dsChemTypes: TDataSource;
    dsOrogenicPeriods: TDataSource;
    dsRefDetail: TDataSource;
    dsMethods: TDataSource;
    dsBoundaryPositions: TDataSource;
    dsBoundaries: TDataSource;
    dsSamples: TDataSource;
    qUnitCountry: TSQLQuery;
    dspUnitCountry: TDataSetProvider;
    cdsUnitCountry: TClientDataSet;
    dsUnitCountry: TDataSource;
    qUnitCountryUNITNAME: TStringField;
    qUnitCountryCOUNTRYABR: TStringField;
    cdsUnitCountryUNITNAME: TStringField;
    cdsUnitCountryCOUNTRYABR: TStringField;
    qUnitArea: TSQLQuery;
    dspUnitArea: TDataSetProvider;
    cdsUnitArea: TClientDataSet;
    dsUnitArea: TDataSource;
    qUnitAreaCOUNTRYABR: TStringField;
    cdsUnitAreaCOUNTRYABR: TStringField;
    qGroupingListUSERID: TStringField;
    qGroupingListEXPIRYDATE: TSQLTimeStampField;
    cdsGroupingListUSERID: TStringField;
    cdsGroupingListEXPIRYDATE: TSQLTimeStampField;
    qAgeUnitsAGEFACTOR: TFloatField;
    cdsAgeUnitsAGEFACTOR: TFloatField;
    qLaboratories: TSQLQuery;
    dspLaboratories: TDataSetProvider;
    cdsLaboratories: TClientDataSet;
    dsLaboratories: TDataSource;
    cdsLaboratoriesLABORATORYABR: TStringField;
    cdsLaboratoriesLABORATORYNAME: TStringField;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    qYesNoYESNOID: TStringField;
    qYesNoYESNO: TStringField;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    qIsoValid2: TSQLQuery;
    cdsIsoValid2: TClientDataSet;
    dsIsoValid2: TDataSource;
    cdsRefFullCONTINENTID: TStringField;
    qUsersWhoFor: TSQLQuery;
    dspUsersWhoFor: TDataSetProvider;
    cdsUsersWhoFor: TClientDataSet;
    dsUsersWhoFor: TDataSource;
    cdsUsersWhoForUSERID: TStringField;
    cdsUsersWhoForWHOFORID: TStringField;
    cdsUsersWhoForWHOFOR: TStringField;
    qUsersWhoForUSERID: TStringField;
    qUsersWhoForWHOFORID: TStringField;
    qUsersWhoForWHOFOR: TStringField;
    qRecordIDsAll: TSQLQuery;
    dspRecordIDsAll: TDataSetProvider;
    cdsRecordIDsAll: TClientDataSet;
    dsRecordIDsAll: TDataSource;
    qResults2: TSQLQuery;
    dsResults2: TDataSource;
    cdsResults2: TClientDataSet;
    dscdsResults2: TDataSource;
    qRecordIDsMax: TSQLQuery;
    IntegerField12: TIntegerField;
    dspRecordIDsMax: TDataSetProvider;
    dsRecordIDsMax: TDataSource;
    qRecordIDsAllRECORDID: TIntegerField;
    cdsRecordIDsAllRECORDID: TIntegerField;
    cdsRecordIDsMax: TClientDataSet;
    cdsRecordIDsMaxMAX: TIntegerField;
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    qUsersUSERID: TStringField;
    cdsUsersUSERID: TStringField;
    qClosureTemperatures: TSQLQuery;
    dspClosureTemperatures: TDataSetProvider;
    cdsClosureTemperatures: TClientDataSet;
    dsClosureTemperatures: TDataSource;
    cdsClosureTemperaturesMATERIALABR: TStringField;
    cdsClosureTemperaturesISOSYSTEM: TStringField;
    cdsClosureTemperaturesAPPROACHABR: TStringField;
    cdsClosureTemperaturesBLOCKINGT: TFloatField;
    cdsClosureTemperaturesBLOCKINGTUNCERTAINTY: TFloatField;
    cdsClosureTemperaturesMATERIALDESCRIPTION: TStringField;
    cdsClosureTemperaturesISOSYSTEMNAME: TStringField;
    cdsClosureTemperaturesAPPROACHDESCRIPTION: TStringField;
    SQLQuery3: TSQLQuery;
    DataSetProvider3: TDataSetProvider;
    ClientDataSet3: TClientDataSet;
    DataSource3: TDataSource;
    qSamplesCONTINENTID: TStringField;
    qSamplesCOUNTRYABR: TStringField;
    cdsSamplesCONTINENTID: TStringField;
    cdsSamplesCOUNTRYABR: TStringField;
    cdsSamplesSAMPLENO: TStringField;
    qCountriesCOUNTRYHASRECORDS: TStringField;
    cdsCountriesCOUNTRYHASRECORDS: TStringField;
    cdsRecordIDsRECORDID: TIntegerField;
    cdsRecordIDsqResults2: TDataSetField;
    cdsRecordIDsqIsoValid2: TDataSetField;
    cdsRecordIDsqIsoGrouping: TDataSetField;
    cdsRecordIDsqIsoOrogenic: TDataSetField;
    cdsRecordIDsqIsoChemType: TDataSetField;
    cdsRecordIDsqIsoStatistics: TDataSetField;
    cdsRecordIDsqIsoBoundary: TDataSetField;
    cdsRecordIDsqIsoImages: TDataSetField;
    cdsRecordIDsqIsoFor: TDataSetField;
    cdsRecordIDsqIsoLab: TDataSetField;
    cdsRecordIDsqIsoValid: TDataSetField;
    cdsRecordIDsqIsoRef: TDataSetField;
    cdsRecordIDsqTerrane: TDataSetField;
    cdsRecordIDsqProvince: TDataSetField;
    cdsRecordIDsqIsoOther: TDataSetField;
    cdsRecordIDsqIsoInit: TDataSetField;
    cdsRecordIDsqResultsExtra: TDataSetField;
    cdsRecordIDsqResults: TDataSetField;
    cdsResultsCOUNTRYABR: TStringField;
    cdsResultsUNITNAME: TStringField;
    cdsResultsMATERIALABR: TStringField;
    cdsResultsISOTOPESYSTEM: TStringField;
    cdsResultsAPPROACHABR: TStringField;
    cdsResultsTECHABR: TStringField;
    cdsResultsINTERPABR: TStringField;
    cdsResultsPREFLEVEL: TSmallintField;
    cdsResultsIAGE: TIntegerField;
    cdsResultsIAGEPERROR: TIntegerField;
    cdsResultsIAGEMERROR: TIntegerField;
    cdsResultsAGEUNITS: TStringField;
    cdsResultsCONFIDENTIAL: TIntegerField;
    cdsResultsLITHOLOGY: TStringField;
    cdsResultsMETHODABR: TStringField;
    cdsResultsRECORDID: TIntegerField;
    cdsResultsRAGE: TFloatField;
    cdsResultsRAGEPERROR: TFloatField;
    cdsResultsRAGEMERROR: TFloatField;
    cdsResults2COUNTRYABR: TStringField;
    cdsResults2UNITNAME: TStringField;
    cdsResults2MATERIALABR: TStringField;
    cdsResults2ISOTOPESYSTEM: TStringField;
    cdsResults2APPROACHABR: TStringField;
    cdsResults2TECHABR: TStringField;
    cdsResults2INTERPABR: TStringField;
    cdsResults2PREFLEVEL: TSmallintField;
    cdsResults2IAGE: TIntegerField;
    cdsResults2IAGEPERROR: TIntegerField;
    cdsResults2IAGEMERROR: TIntegerField;
    cdsResults2AGEUNITS: TStringField;
    cdsResults2CONFIDENTIAL: TIntegerField;
    cdsResults2LITHOLOGY: TStringField;
    cdsResults2METHODABR: TStringField;
    cdsResults2RECORDID: TIntegerField;
    cdsResults2METHODNAME: TStringField;
    cdsResults2COUNTRY: TStringField;
    cdsResults2MATERIALDESCRIPTION: TStringField;
    cdsResults2INTERPRETATION: TStringField;
    cdsResults2APPROACHDESCRIPTION: TStringField;
    cdsResults2TECHNIQUE: TStringField;
    cdsResults2ISOSYSTEMNAME: TStringField;
    cdsResults2PREFSHORT: TStringField;
    cdsResults2RAGE: TFloatField;
    cdsResults2RAGEPERROR: TFloatField;
    cdsResults2RAGEMERROR: TFloatField;
    cdsResults2qSmpReg: TDataSetField;
    cdsResultsExtraRECORDID: TIntegerField;
    cdsResultsExtraDECAYCONST1: TFloatField;
    cdsResultsExtraDECAYCONST2: TFloatField;
    cdsResultsExtraSIGMAPERCENTDC1: TFloatField;
    cdsResultsExtraSIGMAPERCENTDC2: TFloatField;
    cdsResultsExtraDATESTRING: TSQLTimeStampField;
    cdsResultsExtraREGISTEREDUSER: TStringField;
    cdsIsoInitRECORDID: TIntegerField;
    cdsIsoInitINITRATIO: TFloatField;
    cdsIsoInitINITRATIOERROR: TFloatField;
    cdsIsoInitEPSILON: TFloatField;
    cdsIsoInitEPSILONERROR: TFloatField;
    cdsIsoInitMU: TFloatField;
    cdsIsoInitMUPERROR: TFloatField;
    cdsIsoInitMUMERROR: TFloatField;
    cdsIsoInitMODEL: TStringField;
    cdsIsoInitINITIALRATIO3D: TFloatField;
    cdsIsoInitINITIALRATIO3DERROR: TFloatField;
    cdsIsoOtherRECORDID: TIntegerField;
    cdsIsoOtherLWRINTERCEPT: TFloatField;
    cdsIsoOtherLWRPERROR: TFloatField;
    cdsIsoOtherLWRMERROR: TFloatField;
    cdsIsoOtherWEIGHTING: TStringField;
    cdsIsoRefRECORDID: TIntegerField;
    cdsIsoRefSOURCETYPEID: TStringField;
    cdsIsoRefSOURCETYPE: TStringField;
    cdsIsoValidRECORDID: TIntegerField;
    cdsIsoValidVALIDSTATUSID: TStringField;
    cdsIsoValidDATEDONE: TSQLTimeStampField;
    cdsIsoValidDONEBY: TStringField;
    cdsIsoValidCOMMENTS: TMemoField;
    cdsIsoValidVALIDATIONSTATUS: TStringField;
    cdsIsoLabRECORDID: TIntegerField;
    cdsIsoLabLABORATORYABR: TStringField;
    cdsIsoLabLABORATORYNAME: TStringField;
    cdsIsoValid2RECORDID: TIntegerField;
    cdsIsoValid2VALIDSTATUSID: TStringField;
    cdsIsoValid2DATEDONE: TSQLTimeStampField;
    cdsIsoValid2DONEBY: TStringField;
    cdsIsoValid2COMMENTS: TMemoField;
    cdsIsoGroupingRECORDID: TIntegerField;
    cdsIsoGroupingGROUPING: TStringField;
    cdsIsoOrogenicRECORDID: TIntegerField;
    cdsIsoOrogenicOROGENICPERIODID: TStringField;
    cdsIsoOrogenicOROGENICPERIOD: TStringField;
    cdsIsoChemTypeRECORDID: TIntegerField;
    cdsIsoChemTypeCHEMTYPEABR: TStringField;
    cdsIsoChemTypeCHEMICALTYPE: TStringField;
    cdsIsoStatisticsRECORDID: TIntegerField;
    cdsIsoStatisticsMSWD: TFloatField;
    cdsIsoStatisticsNREG: TFloatField;
    cdsIsoStatisticsNSAMPLES: TIntegerField;
    cdsIsoStatisticsALPHA: TFloatField;
    cdsIsoStatisticsNREPLICATES: TIntegerField;
    cdsIsoStatisticsDEGFREEDOM: TIntegerField;
    cdsIsoStatisticsFCUTOFF: TFloatField;
    cdsIsoStatisticsPROBOFFIT: TFloatField;
    cdsIsoStatisticsPROBOFCONCORDANCE: TFloatField;
    cdsIsoStatisticsLUDWIGP: TFloatField;
    cdsIsoStatisticsXCENTROID: TFloatField;
    cdsIsoStatisticsYCENTROID: TFloatField;
    cdsIsoStatisticsCONSTRAINTS: TStringField;
    cdsIsoStatisticsXCONSTRAIN: TFloatField;
    cdsIsoStatisticsYCONSTRAIN: TFloatField;
    cdsIsoStatisticsAGECONSTRAIN: TFloatField;
    cdsIsoStatisticsAUGMENTATION: TStringField;
    cdsIsoStatisticsSIGMAPERCENTDC1: TFloatField;
    cdsIsoStatisticsSIGMAPERCENTDC2: TFloatField;
    cdsIsoStatisticsPROGNAME: TStringField;
    cdsIsoStatisticsZCENTROID: TFloatField;
    cdsIsoStatisticsZCONSTRAIN: TFloatField;
    cdsIsoBoundaryRECORDID: TIntegerField;
    cdsIsoBoundaryBOUNDARYID: TIntegerField;
    cdsIsoBoundaryBOUNDPOSID: TStringField;
    cdsIsoBoundaryBOUNDARYNAME: TStringField;
    cdsIsoBoundaryBOUNDARYPOSITION: TStringField;
    cdsSmpRegRECORDID: TIntegerField;
    cdsSmpRegSAMPLENO: TStringField;
    cdsSmpRegFRAC: TStringField;
    cdsSmpRegINCLUDED: TStringField;
    cdsSmpRegISOSYSTEM: TStringField;
    cdsSmpRegLATITUDE: TFloatField;
    cdsSmpRegLATITUDEPRECISION: TFloatField;
    cdsSmpRegLONGITUDE: TFloatField;
    cdsSmpRegLONGITUDEPRECISION: TFloatField;
    cdsSmpRegELEVATION: TFloatField;
    cdsSmpRegELEVATIONPRECISION: TFloatField;
    cdsIsoImagesRECORDID: TIntegerField;
    cdsIsoImagesIMAGETYPEID: TStringField;
    cdsIsoImagesIMAGEID: TIntegerField;
    cdsIsoImagesIMAGETYPE: TStringField;
    cdsIsoForRECORDID: TIntegerField;
    cdsIsoForWHOFORID: TStringField;
    cdsIsoForWHOFOR: TStringField;
    cdsIsoRef2RECORDID: TIntegerField;
    cdsIsoRef2SOURCETYPEID: TStringField;
    cdsSmpLocSAMPLENO: TStringField;
    cdsSmpLocCONTINENTID: TStringField;
    cdsSmpLocCOUNTRYABR: TStringField;
    cdsSmpLocLATITUDE: TFloatField;
    cdsSmpLocLONGITUDE: TFloatField;
    cdsSmpLocELEVATION: TFloatField;
    cdsSmpLocLATITUDEPRECISION: TFloatField;
    cdsSmpLocLONGITUDEPRECISION: TFloatField;
    cdsSmpLocELEVATIONPRECISION: TFloatField;
    cdsSmpLocCONTINENT: TStringField;
    cdsSmpLocCOUNTRY: TStringField;
    qRecordIDsRECORDID: TIntegerField;
    qResultsCOUNTRYABR: TStringField;
    qResultsUNITNAME: TStringField;
    qResultsMATERIALABR: TStringField;
    qResultsISOTOPESYSTEM: TStringField;
    qResultsAPPROACHABR: TStringField;
    qResultsTECHABR: TStringField;
    qResultsINTERPABR: TStringField;
    qResultsPREFLEVEL: TSmallintField;
    qResultsIAGE: TIntegerField;
    qResultsIAGEPERROR: TIntegerField;
    qResultsIAGEMERROR: TIntegerField;
    qResultsAGEUNITS: TStringField;
    qResultsCONFIDENTIAL: TIntegerField;
    qResultsLITHOLOGY: TStringField;
    qResultsMETHODABR: TStringField;
    qResultsRECORDID: TIntegerField;
    qResultsRAGE: TFloatField;
    qResultsRAGEPERROR: TFloatField;
    qResultsRAGEMERROR: TFloatField;
    qResults2COUNTRYABR: TStringField;
    qResults2UNITNAME: TStringField;
    qResults2MATERIALABR: TStringField;
    qResults2ISOTOPESYSTEM: TStringField;
    qResults2APPROACHABR: TStringField;
    qResults2TECHABR: TStringField;
    qResults2INTERPABR: TStringField;
    qResults2PREFLEVEL: TSmallintField;
    qResults2IAGE: TIntegerField;
    qResults2IAGEPERROR: TIntegerField;
    qResults2IAGEMERROR: TIntegerField;
    qResults2AGEUNITS: TStringField;
    qResults2CONFIDENTIAL: TIntegerField;
    qResults2LITHOLOGY: TStringField;
    qResults2METHODABR: TStringField;
    qResults2RECORDID: TIntegerField;
    qResults2METHODNAME: TStringField;
    qResults2COUNTRYABR_1: TStringField;
    qResults2COUNTRY: TStringField;
    qResults2MATERIALDESCRIPTION: TStringField;
    qResults2INTERPRETATION: TStringField;
    qResults2APPROACHDESCRIPTION: TStringField;
    qResults2TECHNIQUE: TStringField;
    qResults2ISOSYSTEMNAME: TStringField;
    qResults2PREFSHORT: TStringField;
    qResults2RAGE: TFloatField;
    qResults2RAGEPERROR: TFloatField;
    qResults2RAGEMERROR: TFloatField;
    qSmpRegRECORDID: TIntegerField;
    qSmpRegSAMPLENO: TStringField;
    qSmpRegFRAC: TStringField;
    qSmpRegINCLUDED: TStringField;
    qSmpRegISOSYSTEM: TStringField;
    qSmpRegLATITUDE: TFloatField;
    qSmpRegLATITUDEPRECISION: TFloatField;
    qSmpRegLONGITUDE: TFloatField;
    qSmpRegLONGITUDEPRECISION: TFloatField;
    qSmpRegELEVATION: TFloatField;
    qSmpRegELEVATIONPRECISION: TFloatField;
    qIsoBoundaryRECORDID: TIntegerField;
    qIsoBoundaryBOUNDARYID: TIntegerField;
    qIsoBoundaryBOUNDPOSID: TStringField;
    qIsoBoundaryBOUNDARYNAME: TStringField;
    qIsoBoundaryBOUNDARYPOSITION: TStringField;
    qIsoRefRECORDID: TIntegerField;
    qIsoRefSOURCETYPEID: TStringField;
    qIsoRefSOURCETYPE: TStringField;
    qIsoLabRECORDID: TIntegerField;
    qIsoLabLABORATORYABR: TStringField;
    qIsoLabLABORATORYNAME: TStringField;
    qIsoValidRECORDID: TIntegerField;
    qIsoValidVALIDSTATUSID: TStringField;
    qIsoValidDATEDONE: TSQLTimeStampField;
    qIsoValidDONEBY: TStringField;
    qIsoValidCOMMENTS: TMemoField;
    qIsoValidVALIDATIONSTATUS: TStringField;
    qIsoImagesRECORDID: TIntegerField;
    qIsoImagesIMAGETYPEID: TStringField;
    qIsoImagesIMAGEID: TIntegerField;
    qIsoImagesIMAGETYPE: TStringField;
    qSmpLocSAMPLENO: TStringField;
    qSmpLocCONTINENTID: TStringField;
    qSmpLocCOUNTRYABR: TStringField;
    qSmpLocLATITUDE: TFloatField;
    qSmpLocLONGITUDE: TFloatField;
    qSmpLocELEVATION: TFloatField;
    qSmpLocLATITUDEPRECISION: TFloatField;
    qSmpLocLONGITUDEPRECISION: TFloatField;
    qSmpLocELEVATIONPRECISION: TFloatField;
    qSmpLocCONTINENT: TStringField;
    qSmpLocCOUNTRY: TStringField;
    qNewResult: TSQLQuery;
    dspDisplayImages: TDataSetProvider;
    qIsoForRECORDID: TIntegerField;
    qIsoForWHOFORID: TStringField;
    qIsoForWHOFOR: TStringField;
    Query1Rec: TSQLQuery;
    dspQuery1Rec: TDataSetProvider;
    cdsQuery1Rec: TClientDataSet;
    qSmpLocORIGINALNO: TStringField;
    cdsSmpLocORIGINALNO: TStringField;
    qSmpRegORIGINALNO: TStringField;
    cdsSmpRegORIGINALNO: TStringField;
    cdsIsoRef2REFNUM: TIntegerField;
    qIsoRefREFNUM: TIntegerField;
    cdsIsoRefREFNUM: TIntegerField;
    Query1COUNTRYABR: TStringField;
    Query1UNITNAME: TStringField;
    Query1MATERIALABR: TStringField;
    Query1ISOTOPESYSTEM: TStringField;
    Query1APPROACHABR: TStringField;
    Query1TECHABR: TStringField;
    Query1INTERPABR: TStringField;
    Query1PREFLEVEL: TSmallintField;
    Query1AGEUNITS: TStringField;
    Query1LITHOLOGY: TStringField;
    Query1METHODABR: TStringField;
    Query1RECORDID: TIntegerField;
    Query1COUNTRY: TStringField;
    Query1MATERIALDESCRIPTION: TStringField;
    Query1INTERPRETATION: TStringField;
    Query1APPROACHDESCRIPTION: TStringField;
    Query1TECHNIQUE: TStringField;
    Query1ISOSYSTEMNAME: TStringField;
    Query1RAGE: TFloatField;
    Query1RAGEPERROR: TFloatField;
    Query1RAGEMERROR: TFloatField;
    qRefNew: TSQLQuery;
    qRefNewCONTINENTID: TStringField;
    qUnitRanks: TSQLQuery;
    dspUnitRanks: TDataSetProvider;
    cdsUnitRanks: TClientDataSet;
    dsUnitRanks: TDataSource;
    cdsUnitRanksUNITRANKID: TStringField;
    cdsUnitRanksUNITRANK: TStringField;
    qNumRecords: TSQLQuery;
    dspNumRecords: TDataSetProvider;
    dsNumRecords: TDataSource;
    cdsNumRecords: TClientDataSet;
    cdsNumRecordsDATECOUNTED: TSQLTimeStampField;
    cdsNumRecordsNUMTOTALRECORDS: TIntegerField;
    cdsNumRecordsNUMPUBLRECORDS: TIntegerField;
    qNew: TSQLQuery;
    qSmpFrac: TSQLQuery;
    dspSmpFrac: TDataSetProvider;
    cdsSmpFrac: TClientDataSet;
    dsSmpFrac: TDataSource;
    cdsSmpFracSAMPLENO: TStringField;
    cdsSmpFracFRAC: TStringField;
    qFracsForSample: TSQLQuery;
    dspFracsForSample: TDataSetProvider;
    cdsFracsForSample: TClientDataSet;
    dsFracsForSample: TDataSource;
    cdsFracsForSampleFRAC: TStringField;
    qStratDBLink: TSQLQuery;
    cdsStratDBLink: TClientDataSet;
    dsStratDBLink: TDataSource;
    qStratDBLinkGISID: TIntegerField;
    cdsResults2qStratDBLink: TDataSetField;
    cdsStratDBLinkGISID: TIntegerField;
    qUsersNUMCONTRIBUTED: TIntegerField;
    cdsUsersNUMCONTRIBUTED: TIntegerField;
    qUsersContributed: TSQLQuery;
    dspUsersContributed: TDataSetProvider;
    cdsUsersContributed: TClientDataSet;
    dsUsersContributed: TDataSource;
    qUsersContributedUSERID: TStringField;
    qUsersContributedNUMCONTRIBUTED: TIntegerField;
    cdsUsersContributedUSERID: TStringField;
    cdsUsersContributedNUMCONTRIBUTED: TIntegerField;
    qIsoChemTypeRECORDID: TIntegerField;
    qIsoChemTypeCHEMTYPEABR: TStringField;
    qIsoChemTypeCHEMTYPEABR_1: TStringField;
    qIsoChemTypeCHEMICALTYPE: TStringField;
    qIsoOrogenicRECORDID: TIntegerField;
    qIsoOrogenicOROGENICPERIODID: TStringField;
    qIsoOrogenicOROGENICPERIOD: TStringField;
    qIsoGroupingRECORDID: TIntegerField;
    qIsoGroupingGROUPING: TStringField;
    qLIPs: TSQLQuery;
    dspLIPs: TDataSetProvider;
    cdsLIPs: TClientDataSet;
    dsLIPs: TDataSource;
    cdsLIPsLIPID: TIntegerField;
    cdsLIPsLIPNAME: TStringField;
    qIsoLIP: TSQLQuery;
    cdsIsoLIP: TClientDataSet;
    dsIsoLIP: TDataSource;
    qIsoLIPRECORDID: TIntegerField;
    qIsoLIPLIPID: TIntegerField;
    qIsoLIPLIPNAME: TStringField;
    cdsRecordIDsqIsoLIP: TDataSetField;
    cdsIsoLIPRECORDID: TIntegerField;
    cdsIsoLIPLIPID: TIntegerField;
    cdsIsoLIPLIPNAME: TStringField;
    qComment: TSQLQuery;
    cdsComment: TClientDataSet;
    dsComment: TDataSource;
    qCommentRECORDID: TIntegerField;
    qCommentCOMMENT: TMemoField;
    cdsRecordIDsqComment: TDataSetField;
    cdsCommentRECORDID: TIntegerField;
    cdsCommentCOMMENT: TMemoField;
    qSmpFracRange: TSQLQuery;
    dspSmpFracRange: TDataSetProvider;
    cdsSmpFracRange: TClientDataSet;
    dsSmpFracRange: TDataSource;
    cdsSmpFracRangeSAMPLENO: TStringField;
    cdsSmpFracRangeFRAC: TStringField;
    cdsRefFullDOI: TStringField;
    qUnitsUNITID: TIntegerField;
    cdsUnitsUNITID: TIntegerField;
    qResultsUNITID: TIntegerField;
    Query1UNITID: TIntegerField;
    cdsResultsUNITID: TIntegerField;
    qResults2UNITID: TIntegerField;
    cdsResults2UNITID: TIntegerField;
    qUnitAreaUNITID: TIntegerField;
    cdsUnitAreaUNITID: TIntegerField;
    qUnitAreaUNITNAME: TStringField;
    cdsUnitAreaUNITNAME: TStringField;
    qUnitCountryUNITID: TIntegerField;
    cdsUnitCountryUNITID: TIntegerField;
    qProvincesDOMAINNAME: TStringField;
    qProvincesCONTINENTID: TStringField;
    qProvincesDOMAINID: TIntegerField;
    qProvincesDOMAINTYPEID: TStringField;
    cdsProvincesDOMAINNAME: TStringField;
    cdsProvincesCONTINENTID: TStringField;
    cdsProvincesDOMAINID: TIntegerField;
    cdsProvincesDOMAINTYPEID: TStringField;
    qTerranesDOMAINNAME: TStringField;
    qTerranesCONTINENTID: TStringField;
    qTerranesDOMAINID: TIntegerField;
    qTerranesDOMAINTYPEID: TStringField;
    cdsTerranesDOMAINNAME: TStringField;
    cdsTerranesCONTINENTID: TStringField;
    cdsTerranesDOMAINID: TIntegerField;
    cdsTerranesDOMAINTYPEID: TStringField;
    cdsProvinceRECORDID: TIntegerField;
    cdsProvinceDOMAINID: TIntegerField;
    cdsProvinceDOMAINNAME: TStringField;
    cdsProvinceCONTINENTID: TStringField;
    cdsProvinceDOMAINTYPEID: TStringField;
    cdsTerraneRECORDID: TIntegerField;
    cdsTerraneDOMAINID: TIntegerField;
    cdsTerraneDOMAINNAME: TStringField;
    cdsTerraneCONTINENTID: TStringField;
    cdsTerraneDOMAINTYPEID: TStringField;
    cdsTerraneDOMAINTYPE: TStringField;
    cdsTerraneDOMAINTYPELEVEL: TIntegerField;
    cdsProvinceDOMAINTYPE: TStringField;
    cdsProvinceDOMAINTYPELEVEL: TIntegerField;
    qReferencesSOURCENUM: TIntegerField;
    qReferencesSOURCESHORT: TStringField;
    qReferencesCONTINENTID: TStringField;
    qReferencesCONTINENT: TStringField;
    cdsReferencesSOURCENUM: TIntegerField;
    cdsReferencesSOURCESHORT: TStringField;
    cdsReferencesCONTINENTID: TStringField;
    cdsReferencesCONTINENT: TStringField;
    qIsoRefSOURCESHORT: TStringField;
    qIsoRefSOURCEDESCRIPTION: TMemoField;
    cdsProvinceNUMRECORDSLINKED: TIntegerField;
    cdsTerraneNUMRECORDSLINKED: TIntegerField;
    cdsIsoRefSOURCESHORT: TStringField;
    cdsIsoRefSOURCEDESCRIPTION: TMemoField;
    cdsRefFullSOURCENUM: TIntegerField;
    cdsRefFullSOURCESHORT: TStringField;
    cdsRefFullSOURCEYEAR: TIntegerField;
    cdsRefFullSOURCEDESCRIPTION: TMemoField;
    qRefDetailSOURCENUM: TIntegerField;
    qRefDetailSOURCESHORT: TStringField;
    qRefDetailSOURCEYEAR: TIntegerField;
    qRefDetailSOURCEDESCRIPTION: TMemoField;
    cdsRefDetailSOURCENUM: TIntegerField;
    cdsRefDetailSOURCESHORT: TStringField;
    cdsRefDetailSOURCEYEAR: TIntegerField;
    cdsRefDetailSOURCEDESCRIPTION: TMemoField;
    Query1SOURCESHORT: TStringField;
    qRefNewSOURCESHORT: TStringField;
    qIsoValid2RECORDID: TIntegerField;
    qIsoValid2VALIDSTATUSID: TStringField;
    qIsoValid2DATEDONE: TSQLTimeStampField;
    qIsoValid2DONEBY: TStringField;
    qIsoValid2COMMENTS: TMemoField;
    qProvinceRECORDID: TIntegerField;
    qProvinceDOMAINID: TIntegerField;
    qProvinceCONTINENTID: TStringField;
    qProvinceDOMAINNAME: TStringField;
    qProvinceDOMAINTYPEID: TStringField;
    qProvinceNUMRECORDSLINKED: TIntegerField;
    qProvinceDOMAINTYPE: TStringField;
    qProvinceDOMAINTYPELEVEL: TIntegerField;
    qTerraneRECORDID: TIntegerField;
    qTerraneDOMAINID: TIntegerField;
    qTerraneCONTINENTID: TStringField;
    qTerraneDOMAINNAME: TStringField;
    qTerraneDOMAINTYPEID: TStringField;
    qTerraneNUMRECORDSLINKED: TIntegerField;
    qTerraneDOMAINTYPE: TStringField;
    qTerraneDOMAINTYPELEVEL: TIntegerField;
    Query1REFNUM: TIntegerField;
    qUsersLASTUSED: TSQLTimeStampField;
    cdsUsersLASTUSED: TSQLTimeStampField;
    qUserAccount: TSQLQuery;
    dspUserAccount: TDataSetProvider;
    cdsUserAccount: TClientDataSet;
    dsUserAccount: TDataSource;
    cdsUserAccountUSERID: TStringField;
    cdsUserAccountACCOUNTID: TStringField;
    QuerySamples: TSQLQuery;
    dspQuerySamples: TDataSetProvider;
    cdsQuerySamples: TClientDataSet;
    dsQuerySamples: TDataSource;
    cdsQuerySamplesRECORDID: TIntegerField;
    cdsQuerySamplesCONTINENTID: TStringField;
    cdsQuerySamplesCOUNTRYABR: TStringField;
    cdsQuerySamplesSAMPLENO: TStringField;
    cdsQuerySamplesFRAC: TStringField;
    cdsQuerySamplesORIGINALNO: TStringField;
    cdsQuerySamplesINCLUDED: TStringField;
    cdsQuerySamplesLONGITUDE: TFloatField;
    cdsQuerySamplesLATITUDE: TFloatField;
    cdsQuerySamplesELEVATION: TFloatField;
    cdsQuerySamplesLONGITUDEPRECISION: TFloatField;
    cdsQuerySamplesLATITUDEPRECISION: TFloatField;
    cdsQuerySamplesELEVATIONPRECISION: TFloatField;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINNAME: TStringField;
    cdsDomainsCONTINENTID: TStringField;
    cdsDomainsDOMAINID: TIntegerField;
    qThisUnit: TSQLQuery;
    dspThisUnit: TDataSetProvider;
    cdsThisUnit: TClientDataSet;
    dsThisUnit: TDataSource;
    cdsThisUnitUNITID: TIntegerField;
    cdsThisUnitUNITNAME: TStringField;
    cdsThisUnitUNITRANK: TStringField;
    cdsThisUnitGISID: TIntegerField;
    cdsThisUnitFORMATIONOFFSET: TFloatField;
    cdsThisUnitFORMATIONOFFSET2: TFloatField;
    cdsThisUnitFORMATIONOFFSET3: TFloatField;
    cdsThisUnitPARENTID: TIntegerField;
    qThisUnitCountry: TSQLQuery;
    dspThisUnitCountry: TDataSetProvider;
    cdsThisUnitCountry: TClientDataSet;
    dsThisUnitCountry: TDataSource;
    cdsThisUnitCountryUNITID: TIntegerField;
    cdsThisUnitCountryCOUNTRYABR: TStringField;
    cdsThisUnitCountryUNITHASRECORDS: TStringField;
    QueryInit: TSQLQuery;
    dspQueryInit: TDataSetProvider;
    cdsQueryInit: TClientDataSet;
    dsQueryInit: TDataSource;
    cdsQueryInitCOUNTRYABR: TStringField;
    cdsQueryInitUNITID: TIntegerField;
    cdsQueryInitMATERIALABR: TStringField;
    cdsQueryInitISOTOPESYSTEM: TStringField;
    cdsQueryInitAPPROACHABR: TStringField;
    cdsQueryInitTECHABR: TStringField;
    cdsQueryInitINTERPABR: TStringField;
    cdsQueryInitPREFLEVEL: TSmallintField;
    cdsQueryInitAGEUNITS: TStringField;
    cdsQueryInitCONFIDENTIAL: TIntegerField;
    cdsQueryInitLITHOLOGY: TStringField;
    cdsQueryInitMETHODABR: TStringField;
    cdsQueryInitRECORDID: TIntegerField;
    cdsQueryInitCOUNTRY: TStringField;
    cdsQueryInitMATERIALDESCRIPTION: TStringField;
    cdsQueryInitINTERPRETATION: TStringField;
    cdsQueryInitAPPROACHDESCRIPTION: TStringField;
    cdsQueryInitTECHNIQUE: TStringField;
    cdsQueryInitISOSYSTEMNAME: TStringField;
    cdsQueryInitRAGE: TFloatField;
    cdsQueryInitRAGEPERROR: TFloatField;
    cdsQueryInitRAGEMERROR: TFloatField;
    cdsQueryInitSOURCESHORT: TStringField;
    cdsQueryInitUNITNAME: TStringField;
    cdsQueryInitREFNUM: TIntegerField;
    cdsQueryInitINITRATIO: TFloatField;
    cdsQueryInitINITRATIOERROR: TFloatField;
    cdsQueryInitEPSILON: TFloatField;
    cdsQueryInitEPSILONERROR: TFloatField;
    cdsQueryInitMU: TFloatField;
    cdsQueryInitMUPERROR: TFloatField;
    cdsQueryInitMUMERROR: TFloatField;
    cdsQueryInitMODEL: TStringField;
    SQLMonitor1: TSQLMonitor;
    qSmpLocLITHOLOGY: TStringField;
    qSmpLocLITHCLASSID: TStringField;
    qSmpLocLITHCLASS: TStringField;
    cdsSmpLocLITHOLOGY: TStringField;
    cdsSmpLocLITHCLASSID: TStringField;
    cdsSmpLocLITHCLASS: TStringField;
    qSampleZones: TSQLQuery;
    dspSampleZones: TDataSetProvider;
    cdsSampleZones: TClientDataSet;
    dsSampleZones: TDataSource;
    cdsSampleZonesZONEID: TStringField;
    cdsSampleZonesZONETYPE: TStringField;
    cdsSmpFracRangeZONEID: TStringField;
    cdsSmpFracZONEID: TStringField;
    qSameSampleResults: TSQLQuery;
    dspSameSampleResults: TDataSetProvider;
    cdsSameSampleResults: TClientDataSet;
    dsSameSampleResults: TDataSource;
    qSameSampleResultsRECORDID: TIntegerField;
    qSameSampleResultsINTERPABR: TStringField;
    qSameSampleResultsPREFLEVEL: TSmallintField;
    qSameSampleResultsMATERIALABR: TStringField;
    qSameSampleResultsISOTOPESYSTEM: TStringField;
    qSameSampleResultsAPPROACHABR: TStringField;
    qSameSampleResultsRAGE: TFloatField;
    qSameSampleResultsRAGEPERROR: TFloatField;
    qSameSampleResultsRAGEMERROR: TFloatField;
    qSameSampleResultsAGEUNITS: TStringField;
    cdsSameSampleResultsRECORDID: TIntegerField;
    cdsSameSampleResultsINTERPABR: TStringField;
    cdsSameSampleResultsPREFLEVEL: TSmallintField;
    cdsSameSampleResultsMATERIALABR: TStringField;
    cdsSameSampleResultsISOTOPESYSTEM: TStringField;
    cdsSameSampleResultsAPPROACHABR: TStringField;
    cdsSameSampleResultsRAGE: TFloatField;
    cdsSameSampleResultsRAGEPERROR: TFloatField;
    cdsSameSampleResultsRAGEMERROR: TFloatField;
    cdsSameSampleResultsAGEUNITS: TStringField;
    qSmpFracSAMPLENO: TStringField;
    qSmpFracFRAC: TStringField;
    qSmpFracZONEID: TStringField;
    Query1WHOFORID: TStringField;
    cdsQueryInitWHOFORID: TStringField;
    cdsQuerySamplesLITHOLOGY: TStringField;
    cdsQuery1RecCOUNT: TFMTBCDField;
    qSmpLocIGSN: TStringField;
    cdsSmpLocIGSN: TStringField;
    qLitholLITHGROUPID: TSmallintField;
    qLitholLITHGROUP: TStringField;
    cdsLitholLITHGROUPID: TSmallintField;
    cdsLitholLITHGROUP: TStringField;
    qSmpRegLITHOLOGY: TStringField;
    qSmpRegIGSN: TStringField;
    cdsSmpRegLITHOLOGY: TStringField;
    cdsSmpRegIGSN: TStringField;
    QueryCombined: TSQLQuery;
    dspQueryCombined: TDataSetProvider;
    cdsQueryCombined: TClientDataSet;
    dsQueryCombined: TDataSource;
    QueryCombinedCOUNTRYABR: TStringField;
    QueryCombinedUNITID: TIntegerField;
    QueryCombinedMATERIALABR: TStringField;
    QueryCombinedISOTOPESYSTEM: TStringField;
    QueryCombinedAPPROACHABR: TStringField;
    QueryCombinedTECHABR: TStringField;
    QueryCombinedINTERPABR: TStringField;
    QueryCombinedPREFLEVEL: TSmallintField;
    QueryCombinedAGEUNITS: TStringField;
    QueryCombinedLITHOLOGY: TStringField;
    QueryCombinedMETHODABR: TStringField;
    QueryCombinedRECORDID: TIntegerField;
    QueryCombinedCOUNTRY: TStringField;
    QueryCombinedMATERIALDESCRIPTION: TStringField;
    QueryCombinedINTERPRETATION: TStringField;
    QueryCombinedAPPROACHDESCRIPTION: TStringField;
    QueryCombinedTECHNIQUE: TStringField;
    QueryCombinedISOSYSTEMNAME: TStringField;
    QueryCombinedRAGE: TFloatField;
    QueryCombinedRAGEPERROR: TFloatField;
    QueryCombinedRAGEMERROR: TFloatField;
    QueryCombinedSOURCESHORT: TStringField;
    QueryCombinedUNITNAME: TStringField;
    QueryCombinedREFNUM: TIntegerField;
    QueryCombinedWHOFORID: TStringField;
    QueryCombinedSAMPLENO: TStringField;
    QueryCombinedFRAC: TStringField;
    QueryCombinedLONGITUDE: TFloatField;
    QueryCombinedLATITUDE: TFloatField;
    QueryCombinedELEVATION: TFloatField;
    QueryCombinedINCLUDED: TStringField;
    cdsQueryCombinedCOUNTRYABR: TStringField;
    cdsQueryCombinedUNITID: TIntegerField;
    cdsQueryCombinedMATERIALABR: TStringField;
    cdsQueryCombinedISOTOPESYSTEM: TStringField;
    cdsQueryCombinedAPPROACHABR: TStringField;
    cdsQueryCombinedTECHABR: TStringField;
    cdsQueryCombinedINTERPABR: TStringField;
    cdsQueryCombinedPREFLEVEL: TSmallintField;
    cdsQueryCombinedAGEUNITS: TStringField;
    cdsQueryCombinedLITHOLOGY: TStringField;
    cdsQueryCombinedMETHODABR: TStringField;
    cdsQueryCombinedRECORDID: TIntegerField;
    cdsQueryCombinedCOUNTRY: TStringField;
    cdsQueryCombinedMATERIALDESCRIPTION: TStringField;
    cdsQueryCombinedINTERPRETATION: TStringField;
    cdsQueryCombinedAPPROACHDESCRIPTION: TStringField;
    cdsQueryCombinedTECHNIQUE: TStringField;
    cdsQueryCombinedISOSYSTEMNAME: TStringField;
    cdsQueryCombinedRAGE: TFloatField;
    cdsQueryCombinedRAGEPERROR: TFloatField;
    cdsQueryCombinedRAGEMERROR: TFloatField;
    cdsQueryCombinedSOURCESHORT: TStringField;
    cdsQueryCombinedUNITNAME: TStringField;
    cdsQueryCombinedREFNUM: TIntegerField;
    cdsQueryCombinedWHOFORID: TStringField;
    cdsQueryCombinedSAMPLENO: TStringField;
    cdsQueryCombinedFRAC: TStringField;
    cdsQueryCombinedLONGITUDE: TFloatField;
    cdsQueryCombinedLATITUDE: TFloatField;
    cdsQueryCombinedELEVATION: TFloatField;
    cdsQueryCombinedINCLUDED: TStringField;
    cdsQuery1COUNTRYABR: TStringField;
    cdsQuery1UNITID: TIntegerField;
    cdsQuery1MATERIALABR: TStringField;
    cdsQuery1ISOTOPESYSTEM: TStringField;
    cdsQuery1APPROACHABR: TStringField;
    cdsQuery1TECHABR: TStringField;
    cdsQuery1INTERPABR: TStringField;
    cdsQuery1PREFLEVEL: TSmallintField;
    cdsQuery1AGEUNITS: TStringField;
    cdsQuery1UNITNAME: TStringField;
    cdsQuery1LITHOLOGY: TStringField;
    cdsQuery1METHODABR: TStringField;
    cdsQuery1RECORDID: TIntegerField;
    cdsQuery1COUNTRY: TStringField;
    cdsQuery1MATERIALDESCRIPTION: TStringField;
    cdsQuery1INTERPRETATION: TStringField;
    cdsQuery1APPROACHDESCRIPTION: TStringField;
    cdsQuery1TECHNIQUE: TStringField;
    cdsQuery1ISOSYSTEMNAME: TStringField;
    cdsQuery1RAGE: TFloatField;
    cdsQuery1RAGEPERROR: TFloatField;
    cdsQuery1RAGEMERROR: TFloatField;
    cdsQuery1SOURCESHORT: TStringField;
    cdsQuery1REFNUM: TIntegerField;
    cdsQuery1WHOFORID: TStringField;
    procedure cdsIsoValidReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsResultsCalcFields(DataSet: TDataSet);
    procedure dsSmpLocDataChange(Sender: TObject; Field: TField);
    procedure dsSmpRegDataChange(Sender: TObject; Field: TField);
  private
  public
    procedure ConstructUnitAreaQuery;
    procedure SubmitContAreaQuery;
    procedure SubmitSQL1(SQLMemoField : String);
    procedure SubmitQuery1;
    procedure ConstructQuery;
    procedure ConstructQueryStringList ( QueryUse : integer; var tmpStringList : TStringList);
    procedure ConstructQueryStringListJoin ( QueryUse : integer; var tmpStringList : TStringList);
    procedure ConstructQuerySamplesStringListJoin ( QueryUse : integer; var tmpStringList : TStringList);
    procedure SubmitNewRecord(var WasSuccessful : boolean);
    procedure SubmitNewRecord2(var WasSuccessful : boolean);
    procedure ConstructClosureTemperatureQuery;
    procedure Query1RecordCount;
    procedure SubmitNewReference(var WasSuccessful : boolean);
    procedure AddNewSample(var WasSuccessful : boolean);
    procedure AddNewSampleFrac(var WasSuccessful : boolean);
    procedure AddNewRecordWithDecayconstErrors(var WasSuccessful : boolean);
    procedure AddUnitAreaLink(tUnitID     : string;
                              tCountryAbr : string;
                              var WasSuccessful : boolean);
    procedure AddUnit(tUnitName : string;
                  var WasSuccessful : boolean);
    procedure ConstructReferenceQuery;
    procedure ConstructDomainQuery;
    procedure AddNewComment(var WasSuccessful : boolean);
    procedure AddNewOtherIntercept(var WasSuccessful : boolean);
    procedure AddNewUser(var WasSuccessful : boolean);
    procedure AddNewUserWhoFor(var WasSuccessful : boolean);
  end;

// Procs
  function dmDVcds: TdmDVcds;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, DVIW_constants, usrIW_dm;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function dmDVcds: TdmDVcds;
begin
  Result := TUserSession(WebApplication.Data).dmDV;
end;


procedure TdmDVcds.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;


procedure TdmDVcds.ConstructUnitAreaQuery;
var
  i : integer;
begin
  //Areas
  dmDV.qCountries.Close;
  dmDV.qCountries.SQL.Clear;
  dmDV.qCountries.SQL.Add('select Country.CountryAbr, Country.Country, Country.CountryOffset,');
  dmDV.qCountries.SQL.Add('  Country.CountryOffset2, Country.CountryOffset3, Country.ContinentID,');
  dmDV.qCountries.SQL.Add('  Continent.Continent, Country.CountryHasRecords');
  dmDV.qCountries.SQL.Add('from Country, Continent');
  dmDV.qCountries.SQL.Add('where Country.ContinentID=Continent.ContinentID');
  dmDV.qCountries.SQL.Add('and Country.CountryHasRecords = '+''''+'Y'+'''');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qCountries.SQL.Add('AND ( COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qCountries.SQL.Add('OR COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qCountries.SQL.Add(' ) ');
  end;
  dmDV.qCountries.SQL.Add('order by Country.Country');
  dmDV.cdsCountries.Close;
  //UnitAreas
  dmDV.qUnitArea.Close;
  dmDV.qUnitArea.SQL.Clear;
  dmDV.qUnitArea.SQL.Add('SELECT DISTINCT SUITECOUNTRY.UNITID, SUITECOUNTRY.COUNTRYABR, SUITE.UNITNAME');
  dmDV.qUnitArea.SQL.Add('FROM SUITECOUNTRY,SUITE,COUNTRY,CONTINENT');
  dmDV.qUnitArea.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qUnitArea.SQL.Add('AND COUNTRY.COUNTRYABR = SUITECOUNTRY.COUNTRYABR');
  dmDV.qUnitArea.SQL.Add('AND SUITECOUNTRY.UNITID = SUITE.UNITID');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qUnitArea.SQL.Add('AND ( CONTINENT.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qUnitArea.SQL.Add('OR CONTINENT.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qUnitArea.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmDV.qUnitArea.SQL.Add('AND ( SUITECOUNTRY.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDV.qUnitArea.SQL.Add('OR SUITECOUNTRY.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qUnitArea.SQL.Add(' ) ');
  end;
  dmDV.qUnitArea.SQL.Add('ORDER BY SUITE.UNITNAME');
  //dmUser.SetDeveloperData('ConstructUnitAreaQuerySuiteCountry '+dmDV.qUnitArea.SQL.Text);
  //Provinces
  dmDV.qProvinces.Close;
  dmDV.qProvinces.SQL.Clear;
  dmDV.qProvinces.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID,');
  dmDV.qProvinces.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
  dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
  dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
  dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
  dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qProvinces.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qProvinces.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qProvinces.SQL.Add(' ) ');
  end;
  dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
  {
  if UserSession.IsDeveloper then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'ConstructUnitAreaQueryProvinces '+dmDV.qProvinces.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  //Terranes
  dmDV.qTerranes.Close;
  dmDV.qTerranes.SQL.Clear;
  dmDV.qTerranes.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID,');
  dmDV.qTerranes.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
  dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
  dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
  dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
  dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qTerranes.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qTerranes.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qTerranes.SQL.Add(' ) ');
  end;
  dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
  {
  if UserSession.IsDeveloper then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'ConstructUnitAreaQueryTerranes '+dmDV.qTerranes.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  //Grouping
  dmDV.qGroupingList.Close;
  dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
  //References
  dmDV.qReferences.Close;
  dmDV.qReferences.SQL.Clear;
  dmDV.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmDV.qReferences.SQL.Add('  CONTINENT.CONTINENT');
  dmDV.qReferences.SQL.Add('FROM SOURCELIST,CONTINENT');
  dmDV.qReferences.SQL.Add('WHERE CONTINENT.CONTINENTID = SOURCELIST.CONTINENTID');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :LastReference');
  dmDV.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedCONTINENTID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmDV.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmDV.qReferences.SQL.Add(' ) ');
  dmDV.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT');
  {
  if UserSession.IsDeveloper then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'ConstructUnitAreaQueryContinentReferences '+dmDV.qReferences.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  //Samples
  dmDV.qSamples.Close;
  dmDV.qSamples.SQL.Clear;
  dmDV.qSamples.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
  dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qSamples.SQL.Add('AND ( SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qSamples.SQL.Add('OR SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSamples.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmDV.qSamples.SQL.Add('AND ( SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDV.qSamples.SQL.Add('OR SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSamples.SQL.Add(' ) ');
  end;
  {
  if UserSession.IsDeveloper then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'ConstructUnitAreaQuerySamples '+dmDV.qSamples.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
  //Samples and Fractions
  dmDV.qSmpFrac.Close;
  dmDV.qSmpFrac.SQL.Clear;
  dmDV.qSmpFrac.SQL.Add('SELECT DISTINCT SMPFRAC.SAMPLENO, SMPFRAC.FRAC');
  dmDV.qSmpFrac.SQL.Add('FROM SMPFRAC,SMPLOC,COUNTRY,CONTINENT');
  dmDV.qSmpFrac.SQL.Add('WHERE SMPFRAC.SAMPLENO = SMPLOC.SAMPLENO');
  dmDV.qSmpFrac.SQL.Add('AND CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
  dmDV.qSmpFrac.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
  dmDV.qSmpFrac.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qSmpFrac.SQL.Add('AND ( SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qSmpFrac.SQL.Add('OR SMPLOC.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpFrac.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmDV.qSmpFrac.SQL.Add('AND ( SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDV.qSmpFrac.SQL.Add('OR SMPLOC.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qSmpFrac.SQL.Add(' ) ');
  end;
  {
  if UserSession.IsDeveloper then
  begin
    try
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := 'ConstructUnitAreaQueryFractions '+dmDV.qSmpFrac.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    except
    end;
  end;
  }
end;

procedure TdmDVcds.dsSmpLocDataChange(Sender: TObject; Field: TField);
begin
  {
  if (dmDV.cdsSmpLoc.State in [dsEdit,dsInsert]) then
  begin
    if (Pos('New',dmDV.cdsSmpLocORIGINALNO.AsString) < 2) then
    begin
      dmDV.cdsSmpLocORIGINALNO.AsString := dmDV.cdsSmpLocSAMPLENO.AsString;
    end;
  end;
  }
end;

procedure TdmDVcds.dsSmpRegDataChange(Sender: TObject; Field: TField);
begin

end;

{
procedure TdmDV.SQLMonitor1LogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc30);
var
  LogFileName: string;
begin
  with Sender as TSQLMonitor do
  begin
    if TraceCount = 10 then
    begin
      LogFileName := 'c:\log' + IntToStr(Tag) + '.txt';
      Tag := Tag + 1; //ensure next log file has a different name
      SaveToFile(LogFileName);
      TraceList.Clear; //clear list
    end;
  end;
end;
}

procedure TdmDVcds.SubmitContAreaQuery;
begin
  ConstructUnitAreaQuery;
  dmUser.SetFormData2(dmDV.qUnitArea.SQL.Text);
end;

procedure TdmDVcds.SubmitSQL1(SQLMemoField : String);
begin
  dmDV.Query1.Close;
  dmDV.Query1.SQL.Clear;
  dmDV.Query1.SQL.Text := SQLMemoField;
  dmUser.SetFormData2(SQLMemoField);
  dmDV.Query1.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.Query1.Open;
end;

procedure TdmDVcds.SubmitQuery1;
begin
  ConstructQuery;
  if UserSession.IsDeveloper then
  begin
      //dmUser.SetDeveloperData('SubmitQuery1 '+dmDV.Query1.SQL.Text);
  end;
  dmUser.SetFormData2(dmDV.Query1.SQL.Text);
end;

procedure TdmDVcds.ConstructQuery;
var
  i, itmp, iCode : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
  FromEpsilon, ToEpsilon : double;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 1;
  dmDV.cdsQuery1.Close;
  dmDV.Query1.Close;
  dmDV.Query1.SQL.Clear;
  dmDV.Query1.SQL.Add('SELECT DISTINCT ISORGR30.COUNTRYABR, ISORGR30.UNITID, ISORGR30.MATERIALABR, ');
  dmDV.Query1.SQL.Add('ISORGR30.ISOTOPESYSTEM, ISORGR30.APPROACHABR, ISORGR30.TECHABR, SUITE.UNITNAME,');
  dmDV.Query1.SQL.Add('ISORGR30.INTERPABR, ISORGR30.PREFLEVEL,  ');
  dmDV.Query1.SQL.Add('ISORGR30.AGEUNITS, ');
  dmDV.Query1.SQL.Add('ISORGR30.LITHOLOGY, ISORGR30.METHODABR, ISORGR30.RECORDID, ');
  dmDV.Query1.SQL.Add('COUNTRY.COUNTRY, MATERIAL.MATERIALDESCRIPTION, INTERPRETATION.INTERPRETATION, ');
  dmDV.Query1.SQL.Add('APPROACH.APPROACHDESCRIPTION, TECHNIQUE.TECHNIQUE, ISOSYSTEM.ISOSYSTEMNAME,  ');
  dmDV.Query1.SQL.Add('ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR, SOURCELIST.SOURCESHORT, SOURCEA.REFNUM,  ');
  dmDV.Query1.SQL.Add('ISOFOR.WHOFORID  ');
  dmDV.cdsQueryInit.Close;
  dmDV.QueryInit.Close;
  dmDV.QueryInit.SQL.Clear;
  dmDV.QueryInit.SQL.Text := dmDV.Query1.SQL.Text;
  dmDV.QueryInit.SQL.Add(', isoinit.initratio,isoinit.initratioerror,');
  dmDV.QueryInit.SQL.Add('isoinit.epsilon,isoinit.epsilonerror,');
  dmDV.QueryInit.SQL.Add('isoinit.mu,isoinit.muperror,isoinit.mumerror,isoinit.model');

  dmDV.QueryCombined.Close;
  dmDV.QueryCombined.SQL.Clear;
  dmDV.QueryCombined.SQL.Text := dmDV.Query1.SQL.Text;
  dmDV.QueryCombined.SQL.Add(', SMPLOC.SampleNo, SMPREG.Frac, SMPLOC.Longitude, SMPLOC.Latitude, SMPLOC.Elevation, SMPREG.Included ');

  if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
  begin
    dmDV.Query1.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,');
    dmDV.Query1.SQL.Add('      TECHNIQUE,ISOSYSTEM,SUITE,USERSWHOFOR,ISOFOR,SOURCEA,SOURCELIST');
    dmDV.QueryInit.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,');
    dmDV.QueryInit.SQL.Add('      TECHNIQUE,ISOSYSTEM,SUITE,USERSWHOFOR,ISOFOR,SOURCEA,SOURCELIST,ISOINIT');
    dmDV.QueryCombined.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,');
    dmDV.QueryCombined.SQL.Add('      TECHNIQUE,ISOSYSTEM,SUITE,USERSWHOFOR,ISOFOR,SOURCEA,SOURCELIST,SMPLOC,SMPREG');
  end;
  if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
  begin
    dmDV.Query1.SQL.Add('FROM ISORGR30');
    dmDV.QueryInit.SQL.Add('FROM ISORGR30,ISOINIT');
    dmDV.QueryCombined.SQL.Add('FROM ISORGR30,SMPLOC,SMPREG');
  end;
  if UserSession.IsDeveloper then
  begin
      //dmUser.SetDeveloperData('SubmitQuery1a '+dmDV.Query1.SQL.Text);
      //dmUser.SetDeveloperData('SubmitQueryInita '+dmDV.QueryInit.SQL.Text);
  end;
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeLithologyValues
      or UserSession.IncludeIgneous
      or UserSession.IncludeSedimentary
      or UserSession.IncludeMetamorphicAndOther
      or UserSession.IncludeMaterialValues
      or UserSession.IncludeIsotopeSystemValues
      or UserSession.IncludeApproachValues
      or UserSession.IncludeInterpretationValues
      or UserSession.IncludeTechniqueValues
      or UserSession.IncludeMethodValues
      or UserSession.IncludeGroupValues
      or UserSession.IncludeProvinceValues
      or UserSession.IncludeTerraneValues
      or UserSession.IncludeLIPValues
      or UserSession.IncludeOrogenicPeriodValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeChemicalTypeValues
      or UserSession.IncludeIsochronOnlyValue
      or UserSession.IncludeWhoForValues
      or UserSession.IncludeUsersContributedValues
      or (UserSession.PreferenceLevelValue <> '')
      or UserSession.IncludeCoordinates
      or UserSession.IncludeEpsilonFromValue
      or UserSession.IncludeEpsilonToValue
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeUserOrgID
      or UserSession.IncludeDateToValue) then
  begin
    tmpStringList := TStringList.Create;
    try
      if not UserSession.IncludeUserOrgID then ConstructQueryStringList(QueryUse,tmpStringList);
      if UserSession.IncludeUserOrgID then
      begin
        if (UserSession.UserOrgIDValue='Y') then ConstructQueryStringList(QueryUse,tmpStringList);
        if (UserSession.UserOrgIDValue='N') then ConstructQueryStringListJoin(QueryUse,tmpStringList);
      end;
      i := tmpStringList.Count;
      for i := 0 to tmpStringList.Count - 1 do
      begin
        dmDV.Query1.SQL.Add(tmpStringList.Strings[i]);
        dmDV.QueryInit.SQL.Add(tmpStringList.Strings[i]);
        dmDV.QueryCombined.SQL.Add(tmpStringList.Strings[i]);
      end;
    finally
      FreeAndNil(tmpStringList);
    end;
    //dmDV.Query1.SQL.Add('AND ISORGR30.RECORDID=ISOFOR.RECORDID ');
    dmDV.QueryInit.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
    //dmDV.QueryCombined.SQL.Add('AND ISORGR30.RECORDID=ISOFOR.RECORDID ');
    dmDV.QueryCombined.SQL.Add('AND ISORGR30.RECORDID=SMPREG.RECORDID ');
    dmDV.QueryCombined.SQL.Add('AND ISORGR30.IsotopeSystem=SMPREG.ISOSYSTEM ');
    dmDV.QueryCombined.SQL.Add('AND SMPREG.SampleNo=SMPLOC.SampleNo ');
    if (UserSession.OrderByValue = '0') then
    begin
      dmDV.Query1.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.TECHABR,ISORGR30.RAGE');
      dmDV.QueryInit.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.TECHABR,ISORGR30.RAGE');
      dmDV.QueryCombined.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.TECHABR,ISORGR30.RAGE');
    end;
    if (UserSession.OrderByValue = '1') then
    begin
      dmDV.Query1.SQL.Add('ORDER by ISORGR30.RecordID');
      dmDV.QueryInit.SQL.Add('ORDER by ISORGR30.RecordID');
      dmDV.QueryCombined.SQL.Add('ORDER by ISORGR30.RecordID');
    end;
    if (UserSession.OrderByValue = '2') then
    begin
      dmDV.Query1.SQL.Add('ORDER by ISORGR30.RAge,ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
      dmDV.QueryInit.SQL.Add('ORDER by ISORGR30.RAge,ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
      dmDV.QueryCombined.SQL.Add('ORDER by ISORGR30.RAge,ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
    end;
    if (UserSession.OrderByValue = '3') then
    begin
      dmDV.Query1.SQL.Add('ORDER by ISORGR30.MaterialAbr,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.RAGE,ISORGR30.TECHABR,ISORGR30.COUNTRYABR,SUITE.UNITNAME');
      dmDV.QueryInit.SQL.Add('ORDER by ISORGR30.MaterialAbr,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.RAGE,ISORGR30.TECHABR,ISORGR30.COUNTRYABR,SUITE.UNITNAME');
      dmDV.QueryCombined.SQL.Add('ORDER by ISORGR30.MaterialAbr,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL,ISORGR30.RAGE,ISORGR30.TECHABR,ISORGR30.COUNTRYABR,SUITE.UNITNAME');
    end;
    if (UserSession.OrderByValue = '4') then
    begin
      dmDV.Query1.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.RAge,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
      dmDV.QueryInit.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.RAge,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
      dmDV.QueryCombined.SQL.Add('ORDER by ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.RAge,ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,ISORGR30.PREFLEVEL');
    end;
    dmDV.Query1.SQL.Add(' ');
    dmDV.QueryInit.SQL.Add(' ');
    dmDV.QueryCombined.SQL.Add(' ');
  end;
  if UserSession.IsDeveloper then
  begin
      //dmUser.SetDeveloperData('SubmitQuery1b '+dmDV.Query1.SQL.Text);
      //dmUser.SetDeveloperData('SubmitQueryInitb '+dmDV.QueryInit.SQL.Text);
      dmUser.SetDeveloperData('SubmitQuery1Combinedb '+dmDV.QueryCombined.SQL.Text);
  end;
  dmDV.Query1.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.QueryInit.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.QueryCombined.ParamByName('USERID').AsString := UserSession.UserID;
end;

procedure TdmDVcds.ConstructQueryStringList ( QueryUse : integer; var tmpStringList : TStringList);
var
  i, itmp, iCode : integer;
  iLitholClassesSelected : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
  FromEpsilon, ToEpsilon : double;
begin
  //QueryUse = 1 when need to include lookup fields
  //  for Material, Approach, Interpretation, Isotope System, Technique, SourceID
  //QueryUse = 2 when not needed

//    Query1Rec.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,');
//    Query1Rec.SQL.Add('      TECHNIQUE,ISOSYSTEM,SUITE,USERSWHOFOR,ISOFOR,SOURCEA,SOURCELIST');

  tmpStringList.Clear;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,FromEpsilon,iCode);
      UserSession.EpsilonFromValue := FormatFloat('###0.00',FromEpsilon);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,ToEpsilon,iCode);
      UserSession.EpsilonToValue := FormatFloat('###0.00',ToEpsilon);
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      tmpStringList.Add('    ,LITHOL ');
    end;
    if ((QueryUse > 1) and (UserSession.IncludeReferenceValues)) then
    begin
      tmpStringList.Add('      ,SOURCEA');
    end;
    if (UserSession.IncludeGroupValues) then
    begin
      tmpStringList.Add('    ,GROUPING ');
    end;
    if ((UserSession.IncludeProvinceValues) or (UserSession.IncludeTerraneValues)) then
    begin
      tmpStringList.Add('    ,DOMAINS,ISOPROVTERR ');
    end;
    if (UserSession.IncludeLIPValues) then
    begin
      tmpStringList.Add('    ,ISOLIP ');
    end;
    if (UserSession.IncludeOrogenicPeriodValues) then
    begin
      tmpStringList.Add('    ,ISOOROGENIC ');
    end;
    if (UserSession.IncludeChemicalTypeValues) then
    begin
      tmpStringList.Add('    ,ISOCHEMTYPE ');
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      tmpStringList.Add('    ,ISOSTATISTICS ');
    end;
    if UserSession.IncludeBoundaryValues then
    begin
      tmpStringList.Add('    ,ISOBOUNDARY ');
    end;
    if (UserSession.IncludeValidationValues or UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('    ,ISOVALID ');
    end;
    if UserSession.IncludeCoordinates then
    begin
      tmpStringList.Add('    ,SMPREG,SMPLOC ');
    end;
    if UserSession.IncludeUserOrgID then
    begin
      tmpStringList.Add('    ,USERACCOUNT,ISOUUID ');
    end;
    if UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue then
    begin
      tmpStringList.Add('    ,ISOINIT ');
    end;
    tmpStringList.Add('WHERE USERSWHOFOR.USERID = :USERID ');
    tmpStringList.Add('AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID ');
    tmpStringList.Add('AND ISORGR30.RECORDID = ISOFOR.RECORDID ');
    tmpStringList.Add('AND ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR ');
    tmpStringList.Add('AND ISORGR30.UNITID = SUITE.UNITID ');
    if (QueryUse < 2) then tmpStringList.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR ');
    if (QueryUse < 2) then tmpStringList.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR ');
    if (QueryUse < 2) then tmpStringList.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR ');
    if (QueryUse < 2) then tmpStringList.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM ');
    if (QueryUse < 2) then tmpStringList.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR ');
    if ((QueryUse < 2))
      then tmpStringList.Add('AND SOURCEA.REFNUM = SOURCELIST.SOURCENUM ');
    if ((QueryUse < 2) or (UserSession.IncludeReferenceValues))
      then tmpStringList.Add('AND ISORGR30.RECORDID = SOURCEA.RECORDID ');
    if (QueryUse < 2) then tmpStringList.Add('AND SOURCEA.SOURCETYPEID = '+''''+'A'+'''');
    if UserSession.IncludeCoordinates then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = SMPREG.RECORDID ');
      tmpStringList.Add('AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO ');
    end;
    if UserSession.IncludeGroupValues then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = GROUPING.RECORDID ');
    end;
    if ((UserSession.IncludeProvinceValues) or (UserSession.IncludeTerraneValues)) then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOPROVTERR.RECORDID ');
      tmpStringList.Add('AND ISOPROVTERR.DOMAINID = DOMAINS.DOMAINID ');
    end;
    if UserSession.IncludeLIPValues then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOLIP.RECORDID ');
    end;
    if UserSession.IncludeOrogenicPeriodValues then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOOROGENIC.RECORDID ');
    end;
    if UserSession.IncludeChemicalTypeValues then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOCHEMTYPE.RECORDID ');
    end;
    if UserSession.IncludeBoundaryValues then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOBOUNDARY.RECORDID ');
    end;
    if (UserSession.IncludeValidationValues or UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('AND ISORGR30.RECORDID = ISOVALID.RECORDID ');
    end;
    //continent
    if UserSession.IncludeContinentValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //area
    if UserSession.IncludeAreaValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.AreaValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.AreaValues.Count > 1) then
      begin
        for i := 2 to UserSession.AreaValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //unit
    if UserSession.IncludeUnitValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.UnitValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UnitValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //lithology
    if UserSession.IncludeLithologyValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LithologyValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LithologyValues.Count > 1) then
      begin
        for i := 2 to UserSession.LithologyValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      iLitholClassesSelected := 0;
      if (UserSession.IncludeIgneous) then iLitholClassesSelected := iLitholClassesSelected + 1;
      if (UserSession.IncludeSedimentary) then iLitholClassesSelected := iLitholClassesSelected + 1;
      if (UserSession.IncludeMetamorphicAndOther) then iLitholClassesSelected := iLitholClassesSelected + 1;
      tempStr := 'AND (ISORGR30.LITHOLOGY = LITHOL.LITHOLOGY) ';
      tmpStringList.Add(tempStr);
      tempStr := 'AND ( ';
      tmpStringList.Add(tempStr);
      if (UserSession.IncludeIgneous) then
      begin
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'I'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeSedimentary) then
      begin
        if (UserSession.IncludeIgneous) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'S'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeMetamorphicAndOther) then
      begin
        if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary)) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'M'+''''+') OR (LITHOL.LITHCLASSID = '+''''+'N'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      tempStr := ') ';
      tmpStringList.Add(tempStr);
    end;
    //material
    if UserSession.IncludeMaterialValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MaterialValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MaterialValues.Count > 1) then
      begin
        for i := 2 to UserSession.MaterialValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //isotope system
    if UserSession.IncludeIsotopeSystemValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.IsotopeSystemValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.IsotopeSystemValues.Count > 1) then
      begin
        for i := 2 to UserSession.IsotopeSystemValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //approach
    if UserSession.IncludeApproachValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ApproachValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ApproachValues.Count > 1) then
      begin
        for i := 2 to UserSession.ApproachValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //interpretation
    if UserSession.IncludeInterpretationValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.InterpretationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.InterpretationValues.Count > 1) then
      begin
        for i := 2 to UserSession.InterpretationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //technique
    if UserSession.IncludeTechniqueValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TechniqueValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TechniqueValues.Count > 1) then
      begin
        for i := 2 to UserSession.TechniqueValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //method
    if UserSession.IncludeMethodValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MethodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MethodValues.Count > 1) then
      begin
        for i := 2 to UserSession.MethodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.RECORDID = ISORGR30.RECORDID)';
      tmpStringList.Add(tempStr);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.MSWD < ISOSTATISTICS.FCUTOFF or ISOSTATISTICS.PROBOFFIT > ISOSTATISTICS.ALPHA)';
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      //tempStr := 'ISORGR30.IAGE >= '+IntToStr(itmp);
      tempStr := 'ISORGR30.RAGE >= '+FormatFloat('####0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      //tempStr := 'ISORGR30.IAGE <= '+IntToStr(itmp);
      tempStr := 'ISORGR30.RAGE <= '+FormatFloat('####0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue then
    begin
      tempStr := 'AND ISOINIT.RECORDID = ISORGR30.RECORDID';
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,tmp,iCode);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISOINIT.EPSILON >= '+FormatFloat('###0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,tmp,iCode);
      if (iCode = 0) then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISOINIT.EPSILON <= '+FormatFloat('###0.000',tmp);
        tmpStringList.Add(tempStr);
      end;
    end;
    if UserSession.IncludeAgeUnitsValue then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.AGEUNITS = '+''''+UserSession.AgeUnitsValue+'''';
      tmpStringList.Add(tempStr);
    end;
    //grouping
    if (UserSession.IncludeGroupValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.GroupValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.GroupValues.Count > 1) then
      begin
        for i := 2 to UserSession.GroupValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //province
    if (UserSession.IncludeProvinceValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.ProvinceValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.provinceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ProvinceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //terrane
    if (UserSession.IncludeTerraneValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TerraneValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TerraneValues.Count > 1) then
      begin
        for i := 2 to UserSession.TerraneValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //LIP
    if (UserSession.IncludeLIPValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LIPValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LIPValues.Count > 1) then
      begin
        for i := 2 to UserSession.LIPValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //orogenic period
    if (UserSession.IncludeOrogenicPeriodValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.OrogenicPeriodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.OrogenicPeriodValues.Count > 1) then
      begin
        for i := 2 to UserSession.OrogenicPeriodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //chemical type
    if (UserSession.IncludeChemicalTypeValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ChemicalTypeValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ChemicalTypeValues.Count > 1) then
      begin
        for i := 2 to UserSession.ChemicalTypeValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //reference
    if UserSession.IncludeReferenceValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundaries
    if (UserSession.IncludeBoundaryValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundary positions
    if (UserSession.IncludeBoundaryPositionValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryPositionValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryPositionValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryPositionValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //validation status
    if (UserSession.IncludeValidationValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //contributors
    if (UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('AND ISOVALID.VALIDSTATUSID = '+''''+'Capt'+'''');
      tmpStringList.Add('AND ');
      if ((UserSession.UsersContributedValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UsersContributedValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersContributedValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //who for
    if (UserSession.IncludeWhoForValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.WhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.WhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.WhoForValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if (UserSession.PreferenceLevelValue <> '') then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.PREFLEVEL >= '+''''+UserSession.PreferenceLevelValue+'''';
      tmpStringList.Add(tempStr);
    end;
    if (UserSession.DecayUncertaintyValues.Count = 1) then
    begin
      if (UserSession.DecayUncertaintyValues[0] = 'WithoutDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 <= 0.0001';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.DecayUncertaintyValues[0] = 'WithDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 > 0.0001';
        tmpStringList.Add(tempStr);
      end;
    end;
    //RecordID
    if (UserSession.IncludeRecordIDValueRange) then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID >= '+''''+UserSession.RecordIDValueFrom+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID <= '+''''+UserSession.RecordIDValueTo+'''';
      tmpStringList.Add(tempStr);
    end;
    //if (UserSession.ConfidentialValue <> '') then
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  if UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL <= '+IntToStr(255);
    //  if not UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL < '+IntToStr(1);
    //  tmpStringList.Add(tempStr);
    //end else
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  tempStr := 'ISORGR30.CONFIDENTIAL = '+IntToStr(0);
    //  tmpStringList.Add(tempStr);
    //end;
    if UserSession.IncludeCoordinates then
    begin
      tempStr := 'AND SMPREG.RECORDID = ISORGR30.RECORDID';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= '+UserSession.NELat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE <= '+UserSession.NELon;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE >= '+UserSession.SWLat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE >= '+UserSession.SWLon;
      tmpStringList.Add(tempStr);
    end;
    //User OrgID
    if (UserSession.IncludeUserOrgID) then
    begin
      tempStr := 'AND USERACCOUNT.ACCOUNTID = ISOUUID.ACCOUNTID';
      tmpStringList.Add(tempStr);
      if (UserSession.UserOrgIDValue = 'Y') then tempStr := 'AND ISORGR30.RECORDID = ISOUUID.RECORDID';
      if (UserSession.UserOrgIDValue = 'N') then tempStr := 'AND ISORGR30.RECORDID <> ISOUUID.RECORDID';
      tmpStringList.Add(tempStr);
      tempStr := 'AND USERACCOUNT.USERID = USERSWHOFOR.USERID';
      tmpStringList.Add(tempStr);
    end;
end;

procedure TdmDVcds.ConstructQueryStringListJoin ( QueryUse : integer; var tmpStringList : TStringList);
var
  i, itmp, iCode : integer;
  iLitholClassesSelected : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
  FromEpsilon, ToEpsilon : double;
begin
  //QueryUse = 1 when need to include lookup fields
  //  for Material, Approach, Interpretation, Isotope System, Technique, SourceID
  //QueryUse = 2 when not needed

//    Query1Rec.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,');
//    Query1Rec.SQL.Add('      TECHNIQUE,ISOSYSTEM,SUITE,USERSWHOFOR,ISOFOR,SOURCEA,SOURCELIST');

  tmpStringList.Clear;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,FromEpsilon,iCode);
      UserSession.EpsilonFromValue := FormatFloat('###0.00',FromEpsilon);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,ToEpsilon,iCode);
      UserSession.EpsilonToValue := FormatFloat('###0.00',ToEpsilon);
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      tmpStringList.Add('JOIN LITHOL ON (ISORGR30.LITHOLOGY = LITHOL.LITHOLOGY) ');
    end;
    tmpStringList.Add('JOIN ISOFOR ON (ISORGR30.RECORDID = ISOFOR.RECORDID) ');
    tmpStringList.Add('JOIN USERSWHOFOR ON (ISOFOR.WHOFORID = USERSWHOFOR.WHOFORID) ');
    tmpStringList.Add('JOIN COUNTRY ON (ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR) ');
    tmpStringList.Add('JOIN SUITE ON (ISORGR30.UNITID = SUITE.UNITID) ');
    if (QueryUse < 2) then tmpStringList.Add('JOIN MATERIAL ON  (ISORGR30.MATERIALABR = MATERIAL.MATERIALABR) ');
    if (QueryUse < 2) then tmpStringList.Add('JOIN APPROACH ON  (ISORGR30.APPROACHABR = APPROACH.APPROACHABR) ');
    if (QueryUse < 2) then tmpStringList.Add('JOIN INTERPRETATION ON  (ISORGR30.INTERPABR = INTERPRETATION.INTERPABR) ');
    if (QueryUse < 2) then tmpStringList.Add('JOIN ISOSYSTEM ON  (ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM) ');
    if (QueryUse < 2) then tmpStringList.Add('JOIN TECHNIQUE ON  (ISORGR30.TECHABR = TECHNIQUE.TECHABR) ');
    if ((QueryUse < 2) or (UserSession.IncludeReferenceValues)) then
    begin
      tmpStringList.Add('JOIN SOURCEA ON ((ISORGR30.RECORDID = SOURCEA.RECORDID) ');
      if (QueryUse < 2) then
        tmpStringList.Add('AND SOURCEA.SOURCETYPEID = '+''''+'A'+''''+')')
      else
        tmpStringList.Add(')');
    end;
    if (QueryUse < 2) then tmpStringList.Add('JOIN SOURCELIST ON (SOURCEA.REFNUM = SOURCELIST.SOURCENUM) ');
    if UserSession.IncludeCoordinates then
    begin
      tmpStringList.Add('JOIN SMPREG ON (ISORGR30.RECORDID = SMPREG.RECORDID) ');
      tmpStringList.Add('JOIN SMPLOC ON (SMPREG.SAMPLENO = SMPLOC.SAMPLENO) ');
    end;
    if UserSession.IncludeGroupValues then
    begin
      tmpStringList.Add('JOIN GROUPING ON (ISORGR30.RECORDID = GROUPING.RECORDID) ');
    end;
    if ((UserSession.IncludeProvinceValues) or (UserSession.IncludeTerraneValues)) then
    begin
      tmpStringList.Add('JOIN ISOPROVTERR ON (ISORGR30.RECORDID = ISOPROVTERR.RECORDID) ');
      tmpStringList.Add('JOIN DOMAINS ON (ISOPROVTERR.DOMAINID = DOMAINS.DOMAINID) ');
    end;
    if UserSession.IncludeLIPValues then
    begin
      tmpStringList.Add('JOIN ISOLIP ON (ISORGR30.RECORDID = ISOLIP.RECORDID) ');
    end;
    if UserSession.IncludeOrogenicPeriodValues then
    begin
      tmpStringList.Add('JOIN ISOOROGENIC ON (ISORGR30.RECORDID = ISOOROGENIC.RECORDID) ');
    end;
    if UserSession.IncludeChemicalTypeValues then
    begin
      tmpStringList.Add('JOIN ISOCHEMTYPE ON (ISORGR30.RECORDID = ISOCHEMTYPE.RECORDID) ');
    end;
    if UserSession.IncludeBoundaryValues then
    begin
      tmpStringList.Add('JOIN ISOBOUNDARY ON (ISORGR30.RECORDID = ISOBOUNDARY.RECORDID) ');
    end;
    if (UserSession.IncludeValidationValues or UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('JOIN ISOVALID ON (ISORGR30.RECORDID = ISOVALID.RECORDID) ');
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      tmpStringList.Add('JOIN ISOSTATISTICS ON (ISORGR30.RECORDID = ISOSTATISTICS.RECORDID) ');
    end;
    if UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue then
    begin
      tempStr := 'JOIN ISOINIT ON (ISOINIT.RECORDID = ISORGR30.RECORDID) ';
      tmpStringList.Add(tempStr);
    end;
    //User OrgID
    if (UserSession.IncludeUserOrgID) then
    begin
      if (UserSession.UserOrgIDValue = 'Y') then
      begin
        tempStr := 'JOIN ISOUUID ON (ISORGR30.RECORDID = ISOUUID.RECORDID) ';
        tmpStringList.Add(tempStr);
        tempStr := 'JOIN USERACCOUNT ON (USERACCOUNT.ACCOUNTID = ISOUUID.ACCOUNTID) ';
        tmpStringList.Add(tempStr);
        tempStr := 'AND USERACCOUNT.USERID = USERSWHOFOR.USERID';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.UserOrgIDValue = 'N') then
      begin
        tempStr := 'LEFT OUTER JOIN ISOUUID ON (ISORGR30.RECORDID = ISOUUID.RECORDID) ';
        tmpStringList.Add(tempStr);
      end;
    end;
    tmpStringList.Add('WHERE USERSWHOFOR.USERID = :USERID ');
    //continent
    if UserSession.IncludeContinentValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //area
    if UserSession.IncludeAreaValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.AreaValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.AreaValues.Count > 1) then
      begin
        for i := 2 to UserSession.AreaValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //unit
    if UserSession.IncludeUnitValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.UnitValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UnitValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //lithology
    if UserSession.IncludeLithologyValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LithologyValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LithologyValues.Count > 1) then
      begin
        for i := 2 to UserSession.LithologyValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      iLitholClassesSelected := 0;
      if (UserSession.IncludeIgneous) then iLitholClassesSelected := iLitholClassesSelected + 1;
      if (UserSession.IncludeSedimentary) then iLitholClassesSelected := iLitholClassesSelected + 1;
      if (UserSession.IncludeMetamorphicAndOther) then iLitholClassesSelected := iLitholClassesSelected + 1;
      tempStr := 'AND ( ';
      tmpStringList.Add(tempStr);
      if (UserSession.IncludeIgneous) then
      begin
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'I'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeSedimentary) then
      begin
        if (UserSession.IncludeIgneous) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'S'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeMetamorphicAndOther) then
      begin
        if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary)) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'M'+''''+') OR (LITHOL.LITHCLASSID = '+''''+'N'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      tempStr := ') ';
      tmpStringList.Add(tempStr);
    end;
    //material
    if UserSession.IncludeMaterialValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MaterialValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MaterialValues.Count > 1) then
      begin
        for i := 2 to UserSession.MaterialValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //isotope system
    if UserSession.IncludeIsotopeSystemValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.IsotopeSystemValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.IsotopeSystemValues.Count > 1) then
      begin
        for i := 2 to UserSession.IsotopeSystemValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //approach
    if UserSession.IncludeApproachValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ApproachValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ApproachValues.Count > 1) then
      begin
        for i := 2 to UserSession.ApproachValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //interpretation
    if UserSession.IncludeInterpretationValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.InterpretationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.InterpretationValues.Count > 1) then
      begin
        for i := 2 to UserSession.InterpretationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //technique
    if UserSession.IncludeTechniqueValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TechniqueValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TechniqueValues.Count > 1) then
      begin
        for i := 2 to UserSession.TechniqueValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //method
    if UserSession.IncludeMethodValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MethodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MethodValues.Count > 1) then
      begin
        for i := 2 to UserSession.MethodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      {
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.RECORDID = ISORGR30.RECORDID)';
      tmpStringList.Add(tempStr);
      }
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.MSWD < ISOSTATISTICS.FCUTOFF or ISOSTATISTICS.PROBOFFIT > ISOSTATISTICS.ALPHA)';
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      //tempStr := 'ISORGR30.IAGE >= '+IntToStr(itmp);
      tempStr := 'ISORGR30.RAGE >= '+FormatFloat('####0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      //tempStr := 'ISORGR30.IAGE <= '+IntToStr(itmp);
      tempStr := 'ISORGR30.RAGE <= '+FormatFloat('####0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,tmp,iCode);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISOINIT.EPSILON >= '+FormatFloat('###0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,tmp,iCode);
      if (iCode = 0) then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISOINIT.EPSILON <= '+FormatFloat('###0.000',tmp);
        tmpStringList.Add(tempStr);
      end;
    end;
    if UserSession.IncludeAgeUnitsValue then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.AGEUNITS = '+''''+UserSession.AgeUnitsValue+'''';
      tmpStringList.Add(tempStr);
    end;
    //grouping
    if (UserSession.IncludeGroupValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.GroupValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.GroupValues.Count > 1) then
      begin
        for i := 2 to UserSession.GroupValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //province
    if (UserSession.IncludeProvinceValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.ProvinceValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.provinceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ProvinceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //terrane
    if (UserSession.IncludeTerraneValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TerraneValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TerraneValues.Count > 1) then
      begin
        for i := 2 to UserSession.TerraneValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //LIP
    if (UserSession.IncludeLIPValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LIPValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LIPValues.Count > 1) then
      begin
        for i := 2 to UserSession.LIPValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //orogenic period
    if (UserSession.IncludeOrogenicPeriodValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.OrogenicPeriodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.OrogenicPeriodValues.Count > 1) then
      begin
        for i := 2 to UserSession.OrogenicPeriodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //chemical type
    if (UserSession.IncludeChemicalTypeValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ChemicalTypeValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ChemicalTypeValues.Count > 1) then
      begin
        for i := 2 to UserSession.ChemicalTypeValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //reference
    if UserSession.IncludeReferenceValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundaries
    if (UserSession.IncludeBoundaryValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundary positions
    if (UserSession.IncludeBoundaryPositionValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryPositionValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryPositionValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryPositionValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //validation status
    if (UserSession.IncludeValidationValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //contributors
    if (UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('AND ISOVALID.VALIDSTATUSID = '+''''+'Capt'+'''');
      tmpStringList.Add('AND ');
      if ((UserSession.UsersContributedValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UsersContributedValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersContributedValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //who for
    if (UserSession.IncludeWhoForValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.WhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.WhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.WhoForValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if (UserSession.PreferenceLevelValue <> '') then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.PREFLEVEL >= '+''''+UserSession.PreferenceLevelValue+'''';
      tmpStringList.Add(tempStr);
    end;
    if (UserSession.DecayUncertaintyValues.Count = 1) then
    begin
      if (UserSession.DecayUncertaintyValues[0] = 'WithoutDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 <= 0.0001';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.DecayUncertaintyValues[0] = 'WithDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 > 0.0001';
        tmpStringList.Add(tempStr);
      end;
    end;
    //RecordID
    if (UserSession.IncludeRecordIDValueRange) then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID >= '+''''+UserSession.RecordIDValueFrom+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID <= '+''''+UserSession.RecordIDValueTo+'''';
      tmpStringList.Add(tempStr);
    end;
    //if (UserSession.ConfidentialValue <> '') then
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  if UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL <= '+IntToStr(255);
    //  if not UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL < '+IntToStr(1);
    //  tmpStringList.Add(tempStr);
    //end else
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  tempStr := 'ISORGR30.CONFIDENTIAL = '+IntToStr(0);
    //  tmpStringList.Add(tempStr);
    //end;
    if UserSession.IncludeCoordinates then
    begin
      tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= '+UserSession.NELat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE <= '+UserSession.NELon;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE >= '+UserSession.SWLat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE >= '+UserSession.SWLon;
      tmpStringList.Add(tempStr);
    end;
    //User OrgID
    if (UserSession.IncludeUserOrgID) then
    begin
      if (UserSession.UserOrgIDValue = 'N') then
      begin
        tempStr := 'AND ISOUUID.RECORDID IS NULL';
        tmpStringList.Add(tempStr);
      end;
    end;
end;

procedure TdmDVcds.ConstructQuerySamplesStringListJoin ( QueryUse : integer; var tmpStringList : TStringList);
var
  i, itmp, iCode : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
  FromEpsilon, ToEpsilon : double;
begin
  //QueryUse = 1 when need to include lookup fields
  //  for Material, Approach, Interpretation, Isotope System, Technique, SourceID
  //QueryUse = 2 when not needed

  tmpStringList.Clear;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,FromEpsilon,iCode);
      UserSession.EpsilonFromValue := FormatFloat('###0.00',FromEpsilon);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,ToEpsilon,iCode);
      UserSession.EpsilonToValue := FormatFloat('###0.00',ToEpsilon);
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      tmpStringList.Add('JOIN LITHOL ON (ISORGR30.LITHOLOGY = LITHOL.LITHOLOGY) ');
    end;
    tmpStringList.Add('JOIN ISOFOR ON (ISORGR30.RECORDID = ISOFOR.RECORDID) ');
    tmpStringList.Add('JOIN USERSWHOFOR ON (ISOFOR.WHOFORID = USERSWHOFOR.WHOFORID) ');
    tmpStringList.Add('JOIN COUNTRY ON (ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR) ');
    tmpStringList.Add('JOIN SUITE ON (ISORGR30.UNITID = SUITE.UNITID) ');
    if ((QueryUse < 2) or (UserSession.IncludeReferenceValues))
      then tmpStringList.Add('JOIN SOURCEA ON (ISORGR30.RECORDID = SOURCEA.RECORDID) ');
    {
    if UserSession.IncludeCoordinates then
    begin
      tmpStringList.Add('JOIN SMPREG ON (ISORGR30.RECORDID = SMPREG.RECORDID) ');
      tmpStringList.Add('JOIN SMPLOC ON (SMPREG.SAMPLENO = SMPLOC.SAMPLENO) ');
    end;
    }
    if UserSession.IncludeGroupValues then
    begin
      tmpStringList.Add('JOIN GROUPING ON (ISORGR30.RECORDID = GROUPING.RECORDID) ');
    end;
    if ((UserSession.IncludeProvinceValues) or (UserSession.IncludeTerraneValues)) then
    begin
      tmpStringList.Add('JOIN ISOPROVTERR ON (ISORGR30.RECORDID = ISOPROVTERR.RECORDID) ');
      tmpStringList.Add('JOIN DOMAINS ON (ISOPROVTERR.DOMAINID = DOMAINS.DOMAINID) ');
    end;
    if UserSession.IncludeLIPValues then
    begin
      tmpStringList.Add('JOIN ISOLIP ON (ISORGR30.RECORDID = ISOLIP.RECORDID) ');
    end;
    if UserSession.IncludeOrogenicPeriodValues then
    begin
      tmpStringList.Add('JOIN ISOOROGENIC ON (ISORGR30.RECORDID = ISOOROGENIC.RECORDID) ');
    end;
    if UserSession.IncludeChemicalTypeValues then
    begin
      tmpStringList.Add('JOIN ISOCHEMTYPE ON (ISORGR30.RECORDID = ISOCHEMTYPE.RECORDID) ');
    end;
    if UserSession.IncludeBoundaryValues then
    begin
      tmpStringList.Add('JOIN ISOBOUNDARY ON (ISORGR30.RECORDID = ISOBOUNDARY.RECORDID) ');
    end;
    if (UserSession.IncludeValidationValues or UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('JOIN ISOVALID ON (ISORGR30.RECORDID = ISOVALID.RECORDID) ');
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      tmpStringList.Add('JOIN ISOSTATISTICS ON (ISORGR30.RECORDID = ISOSTATISTICS.RECORDID) ');
    end;
    if UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue then
    begin
      tempStr := 'JOIN ISOINIT ON (ISOINIT.RECORDID = ISORGR30.RECORDID) ';
      tmpStringList.Add(tempStr);
    end;
    //User OrgID
    if (UserSession.IncludeUserOrgID) then
    begin
      if (UserSession.UserOrgIDValue = 'Y') then
      begin
        tempStr := 'JOIN ISOUUID ON (ISORGR30.RECORDID = ISOUUID.RECORDID) ';
        tmpStringList.Add(tempStr);
        tempStr := 'JOIN USERACCOUNT ON (USERACCOUNT.ACCOUNTID = ISOUUID.ACCOUNTID) ';
        tmpStringList.Add(tempStr);
        tempStr := 'AND USERACCOUNT.USERID = USERSWHOFOR.USERID';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.UserOrgIDValue = 'N') then
      begin
        tempStr := 'LEFT OUTER JOIN ISOUUID ON (ISORGR30.RECORDID = ISOUUID.RECORDID) ';
        tmpStringList.Add(tempStr);
      end;
    end;
    tempStr := 'JOIN SMPREG ON (ISORGR30.RECORDID = SMPREG.RECORDID) ';
    tmpStringList.Add(tempStr);
    tempStr := 'JOIN SMPLOC ON (SMPREG.SAMPLENO = SMPLOC.SAMPLENO) ';
    tmpStringList.Add(tempStr);
    tmpStringList.Add('WHERE USERSWHOFOR.USERID = :USERID ');
    //continent
    if UserSession.IncludeContinentValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //area
    if UserSession.IncludeAreaValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.AreaValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.AreaValues.Count > 1) then
      begin
        for i := 2 to UserSession.AreaValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //unit
    if UserSession.IncludeUnitValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.UnitValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UnitValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.UNITID = '+''''+UserSession.UnitValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //lithology
    if UserSession.IncludeLithologyValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LithologyValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LithologyValues.Count > 1) then
      begin
        for i := 2 to UserSession.LithologyValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.LITHOLOGY = '+''''+UserSession.LithologyValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary) or (UserSession.IncludeMetamorphicAndOther)) then
    begin
      tempStr := 'AND ( ';
      tmpStringList.Add(tempStr);
      if (UserSession.IncludeIgneous) then
      begin
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'I'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeSedimentary) then
      begin
        if (UserSession.IncludeIgneous) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'S'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.IncludeMetamorphicAndOther) then
      begin
        if ((UserSession.IncludeIgneous) or (UserSession.IncludeSedimentary)) then
        begin
          tempStr := ' OR ';
          tmpStringList.Add(tempStr);
        end;
        tempStr := '(LITHOL.LITHCLASSID = '+''''+'M'+''''+') OR (LITHOL.LITHCLASSID = '+''''+'N'+''''+') ';
        tmpStringList.Add(tempStr);
      end;
      tempStr := ') ';
      tmpStringList.Add(tempStr);
    end;
    //material
    if UserSession.IncludeMaterialValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MaterialValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MaterialValues.Count > 1) then
      begin
        for i := 2 to UserSession.MaterialValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.MATERIALABR = '+''''+UserSession.MaterialValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //isotope system
    if UserSession.IncludeIsotopeSystemValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.IsotopeSystemValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.IsotopeSystemValues.Count > 1) then
      begin
        for i := 2 to UserSession.IsotopeSystemValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.ISOTOPESYSTEM = '+''''+UserSession.IsotopeSystemValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //approach
    if UserSession.IncludeApproachValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ApproachValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ApproachValues.Count > 1) then
      begin
        for i := 2 to UserSession.ApproachValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.APPROACHABR = '+''''+UserSession.ApproachValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //interpretation
    if UserSession.IncludeInterpretationValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.InterpretationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.InterpretationValues.Count > 1) then
      begin
        for i := 2 to UserSession.InterpretationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.INTERPABR = '+''''+UserSession.InterpretationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //technique
    if UserSession.IncludeTechniqueValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TechniqueValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TechniqueValues.Count > 1) then
      begin
        for i := 2 to UserSession.TechniqueValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.TECHABR = '+''''+UserSession.TechniqueValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //method
    if UserSession.IncludeMethodValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.MethodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.MethodValues.Count > 1) then
      begin
        for i := 2 to UserSession.MethodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISORGR30.METHODABR = '+''''+UserSession.MethodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      {
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.RECORDID = ISORGR30.RECORDID)';
      tmpStringList.Add(tempStr);
      }
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := '(ISOSTATISTICS.MSWD < ISOSTATISTICS.FCUTOFF or ISOSTATISTICS.PROBOFFIT > ISOSTATISTICS.ALPHA)';
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RAGE >= '+UserSession.DateFromField;
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,tmp,iCode);
      itmp := ROUND(tmp * 1000.0);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      //tempStr := 'ISORGR30.IAGE <= '+IntToStr(itmp);
      tempStr := 'ISORGR30.RAGE <= '+UserSession.DateToField;
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      Val(UserSession.EpsilonFromValue,tmp,iCode);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISOINIT.EPSILON >= '+FormatFloat('###0.000',tmp);
      tmpStringList.Add(tempStr);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      Val(UserSession.EpsilonToValue,tmp,iCode);
      if (iCode = 0) then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISOINIT.EPSILON <= '+FormatFloat('###0.000',tmp);
        tmpStringList.Add(tempStr);
      end;
    end;
    if UserSession.IncludeAgeUnitsValue then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.AGEUNITS = '+''''+UserSession.AgeUnitsValue+'''';
      tmpStringList.Add(tempStr);
    end;
    //grouping
    if (UserSession.IncludeGroupValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.GroupValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.GroupValues.Count > 1) then
      begin
        for i := 2 to UserSession.GroupValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'GROUPING.GROUPING = '+''''+UserSession.GroupValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //province
    if (UserSession.IncludeProvinceValues) then
    begin
      tmpStringList.Add('AND ');
      if (UserSession.ProvinceValues.Count > 1) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.provinceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ProvinceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.ProvinceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //terrane
    if (UserSession.IncludeTerraneValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.TerraneValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.TerraneValues.Count > 1) then
      begin
        for i := 2 to UserSession.TerraneValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOPROVTERR.DOMAINID = '+''''+UserSession.TerraneValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //LIP
    if (UserSession.IncludeLIPValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.LIPValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.LIPValues.Count > 1) then
      begin
        for i := 2 to UserSession.LIPValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOLIP.LIPID = '+''''+UserSession.LIPValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //orogenic period
    if (UserSession.IncludeOrogenicPeriodValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.OrogenicPeriodValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.OrogenicPeriodValues.Count > 1) then
      begin
        for i := 2 to UserSession.OrogenicPeriodValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOOROGENIC.OROGENICPERIODID = '+''''+UserSession.OrogenicPeriodValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //chemical type
    if (UserSession.IncludeChemicalTypeValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ChemicalTypeValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ChemicalTypeValues.Count > 1) then
      begin
        for i := 2 to UserSession.ChemicalTypeValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOCHEMTYPE.CHEMTYPEABR = '+''''+UserSession.ChemicalTypeValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //reference
    if UserSession.IncludeReferenceValues then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'SOURCEA.REFNUM = '+''''+UserSession.ReferenceValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundaries
    if (UserSession.IncludeBoundaryValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDARYID = '+''''+UserSession.BoundaryValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //boundary positions
    if (UserSession.IncludeBoundaryPositionValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.BoundaryPositionValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.BoundaryPositionValues.Count > 1) then
      begin
        for i := 2 to UserSession.BoundaryPositionValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOBOUNDARY.BOUNDPOSID = '+''''+UserSession.BoundaryPositionValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //validation status
    if (UserSession.IncludeValidationValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //contributors
    if (UserSession.IncludeUsersContributedValues) then
    begin
      tmpStringList.Add('AND ISOVALID.VALIDSTATUSID = '+''''+'Capt'+'''');
      tmpStringList.Add('AND ');
      if ((UserSession.UsersContributedValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.UsersContributedValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersContributedValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOVALID.DONEBY = '+''''+UserSession.UsersContributedValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    //who for
    if (UserSession.IncludeWhoForValues) then
    begin
      tmpStringList.Add('AND ');
      if ((UserSession.WhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        tmpStringList.Add(tempStr);
      end;
      tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[0]+'''';
      tmpStringList.Add(tempStr);
      if (UserSession.WhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.WhoForValues.Count do
        begin
          tmpStringList.Add('OR ');
          tempStr := 'ISOFOR.WHOFORID = '+''''+UserSession.WhoForValues[i-1]+'''';
          tmpStringList.Add(tempStr);
        end;
        tmpStringList.Add(') ');
      end;
    end;
    if (UserSession.PreferenceLevelValue <> '') then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.PREFLEVEL >= '+''''+UserSession.PreferenceLevelValue+'''';
      tmpStringList.Add(tempStr);
    end;
    if (UserSession.DecayUncertaintyValues.Count = 1) then
    begin
      if (UserSession.DecayUncertaintyValues[0] = 'WithoutDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 <= 0.0001';
        tmpStringList.Add(tempStr);
      end;
      if (UserSession.DecayUncertaintyValues[0] = 'WithDCerrors') then
      begin
        tempStr := 'AND ';
        tmpStringList.Add(tempStr);
        tempStr := 'ISORGR30.SIGMAPERCENTDC1 > 0.0001';
        tmpStringList.Add(tempStr);
      end;
    end;
    //RecordID
    if (UserSession.IncludeRecordIDValueRange) then
    begin
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID >= '+''''+UserSession.RecordIDValueFrom+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND ';
      tmpStringList.Add(tempStr);
      tempStr := 'ISORGR30.RECORDID <= '+''''+UserSession.RecordIDValueTo+'''';
      tmpStringList.Add(tempStr);
    end;
    //if (UserSession.ConfidentialValue <> '') then
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  if UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL <= '+IntToStr(255);
    //  if not UserSession.IsDeveloper then tempStr := 'ISORGR30.CONFIDENTIAL < '+IntToStr(1);
    //  tmpStringList.Add(tempStr);
    //end else
    //begin
    //  tempStr := 'AND ';
    //  tmpStringList.Add(tempStr);
    //  tempStr := 'ISORGR30.CONFIDENTIAL = '+IntToStr(0);
    //  tmpStringList.Add(tempStr);
    //end;
    if UserSession.IncludeCoordinates then
    begin
      tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE <= '+UserSession.NELat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE <= '+UserSession.NELon;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LATITUDE >= '+UserSession.SWLat;
      tmpStringList.Add(tempStr);
      tempStr := 'AND SMPLOC.LONGITUDE >= '+UserSession.SWLon;
      tmpStringList.Add(tempStr);
    end;
    //User OrgID
    if (UserSession.IncludeUserOrgID) then
    begin
      if (UserSession.UserOrgIDValue = 'N') then
      begin
        tempStr := 'AND ISOUUID.RECORDID IS NULL';
        tmpStringList.Add(tempStr);
      end;
    end;
end;

procedure TdmDVcds.cdsIsoValidReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('dmDV reconcile error '+E.Message);
end;

procedure TdmDVcds.SubmitNewRecord(var WasSuccessful : boolean);
var
  i, NextAvailableRecordID : integer;
  AgeFactor, DC1, DC2 : double;
begin
  NextAvailableRecordID := 0;
  try
    dmDV.cdsAgeUnits.Open;
    dmDV.cdsIsoSystems.Open;
    UserSession.WhereAmI := 'Results start';
    dmDV.cdsAgeUnits.Locate('AGEUNITS',UserSession.NewAgeUnit,[]);
    AgeFactor := dmDV.cdsAgeUnitsAGEFACTOR.AsFloat;
    dmDV.cdsIsoSystems.Locate('ISOSYSTEM',UserSession.NewIsotopeSystemID,[]);
    DC1 := dmDV.cdsIsoSystemsDECAYCONST1.AsFloat;
    DC2 := dmDV.cdsIsoSystemsDECAYCONST2.AsFloat;

    dmDV.cdsRecordIDs.Close;

    dmDV.cdsRecordIDsMax.Close;
    dmDV.cdsRecordIDsMax.Open;
    NextAvailableRecordID := dmDV.cdsRecordIDsMaxMAX.AsInteger + 1;
    UserSession.RecordChosen := IntToStr(NextAvailableRecordID);

    dmDV.qRecordIDsAll.Close;
    dmDV.qRecordIDsAll.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
    dmDV.cdsRecordIDsAll.Close;
    dmDV.cdsRecordIDsAll.Open;
    dmDV.cdsRecordIDsAll.Append;
    dmDV.cdsRecordIDsAllRECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDsAll.Post;
    dmDV.cdsRecordIDsAll.ApplyUpdates(0);
    dmDV.cdsRecordIDsAll.Close;

    UserSession.WhereAmI := 'Results qrecordIDs';
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;
    dmDV.cdsRecordIDs.Edit;

    UserSession.WhereAmI := 'Results Append';
    dmDV.cdsResults.Append;
    dmDV.cdsResultsCOUNTRYABR.AsString := UserSession.NewAreaID;
    dmDV.cdsResultsUNITID.AsString := UserSession.NewUnitID;
    dmDV.cdsResultsMATERIALABR.AsString := UserSession.NewMaterialID;
    dmDV.cdsResultsISOTOPESYSTEM.AsString := UserSession.NewIsotopeSystemID;
    dmDV.cdsResultsAPPROACHABR.AsString := UserSession.NewApproachID;
    dmDV.cdsResultsTECHABR.AsString := UserSession.NewTechniqueID;
    dmDV.cdsResultsINTERPABR.AsString := UserSession.NewInterpretationID;
    dmDV.cdsResultsPREFLEVEL.AsString := UserSession.NewRatingNum;
    dmDV.cdsResultsAGEUNITS.AsString := UserSession.NewAgeUnit;
    dmDV.cdsResultsLITHOLOGY.AsString := UserSession.NewLithologyID;
    dmDV.cdsResultsMETHODABR.AsString := UserSession.NewMethodID;
    dmDV.cdsResultsRECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsResultsCONFIDENTIAL.AsInteger := 0;
    dmDV.cdsResultsIAGE.AsInteger := Round(UserSession.NewAge*AgeFactor);
    dmDV.cdsResultsIAGEPError.AsInteger := Round(UserSession.NewAgePError*AgeFactor);
    dmDV.cdsResultsIAGEMError.AsInteger := Round(UserSession.NewAgeMError*AgeFactor);
    dmDV.cdsResultsRAGE.AsFloat := UserSession.NewAge;
    dmDV.cdsResultsRAGEPERROR.AsFloat := UserSession.NewAgePError;
    dmDV.cdsResultsRAGEMERROR.AsFloat := UserSession.NewAgeMError;
    UserSession.WhereAmI := 'Results RAge';
    dmDV.cdsResults.Post;
    UserSession.WhereAmI := 'Results posted';

    UserSession.WhereAmI := 'valid Capt';
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := ValueForCaptured;
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
    dmDV.cdsIsoValid2.Post;

    UserSession.WhereAmI := 'valid NotYt';
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'NotYt';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2DONEBY.AsString := 'Nobody';
    dmDV.cdsIsoValid2.Post;

    UserSession.WhereAmI := 'sourcea';
    dmDV.cdsIsoRef.Append;
    dmDV.cdsIsoRefRECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoRefSOURCETYPEID.AsString := 'A';
    dmDV.cdsIsoRefREFNUM.AsString := UserSession.NewReferenceID;
    {
    dmDV.cdsIsoRefSOURCESHORT.AsString := UserSession.NewReferenceID;
    }
    dmDV.cdsIsoRef.Post;

    UserSession.WhereAmI := 'who for';
    for i := 1 to UserSession.WhoForValues.Count do
    begin
      dmDV.cdsIsoFor.Append;
      dmDV.cdsIsoForRECORDID.AsInteger := NextAvailableRecordID;
      dmDV.cdsIsoForWHOFORID.AsString := UserSession.WhoForValues.Strings[i-1];
      dmDV.cdsIsoFor.Post;
    end;

    UserSession.WhereAmI := 'applyupdates';
    WasSuccessful := true;
    UserSession.RecordChosen := IntToStr(NextAvailableRecordID);
    dmDV.cdsRecordIDs.ApplyUpdates(0);
    try
      dmDV.cdsResults.ApplyUpdates(0);
      dmDV.cdsIsoValid.ApplyUpdates(1);
      dmDV.cdsIsoRef.ApplyUpdates(0);
      dmDV.cdsIsoFor.ApplyUpdates(UserSession.WhoForValues.Count);
    except
    end;

    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;

    dmDV.cdsRecordIDs.Edit;

    dmDV.cdsResultsExtra.Edit;
    dmDV.cdsResultsExtraDECAYCONST1.AsFloat := DC1;
    dmDV.cdsResultsExtraDECAYCONST2.AsFloat := DC2;
    dmDV.cdsResultsExtraSIGMAPERCENTDC1.AsFloat := 0.0;
    dmDV.cdsResultsExtraSIGMAPERCENTDC2.AsFloat := 0.0;
    dmDV.cdsResultsExtra.Post;

    dmDV.cdsRecordIDs.ApplyUpdates(0);

    dmDV.cdsCountries.Open;
    dmDV.cdsCountries.Locate('COUNTRYABR',UserSession.NewAreaID,[]);
    if (dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString = 'N') then
    begin
      try
        dmDV.cdsCountries.Edit;
        dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString := 'Y';
        dmDV.cdsCountries.Post;
        dmDV.cdsCountries.ApplyUpdates(0);
      except
      end;
    end;

    {Provinces}
    dmDV.qProvinces.Close;
    dmDV.qProvinces.SQL.Clear;
    dmDV.qProvinces.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID,');
    dmDV.qProvinces.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
    dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    if UserSession.IsDeveloper then
    begin
      try
        dmUser.cdsDevInfo.Open;
        dmUser.cdsDevInfo.Insert;
        dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsDevInfoQUERYCHECK.AsString := 'SubmitNewRecord '+dmDV.qProvinces.SQL.Text;
        dmUser.cdsDevInfo.ApplyUpdates(0);
        dmUser.cdsDevInfo.Close;
      except
      end;
    end;
    {Terranes}
    dmDV.qTerranes.Close;
    dmDV.qTerranes.SQL.Clear;
    dmDV.qTerranes.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, PROVTERRIST.CONTINENTID,');
    dmDV.qTerranes.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
    dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    if UserSession.IsDeveloper then
    begin
      try
        dmUser.cdsDevInfo.Open;
        dmUser.cdsDevInfo.Insert;
        dmUser.cdsDevInfoDATESAVED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsDevInfoQUERYCHECK.AsString := 'SubmitNewRecord '+dmDV.qTerranes.SQL.Text;
        dmUser.cdsDevInfo.ApplyUpdates(0);
        dmUser.cdsDevInfo.Close;
      except
      end;
    end;
    {Grouping}
    dmDV.qGroupingList.Close;
    dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
    {Samples}
    dmDV.qSamples.Close;
    dmDV.qSamples.SQL.Clear;
    dmDV.qSamples.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
    dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('AND SMPLOC.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+UserSession.NewAreaID+'''');
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('SubmitNewRecord '+dmDV.qSamples.SQL.Text);
    end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to insert new record');
  end;
end;

procedure TdmDVcds.SubmitNewRecord2(var WasSuccessful : boolean);
const
  zero = 0;
var
  i, NextAvailableRecordID : integer;
  AgeFactor, DC1, DC2 : double;
  TD: TDBXTransaction;
begin
  NextAvailableRecordID := 0;
  try
    WasSuccessful := true;
    dmDV.cdsAgeUnits.Open;
    dmDV.cdsIsoSystems.Open;
    UserSession.WhereAmI := 'Results start';
    dmDV.cdsAgeUnits.Locate('AGEUNITS',UserSession.NewAgeUnit,[]);
    AgeFactor := dmDV.cdsAgeUnitsAGEFACTOR.AsFloat;
    dmDV.cdsIsoSystems.Locate('ISOSYSTEM',UserSession.NewIsotopeSystemID,[]);
    DC1 := dmDV.cdsIsoSystemsDECAYCONST1.AsFloat;
    DC2 := dmDV.cdsIsoSystemsDECAYCONST2.AsFloat;

    dmDV.cdsRecordIDs.Close;

    dmDV.cdsRecordIDsMax.Close;
    dmDV.cdsRecordIDsMax.Open;
    NextAvailableRecordID := dmDV.cdsRecordIDsMaxMAX.AsInteger + 1;
    UserSession.RecordIDValueFrom := IntToStr(NextAvailableRecordID);
    UserSession.RecordIDValueTo := IntToStr(NextAvailableRecordID);
    UserSession.RecordChosen := IntToStr(NextAvailableRecordID);
    UserSession.WhereAmI := 'Max found';

    dmDV.qNewResult.SQL.Clear;
    dmDV.qNewResult.SQL.Add('INSERT INTO ISORGR30');
    dmDV.qNewResult.SQL.Add('(RECORDID, COUNTRYABR, UNITID, MATERIALABR, ISOTOPESYSTEM,');
    dmDV.qNewResult.SQL.Add('APPROACHABR, TECHABR, INTERPABR, PREFLEVEL, AGEUNITS, LITHOLOGY,');
    dmDV.qNewResult.SQL.Add('METHODABR, CONFIDENTIAL,');
    dmDV.qNewResult.SQL.Add('IAGE, IAGEPERROR, IAGEMERROR,');
    dmDV.qNewResult.SQL.Add('RAGE, RAGEPERROR, RAGEMERROR,');
    dmDV.qNewResult.SQL.Add('DECAYCONST1, DECAYCONST2, SIGMAPERCENTDC1, SIGMAPERCENTDC2)');
    dmDV.qNewResult.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.NewAreaID+''''+', '+''''+UserSession.NewUnitID+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+UserSession.NewMaterialID+''''+', '+''''+UserSession.NewIsotopeSystemID+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+UserSession.NewApproachID+''''+', '+''''+UserSession.NewTechniqueID+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+UserSession.NewInterpretationID+''''+', '+UserSession.NewRatingNum+', ');
    dmDV.qNewResult.SQL.Add(''''+UserSession.NewAgeUnit+''''+', '+''''+UserSession.NewLithologyID+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+UserSession.NewMethodID+''''+', '+IntToStr(zero)+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(UserSession.NewAge*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(UserSession.NewAgePError*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(UserSession.NewAgeMError*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',UserSession.NewAge)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',UserSession.NewAgePError)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',UserSession.NewAgeMError)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000000000000',DC1)+', '+FormatFloat('###0.000000000000',DC2)+', '+FormatFloat('###0.000',zero)+', '+FormatFloat('###0.000',zero)+')');
    //dmUser.SetDeveloperData(dmDV.qNewResult.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNewResult.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;

    UserSession.WhereAmI := 'RecordID committed';
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;
    dmDV.cdsRecordIDs.Edit;

    if WasSuccessful then
    begin
      UserSession.WhereAmI := 'valid Capt';
      dmDV.qNew.SQL.Clear;
      dmDV.qNew.SQL.Add('INSERT INTO ISOVALID');
      dmDV.qNew.SQL.Add('(RECORDID, VALIDSTATUSID, DATEDONE, DONEBY)');
      dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+'Capt'+''''+', '+''''+FormatDateTime('mm/dd/yyyy',dmUser.GetUTCDateTime)+''''+', ');
      dmDV.qNew.SQL.Add(''''+UserSession.UserID+''''+')');
      //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      //if not dmDV.sqlcDateView.InTransaction then
      //begin
        TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDV.qNew.ExecSQL(false);
          dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        except
          dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          WasSuccessful := false;
        end;
      //end;
      {
      dmDV.cdsIsoValid2.Append;
      dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
      dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Capt';
      dmDV.cdsIsoValid2DATEDONE.AsDateTime := Now;
      dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
      dmDV.cdsIsoValid2.Post;
      }

      UserSession.WhereAmI := 'valid NotYt';
      dmDV.qNew.SQL.Clear;
      dmDV.qNew.SQL.Add('INSERT INTO ISOVALID');
      dmDV.qNew.SQL.Add('(RECORDID, VALIDSTATUSID, DATEDONE, DONEBY)');
      dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+'NotYt'+''''+', '+''''+FormatDateTime('mm/dd/yyyy',dmUser.GetUTCDateTime)+''''+', ');
      dmDV.qNew.SQL.Add(''''+'Nobody'+''''+')');
      //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      //if not dmDV.sqlcDateView.InTransaction then
      //begin
        TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDV.qNew.ExecSQL(false);
          dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        except
          dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          WasSuccessful := false;
        end;
      //end;
      {
      dmDV.cdsIsoValid2.Append;
      dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
      dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'NotYt';
      dmDV.cdsIsoValid2DATEDONE.AsDateTime := Now;
      dmDV.cdsIsoValid2DONEBY.AsString := 'Nobody';
      dmDV.cdsIsoValid2.Post;
      try
        dmDV.cdsIsoValid.ApplyUpdates(1);
        UserSession.WhereAmI := 'applyupdates cdsIsoValid';
      except
        WasSuccessful := false;
      end;
      }
    end;
    UserSession.WhereAmI := 'who for';
    UserSession.WhereAmI := 'who for '+IntToStr(UserSession.WhoForValues.Count);
    if (UserSession.WhoForValues.Count < 1) then
    begin
      UserSession.WhoForValues.Add('PUBL');
    end;
    {
    for i := 1 to UserSession.WhoForValues.Count do
    begin
        dmDV.cdsIsoFor.Append;
        dmDV.cdsIsoForRECORDID.AsInteger := NextAvailableRecordID;
        dmDV.cdsIsoForWHOFORID.AsString := UserSession.WhoForValues.Strings[i-1];
        UserSession.WhereAmI := 'who for '+UserSession.WhoForValues.Strings[i-1];
        dmDV.cdsIsoFor.Post;
    end;

    try
      dmDV.cdsIsoFor.ApplyUpdates(UserSession.WhoForValues.Count);
      UserSession.WhereAmI := 'applyupdates cdsIsoFor';
    except
      WasSuccessful := false;
    end;
    }
    for i := 1 to UserSession.WhoForValues.Count do
    begin
      UserSession.WhereAmI := 'who for '+IntToStr(i)+' of '+IntToStr(UserSession.WhoForValues.Count);
      dmDV.qNew.SQL.Clear;
      dmDV.qNew.SQL.Add('INSERT INTO ISOFOR');
      dmDV.qNew.SQL.Add('(RECORDID, WHOFORID)');
      dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.WhoForValues.Strings[i-1]+''''+')');
      //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      //if not dmDV.sqlcDateView.InTransaction then
      //begin
        TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDV.qNew.ExecSQL(false);
          dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          UserSession.WhereAmI := 'applyupdates cdsIsoFor';
        except
          dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          WasSuccessful := false;
        end;
      //end;
    end;

    UserSession.WhereAmI := 'sourcea '+UserSession.NewReferenceID;
    {
    dmDV.cdsIsoRef.Append;
    dmDV.cdsIsoRefRECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoRefSOURCETYPEID.AsString := 'A';
    dmDV.cdsIsoRefREFNUM.AsString := UserSession.NewReferenceID;
    dmDV.cdsIsoRef.Post;

    try
      dmDV.cdsIsoRef.ApplyUpdates(0);
      UserSession.WhereAmI := 'applyupdates cdsIsoRef';
    except
      WasSuccessful := false;
    end;
    }
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SOURCEA');
    dmDV.qNew.SQL.Add('(RECORDID, SOURCETYPEID, REFNUM)');
    dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+'A'+''''+', '+''''+UserSession.NewReferenceID+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        UserSession.WhereAmI := 'applyupdates cdsIsoRef';
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;

    UserSession.WhereAmI := 'applyupdates';
    try
      UserSession.WhereAmI := 'applyupdates cdsRecordIDs';
      dmDV.cdsRecordIDs.ApplyUpdates(0);
    except
      WasSuccessful := false;
    end;

    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;

    dmDV.cdsRecordIDs.Edit;

    UserSession.WhereAmI := 'decayconstants';
    dmDV.cdsResultsExtra.Edit;
    dmDV.cdsResultsExtraDECAYCONST1.AsFloat := DC1;
    dmDV.cdsResultsExtraDECAYCONST2.AsFloat := DC2;
    dmDV.cdsResultsExtraSIGMAPERCENTDC1.AsFloat := 0.0;
    dmDV.cdsResultsExtraSIGMAPERCENTDC2.AsFloat := 0.0;
    dmDV.cdsResultsExtra.Post;

    dmDV.cdsRecordIDs.ApplyUpdates(0);

    UserSession.WhereAmI := 'countryhasrecords';
    dmDV.cdsCountries.Open;
    dmDV.cdsCountries.Locate('COUNTRYABR',UserSession.NewAreaID,[]);
    if (dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString = 'N') then
    begin
      try
        dmDV.cdsCountries.Edit;
        dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString := 'Y';
        dmDV.cdsCountries.Post;
        dmDV.cdsCountries.ApplyUpdates(0);
      except
      end;
    end;
    if (UserSession.NewLaboratory <> 'nd') then
    begin
      {now insert link to laboratory}
      try
        UserSession.WhereAmI := 'Start Insert new laboratory link';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO ISOLAB');
        dmDV.qNew.SQL.Add('(RECORDID, LABORATORYABR)');
        dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.NewLaboratory+''''+')');
        //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;
    if (UserSession.NewSample <> 'New') then
    begin
      {now insert sample-fraction master}
      try
        UserSession.WhereAmI := 'Start Insert new sample fraction master association';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO SMPFRAC');
        dmDV.qNew.SQL.Add('(SAMPLENO, FRAC)');
        if (UserSession.UnitSender=usIndividualAgeHf) then
        begin
          dmDV.qNew.SQL.Add(' VALUES ('+''''+UserSession.NewSample+''''+', '+''''+UserSession.NewFrac+''''+')');
        end else
        begin
          dmDV.qNew.SQL.Add(' VALUES ('+''''+UserSession.NewSample+''''+', '+''''+UserSession.NewMaterialID+''''+')');
        end;
        //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;
    if (UserSession.NewSample <> 'New') then
    begin
      {now insert link to sample}
      try
        UserSession.WhereAmI := 'Start Insert new sample link';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO SMPREG');
        dmDV.qNew.SQL.Add('(RECORDID, ISOSYSTEM, SAMPLENO, FRAC, INCLUDED)');
        if (UserSession.UnitSender=usIndividualAgeHf) then
        begin
          dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.NewIsotopeSystemID+''''+', ');
          dmDV.qNew.SQL.Add(''''+UserSession.NewSample+''''+', '+''''+UserSession.NewFrac+''''+', '+''''+'Y'+''''+')');
        end else
        begin
          dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.NewIsotopeSystemID+''''+', ');
          dmDV.qNew.SQL.Add(''''+UserSession.NewSample+''''+', '+''''+UserSession.NewMaterialID+''''+', '+''''+'Y'+''''+')');
        end;
        //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;
    if (UserSession.NewProvince <> 'Undefined') then
    begin
      {now insert link to province}
      try
        UserSession.WhereAmI := 'Start Insert new province link';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO ISOPROVTERR');
        dmDV.qNew.SQL.Add('(RECORDID, DOMAINID)');
        dmDV.qNew.SQL.Add(' VALUES ('+IntToStr(NextAvailableRecordID)+', '+UserSession.NewProvince+')');
        //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;
    if (UserSession.NewTerrane <> 'Undefined') then
    begin
      {now insert link to terrane}
      try
        UserSession.WhereAmI := 'Start Insert new terrane link';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO ISOPROVTERR');
        dmDV.qNew.SQL.Add('(RECORDID, DOMAINID)');
        dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+UserSession.NewTerrane+')');
        //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;

    {Provinces}
    dmDV.qProvinces.Close;
    dmDV.qProvinces.SQL.Clear;
    dmDV.qProvinces.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID,');
    dmDV.qProvinces.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
    dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    //dmUser.SetDeveloperData('SubmitNewRecord2 '+dmDV.qProvinces.SQL.Text);
    {Terranes}
    dmDV.qTerranes.Close;
    dmDV.qTerranes.SQL.Clear;
    dmDV.qTerranes.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
    dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    //dmUser.SetDeveloperData('SubmitNewRecord2 '+dmDV.qTerranes.SQL.Text);
    {Grouping}
    dmDV.qGroupingList.Close;
    dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('SubmitNewRecord2 '+dmDV.qGroupingList.SQL.Text);
    end;
    {Samples}
    dmDV.qSamples.Close;
    dmDV.qSamples.SQL.Clear;
    dmDV.qSamples.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
    dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('AND SMPLOC.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+UserSession.NewAreaID+'''');
    //dmUser.SetDeveloperData('SubmitNewRecord2 '+dmDV.qSamples.SQL.Text);
    UserSession.WhereAmI := 'end';
    WasSuccessful := true;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to insert new record - reached '+UserSession.WhereAmI);
  end;
end;

procedure TdmDVcds.ConstructClosureTemperatureQuery;
var
  i : integer;
begin
  dmDV.qClosureTemperatures.Close;
  dmDV.qClosureTemperatures.SQL.Clear;
  dmDV.qClosureTemperatures.SQL.Add('SELECT BLOCKINGT.MATERIALABR, BLOCKINGT.ISOSYSTEM, BLOCKINGT.APPROACHABR,');
  dmDV.qClosureTemperatures.SQL.Add('  BLOCKINGT.BLOCKINGT, BLOCKINGT.BLOCKINGTUNCERTAINTY,');
  dmDV.qClosureTemperatures.SQL.Add('  MATERIAL.MATERIALDESCRIPTION, ISOSYSTEM.ISOSYSTEMNAME,');
  dmDV.qClosureTemperatures.SQL.Add('  APPROACH.APPROACHDESCRIPTION');
  dmDV.qClosureTemperatures.SQL.Add('from BLOCKINGT, MATERIAL, ISOSYSTEM, APPROACH');
  dmDV.qClosureTemperatures.SQL.Add('where BLOCKINGT.MATERIALABR=MATERIAL.MATERIALABR');
  dmDV.qClosureTemperatures.SQL.Add('and BLOCKINGT.ISOSYSTEM=ISOSYSTEM.ISOSYSTEM');
  dmDV.qClosureTemperatures.SQL.Add('and BLOCKINGT.APPROACHABR=APPROACH.APPROACHABR');
  if (UserSession.IncludeIsotopeSystemValues and (UserSession.IsotopeSystemValues.Count=0)) then
  begin
    UserSession.IncludeIsotopeSystemValues := false;
  end;
  if (UserSession.IncludeMaterialValues and (UserSession.MaterialValues.Count=0)) then
  begin
    UserSession.IncludeMaterialValues := false;
  end;
  if (UserSession.IncludeIsotopeSystemValues) then
  begin
    dmDV.qClosureTemperatures.SQL.Add('AND ( BLOCKINGT.ISOSYSTEM = '+''''+UserSession.IsotopeSystemValues.Strings[0]+'''');
    if (UserSession.IsotopeSystemValues.Count >1) then
    begin
      for i := 2 to UserSession.IsotopeSystemValues.Count do
      begin
        dmDV.qClosureTemperatures.SQL.Add('OR BLOCKINGT.ISOSYSTEM = '+''''+UserSession.IsotopeSystemValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qClosureTemperatures.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeMaterialValues) then
  begin
    dmDV.qClosureTemperatures.SQL.Add('AND ( BLOCKINGT.MATERIALABR = '+''''+UserSession.MaterialValues.Strings[0]+'''');
    if (UserSession.MaterialValues.Count >1) then
    begin
      for i := 2 to UserSession.MaterialValues.Count do
      begin
        dmDV.qClosureTemperatures.SQL.Add('OR BLOCKINGT.MATERIALABR = '+''''+UserSession.MaterialValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qClosureTemperatures.SQL.Add(' ) ');
  end;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('ConstructClosureTemperatureQuery '+dmDV.qClosureTemperatures.SQL.Text);
  end;
end;

procedure TdmDVcds.cdsResultsCalcFields(DataSet: TDataSet);
begin
  {
  dmDV.cdsResults.Edit;
  dmDV.cdsResultsTAge.AsFloat := dmDV.cdsResultsIAGE.AsFloat*1000.0;
  dmDV.cdsResults.Post;
  }
end;

procedure TdmDVcds.Query1RecordCount;
var
  nRec : integer;
  i : integer;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  UserSession.NumberOfPoints := 0;
  dmDV.cdsQuery1Rec.Close;
  dmDV.Query1Rec.Close;
  dmDV.Query1Rec.SQL.Clear;
  dmDV.Query1Rec.SQL.Add('SELECT COUNT(*) FROM ( ');
  dmDV.Query1Rec.SQL.Add('  ');
  dmDV.Query1Rec.SQL.Add(dmDV.Query1.SQL.Text);
  dmDV.Query1Rec.SQL.Add(' ');
  dmDV.Query1Rec.SQL.Add(' ); ');
  dmDV.Query1Rec.SQL.Add(' ');
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('Query1RecordCount ' + dmDV.Query1Rec.SQL.Text);
  end;

  dmDV.Query1Rec.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.cdsQuery1Rec.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('cdsQuery1RecCOUNT ' + dmDV.cdsQuery1RecCOUNT.AsString);
  end;
  try
    //UserSession.NumberOfPoints := dmDV.cdsQuery1Rec.RecordCount;     // old inefficient way
    UserSession.NumberOfPoints := dmDV.cdsQuery1RecCOUNT.AsInteger;
  finally
    dmDV.cdsQuery1Rec.Close;
  end;
end;

procedure TdmDVcds.SubmitNewReference(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  try
    WasSuccessful := true;
    dmDV.qRefNew.SQL.Clear;
    dmDV.qRefNew.SQL.Add('DELETE FROM SOURCELIST');
    dmDV.qRefNew.SQL.Add('WHERE SOURCELIST.SOURCESHORT = '+''''+'NEW'+UserSession.UserID+'''');
      {
      if UserSession.IsDeveloper then
      begin
        dmUser.cdsDevInfo.Open;
        dmUser.cdsDevInfo.Insert;
        dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
        dmUser.cdsDevInfoQUERYCHECK.AsString := dmDV.qRefNew.SQL.Text;
        dmUser.cdsDevInfo.ApplyUpdates(0);
        dmUser.cdsDevInfo.Close;
      end;
      }
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      try
        dmDV.qRefNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
    dmDV.qRefNew.SQL.Clear;
    dmDV.qRefNew.SQL.Add('INSERT INTO SOURCELIST');
    dmDV.qRefNew.SQL.Add('(SOURCESHORT, CONTINENTID)');
    dmDV.qRefNew.SQL.Add('VALUES ('+''''+'NEW'+UserSession.UserID+''''+', '+''''+ValueForUndefinedContinentID+''''+')');
      {
      if UserSession.IsDeveloper then
      begin
        dmUser.cdsDevInfo.Open;
        dmUser.cdsDevInfo.Insert;
        dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
        dmUser.cdsDevInfoQUERYCHECK.AsString := dmDV.qRefNew.SQL.Text;
        dmUser.cdsDevInfo.ApplyUpdates(0);
        dmUser.cdsDevInfo.Close;
      end;
      }
    WasSuccessful := true;
    //WebApplication.ShowMessage('starting insert test 0');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qRefNew.ExecSQL(false);
        //WebApplication.ShowMessage('execsql test 1');
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        //WebApplication.ShowMessage('committed test 2');
        UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
  end;
end;

procedure TdmDVcds.AddNewSample(var WasSuccessful : boolean);
const
  zero = 0;
  ninety = 90;
var
  TD: TDBXTransaction;
  tmpContinentID, tmpAreaID : string;
begin
  tmpContinentID := ValueForUndefinedContinentID;
  tmpAreaID := ValueForUndefinedCountryAbr;
  if UserSession.IncludeContinentValues then tmpContinentID := UserSession.ContinentValues.Strings[0];
  if UserSession.IncludeAreaValues then  tmpAreaID := UserSession.AreaValues.Strings[0];
  WasSuccessful := true;
  //first ensure that no left-over record exists
  try
    UserSession.WhereAmI := 'Start Delete temporary sample';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('DELETE FROM SMPLOC');
    dmDV.qNew.SQL.Add('WHERE SMPLOC.SAMPLENO = '+''''+'New'+UserSession.UserID+'''');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
  end;
  //now insert a new, temporary record
  try
    UserSession.WhereAmI := 'Start Insert new temporary sample';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SMPLOC');
    dmDV.qNew.SQL.Add('(SAMPLENO, CONTINENTID, COUNTRYABR, LATITUDE, LONGITUDE, ELEVATION,');
    dmDV.qNew.SQL.Add('LATITUDEPRECISION, LONGITUDEPRECISION, ELEVATIONPRECISION, ORIGINALNO)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+'New'+UserSession.UserID+''''+', '+''''+tmpContinentID+''''+', '+''''+tmpAreaID+''''+', ');
    dmDV.qNew.SQL.Add(FormatFloat('00.000',ninety)+', '+FormatFloat('00.000',zero)+', '+FormatFloat('0.000',zero)+', ');
    dmDV.qNew.SQL.Add(FormatFloat('00.000',zero)+', '+FormatFloat('00.000',zero)+', '+FormatFloat('0.000',zero)+', ');
    dmDV.qNew.SQL.Add(''''+'NEW'+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
  //now insert a new, temporary record, including default FRAC
  try
    UserSession.WhereAmI := 'Start Insert new temporary sample and frac';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SMPFRAC');
    dmDV.qNew.SQL.Add('(SAMPLENO, FRAC)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+'New'+UserSession.UserID+''''+', '+''''+'1'+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;

procedure TdmDVcds.AddNewSampleFrac(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpSampleNo : string;
begin
  tmpSampleNo := dmDV.cdsSmpFracRangeSAMPLENO.AsString;
  WasSuccessful := true;
  //first ensure that no left-over record exists
  try
    UserSession.WhereAmI := 'Start Delete temporary samplefrac';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('DELETE FROM SMPFRAC');
    dmDV.qNew.SQL.Add('WHERE SMPFRAC.FRAC = '+''''+'New'+'''');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
  end;
  //insert a new, temporary record, including default FRAC
  try
    UserSession.WhereAmI := 'Start Insert new temporary sample and frac';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SMPFRAC');
    dmDV.qNew.SQL.Add('(SAMPLENO, FRAC)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+tmpSampleNo+''''+', '+''''+'New'+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;

procedure TdmDVcds.AddNewRecordWithDecayconstErrors(var WasSuccessful : boolean);
const
  hundred : double = 100.0;
var
  i, NextAvailableRecordID : integer;
  AgeFactor, DC1, DC2 : double;
  NewSampleID, NewIsotopeSystemID,
  NewFrac, NewIncluded : string;
  NewString, NewString2 : string;
  NewRefNo : integer;
  TD: TDBXTransaction;
begin
  NewRefNo := 0;
  NextAvailableRecordID := 0;
  try
    WasSuccessful := true;
    dmDV.cdsAgeUnits.Open;
    dmDV.cdsIsoSystems.Open;
    UserSession.WhereAmI := 'Results start';
    dmDV.cdsAgeUnits.Locate('AGEUNITS',UserSession.NewAgeUnit,[]);
    AgeFactor := dmDV.cdsAgeUnitsAGEFACTOR.AsFloat;
    dmDV.cdsIsoSystems.Locate('ISOSYSTEM',UserSession.NewIsotopeSystemID,[]);
    DC1 := dmDV.cdsIsoSystemsDECAYCONST1.AsFloat;
    DC2 := dmDV.cdsIsoSystemsDECAYCONST2.AsFloat;
    if (dmDV.cdsResultsExtraDECAYCONST1.AsFloat > 0.0) then DC1 := dmDV.cdsResultsExtraDECAYCONST1.AsFloat;
    if (dmDV.cdsResultsExtraDECAYCONST2.AsFloat > 0.0) then DC2 := dmDV.cdsResultsExtraDECAYCONST2.AsFloat;
    NewIsotopeSystemID := 'NEW';
    if (dmDV.cdsSmpRegISOSYSTEM.AsString <> '') then NewIsotopeSystemID := dmDV.cdsSmpRegISOSYSTEM.AsString;
    NewSampleID := 'NEW';
    if (dmDV.cdsSmpRegSAMPLENO.AsString <> '') then NewSampleID := dmDV.cdsSmpRegSAMPLENO.AsString;
    NewFrac := 'NEW';
    if (dmDV.cdsSmpRegFRAC.AsString <> '') then NewFrac := dmDV.cdsSmpRegFRAC.AsString;
    NewIncluded := 'N';
    if (dmDV.cdsSmpRegINCLUDED.AsString <> '') then NewIncluded := dmDV.cdsSmpRegINCLUDED.AsString;
    if (dmDV.cdsIsoRefREFNUM.AsInteger > 0) then NewRefNo := dmDV.cdsIsoRefREFNUM.AsInteger;
    NewString := '';
    NewString := dmDV.cdsCommentCOMMENT.AsString;
    //WebApplication.ShowMessage('Sample info '+NewSampleID+'  '+NewFrac+'  '+NewIncluded);

    //dmDV.cdsRecordIDs.Close;

    dmDV.cdsRecordIDsMax.Close;
    dmDV.cdsRecordIDsMax.Open;
    NextAvailableRecordID := dmDV.cdsRecordIDsMaxMAX.AsInteger + 1;
    //UserSession.RecordChosen := IntToStr(NextAvailableRecordID);
    UserSession.WhereAmI := 'Max found '+UserSession.RecordChosen;

    dmDV.qNewResult.SQL.Clear;
    dmDV.qNewResult.SQL.Add('INSERT INTO ISORGR30');
    dmDV.qNewResult.SQL.Add('(RECORDID, COUNTRYABR, UNITID, MATERIALABR, ISOTOPESYSTEM,');
    dmDV.qNewResult.SQL.Add('APPROACHABR, TECHABR, INTERPABR, PREFLEVEL, AGEUNITS, LITHOLOGY,');
    dmDV.qNewResult.SQL.Add('METHODABR, CONFIDENTIAL,');
    dmDV.qNewResult.SQL.Add('IAGE, IAGEPERROR, IAGEMERROR,');
    dmDV.qNewResult.SQL.Add('RAGE, RAGEPERROR, RAGEMERROR,');
    dmDV.qNewResult.SQL.Add('DECAYCONST1, DECAYCONST2, SIGMAPERCENTDC1, SIGMAPERCENTDC2)');
    dmDV.qNewResult.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+dmDV.cdsResultsCOUNTRYABR.AsString+''''+', '+''''+dmDV.cdsResultsUNITNAME.AsString+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+dmDV.cdsResultsMATERIALABR.AsString+''''+', '+''''+dmDV.cdsResultsISOTOPESYSTEM.AsString+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+dmDV.cdsResultsAPPROACHABR.AsString+''''+', '+''''+dmDV.cdsResultsTECHABR.AsString+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+dmDV.cdsResultsINTERPABR.AsString+''''+', '+dmDV.cdsResultsPREFLEVEL.AsString+', ');
    dmDV.qNewResult.SQL.Add(''''+dmDV.cdsResultsAGEUNITS.AsString+''''+', '+''''+dmDV.cdsResultsLITHOLOGY.AsString+''''+', ');
    dmDV.qNewResult.SQL.Add(''''+dmDV.cdsResultsMETHODABR.AsString+''''+', '+dmDV.cdsResultsCONFIDENTIAL.AsString+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(dmDV.cdsResultsRAGE.AsFloat*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(dmDV.cdsResultsRAGEPERROR.AsFloat*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(IntToStr(Round(dmDV.cdsResultsRAGEMERROR.AsFloat*AgeFactor))+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',dmDV.cdsResultsRAGE.AsFloat)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',dmDV.cdsResultsRAGEPERROR.AsFloat)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000',dmDV.cdsResultsRAGEMERROR.AsFloat)+', ');
    dmDV.qNewResult.SQL.Add(FormatFloat('###0.000000e00',DC1)+', '+FormatFloat('###0.000000e00',DC2)+', '+FormatFloat('###0.000',hundred)+', '+FormatFloat('###0.000',hundred)+')');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNewResult.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;

    UserSession.WhereAmI := 'RecordID committed';
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;
    dmDV.cdsRecordIDs.Edit;

    UserSession.WhereAmI := 'valid Capt';
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'Capt';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2DONEBY.AsString := UserSession.UserID;
    dmDV.cdsIsoValid2.Post;

    UserSession.WhereAmI := 'valid NotYt';
    dmDV.cdsIsoValid2.Append;
    dmDV.cdsIsoValid2RECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsIsoValid2VALIDSTATUSID.AsString := 'NotYt';
    dmDV.cdsIsoValid2DATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmDV.cdsIsoValid2DONEBY.AsString := 'Nobody';
    dmDV.cdsIsoValid2.Post;

    try
      dmDV.cdsIsoValid.ApplyUpdates(1);
      UserSession.WhereAmI := 'applyupdates cdsIsoValid';
    except
      WasSuccessful := false;
    end;

    //need loop here to duplicate whofor records
    UserSession.WhereAmI := 'who for';
    UserSession.WhereAmI := 'who for '+IntToStr(UserSession.WhoForValues.Count);
    if (UserSession.WhoForValues.Count < 1) then
    begin
      UserSession.WhoForValues.Add('PUBL');
    end;
    for i := 1 to UserSession.WhoForValues.Count do
    begin
        dmDV.cdsIsoFor.Append;
        dmDV.cdsIsoForRECORDID.AsInteger := NextAvailableRecordID;
        dmDV.cdsIsoForWHOFORID.AsString := UserSession.WhoForValues.Strings[i-1];
        UserSession.WhereAmI := 'who for '+UserSession.WhoForValues.Strings[i-1];
        dmDV.cdsIsoFor.Post;
    end;
    try
      dmDV.cdsIsoFor.ApplyUpdates(UserSession.WhoForValues.Count);
      UserSession.WhereAmI := 'applyupdates cdsIsoFor';
    except
      WasSuccessful := false;
    end;
    UserSession.WhereAmI := 'applyupdates';
    try
      UserSession.WhereAmI := 'applyupdates cdsRecordIDs';
      dmDV.cdsRecordIDs.ApplyUpdates(0);
    except
      WasSuccessful := false;
    end;
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;
    dmDV.cdsRecordIDs.Edit;
    UserSession.WhereAmI := 'decayconstants';
    dmDV.cdsResultsExtra.Edit;
    dmDV.cdsResultsExtraDECAYCONST1.AsFloat := DC1;
    dmDV.cdsResultsExtraDECAYCONST2.AsFloat := DC2;
    dmDV.cdsResultsExtraSIGMAPERCENTDC1.AsFloat := 99.0;
    dmDV.cdsResultsExtraSIGMAPERCENTDC2.AsFloat := 99.0;
    dmDV.cdsResultsExtraSIGMAPERCENTDC2.AsFloat := 99.0;
    dmDV.cdsResultsExtra.Post;
    dmDV.cdsComment.Edit;
    dmDV.cdsCommentRECORDID.AsInteger := NextAvailableRecordID;
    dmDV.cdsCommentCOMMENT.AsString := NewString;
    dmDV.cdsComment.Post;
    dmDV.cdsRecordIDs.ApplyUpdates(0);
    UserSession.WhereAmI := 'countryhasrecords';
    dmDV.cdsCountries.Open;
    dmDV.cdsCountries.Locate('COUNTRYABR',UserSession.NewAreaID,[]);
    if (dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString = 'N') then
    begin
      try
        dmDV.cdsCountries.Edit;
        dmDV.cdsCountriesCOUNTRYHASRECORDS.AsString := 'Y';
        dmDV.cdsCountries.Post;
        dmDV.cdsCountries.ApplyUpdates(0);
      except
      end;
    end;
    if (UserSession.NewLaboratory <> 'nd') then
    begin
      //now insert link to laboratory
      try
        UserSession.WhereAmI := 'Start Insert new laboratory link';
        dmDV.qNew.SQL.Clear;
        dmDV.qNew.SQL.Add('INSERT INTO ISOLAB');
        dmDV.qNew.SQL.Add('(RECORDID, LABORATORYABR)');
        dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+UserSession.NewLaboratory+''''+')');
        //if not dmDV.sqlcDateView.InTransaction then
        //begin
          TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDV.qNew.ExecSQL(false);
            dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          end;
        //end;
      except
      end;
    end;
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
    dmDV.cdsRecordIDs.Open;
    if (dmDV.cdsIsoRef.RecordCount > 0) then
    begin
      //now insert link to terrane
      try
        UserSession.WhereAmI := 'Start Insert new reference link';
        repeat
          NewString2 := dmDV.cdsIsoRefREFNUM.AsString;
          NewString := dmDV.cdsIsoRefSOURCETYPEID.AsString;
          dmDV.qNew.SQL.Clear;
          dmDV.qNew.SQL.Add('INSERT INTO SOURCEA');
          dmDV.qNew.SQL.Add('(RECORDID, SOURCETYPEID, REFNUM)');
          dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+NewString+''''+', '+NewString2+')');
          dmDV.cdsIsoRef.Next;
          //if not dmDV.sqlcDateView.InTransaction then
          //begin
            TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
            try
              dmDV.qNew.ExecSQL(false);
              dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            except
              dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            end;
          //end;
        until dmDV.cdsIsoRef.Eof;
      except
      end;
    end;
    if (dmDV.cdsSmpReg.RecordCount > 0) then
    begin
      //now insert link to sample
      try
        UserSession.WhereAmI := 'Start Insert new sample link';
        repeat
          dmDV.qNew.SQL.Clear;
          dmDV.qNew.SQL.Add('INSERT INTO SMPREG');
          dmDV.qNew.SQL.Add('(RECORDID, ISOSYSTEM, SAMPLENO, FRAC, INCLUDED)');
          NewIsotopeSystemID := 'NEW';
          if (dmDV.cdsSmpRegISOSYSTEM.AsString <> '') then NewIsotopeSystemID := dmDV.cdsSmpRegISOSYSTEM.AsString;
          NewSampleID := 'NEW';
          if (dmDV.cdsSmpRegSAMPLENO.AsString <> '') then NewSampleID := dmDV.cdsSmpRegSAMPLENO.AsString;
          NewFrac := 'NEW';
          if (dmDV.cdsSmpRegFRAC.AsString <> '') then NewFrac := dmDV.cdsSmpRegFRAC.AsString;
          NewIncluded := 'N';
          if (dmDV.cdsSmpRegINCLUDED.AsString <> '') then NewIncluded := dmDV.cdsSmpRegINCLUDED.AsString;
          dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+''''+NewIsotopeSystemID+''''+', ');
          dmDV.qNew.SQL.Add(''''+NewSampleID+''''+', '+''''+NewFrac+''''+', '+''''+NewIncluded+''''+')');
          dmDV.cdsSmpReg.Next;
          //if not dmDV.sqlcDateView.InTransaction then
          //begin
            TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
            try
              dmDV.qNew.ExecSQL(false);
              dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            except
              dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            end;
          //end;
        until dmDV.cdsSmpReg.Eof;
      except
      end;
    end;

    if (dmDV.cdsProvince.RecordCount > 0) then
    begin
      //now insert link to province
      try
        UserSession.WhereAmI := 'Start Insert new province link';
        repeat
          NewString := dmDV.cdsProvincesDOMAINID.AsString;
          dmDV.qNew.SQL.Clear;
          dmDV.qNew.SQL.Add('INSERT INTO ISOPROVTERR');
          dmDV.qNew.SQL.Add('(RECORDID, DOMAINID)');
          dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+NewString+')');
          dmDV.cdsProvince.Next;
          //if not dmDV.sqlcDateView.InTransaction then
          //begin
            TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
            try
              dmDV.qNew.ExecSQL(false);
              dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            except
              dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            end;
          //end;
        until dmDV.cdsProvince.Eof;
      except
      end;
    end;
    if (dmDV.cdsTerrane.RecordCount > 0) then
    begin
      //now insert link to terrane
      try
        UserSession.WhereAmI := 'Start Insert new terrane link';
        repeat
          NewString := dmDV.cdsTerranesDOMAINID.AsString;
          dmDV.qNew.SQL.Clear;
          dmDV.qNew.SQL.Add('INSERT INTO ISOPROVTERR');
          dmDV.qNew.SQL.Add('(RECORDID, DOMAINID)');
          dmDV.qNew.SQL.Add('VALUES ('+IntToStr(NextAvailableRecordID)+', '+NewString+')');
          dmDV.cdsTerrane.Next;
          //if not dmDV.sqlcDateView.InTransaction then
          //begin
            TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
            try
              dmDV.qNew.ExecSQL(false);
              dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            except
              dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            end;
          //end;
        until dmDV.cdsTerrane.Eof;
      except
      end;
    end;
    dmDV.cdsRecordIDs.Close;
    dmDV.qRecordIDs.Close;
    dmDV.qRecordIDs.ParamByName('RECORDID').AsInteger := NextAvailableRecordID;
    dmDV.cdsRecordIDs.Open;
    //Provinces
    dmDV.qProvinces.Close;
    dmDV.qProvinces.SQL.Clear;
    dmDV.qProvinces.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    dmDV.qProvinces.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qProvinces.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qProvinces.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qProvinces.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL <= 2');
    dmDV.qProvinces.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('AddNewRecordWithDecayConstErrors '+dmDV.qProvinces.SQL.Text);
    end;
    //Terranes
    dmDV.qTerranes.Close;
    dmDV.qTerranes.SQL.Clear;
    dmDV.qTerranes.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('  DOMAINS.DOMAINID, DOMAINS.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
    dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID = DOMAINTYPE.DOMAINTYPEID');
    dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
    dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
    //Grouping
    dmDV.qGroupingList.Close;
    dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
    //Samples
    dmDV.qSamples.Close;
    dmDV.qSamples.SQL.Clear;
    dmDV.qSamples.SQL.Add('SELECT DISTINCT SMPLOC.SAMPLENO, SMPLOC.CONTINENTID, SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('FROM SMPLOC,COUNTRY,CONTINENT');
    dmDV.qSamples.SQL.Add('WHERE CONTINENT.CONTINENTID = COUNTRY.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.CONTINENTID = SMPLOC.CONTINENTID');
    dmDV.qSamples.SQL.Add('AND COUNTRY.COUNTRYABR = SMPLOC.COUNTRYABR');
    dmDV.qSamples.SQL.Add('AND SMPLOC.CONTINENTID = '+''''+UserSession.NewCONTINENTID+'''');
    dmDV.qSamples.SQL.Add('AND SMPLOC.COUNTRYABR = '+''''+UserSession.NewAreaID+'''');
    //dmUser.SetDeveloperData('AddNewRecordWithDecayConstErrors '+dmDV.qSamples.SQL.Text);
    UserSession.WhereAmI := 'end';
    WasSuccessful := true;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to insert new record - reached '+UserSession.WhereAmI);
  end;
end;


procedure TdmDVcds.AddUnitAreaLink(tUnitID : string;
                                tCountryAbr : string;
                                var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  try
    UserSession.WhereAmI := 'Start Insert new area link for unit';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SUITECOUNTRY');
    dmDV.qNew.SQL.Add('(UNITID, COUNTRYABR, UNITHASRECORDS)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+tUnitID+''''+', '+''''+tCountryAbr+''''+', '+''''+'Y'+''''+' '+')');
    //UserSession.tmpStrList.Text  := dmDV.qNew.SQL.Text;
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      end;
    //end;
  except
  end;
end;

procedure TdmDVcds.AddUnit(tUnitName : string;
                    var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  try
    UserSession.WhereAmI := 'Start Insert new unit';
    WasSuccessful := false;
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('DELETE FROM SUITE');
    dmDV.qNew.SQL.Add('WHERE SUITE.UNITNAME = '+''''+'NEW'+UserSession.UserID+'''');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        WasSuccessful := true;
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO SUITE');
    dmDV.qNew.SQL.Add('(UNITNAME)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+tUnitName+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        WasSuccessful := true;
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
  end;
end;


procedure TdmDVcds.ConstructReferenceQuery;
var
  i : integer;
begin
  //References
  dmDV.qReferences.Close;
  dmDV.qReferences.SQL.Clear;
  dmDV.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmDV.qReferences.SQL.Add('  CONTINENT.CONTINENT, SOURCELIST.SOURCEYEAR');
  dmDV.qReferences.SQL.Add('FROM SOURCELIST,CONTINENT');
  dmDV.qReferences.SQL.Add('WHERE CONTINENT.CONTINENTID = SOURCELIST.CONTINENTID');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmDV.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :LastReference');
  dmDV.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmDV.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmDV.qReferences.SQL.Add(' ) ');
  //dmUser.SetDeveloperData('Define reference query');
  //dmUser.SetDeveloperData(dmDV.qReferences.SQL.Text);
end;

procedure TdmDVcds.ConstructDomainQuery;
var
  i : integer;
begin
  //Domains
  dmDV.qDomains.Close;
  dmDV.qDomains.SQL.Clear;
  dmDV.qDomains.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINNAME || '+''''+' ('+''''+' || DOMAINS.CONTINENTID || '+''''+')'+''''+' AS DOMAINNAME'+',');
  dmDV.qDomains.SQL.Add('DOMAINS.DOMAINID, DOMAINS.CONTINENTID');
  dmDV.qDomains.SQL.Add('FROM DOMAINS');
  dmDV.qDomains.SQL.Add('WHERE DOMAINS.DOMAINNAME >= :FirstDomain');
  dmDV.qDomains.SQL.Add('AND DOMAINS.DOMAINNAME <= :LastDomain');
  dmDV.qDomains.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+ValueForUndefinedContinentID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmDV.qDomains.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmDV.qDomains.SQL.Add(' ) ');
  dmDV.qDomains.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  //dmUser.SetDeveloperData('Define domains query');
  //dmUser.SetDeveloperData(dmDV.qDomains.SQL.Text);
end;

procedure TdmDVcds.AddNewComment(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
begin
  tmpStr := 'new comment';
  WasSuccessful := true;
  //now insert a new, temporary record
  try
    UserSession.WhereAmI := 'Start Insert new temporary comment';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO ISORGR30COMMENT');
    dmDV.qNew.SQL.Add('(RECORDID, COMMENT )');
    dmDV.qNew.SQL.Add('VALUES ('+''''+UserSession.RecordChosen+''''+', '+''''+tmpStr+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;

procedure TdmDVcds.AddNewOtherIntercept(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
begin
  tmpStr := '0.0';
  WasSuccessful := true;
  //now insert a new, temporary record
  try
    UserSession.WhereAmI := 'Start Insert new temporary other intercept';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO ISOOTHER');
    dmDV.qNew.SQL.Add('(RECORDID, LWRINTERCEPT, LWRPERROR, LWRMERROR, WEIGHTING )');
    dmDV.qNew.SQL.Add('VALUES ('+''''+UserSession.RecordChosen+''''+', '+''''+tmpStr+''''+', '+''''+tmpStr+''''+', ');
    dmDV.qNew.SQL.Add(''''+tmpStr+''''+', '+''''+' '+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;


procedure TdmDVcds.AddNewUser(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
begin
  tmpStr := '0.0';
  WasSuccessful := true;
  //now insert a new, temporary record
  try
    UserSession.WhereAmI := 'Start Insert new user for DateView';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO USERS');
    dmDV.qNew.SQL.Add('(USERID)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+UserSession.UserID+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;

procedure TdmDVcds.AddNewUserWhoFor(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
begin
  tmpStr := '0.0';
  WasSuccessful := true;
  //now insert a new, temporary record
  try
    UserSession.WhereAmI := 'Start Insert new userwhofor for DateView';
    dmDV.qNew.SQL.Clear;
    dmDV.qNew.SQL.Add('INSERT INTO USERSWHOFOR');
    dmDV.qNew.SQL.Add('(USERID)');
    dmDV.qNew.SQL.Add('VALUES ('+''''+UserSession.UserID+''''+')');
    //dmUser.SetDeveloperData(dmDV.qNew.SQL.Text);
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qNew.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
  end;
end;

end.


