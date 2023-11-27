unit DVIW_dmgraphics;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, midaslib,
  DBXDevartInterBase;

type
  TdmgDV = class(TDataModule)
    sqlcDateView: TSQLConnection;
    Querydm: TSQLQuery;
    dspQuery2: TDataSetProvider;
    cdsQuerydm: TClientDataSet;
    dsQuerydm: TDataSource;
    dsTempDataMap: TDataSource;
    dsTempDataDI: TDataSource;
    dsTempDataI: TDataSource;
    dsTempDataDT: TDataSource;
    dsTempDataDG: TDataSource;
    dsQdmGrouping: TDataSource;
    dsQdmSmp: TDataSource;
    dsQdmProvince: TDataSource;
    dsQdmTerrane: TDataSource;
    dsQdmOrogenicPeriod: TDataSource;
    dsQdmChemType: TDataSource;
    dsQdmInit: TDataSource;
    dsQdmBlockingT: TDataSource;
    cdsTempDataMap: TClientDataSet;
    cdsTempDataDI: TClientDataSet;
    cdsTempDataDIInterpretation: TStringField;
    cdsTempDataDIAge: TFloatField;
    cdsTempDataDISuitName: TStringField;
    cdsTempDataDIInterpAbr: TStringField;
    cdsTempDataDIGrouping: TStringField;
    cdsTempDataDIColumnNo: TSmallintField;
    cdsTempDataDIAgeErrorAv: TFloatField;
    cdsTempDataDIAgePlusError: TFloatField;
    cdsTempDataDIAgeMinusError: TFloatField;
    cdsTempDataDT: TClientDataSet;
    cdsTempDataDG: TClientDataSet;
    cdsTempDataDTGrouping: TStringField;
    cdsTempDataDTSuitName: TStringField;
    cdsTempDataDTColumnNo: TSmallintField;
    cdsTempDataDTAge: TFloatField;
    cdsTempDataDTAgePlusError: TFloatField;
    cdsTempDataDTAgeMinusError: TFloatField;
    cdsTempDataDTIsoSystem: TStringField;
    cdsTempDataDTMaterialAbr: TStringField;
    cdsTempDataDTApproachAbr: TStringField;
    cdsTempDataDTBlockingT: TFloatField;
    cdsTempDataDTBlockingTUncertainty: TFloatField;
    cdsTempDataDGGrouping: TStringField;
    cdsTempDataDGAge: TFloatField;
    cdsTempDataDGSuitName: TStringField;
    cdsTempDataDGInterpAbr: TStringField;
    cdsTempDataDGInterpretation: TStringField;
    cdsTempDataDGColumnNo: TSmallintField;
    cdsTempDataDGAgeErrorAv: TFloatField;
    cdsTempDataDGAgePlusError: TFloatField;
    cdsTempDataDGAgeMinusError: TFloatField;
    QuerydmCOUNTRYABR: TStringField;
    QuerydmUNITNAME: TStringField;
    QuerydmMATERIALABR: TStringField;
    QuerydmISOTOPESYSTEM: TStringField;
    QuerydmAPPROACHABR: TStringField;
    QuerydmTECHABR: TStringField;
    QuerydmINTERPABR: TStringField;
    QuerydmPREFLEVEL: TSmallintField;
    QuerydmAGEUNITS: TStringField;
    QuerydmLITHOLOGY: TStringField;
    QuerydmMETHODABR: TStringField;
    QuerydmRECORDID: TIntegerField;
    QuerydmCONFIDENTIAL: TIntegerField;
    QuerydmRAGE: TFloatField;
    QuerydmRAGEPERROR: TFloatField;
    QuerydmRAGEMERROR: TFloatField;
    cdsQuerydmCOUNTRYABR: TStringField;
    cdsQuerydmUNITNAME: TStringField;
    cdsQuerydmMATERIALABR: TStringField;
    cdsQuerydmISOTOPESYSTEM: TStringField;
    cdsQuerydmAPPROACHABR: TStringField;
    cdsQuerydmTECHABR: TStringField;
    cdsQuerydmINTERPABR: TStringField;
    cdsQuerydmPREFLEVEL: TSmallintField;
    cdsQuerydmAGEUNITS: TStringField;
    cdsQuerydmLITHOLOGY: TStringField;
    cdsQuerydmMETHODABR: TStringField;
    cdsQuerydmRECORDID: TIntegerField;
    cdsQuerydmCONFIDENTIAL: TIntegerField;
    cdsQuerydmRAGE: TFloatField;
    cdsQuerydmRAGEPERROR: TFloatField;
    cdsQuerydmRAGEMERROR: TFloatField;
    QdmGrouping: TSQLQuery;
    QdmSmp: TSQLQuery;
    QdmProvince: TSQLQuery;
    QdmTerrane: TSQLQuery;
    QdmOrogenicPeriod: TSQLQuery;
    QdmChemType: TSQLQuery;
    QdmInit: TSQLQuery;
    QdmBlockingT: TSQLQuery;
    QdmBoundary: TSQLQuery;
    dsQuerydmDB: TDataSource;
    QdmGroupingRECORDID: TIntegerField;
    QdmGroupingGROUPING: TStringField;
    QdmSmpRECORDID: TIntegerField;
    QdmSmpISOSYSTEM: TStringField;
    QdmSmpSAMPLENO: TStringField;
    QdmSmpFRAC: TStringField;
    QdmSmpINCLUDED: TStringField;
    QdmSmpCONTINENTID: TStringField;
    QdmSmpCOUNTRYABR: TStringField;
    QdmSmpLATITUDE: TFloatField;
    QdmSmpLONGITUDE: TFloatField;
    QdmSmpELEVATION: TFloatField;
    QdmProvinceRECORDID: TIntegerField;
    QdmTerraneRECORDID: TIntegerField;
    QdmOrogenicPeriodRECORDID: TIntegerField;
    QdmOrogenicPeriodOROGENICPERIODID: TStringField;
    QdmChemTypeRECORDID: TIntegerField;
    QdmChemTypeCHEMTYPEABR: TStringField;
    QdmBoundaryRECORDID: TIntegerField;
    QdmBoundaryBOUNDARYID: TIntegerField;
    QdmBoundaryBOUNDPOSID: TStringField;
    QdmInitRECORDID: TIntegerField;
    QdmInitINITRATIO: TFloatField;
    QdmInitINITRATIOERROR: TFloatField;
    QdmInitEPSILON: TFloatField;
    QdmInitEPSILONERROR: TFloatField;
    QdmInitMU: TFloatField;
    QdmInitMUPERROR: TFloatField;
    QdmInitMUMERROR: TFloatField;
    QdmInitINITIALRATIO3D: TFloatField;
    QdmInitINITIALRATIO3DERROR: TFloatField;
    QdmBlockingTMATERIALABR: TStringField;
    QdmBlockingTISOSYSTEM: TStringField;
    QdmBlockingTAPPROACHABR: TStringField;
    QdmBlockingTBLOCKINGT: TFloatField;
    QdmBlockingTBLOCKINGTUNCERTAINTY: TFloatField;
    cdsQdmGrouping: TClientDataSet;
    cdsQdmSmp: TClientDataSet;
    cdsQdmProvince: TClientDataSet;
    cdsQdmTerrane: TClientDataSet;
    cdsQdmOrogenicPeriod: TClientDataSet;
    cdsQdmChemType: TClientDataSet;
    cdsQdmBoundary: TClientDataSet;
    cdsQdmInit: TClientDataSet;
    cdsQdmBlockingT: TClientDataSet;
    dsQdmBoundary: TDataSource;
    cdsQuerydmQdmGrouping: TDataSetField;
    cdsQuerydmQdmSmp: TDataSetField;
    cdsQuerydmQdmProvince: TDataSetField;
    cdsQuerydmQdmTerrane: TDataSetField;
    cdsQuerydmQdmOrogenicPeriod: TDataSetField;
    cdsQuerydmQdmChemType: TDataSetField;
    cdsQuerydmQdmBoundary: TDataSetField;
    cdsQuerydmQdmInit: TDataSetField;
    cdsQuerydmQdmBlockingT: TDataSetField;
    cdsQdmGroupingRECORDID: TIntegerField;
    cdsQdmGroupingGROUPING: TStringField;
    cdsQdmSmpRECORDID: TIntegerField;
    cdsQdmSmpISOSYSTEM: TStringField;
    cdsQdmSmpSAMPLENO: TStringField;
    cdsQdmSmpFRAC: TStringField;
    cdsQdmSmpINCLUDED: TStringField;
    cdsQdmSmpCONTINENTID: TStringField;
    cdsQdmSmpCOUNTRYABR: TStringField;
    cdsQdmSmpLATITUDE: TFloatField;
    cdsQdmSmpLONGITUDE: TFloatField;
    cdsQdmSmpELEVATION: TFloatField;
    cdsQdmProvinceRECORDID: TIntegerField;
    cdsQdmTerraneRECORDID: TIntegerField;
    cdsQdmOrogenicPeriodRECORDID: TIntegerField;
    cdsQdmOrogenicPeriodOROGENICPERIODID: TStringField;
    cdsQdmChemTypeRECORDID: TIntegerField;
    cdsQdmChemTypeCHEMTYPEABR: TStringField;
    cdsQdmBoundaryRECORDID: TIntegerField;
    cdsQdmBoundaryBOUNDARYID: TIntegerField;
    cdsQdmBoundaryBOUNDPOSID: TStringField;
    cdsQdmInitRECORDID: TIntegerField;
    cdsQdmInitINITRATIO: TFloatField;
    cdsQdmInitINITRATIOERROR: TFloatField;
    cdsQdmInitEPSILON: TFloatField;
    cdsQdmInitEPSILONERROR: TFloatField;
    cdsQdmInitMU: TFloatField;
    cdsQdmInitMUPERROR: TFloatField;
    cdsQdmInitMUMERROR: TFloatField;
    cdsQdmInitINITIALRATIO3D: TFloatField;
    cdsQdmInitINITIALRATIO3DERROR: TFloatField;
    cdsQdmBlockingTMATERIALABR: TStringField;
    cdsQdmBlockingTISOSYSTEM: TStringField;
    cdsQdmBlockingTAPPROACHABR: TStringField;
    cdsQdmBlockingTBLOCKINGT: TFloatField;
    cdsQdmBlockingTBLOCKINGTUNCERTAINTY: TFloatField;
    QdmStatistics: TSQLQuery;
    cdsQdmStatistics: TClientDataSet;
    dsQdmStatistics: TDataSource;
    QdmStatisticsRECORDID: TIntegerField;
    QdmStatisticsMSWD: TFloatField;
    QdmStatisticsNREG: TFloatField;
    QdmStatisticsNSAMPLES: TIntegerField;
    QdmStatisticsALPHA: TFloatField;
    QdmStatisticsNREPLICATES: TIntegerField;
    QdmStatisticsDEGFREEDOM: TIntegerField;
    QdmStatisticsFCUTOFF: TFloatField;
    QdmStatisticsPROBOFFIT: TFloatField;
    QdmStatisticsPROBOFCONCORDANCE: TFloatField;
    QdmStatisticsLUDWIGP: TFloatField;
    QdmStatisticsXCENTROID: TFloatField;
    QdmStatisticsYCENTROID: TFloatField;
    QdmStatisticsXCONSTRAIN: TFloatField;
    QdmStatisticsYCONSTRAIN: TFloatField;
    QdmStatisticsAGECONSTRAIN: TFloatField;
    QdmStatisticsZCENTROID: TFloatField;
    QdmStatisticsZCONSTRAIN: TFloatField;
    cdsQuerydmQdmStatistics: TDataSetField;
    cdsQdmStatisticsRECORDID: TIntegerField;
    cdsQdmStatisticsMSWD: TFloatField;
    cdsQdmStatisticsNREG: TFloatField;
    cdsQdmStatisticsNSAMPLES: TIntegerField;
    cdsQdmStatisticsALPHA: TFloatField;
    cdsQdmStatisticsNREPLICATES: TIntegerField;
    cdsQdmStatisticsDEGFREEDOM: TIntegerField;
    cdsQdmStatisticsFCUTOFF: TFloatField;
    cdsQdmStatisticsPROBOFFIT: TFloatField;
    cdsQdmStatisticsPROBOFCONCORDANCE: TFloatField;
    cdsQdmStatisticsLUDWIGP: TFloatField;
    cdsQdmStatisticsXCENTROID: TFloatField;
    cdsQdmStatisticsYCENTROID: TFloatField;
    cdsQdmStatisticsXCONSTRAIN: TFloatField;
    cdsQdmStatisticsYCONSTRAIN: TFloatField;
    cdsQdmStatisticsAGECONSTRAIN: TFloatField;
    cdsQdmStatisticsZCENTROID: TFloatField;
    cdsQdmStatisticsZCONSTRAIN: TFloatField;
    cdsTempDataI: TClientDataSet;
    cdsTempDataIInterpretation: TStringField;
    cdsTempDataIPlotNo: TSmallintField;
    cdsTempDataIColumnNo: TSmallintField;
    cdsTempDataIVariableX: TFloatField;
    cdsTempDataIVariableY: TFloatField;
    cdsTempDataIGrouping: TStringField;
    qVariables: TSQLQuery;
    dspVariables: TDataSetProvider;
    cdsVariables: TClientDataSet;
    dsVariables: TDataSource;
    cdsTempDataProb: TClientDataSet;
    dsTempDataProb: TDataSource;
    cdsTempDataProbAge: TFloatField;
    cdsTempDataProbCurveValue: TFloatField;
    cdsTempDataProbCurveNumber: TIntegerField;
    cdsTempDataProbCurveTitle: TStringField;
    Querydm2: TSQLQuery;
    dspQuerydm2: TDataSetProvider;
    cdsQuerydm2: TClientDataSet;
    dsQuerydm2: TDataSource;
    cdsQuerydm2RAGE: TFloatField;
    cdsQuerydm2UNITNAME: TStringField;
    cdsQuerydm2INTERPABR: TStringField;
    cdsQuerydm2OPTIONID: TIntegerField;
    cdsQuerydm2RAGEPERROR: TFloatField;
    cdsQuerydm2RAGEMERROR: TFloatField;
    cdsQuerydm2OPTIONTITLE: TStringField;
    cdsQuerydm2OPTIONTITLE_1: TStringField;
    qGroupingLink: TSQLQuery;
    dspGroupingLink: TDataSetProvider;
    cdsGroupingLink: TClientDataSet;
    dsGroupingLink: TDataSource;
    cdsGroupingLinkGROUPINGNUMBER: TIntegerField;
    cdsGroupingLinkGROUPINGLINK: TStringField;
    cdsGroupingLinkUSERID: TStringField;
    QuerydmDI: TSQLQuery;
    dspQuerydmDI: TDataSetProvider;
    cdsQuerydmDI: TClientDataSet;
    dsQuerydmDI: TDataSource;
    QuerydmDG: TSQLQuery;
    dspQuerydmDG: TDataSetProvider;
    cdsQuerydmDG: TClientDataSet;
    dsQuerydmDG: TDataSource;
    cdsQuerydmDGGROUPINGLINK: TStringField;
    cdsQuerydmDGRAGE: TFloatField;
    cdsQuerydmDGUNITNAME: TStringField;
    cdsQuerydmDGINTERPABR: TStringField;
    cdsQuerydmDGGROUPINGNUMBER: TIntegerField;
    cdsQuerydmDGRAGEPERROR: TFloatField;
    cdsQuerydmDGRAGEMERROR: TFloatField;
    QuerydmI: TSQLQuery;
    dspQuerydmI: TDataSetProvider;
    cdsQuerydmI: TClientDataSet;
    dsQuerydmI: TDataSource;
    QuerydmDT: TSQLQuery;
    dspQuerydmDT: TDataSetProvider;
    cdsQuerydmDT: TClientDataSet;
    dsQuerydmDT: TDataSource;
    cdsQuerydmDTGROUPINGLINK: TStringField;
    cdsQuerydmDTUNITNAME: TStringField;
    cdsQuerydmDTGROUPINGNUMBER: TIntegerField;
    cdsQuerydmDTRAGE: TFloatField;
    cdsQuerydmDTRAGEPERROR: TFloatField;
    cdsQuerydmDTRAGEMERROR: TFloatField;
    cdsQuerydmDTISOTOPESYSTEM: TStringField;
    cdsQuerydmDTMATERIALABR: TStringField;
    cdsQuerydmDTAPPROACHABR: TStringField;
    cdsQuerydmDTINTERPABR: TStringField;
    cdsQuerydmDTBLOCKINGT: TFloatField;
    cdsQuerydmDTBLOCKINGTUNCERTAINTY: TFloatField;
    QuerydmMI: TSQLQuery;
    dspQuerydmMI: TDataSetProvider;
    cdsQuerydmMI: TClientDataSet;
    dsQuerydmMI: TDataSource;
    cdsQuerydmMIOPTIONID: TIntegerField;
    cdsQuerydmMISAMPLENO: TStringField;
    cdsQuerydmMILATITUDE: TFloatField;
    cdsQuerydmMILONGITUDE: TFloatField;
    cdsQuerydmMIINTERPABR: TStringField;
    cdsQuerydmMIOPTIONTITLE: TStringField;
    cdsQuerydmMIRAGE: TFloatField;
    cdsQuerydmIRAGE: TFloatField;
    cdsQuerydmIUNITNAME: TStringField;
    cdsQuerydmIINTERPABR: TStringField;
    cdsQuerydmIOPTIONID: TIntegerField;
    cdsQuerydmIRAGEPERROR: TFloatField;
    cdsQuerydmIRAGEMERROR: TFloatField;
    cdsQuerydmIINITRATIO: TFloatField;
    cdsQuerydmIEPSILON: TFloatField;
    cdsQuerydmIMU: TFloatField;
    cdsQuerydmIINITIALRATIO3D: TFloatField;
    cdsQuerydmDIOPTIONTITLE: TStringField;
    cdsQuerydmDIRAGE: TFloatField;
    cdsQuerydmDIUNITNAME: TStringField;
    cdsQuerydmDIINTERPABR: TStringField;
    cdsQuerydmDIOPTIONID: TIntegerField;
    cdsQuerydmDIRAGEPERROR: TFloatField;
    cdsQuerydmDIRAGEMERROR: TFloatField;
    cdsQuerydmIOPTIONTITLE: TStringField;
    cdsVariablesVARIABLEABR: TStringField;
    cdsVariablesVARIABLENAME: TStringField;
    QuerydmIG: TSQLQuery;
    dspQuerydmIG: TDataSetProvider;
    cdsQuerydmIG: TClientDataSet;
    dsQuerydmIG: TDataSource;
    cdsQuerydmIGGROUPINGLINK: TStringField;
    cdsQuerydmIGRAGE: TFloatField;
    cdsQuerydmIGUNITNAME: TStringField;
    cdsQuerydmIGINTERPABR: TStringField;
    cdsQuerydmIGGROUPINGNUMBER: TIntegerField;
    cdsQuerydmIGRAGEPERROR: TFloatField;
    cdsQuerydmIGRAGEMERROR: TFloatField;
    cdsQuerydmIGINITRATIO: TFloatField;
    cdsQuerydmIGEPSILON: TFloatField;
    cdsQuerydmIGMU: TFloatField;
    cdsQuerydmIGINITIALRATIO3D: TFloatField;
    QuerydmMIG: TSQLQuery;
    dspQuerydmMIG: TDataSetProvider;
    cdsQuerydmMIG: TClientDataSet;
    dsQuerydmMIG: TDataSource;
    cdsQuerydmMIGOPTIONID: TIntegerField;
    cdsQuerydmMIGSAMPLENO: TStringField;
    cdsQuerydmMIGLATITUDE: TFloatField;
    cdsQuerydmMIGLONGITUDE: TFloatField;
    cdsQuerydmMIGINTERPABR: TStringField;
    cdsQuerydmMIGGROUPINGLINK: TStringField;
    cdsQuerydmMIGRAGE: TFloatField;
    cdsQuerydmMIGRECORDID: TIntegerField;
    cdsQuerydmMIRECORDID: TIntegerField;
    QuerydmUNITID: TIntegerField;
    cdsQuerydmUNITID: TIntegerField;
    cdsQuerydm2UNITID: TIntegerField;
    cdsQuerydmDIUNITID: TIntegerField;
    QuerydmDIOPTIONTITLE: TStringField;
    QuerydmDIRAGE: TFloatField;
    QuerydmDIUNITID: TIntegerField;
    QuerydmDIUNITNAME: TStringField;
    QuerydmDIINTERPABR: TStringField;
    QuerydmDIOPTIONTITLE_1: TStringField;
    QuerydmDIOPTIONID: TIntegerField;
    QuerydmDIRAGEPERROR: TFloatField;
    QuerydmDIRAGEMERROR: TFloatField;
    cdsQuerydmDGUNITID: TIntegerField;
    QdmProvinceDOMAINNAME: TStringField;
    QdmProvinceDOMAINID: TIntegerField;
    QdmTerraneDOMAINID: TIntegerField;
    QdmTerraneDOMAINNAME: TStringField;
    cdsQdmProvinceDOMAINID: TIntegerField;
    cdsQdmProvinceDOMAINNAME: TStringField;
    cdsQdmTerraneDOMAINID: TIntegerField;
    cdsQdmTerraneDOMAINNAME: TStringField;
    QuerydmME: TSQLQuery;
    dspQuerydmME: TDataSetProvider;
    cdsQuerydmME: TClientDataSet;
    dsQuerydmME: TDataSource;
    cdsQuerydmMEOPTIONID: TIntegerField;
    cdsQuerydmMESAMPLENO: TStringField;
    cdsQuerydmMELATITUDE: TFloatField;
    cdsQuerydmMELONGITUDE: TFloatField;
    cdsQuerydmMEELEVATION: TFloatField;
    cdsQuerydmMEINTERPABR: TStringField;
    cdsQuerydmMEOPTIONTITLE: TStringField;
    cdsQuerydmMERECORDID: TIntegerField;
    cdsQuerydmMEINITRATIO: TFloatField;
    cdsQuerydmMEEPSILON: TFloatField;
    cdsQuerydmMEMU: TFloatField;
    cdsQuerydmMEINITIALRATIO3D: TFloatField;
    cdsQuerydmMERAGE: TFloatField;
    cdsQuerydmMEINITRATIOERROR: TFloatField;
    cdsQuerydmMEEPSILONERROR: TFloatField;
    cdsQuerydmMEMUPERROR: TFloatField;
    cdsQuerydmMEMUMERROR: TFloatField;
    cdsQuerydmMEINITIALRATIO3DERROR: TFloatField;
    cdsTempDataMapInterpretation: TStringField;
    cdsTempDataMapAgeBand: TStringField;
    cdsTempDataMapInterpAbr: TStringField;
    cdsTempDataMapColumnNo: TIntegerField;
    cdsTempDataMapSampleNo: TStringField;
    cdsTempDataMapAge: TFloatField;
    cdsTempDataMapAgePlus: TFloatField;
    cdsTempDataMapAgeMinus: TFloatField;
    cdsTempDataMapLatitude: TFloatField;
    cdsTempDataMapLongitude: TFloatField;
    cdsTempDataMapElevation: TFloatField;
    cdsTempDataMapColumnNoDate: TIntegerField;
    cdsTempDataMapRecordID: TIntegerField;
    cdsTable1: TClientDataSet;
    SQLMonitor1: TSQLMonitor;
    QdmLIP: TSQLQuery;
    cdsQdmLIP: TClientDataSet;
    dsQdmLIP: TDataSource;
    QdmLIPRECORDID: TIntegerField;
    QdmLIPLIPID: TIntegerField;
    QdmLIPLIPNAME: TStringField;
    cdsQuerydmQdmLIP: TDataSetField;
    cdsQdmLIPRECORDID: TIntegerField;
    cdsQdmLIPLIPID: TIntegerField;
    cdsQdmLIPLIPNAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RecordIsToBeGraphed(CurrentInterpAbr : string; var GraphCategory : integer);
    procedure AddRecordToBeGraphed(Graphtype: string; AColumn: integer);
    procedure AllocateInitialAndModelRatios;
    procedure AllocateInitialAndModelRatiosGrouped;
    procedure WtAverData2 ( NS                : integer;
                            var WtAver, MSWD,
                            WESDoM, WOSDoM : double;
                            var N              : integer);
    procedure AllocateDataByInterpretation2;
    procedure AllocateDataGroupedByInterpretation2;
    procedure AllocateInitialAndModelRatios2;
    procedure AllocateInitialAndModelRatiosGrouped2;
    procedure AllocateMapDataInterp2;
    procedure AllocateMapDataBand2;
    procedure AllocateMapDataInitial2(tOptionTypeID : string);
    procedure AllocateClosuretempData2;
    procedure AllocateMapDataInterp2Grouped;
  end;

// Procs
  function dmgDV: TdmgDV;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  DVIW_constants, DVIW_dm, DVIW_regp, DVIW_mathproc, usrIW_dm;


function dmgDV: TdmgDV;
begin
  Result := TUserSession(WebApplication.Data).dmgDV;
end;

procedure TdmgDV.RecordIsToBeGraphed(CurrentInterpAbr : string; var GraphCategory : integer);
var
  i : integer;
begin
  CurrentInterpAbr := Trim(CurrentInterpAbr);
  GraphCategory := 0;
  for i := 1 to UserSession.Interpretation1Values.Count do
  begin
    UserSession.LC := UserSession.LC + 1;
    if (CurrentInterpAbr = Trim(UserSession.Interpretation1Values.Strings[i-1])) then GraphCategory := 1;
    if (GraphCategory > 0) then Break;
  end;
  if (GraphCategory = 0) then
  begin
    for i := 1 to UserSession.Interpretation2Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (CurrentInterpAbr = UserSession.Interpretation2Values.Strings[i-1]) then GraphCategory := 2;
      if (GraphCategory > 0) then Break;
    end;
  end;
  if (GraphCategory = 0) then
  begin
    for i := 1 to UserSession.Interpretation3Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (CurrentInterpAbr = UserSession.Interpretation3Values.Strings[i-1]) then GraphCategory := 3;
      if (GraphCategory > 0) then Break;
    end;
  end;
  if (GraphCategory = 0) then
  begin
    for i := 1 to UserSession.Interpretation4Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (CurrentInterpAbr = UserSession.Interpretation4Values.Strings[i-1]) then GraphCategory := 4;
      if (GraphCategory > 0) then Break;
    end;
  end;
  if (GraphCategory = 0) then
  begin
    for i := 1 to UserSession.Interpretation5Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (CurrentInterpAbr = UserSession.Interpretation5Values.Strings[i-1]) then GraphCategory := 5;
      if (GraphCategory > 0) then Break;
    end;
  end;
end;

procedure TdmgDV.AddRecordToBeGraphed(Graphtype: string; AColumn: integer);
var
  i : integer;
  Done : boolean;
begin
  Done := false;
  if (AColumn = 1) then
  begin
    for i := 1 to UserSession.Interpretation1Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (dmgDV.cdsQuerydmInterpAbr.AsString = UserSession.Interpretation1Values.Strings[i-1]) then
      begin
        if ((GraphType = gtInterpretationWithErrorBars) or
            (GraphType = gtGalbraith) or
            (GraphType = gtInterpretationProbabilityCurves)) then
        begin
          dmgDV.cdsTempDataDIColumnNo.AsInteger := 1;
          dmgDV.cdsTempDataDIInterpretation.AsString := UserSession.Interpretation1Caption;
        end;
        if ((GraphType = gtInitialRatio) or
            (GraphType = gtEpsilon) or
            (GraphType = gtMu) or
            (GraphType = gtInitialRatioGrouped) or
            (GraphType = gtEpsilonGrouped) or
            (GraphType = gtMuGrouped)) then
        begin
          dmgDV.cdsTempDataIColumnNo.AsInteger := 1;
          dmgDV.cdsTempDataIInterpretation.AsString := UserSession.Interpretation1Caption;
          //dmgDV.cdsTempDataIRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        if ((GraphType = gtMapInterpretation) or
            (GraphType = gtMapEpsilonBand) or
            (GraphType = gtMapDateBand)) then
        begin
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 1;
          dmgDV.cdsTempDataMapInterpretation.AsString := UserSession.Interpretation1Caption;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmInterpAbr.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        Done := true;
      end;
      if Done then Break;
    end;
  end;
  if (AColumn = 2) then
  begin
    for i := 1 to UserSession.Interpretation2Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (dmgDV.cdsQuerydmInterpAbr.AsString = UserSession.Interpretation2Values.Strings[i-1]) then
      begin
        if ((GraphType = gtInterpretationWithErrorBars) or
            (GraphType = gtGalbraith) or
            (GraphType = gtInterpretationProbabilityCurves)) then
        begin
          dmgDV.cdsTempDataDIColumnNo.AsInteger := 2;
          dmgDV.cdsTempDataDIInterpretation.AsString := UserSession.Interpretation2Caption;
        end;
        if ((GraphType = gtInitialRatio) or
            (GraphType = gtEpsilon) or
            (GraphType = gtMu) or
            (GraphType = gtInitialRatioGrouped) or
            (GraphType = gtEpsilonGrouped) or
            (GraphType = gtMuGrouped)) then
        begin
          dmgDV.cdsTempDataIColumnNo.AsInteger := 3;
          dmgDV.cdsTempDataIInterpretation.AsString := UserSession.Interpretation2Caption;
          //dmgDV.cdsTempDataIRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        if ((GraphType = gtMapInterpretation) or
            (GraphType = gtMapEpsilonBand) or
            (GraphType = gtMapDateBand)) then
        begin
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 3;
          dmgDV.cdsTempDataMapInterpretation.AsString := UserSession.Interpretation2Caption;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmInterpAbr.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        Done := true;
      end;
      if Done then Break;
    end;
  end;
  if (AColumn = 3) then
  begin
    for i := 1 to UserSession.Interpretation3Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (dmgDV.cdsQuerydmInterpAbr.AsString = UserSession.Interpretation3Values.Strings[i-1]) then
      begin
        if ((GraphType = gtInterpretationWithErrorBars) or
            (GraphType = gtGalbraith) or
            (GraphType = gtInterpretationProbabilityCurves)) then
        begin
          dmgDV.cdsTempDataDIColumnNo.AsInteger := 5;
          dmgDV.cdsTempDataDIInterpretation.AsString := UserSession.Interpretation3Caption;
        end;
        if ((GraphType = gtInitialRatio) or
            (GraphType = gtEpsilon) or
            (GraphType = gtMu) or
            (GraphType = gtInitialRatioGrouped) or
            (GraphType = gtEpsilonGrouped) or
            (GraphType = gtMuGrouped)) then
        begin
          dmgDV.cdsTempDataIColumnNo.AsInteger := 5;
          dmgDV.cdsTempDataIInterpretation.AsString := UserSession.Interpretation3Caption;
          //dmgDV.cdsTempDataIRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        if ((GraphType = gtMapInterpretation) or
            (GraphType = gtMapEpsilonBand) or
            (GraphType = gtMapDateBand)) then
        begin
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 5;
          dmgDV.cdsTempDataMapInterpretation.AsString := UserSession.Interpretation3Caption;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmInterpAbr.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        Done := true;
      end;
      if Done then Break;
    end;
  end;
  if (AColumn = 4) then
  begin
    for i := 1 to UserSession.Interpretation4Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (dmgDV.cdsQuerydmInterpAbr.AsString = UserSession.Interpretation4Values.Strings[i-1]) then
      begin
        if ((GraphType = gtInterpretationWithErrorBars) or
            (GraphType = gtGalbraith) or
            (GraphType = gtInterpretationProbabilityCurves)) then
        begin
          dmgDV.cdsTempDataDIColumnNo.AsInteger := 4;
          dmgDV.cdsTempDataDIInterpretation.AsString := UserSession.Interpretation4Caption;
        end;
        if ((GraphType = gtInitialRatio) or
            (GraphType = gtEpsilon) or
            (GraphType = gtMu) or
            (GraphType = gtInitialRatioGrouped) or
            (GraphType = gtEpsilonGrouped) or
            (GraphType = gtMuGrouped)) then
        begin
          dmgDV.cdsTempDataIColumnNo.AsInteger := 7;
          dmgDV.cdsTempDataIInterpretation.AsString := UserSession.Interpretation4Caption;
          //dmgDV.cdsTempDataIRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        if ((GraphType = gtMapInterpretation) or
            (GraphType = gtMapEpsilonBand) or
            (GraphType = gtMapDateBand)) then
        begin
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 7;
          dmgDV.cdsTempDataMapInterpretation.AsString := UserSession.Interpretation4Caption;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmInterpAbr.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        Done := true;
      end;
      if Done then Break;
    end;
  end;
  if (AColumn = 5) then
  begin
    for i := 1 to UserSession.Interpretation5Values.Count do
    begin
      UserSession.LC := UserSession.LC + 1;
      if (dmgDV.cdsQuerydmInterpAbr.AsString = UserSession.Interpretation5Values.Strings[i-1]) then
      begin
        if ((GraphType = gtInterpretationWithErrorBars) or
            (GraphType = gtGalbraith) or
            (GraphType = gtInterpretationProbabilityCurves)) then
        begin
          dmgDV.cdsTempDataDIColumnNo.AsInteger := 5;
          dmgDV.cdsTempDataDIInterpretation.AsString := UserSession.Interpretation5Caption;
        end;
        if ((GraphType = gtInitialRatio) or
            (GraphType = gtEpsilon) or
            (GraphType = gtMu) or
            (GraphType = gtInitialRatioGrouped) or
            (GraphType = gtEpsilonGrouped) or
            (GraphType = gtMuGrouped)) then
        begin
          dmgDV.cdsTempDataIColumnNo.AsInteger := 9;
          dmgDV.cdsTempDataIInterpretation.AsString := UserSession.Interpretation5Caption;
          //dmgDV.cdsTempDataIRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        if ((GraphType = gtMapInterpretation) or
            (GraphType = gtMapEpsilonBand) or
            (GraphType = gtMapDateBand)) then
        begin
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 9;
          dmgDV.cdsTempDataMapInterpretation.AsString := UserSession.Interpretation5Caption;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmInterpAbr.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmRECORDID.AsInteger;
        end;
        Done := true;
      end;
      if Done then Break;
    end;
  end;
end;

procedure TdmgDV.AllocateInitialAndModelRatios;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  GraphCategoryNum : integer;
begin
  temp := 0.0;
  temp1 := 0.0;
  VarbNo11 := 1;
  VarbNo12 := 1;
  try
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    if UserSession.DataHaveChanged then
    begin
      UserSession.StartAtX := SpectrumStartAge;
      UserSession.EndAtX := SpectrumEndAge;
      UserSession.StartAtY := SpectrumStartAge;
      UserSession.EndAtY := -1.0*SpectrumEndAge;
      if (dmgDV.cdsTempDataI.RecordCount > 0) then
      begin
        dmgDV.cdsTempDataI.EmptyDataSet;
      end;
    end;
    with dmgDV do
    begin
      Querydm.Close;
      Querydm.SQL.Text := dmDV.Query1.SQL.Text;
      Querydm.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydm.Close;
      cdsQuerydm.Open;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydm.First;
    repeat
      GraphCategoryNum := 0;
      RecordIsToBeGraphed(dmgDV.cdsQuerydmINTERPABR.AsString,GraphCategoryNum);
      if (GraphCategoryNum > 0) then
      begin
        case VarbNo11 of
          111..113 : temp := dmgDV.cdsQuerydmRAge.AsFloat;
          114 : temp := dmgDV.cdsQdmInitInitRatio.AsFloat;
          115 : temp := dmgDV.cdsQdmInitEpsilon.AsFloat;
          116 : temp := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        case VarbNo12 of
          121..123 : temp1 := dmgDV.cdsQuerydmRAge.AsFloat;
          124 : temp1 := dmgDV.cdsQdmInitInitRatio.AsFloat;
          125 : temp1 := dmgDV.cdsQdmInitEpsilon.AsFloat;
          126 : temp1 := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        if ((temp <> 0.0) and (temp1 <> 0.0)) then
        begin
          if (UserSession.StartAtX > temp) then UserSession.StartAtX := temp;
          if (UserSession.EndAtX < temp) then UserSession.EndAtX := temp;
          if (UserSession.StartAtY > temp1) then UserSession.StartAtY := temp1;
          if (UserSession.EndAtY < temp1) then UserSession.EndAtY := temp1;
          try
            dmgDV.cdsTempDataI.Append;
            dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
            dmgDV.cdsTempDataIVariableX.AsFloat := temp;
            dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
            AddRecordToBeGraphed(UserSession.GraphType,GraphCategoryNum);
            dmgDV.cdsTempDataI.Post;
          except
          end;
        end;
      end;
      dmgDV.cdsQuerydm.Next;
    until dmgDV.cdsQuerydm.EOF;
    dmgDV.cdsQuerydm.First;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;

procedure TdmgDV.AllocateInitialAndModelRatiosGrouped;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  GraphCategoryNum : integer;
  i, j : integer;
begin
  UserSession.LC := 0;
  {Allocate data}
  dmgDV.cdsTempDataI.Filtered := false;
  dmgDV.cdsTempDataI.First;
  if not UserSession.DataHaveChanged then
  begin
    if (dmgDV.cdsTempDataI.RecordCount > 0) then
    begin
      dmgDV.cdsTempDataI.EmptyDataSet;
    end;
  end;
  with dmgDV do
  begin
    Querydm.Close;
    Querydm.SQL.Text := dmDV.Query1.SQL.Text;
    Querydm.ParamByName('USERID').AsString := UserSession.UserID;
    cdsQuerydm.Close;
    cdsQuerydm.Open;
  end;
  try
    if UserSession.DataHaveChanged then
    begin
      dmgDV.cdsQuerydm.First;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydm.First;
    repeat
      GraphCategoryNum := 0;
      RecordIsToBeGraphed(dmgDV.cdsQuerydmINTERPABR.AsString,GraphCategoryNum);
      if (GraphCategoryNum > 0) then
      begin
        case VarbNo11 of
          111..113 : temp := dmgDV.cdsQuerydmRAge.AsFloat;
          114 : temp := dmgDV.cdsQdmInitInitRatio.AsFloat;
          115 : temp := dmgDV.cdsQdmInitEpsilon.AsFloat;
          116 : temp := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        case VarbNo12 of
          121..123 : temp1 := dmgDV.cdsQuerydmRAge.AsFloat;
          124 : temp1 := dmgDV.cdsQdmInitInitRatio.AsFloat;
          125 : temp1 := dmgDV.cdsQdmInitEpsilon.AsFloat;
          126 : temp1 := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        if ((temp <> 0.0) and (temp1 <> 0.0)) then
        begin
          if (UserSession.StartAtX > temp) then UserSession.StartAtX := temp;
          if (UserSession.EndAtX < temp) then UserSession.EndAtX := temp;
          if (UserSession.StartAtY > temp1) then UserSession.StartAtY := temp1;
          if (UserSession.EndAtY < temp1) then UserSession.EndAtY := temp1;
          try
            dmgDV.cdsTempDataI.Append;
            dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
            dmgDV.cdsTempDataIVariableX.AsFloat := temp;
            dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
            AddRecordToBeGraphed(UserSession.GraphType,GraphCategoryNum);
            {grouped by grouping}
            if ((UserSession.GroupBy = gbGrouping) and (UserSession.GroupValues.Count > 0)) then
            begin
              dmgDV.cdsQdmGrouping.First;
              repeat
                for j := 1 to UserSession.GroupValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.GroupValues.Strings[j-1] = dmgDV.cdsQdmGroupingGrouping.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmGroupingGrouping.AsString;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmGrouping.Next;
              until dmgDV.cdsQdmGrouping.EOF;
              dmgDV.cdsQdmGrouping.First;
            end;
            {grouped by province}
            if ((UserSession.GroupBy = gbProvince) and (UserSession.ProvinceValues.Count > 0)) then
            begin
              dmgDV.cdsQdmProvince.First;
              repeat
                for j := 1 to UserSession.ProvinceValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.ProvinceValues.Strings[j-1] = dmgDV.cdsQdmProvinceDOMAINID.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmProvinceDOMAINID.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmProvince.Next;
              until dmgDV.cdsQdmProvince.EOF;
              dmgDV.cdsQdmProvince.First;
            end;
            {grouped by terrane}
            if ((UserSession.GroupBy = gbTerrane) and (UserSession.GroupValues.Count > 0)) then
            begin
              dmgDV.cdsQdmTerrane.First;
              repeat
                for j := 1 to UserSession.TerraneValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.TerraneValues.Strings[j-1] = dmgDV.cdsQdmTerraneDOMAINID.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmTerraneDOMAINID.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmTerrane.Next;
              until dmgDV.cdsQdmTerrane.EOF;
              dmgDV.cdsQdmTerrane.First;
            end;
            {grouped by large igneous province}
            if ((UserSession.GroupBy = gbLIP) and (UserSession.GroupValues.Count > 0)) then
            begin
              dmgDV.cdsQdmLIP.First;
              repeat
                for j := 1 to UserSession.LIPValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.LIPValues.Strings[j-1] = dmgDV.cdsQdmLIPLIPID.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmLIPLIPID.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmLIP.Next;
              until dmgDV.cdsQdmLIP.EOF;
              dmgDV.cdsQdmLIP.First;
            end;
            {grouped by orogenic period}
            if ((UserSession.GroupBy = gbOrogenicPeriod) and (UserSession.OrogenicPeriodValues.Count > 0)) then
            begin
              dmgDV.cdsQdmOrogenicPeriod.First;
              repeat
                for j := 1 to UserSession.OrogenicPeriodValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.OrogenicPeriodValues.Strings[j-1] = dmgDV.cdsQdmOrogenicPeriodOrogenicPeriodID.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmOrogenicPeriodOrogenicPeriodID.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmOrogenicPeriod.Next;
              until dmgDV.cdsQdmOrogenicPeriod.EOF;
              dmgDV.cdsQdmOrogenicPeriod.First;
            end;
            {grouped by chemical type}
            if ((UserSession.GroupBy = gbChemicalType) and (UserSession.ChemicalTypeValues.Count > 0)) then
            begin
              dmgDV.cdsQdmChemType.First;
              repeat
                for j := 1 to UserSession.ChemicalTypeValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.ChemicalTypeValues.Strings[j-1] = dmgDV.cdsQdmChemTypeChemTypeAbr.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmChemTypeChemTypeAbr.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmChemType.Next;
              until dmgDV.cdsQdmChemType.EOF;
              dmgDV.cdsQdmChemType.First;
            end;
            {grouped by boundary position}
            if ((UserSession.GroupBy = gbBoundaryPosition) and (UserSession.BoundaryPositionValues.Count > 0)) then
            begin
              dmgDV.cdsQdmBoundary.First;
              repeat
                for j := 1 to UserSession.BoundaryPositionValues.Count do
                begin
                  UserSession.LC := UserSession.LC + 1;
                  if (UserSession.BoundaryPositionValues.Strings[j-1] = dmgDV.cdsQdmBoundaryBoundPosID.AsString) then
                  begin
                    dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQdmBoundaryBoundPosID.AsString;
                    Break;
                  end else
                  begin
                  end;
                end;
                dmgDV.cdsQdmBoundary.Next;
              until dmgDV.cdsQdmBoundary.EOF;
              dmgDV.cdsQdmBoundary.First;
            end;
            dmgDV.cdsTempDataI.Post;
          except
          end;
        end;
      end;
      dmgDV.cdsQuerydm.Next;
    until dmgDV.cdsQuerydm.EOF;
    dmgDV.cdsQuerydm.First;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;

procedure TdmgDV.WtAverData2 ( NS                : integer;
                               var WtAver, MSWD,
                               WESDoM, WOSDoM : double;
                               var N              : integer);
var
  i            : integer;
  W            : double;
  tx, tx1      : double;
  Sum          : array[1..5] of double;
begin
  N:=0;
  Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
  if (NS > 1) then
  begin
    dmgDV.cdsTempDataDI.First;
    for i:=1 to NS do
    begin
      tx := dmgDV.cdsTempDataDIAge.AsFloat;
      tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
      N:=N+1;
      if (tx1 <> 0.0) then W:=1.0/(tx1*tx1)
                      else W:=1.0;
      Sum[1]:=Sum[1]+W;
      Sum[2]:=Sum[2]+W*tx;
      Sum[3]:=Sum[3]+W*tx*tx;
      dmgDV.cdsTempDataDI.Next;
    end;
    dmgDV.cdsTempDataDI.First;
    if (N > 1) then
    begin
      WtAver:=Sum[2]/Sum[1];
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[1] > 0) then WESDoM:=1.0/Sqrt(Sum[1])
                      else WESDoM:=-99.9;
      Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
      for i:=1 to NS do
      begin
        tx := dmgDV.cdsTempDataDIAge.AsFloat;
        tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
        W:=1.0/(tx1*tx1 + WESDoM*WESDoM);
        Sum[1]:=Sum[1]+W;
        Sum[2]:=Sum[2]+W*tx;
        Sum[3]:=Sum[3]+W*tx*tx;
        Sum[4]:=Sum[4]+W;
        Sum[5]:=Sum[5]+W*(tx-WtAver)*(tx-WtAver);
        dmgDV.cdsTempDataDI.Next;
      end;
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[4] > 0) then WOSDoM:=Sqrt((Sum[5]/Sum[4])/(1.0*(N-1)))
                      else WOSDoM:=-99.9;
    end
    else begin
      WESDoM:=0.0;
      WOSDoM:=0.0;
      WtAver:=0.0;
      MSWD:=0.0;
      if (N = 1) then
      begin
        dmgDV.cdsTempDataDI.First;
        tx := dmgDV.cdsTempDataDIAge.AsFloat;
        tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
        WtAver := tx;
        WOSDoM := 0.0;
        WESDom := tx1;
        MSWD := 0.0;
      end;
    end;
    {include Troutman option for MSWD > F}
  end else
  begin
    if (NS = 1) then
    begin
      dmgDV.cdsTempDataDI.First;
      tx := dmgDV.cdsTempDataDIAge.AsFloat;
      tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
      WtAver := tx;
      WOSDoM := 0.0;
      WESDom := tx1;
      MSWD := 0.0;
      N := 1;
    end;
  end;
  dmgDV.cdsTempDataDI.First;
end;


procedure TdmgDV.AllocateDataByInterpretation2;
var
  tplus, tminus : double;
  GraphCategoryNum : integer;
  i, nRec : integer;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  UserSession.LC := 0;
  QueryUse := 2;
  {Allocate data}
  dmgDV.cdsTempDataDI.Filtered := false;
  dmgDV.cdsTempDataDI.First;
  if (UserSession.DataHaveChanged) then
  begin
    UserSession.StartAtX := SpectrumStartAge;
    UserSession.EndAtX := SpectrumEndAge;
    if (dmgDV.cdsTempDataDI.RecordCount > 0) then
    begin
      dmgDV.cdsTempDataDI.EmptyDataSet;
    end;
  end;
  with dmgDV do
  begin
    QuerydmDI.Close;
    QuerydmDI.SQL.Clear;
    QuerydmDI.SQL.Add('SELECT DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.RECORDID,ISORGR30.UNITID,SUITE.UNITNAME,');
    QuerydmDI.SQL.Add('   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,USEROPTS.OPTIONID,');
    QuerydmDI.SQL.Add('   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR');

    if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
    begin
      QuerydmDI.SQL.Add('FROM ISORGR30,COUNTRY,');
      QuerydmDI.SQL.Add('     SUITE,USERSWHOFOR,ISOFOR,USEROPTS,USEROPTINTERP');
    end;
    if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
    begin
      dmgDV.QuerydmDI.SQL.Add('FROM ISORGR30');
    end;
    if UserSession.IsDeveloper then
    begin
        //dmUser.SetDeveloperData('SubmitQuerydmDIa '+dmgDV.QuerydmDI.SQL.Text);
    end;

    //QuerydmDI.SQL.Add('FROM ISORGR30,COUNTRY,');
    //QuerydmDI.SQL.Add('     SUITE,USERSWHOFOR,ISOFOR,USEROPTS,USEROPTINTERP');
    tmpStringList := TStringList.Create;
    try
      if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      if UserSession.IncludeUserOrgID then
      begin
        if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
      end;
      //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      i := tmpStringList.Count;
      for i := 0 to tmpStringList.Count - 1 do
      begin
        QuerydmDI.SQL.Add(tmpStringList.Strings[i]);
      end;
    finally
      FreeAndNil(tmpStringList);
    end;
    QuerydmDI.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
    QuerydmDI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
    QuerydmDI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
    QuerydmDI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
    QuerydmDI.SQL.Add('AND USEROPTINTERP.INTERPABR=ISORGR30.INTERPABR');
    QuerydmDI.SQL.Add('ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME');
    QuerydmDI.ParamByName('USERID').AsString := UserSession.UserID;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('AllocateDataByInterpretation2 '+dmgDV.QuerydmDI.SQL.Text);
    end;
    cdsQuerydmDI.Close;
    cdsQuerydmDI.Open;
  end;
  try
    if UserSession.DataHaveChanged then
    begin
      dmgDV.cdsQuerydmDI.First;
      repeat
        if (UserSession.StartAtX > dmgDV.cdsQuerydmDIRAge.AsFloat-dmgDV.cdsQuerydmDIRAgeMError.AsFloat) then UserSession.StartAtX := dmgDV.cdsQuerydmDIRAge.AsFloat-dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsQuerydmDIRAge.AsFloat+dmgDV.cdsQuerydmDIRAgePError.AsFloat) then UserSession.EndAtX := dmgDV.cdsQuerydmDIRAge.AsFloat+dmgDV.cdsQuerydmDIRAgePError.AsFloat;
        try
          dmgDV.cdsTempDataDI.Append;
          dmgDV.cdsTempDataDIInterpretation.AsString := dmgDV.cdsQuerydmDIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataDISuitName.AsString := dmgDV.cdsQuerydmDIUnitName.AsString;
          dmgDV.cdsTempDataDIInterpAbr.AsString := dmgDV.cdsQuerydmDIInterpAbr.AsString;
          dmgDV.cdsTempDataDIGrouping.AsString := dmgDV.cdsQuerydmDIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataDIColumnNo.AsInteger := dmgDV.cdsQuerydmDIOPTIONID.AsInteger;
          dmgDV.cdsTempDataDIAge.AsFloat := dmgDV.cdsQuerydmDIRAge.AsFloat;
          dmgDV.cdsTempDataDIAgePlusError.AsFloat := dmgDV.cdsQuerydmDIRAgePError.AsFloat;
          dmgDV.cdsTempDataDIAgeMinusError.AsFloat := dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
          tPlus := 50.05;
          tMinus := 50.05;
          if (dmgDV.cdsQuerydmDIRAgePError.AsString <> '') then tPlus := dmgDV.cdsQuerydmDIRAgePError.AsFloat;
          if (dmgDV.cdsQuerydmDIRAgeMError.AsString <> '') then tMinus := dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
          dmgDV.cdsTempDataDIAgeErrorAv.AsFloat := (Abs(tPlus) + Abs(tMinus))/(2.0*1.96);
          dmgDV.cdsTempDataDI.Post;
        except
        end;
        dmgDV.cdsQuerydmDI.Next;
      until dmgDV.cdsQuerydmDI.EOF;
    end;
    {
    UserSession.NumberOfPoints := dmgDV.cdsQuerydmDI.RecordCount;
    }
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('AllocateDataByInterpretation2 completed');
    end;
  finally
    dmgDV.cdsQuerydmDI.Close;
  end;
  UserSession.PDFHasChanged := true;
end;

procedure TdmgDV.AllocateDataGroupedByInterpretation2;
var
  i, j : integer;
  tplus, tminus : double;
  tSuitName, tInterpAbr, tInterpretation : string;
  tAge, tAgePlusError, tAgeMinusError, tAgeErrorAv : double;
  tColumnNo : integer;
  Done : boolean;
  GraphCategoryNum : integer;
  nRec : integer;
  tmpPath : string;
  tmpFileName : string;
  tempStr : string;
  tmp : double;
  iCode, itmp : integer;
  tmpStringList : TStringList;
  QueryUse : integer;
  tMax, tMin : double;
begin
  tMax := -9.99e9;
  tMin :=  9.99e9;
  UserSession.LC := 0;
  QueryUse := 2;
  {Allocate data}
  if (UserSession.DataHaveChanged) then
  begin
    if ((UserSession.EndAtX <= UserSession.StartAtX) or (UserSession.EndAtX < 0.0)) then
    begin
      UserSession.StartAtX := SpectrumStartAge;
      UserSession.EndAtX := SpectrumEndAge;
    end;
    if (dmgDV.cdsTempDataDG.RecordCount > 0) then
    begin
      dmgDV.cdsTempDataDG.EmptyDataSet;
    end;
  end;
  dmgDV.cdsTempDataDG.Filtered := false;
  dmgDV.cdsTempDataDG.First;
  with dmgDV do
  begin
    QuerydmDG.Close;
    QuerydmDG.SQL.Clear;
    QuerydmDG.SQL.Add('SELECT DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.RAGE,ISORGR30.RECORDID,ISORGR30.UNITID,SUITE.UNITNAME,');
    QuerydmDG.SQL.Add('   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGNUMBER,');
    QuerydmDG.SQL.Add('   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR');

    if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
    begin
      QuerydmDG.SQL.Add('FROM USEROPTGROUPING,USERSWHOFOR,ISOFOR,ISORGR30,SUITE,COUNTRY');
    end;
    if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
    begin
      dmgDV.QuerydmDG.SQL.Add('FROM ISORGR30');
    end;
    if UserSession.IsDeveloper then
    begin
        //dmUser.SetDeveloperData('SubmitQuerydmDGa '+dmgDV.QuerydmDG.SQL.Text);
    end;


    //QuerydmDG.SQL.Add('FROM USEROPTGROUPING,USERSWHOFOR,ISOFOR,ISORGR30,SUITE,COUNTRY');
    tmpStringList := TStringList.Create;
    try
      if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      if UserSession.IncludeUserOrgID then
      begin
        if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
      end;
      //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      i := tmpStringList.Count;
      for i := 0 to tmpStringList.Count - 1 do
      begin
        QuerydmDG.SQL.Add(tmpStringList.Strings[i]);
      end;
    finally
      FreeAndNil(tmpStringList);
    end;
    QuerydmDG.SQL.Add('AND USERSWHOFOR.USERID = USEROPTGROUPING.USERID');
    if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
    begin
      QuerydmDG.SQL.Add('AND ISOPROVTERR.DOMAINID = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbLIP) then
    begin
      QuerydmDG.SQL.Add('AND ISOLIP.LIPID = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbGrouping) then
    begin
      QuerydmDG.SQL.Add('AND GROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbOrogenicPeriod) then
    begin
      QuerydmDG.SQL.Add('AND ISOOROGENIC.OROGENICPERIODID = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbChemicalType) then
    begin
      QuerydmDG.SQL.Add('AND ISOCHEMTYPE.CHEMTYPEABR = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbBoundaryPosition) then
    begin
      QuerydmDG.SQL.Add('AND ISOBOUNDARY.BOUNDPOSID = USEROPTGROUPING.GROUPINGLINK');
    end;
    QuerydmDG.SQL.Add('ORDER BY USEROPTGROUPING.GROUPINGLINK, ISORGR30.RAGE, SUITE.UNITNAME');
    QuerydmDG.SQL.Add(' ');
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmgDV.QuerydmDG.SQL.Text);
    end;
    QuerydmDG.ParamByName('USERID').AsString := UserSession.UserID;
    cdsQuerydmDG.Close;
    cdsQuerydmDG.Open;
  end;
  UserSession.NumRecordsFound := dmgDV.cdsQuerydmDG.RecordCount;
  try
    if UserSession.DataHaveChanged then
    begin
      dmgDV.cdsQuerydmDG.First;
      repeat
        //if (UserSession.StartAtX > dmgDV.cdsQuerydmDGRAge.AsFloat-dmgDV.cdsQuerydmDGRAgeMError.AsFloat) then UserSession.StartAtX := dmgDV.cdsQuerydmDGRAge.AsFloat-dmgDV.cdsQuerydmDGRAgeMError.AsFloat;
        //if (UserSession.EndAtX < dmgDV.cdsQuerydmDGRAge.AsFloat+dmgDV.cdsQuerydmDGRAgePError.AsFloat) then UserSession.EndAtX := dmgDV.cdsQuerydmDGRAge.AsFloat+dmgDV.cdsQuerydmDGRAgePError.AsFloat;
        if (tMin > dmgDV.cdsQuerydmDGRAge.AsFloat-dmgDV.cdsQuerydmDGRAgeMError.AsFloat) then tMin := dmgDV.cdsQuerydmDGRAge.AsFloat-dmgDV.cdsQuerydmDGRAgeMError.AsFloat;
        if (tMax < dmgDV.cdsQuerydmDGRAge.AsFloat+dmgDV.cdsQuerydmDGRAgePError.AsFloat) then tMax := dmgDV.cdsQuerydmDGRAge.AsFloat+dmgDV.cdsQuerydmDGRAgePError.AsFloat;
        try
          dmgDV.cdsTempDataDG.Append;
          dmgDV.cdsTempDataDGGrouping.AsString := dmgDV.cdsQuerydmDGGROUPINGLINK.AsString;
          dmgDV.cdsTempDataDGSuitName.AsString := dmgDV.cdsQuerydmDGUnitName.AsString;
          dmgDV.cdsTempDataDGInterpAbr.AsString := dmgDV.cdsQuerydmDGInterpAbr.AsString;
          dmgDV.cdsTempDataDGColumnNo.AsInteger := dmgDV.cdsQuerydmDGGROUPINGNUMBER.AsInteger;
          dmgDV.cdsTempDataDGAge.AsFloat := dmgDV.cdsQuerydmDGRAge.AsFloat;
          dmgDV.cdsTempDataDGAgePlusError.AsFloat := dmgDV.cdsQuerydmDGRAgePError.AsFloat;
          dmgDV.cdsTempDataDGAgeMinusError.AsFloat := dmgDV.cdsQuerydmDGRAgeMError.AsFloat;
          tPlus := 50.05;
          tMinus := 50.05;
          if (dmgDV.cdsQuerydmDGRAgePError.AsString <> '') then tPlus := dmgDV.cdsQuerydmDGRAgePError.AsFloat;
          if (dmgDV.cdsQuerydmDGRAgeMError.AsString <> '') then tMinus := dmgDV.cdsQuerydmDGRAgeMError.AsFloat;
          dmgDV.cdsTempDataDGAgeErrorAv.AsFloat := (Abs(tPlus) + Abs(tMinus))/(2.0*1.96);
          dmgDV.cdsTempDataDG.Post;
        except
        end;
        dmgDV.cdsQuerydmDG.Next;
      until dmgDV.cdsQuerydmDG.EOF;
      UserSession.FromAge := tMin;
      UserSession.ToAge := tMax;
    end;
  finally
    dmgDV.cdsQuerydmDG.Close;
  end;
  UserSession.PDFHasChanged := true;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('AllocateDataGroupedByInterpretation2 completed');
  end;
end;

procedure TdmgDV.AllocateInitialAndModelRatios2;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  nRec, i : integer;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  temp := 0.0;
  temp1 := 0.0;
  VarbNo11 := 1;
  VarbNo12 := 1;
  try
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    if UserSession.DataHaveChanged then
    begin
      UserSession.StartAtX := SpectrumStartAge;
      UserSession.EndAtX := SpectrumEndAge;
      UserSession.StartAtY := SpectrumStartAge;
      UserSession.EndAtY := -1.0*SpectrumEndAge;
      if (dmgDV.cdsTempDataI.RecordCount > 0) then
      begin
        dmgDV.cdsTempDataI.EmptyDataSet;
      end;
    end;
    with dmgDV do
    begin
      QuerydmI.Close;
      QuerydmI.SQL.Clear;
      QuerydmI.SQL.Add('select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.RECORDID,ISORGR30.UNITID,SUITE.UNITNAME,');
      QuerydmI.SQL.Add('   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,USEROPTS.OPTIONID,');
      QuerydmI.SQL.Add('   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, ISOINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmI.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp');
        if not UserSession.IncludeEpsilonFromValue and not UserSession.IncludeEpsilonToValue then
        begin
          QuerydmI.SQL.Add('    ,ISOINIT ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmI.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmIa '+dmgDV.QuerydmI.SQL.Text);
      end;
      //QuerydmI.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmI.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      {
      QuerydmI.SQL.Text := dmDV.Query1.SQL.Text;
      QuerydmI.SQL.Strings[0] := 'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNITID,SUITE.UNITNAME,';
      QuerydmI.SQL.Strings[1] := '   ISORGR30.INTERPABR,USEROPTS.OPTIONID,';
      QuerydmI.SQL.Strings[2] := '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, ISOINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D';
      QuerydmI.SQL.Strings[3] := '   ';
      QuerydmI.SQL.Strings[4] := '   ';
      QuerydmI.SQL.Strings[5] := '   ';
      QuerydmI.SQL.Strings[6] := '   ';
      QuerydmI.SQL.Strings[7] := '   ';
      tmpStr := '      Technique, IsoSystem,Suite,UsersWhoFor,IsoFor,SourceA,SourceList,UserOpts,UserOptInterp';
      if (UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue) then
      begin
      end else
      begin
        tmpStr := tmpStr + ',IsoInit';
      end;
      QuerydmI.SQL.Strings[9] := tmpStr;
      }
      QuerydmI.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmI.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      QuerydmI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmI.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      QuerydmI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
      QuerydmI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
      QuerydmI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmI.SQL.Add('AND USEROPTINTERP.INTERPABR = ISORGR30.INTERPABR');
      if not UserSession.IncludeEpsilonFromValue and not UserSession.IncludeEpsilonToValue then
      begin
        QuerydmI.SQL.Add('AND ISOINIT.RECORDID = ISORGR30.RECORDID');
      end;
      QuerydmI.SQL.Add('ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME');
      QuerydmI.SQL.Add(' ');
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmgDV.QuerydmI.SQL.Text);
      end;
      QuerydmI.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydmI.Close;
      cdsQuerydmI.Open;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydmI.First;
    try
      repeat
        try
          dmgDV.cdsTempDataI.Append;
          dmgDV.cdsTempDataIInterpretation.AsString := dmgDV.cdsQuerydmIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
          dmgDV.cdsTempDataIColumnNo.AsInteger := dmgDV.cdsQuerydmIOPTIONID.AsInteger;
          dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQuerydmIINTERPABR.AsString;
          case VarbNo11 of
            111 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            112 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            113 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            114 : temp := dmgDV.cdsQuerydmIINITRATIO.AsFloat;
            115 : temp := dmgDV.cdsQuerydmIEPSILON.AsFloat;
            116 : temp := dmgDV.cdsQuerydmIMU.AsFloat;
          end;
          case VarbNo12 of
            121 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            122 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            123 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            124 : temp1 := dmgDV.cdsQuerydmIINITRATIO.AsFloat;
            125 : temp1 := dmgDV.cdsQuerydmIEPSILON.AsFloat;
            126 : temp1 := dmgDV.cdsQuerydmIMU.AsFloat;
          end;
          dmgDV.cdsTempDataIVariableX.AsFloat := temp;
          dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
          dmgDV.cdsTempDataI.Post;
        except
        end;
        if (UserSession.StartAtX > dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.StartAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.EndAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.StartAtY > dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.StartAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        if (UserSession.EndAtY < dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.EndAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        dmgDV.cdsQuerydmI.Next;
      until dmgDV.cdsQuerydmI.EOF;
    except
    end;
  finally
    dmgDV.cdsQuerydmI.Close;
  end;
end;

procedure TdmgDV.AllocateInitialAndModelRatiosGrouped2;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  nRec, i : integer;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  temp := 0.0;
  temp1 := 0.0;
  VarbNo11 := 1;
  VarbNo12 := 1;
  try
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    if UserSession.DataHaveChanged then
    begin
      UserSession.StartAtX := SpectrumStartAge;
      UserSession.EndAtX := SpectrumEndAge;
      UserSession.StartAtY := SpectrumStartAge;
      UserSession.EndAtY := -1.0*SpectrumEndAge;
      if (dmgDV.cdsTempDataI.RecordCount > 0) then
      begin
        dmgDV.cdsTempDataI.EmptyDataSet;
      end;
    end;
    with dmgDV do
    begin
      QuerydmIG.Close;
      QuerydmIG.SQL.Clear;
      QuerydmIG.SQL.Add('select DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.RAGE,ISORGR30.RECORDID,ISORGR30.UNITID,SUITE.UNITNAME,');
      QuerydmIG.SQL.Add('   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGNUMBER,');
      QuerydmIG.SQL.Add('   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, ISOINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmIG.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmIG.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptGrouping');
        if not UserSession.IncludeEpsilonFromValue and not UserSession.IncludeEpsilonToValue then
        begin
          QuerydmIG.SQL.Add('    ,ISOINIT ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmIG.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmIGa '+dmgDV.QuerydmIG.SQL.Text);
      end;
      //QuerydmIG.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmIG.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptGrouping');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmIG.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      {
      QuerydmIG.SQL.Text := dmDV.Query1.SQL.Text;
      QuerydmIG.SQL.Strings[0] := 'select DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.RAGE,ISORGR30.UNITID,SUITE.UNITNAME,';
      QuerydmIG.SQL.Strings[1] := '   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGNUMBER,';
      QuerydmIG.SQL.Strings[2] := '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, ISOINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D';
      QuerydmIG.SQL.Strings[3] := '   ';
      QuerydmIG.SQL.Strings[4] := '   ';
      QuerydmIG.SQL.Strings[5] := '   ';
      QuerydmIG.SQL.Strings[6] := '   ';
      QuerydmIG.SQL.Strings[7] := '   ';
      tmpStr := '      Technique, IsoSystem,Suite,UsersWhoFor,IsoFor,SourceA,SourceList,UserOpts,UserOptGrouping';
      if (UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue) then
      begin
      end else
      begin
        tmpStr := tmpStr + ',ISOINIT';
      end;
      if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
      begin
        tmpStr := tmpStr + ',DOMAINS,ISOPROVTERR';
      end;
      QuerydmIG.SQL.Strings[9] := tmpStr;
      }
      QuerydmIG.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmIG.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      QuerydmIG.SQL.Add('AND USEROPTS.USERID = USEROPTGROUPING.USERID');
      QuerydmIG.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      if not UserSession.IncludeEpsilonFromValue and not UserSession.IncludeEpsilonToValue then
      begin
        QuerydmIG.SQL.Add('AND ISOINIT.RECORDID = ISORGR30.RECORDID');
      end;
      if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
      begin
        QuerydmIG.SQL.Add('AND ISOPROVTERR.DOMAINID = USEROPTGROUPING.GROUPINGLINK');
      end;
      if (UserSession.GroupBy = gbGrouping) then
        QuerydmIG.SQL.Add('AND GROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbOrogenicPeriod) then
        QuerydmIG.SQL.Add('AND ISOOROGENIC.OROGENICPERIODID = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbChemicalType) then
        QuerydmIG.SQL.Add('AND ISOCHEMTYPE.CHEMTYPEABR = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbBoundaryPosition) then
        QuerydmIG.SQL.Add('AND ISOBOUNDARY.BOUNDPOSID = USEROPTGROUPING.GROUPINGLINK');
      QuerydmIG.SQL.Add('ORDER BY USEROPTGROUPING.GROUPINGLINK, ISORGR30.RAGE, SUITE.UNITNAME');
      QuerydmIG.SQL.Add(' ');
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmgDV.QuerydmIG.SQL.Text);
      end;
      QuerydmIG.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydmIG.Close;
      cdsQuerydmIG.Open;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydmIG.First;
    try
      repeat
        try
          dmgDV.cdsTempDataI.Append;
          dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQuerydmIGGROUPINGLINK.AsString;
          dmgDV.cdsTempDataIInterpretation.AsString := dmgDV.cdsQuerydmIGINTERPABR.AsString;
          dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
          dmgDV.cdsTempDataIColumnNo.AsInteger := dmgDV.cdsQuerydmIGGROUPINGNUMBER.AsInteger;
          case VarbNo11 of
            111 : temp := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            112 : temp := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            113 : temp := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            114 : temp := dmgDV.cdsQuerydmIGINITRATIO.AsFloat;
            115 : temp := dmgDV.cdsQuerydmIGEPSILON.AsFloat;
            116 : temp := dmgDV.cdsQuerydmIGMU.AsFloat;
          end;
          case VarbNo12 of
            121 : temp1 := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            122 : temp1 := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            123 : temp1 := dmgDV.cdsQuerydmIGRAGE.AsFloat;
            124 : temp1 := dmgDV.cdsQuerydmIGINITRATIO.AsFloat;
            125 : temp1 := dmgDV.cdsQuerydmIGEPSILON.AsFloat;
            126 : temp1 := dmgDV.cdsQuerydmIGMU.AsFloat;
          end;
          dmgDV.cdsTempDataIVariableX.AsFloat := temp;
          dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
          dmgDV.cdsTempDataI.Post;
        except
        end;
        if (UserSession.StartAtX > dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.StartAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.EndAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.StartAtY > dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.StartAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        if (UserSession.EndAtY < dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.EndAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        dmgDV.cdsQuerydmIG.Next;
      until dmgDV.cdsQuerydmIG.EOF;
    except
    end;
  finally
    dmgDV.cdsQuerydmIG.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataInterp2;
var
  Minimum1, Maximum1,
  Minimum2, Maximum2,
  Minimum3, Maximum3,
  Minimum4, Maximum4,
  Minimum5, Maximum5 : double;
  GraphCategoryNum : integer;
  SampleLocalityAlreadyShown : boolean;
  i, nRec : integer;
  tempStr : string;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  try
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    with dmgDV do
    begin
      QuerydmMI.Close;
      QuerydmMI.SQL.Clear;
      QuerydmMI.SQL.Add('SELECT DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,USEROPTS.OPTIONTITLE,ISORGR30.INTERPABR,');
      QuerydmMI.SQL.Add('   SMPLOC.LATITUDE,SMPLOC.LONGITUDE,');
      QuerydmMI.SQL.Add('   ISORGR30.RAGE,ISORGR30.RECORDID');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmMI.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmMI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp');
        if not UserSession.IncludeCoordinates then    //need this for situations where coordinates were not part of original query
        begin
          QuerydmMI.SQL.Add('    ,SMPREG,SMPLOC ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmMI.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmMIa '+dmgDV.QuerydmMI.SQL.Text);
      end;
      //QuerydmMI.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmMI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmMI.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      QuerydmMI.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmMI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmMI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
      QuerydmMI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
      QuerydmMI.SQL.Add('AND USEROPTINTERP.INTERPABR = ISORGR30.INTERPABR');
      if not UserSession.IncludeCoordinates then         //need this for situations where coordinates were not part of original query
      begin
        tempStr := 'AND SMPREG.RECORDID = ISORGR30.RECORDID';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
        QuerydmMI.SQL.Add(tempStr);
      end;
      QuerydmMI.SQL.Add('ORDER BY USEROPTS.OPTIONID, SMPLOC.SAMPLENO');
      QuerydmMI.SQL.Add(' ');
      //dmUser.SetDeveloperData('AllocateMapDataInterp2 ' + QuerydmMI.SQL.Text);
      QuerydmMI.ParamByName('USERID').AsString := UserSession.UserID;

      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmgDV.QuerydmMI.SQL.Text);
      end;

      cdsQuerydmMI.Close;
      cdsQuerydmMI.Open;
    end;
    if (dmgDV.cdsQuerydmMI.RecordCount >= 1) then
    begin
      UserSession.LatitudeMin := 90.0;
      UserSession.LatitudeMax := -90.0;
      UserSession.LongitudeMin := 180.0;
      UserSession.LongitudeMax := -180.0;
      dmgDV.cdsTempDataMap.EmptyDataSet;
    end;
    //dmUser.SetDeveloperData('dmgDV.QuerydmMI RecordCount = '+IntToStr(dmgDV.cdsQuerydmMI.RecordCount));
    dmgDV.cdsQuerydmMI.First;
    try
      dmgDV.cdsTempDataMap.DisableControls;
      repeat
        try
          dmgDV.cdsTempDataMap.Append;
          dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsQuerydmMISampleNo.AsString;
          dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsQuerydmMILatitude.AsFloat;
          dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsQuerydmMILongitude.AsFloat;
          dmgDV.cdsTempDataMapElevation.AsFloat := 0.0;
          dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMIRAge.AsFloat;
          dmgDV.cdsTempDataMapColumnNo.AsInteger := dmgDV.cdsQuerydmMIOPTIONID.AsInteger;
          dmgDV.cdsTempDataMapColumnNoDate.AsInteger := 0;
          dmgDV.cdsTempDataMapInterpretation.AsString := dmgDV.cdsQuerydmMIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmMIInterpAbr.AsString;
          dmgDV.cdsTempDataMapAgeBand.AsString := 'nihil';
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmMIRECORDID.AsInteger;
          dmgDV.cdsTempDataMap.Post;
        except
        end;
        if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
        if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
        dmgDV.cdsQuerydmMI.Next;
      until dmgDV.cdsQuerydmMI.EOF;
      dmgDV.cdsTempDataMap.EnableControls;
    except
    end;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataBand2;
var
  Minimum1, Maximum1,
  Minimum2, Maximum2,
  Minimum3, Maximum3,
  Minimum4, Maximum4,
  Minimum5, Maximum5 : double;
  GraphCategoryNum : integer;
  SampleLocalityAlreadyShown : boolean;
  i, nRec : integer;
  tempStr : string;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  try
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    with dmgDV do
    begin
      QuerydmMI.Close;
      QuerydmMI.SQL.Clear;
      QuerydmMI.SQL.Add('SELECT DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,USEROPTS.OPTIONTITLE,ISORGR30.INTERPABR,');
      QuerydmMI.SQL.Add('   SMPLOC.LATITUDE,SMPLOC.LONGITUDE,');
      QuerydmMI.SQL.Add('   ISORGR30.RAGE,ISORGR30.RECORDID');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmMI.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmMI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptDates');
        if not UserSession.IncludeCoordinates then    //need this for situations where coordinates were not part of original query
        begin
          QuerydmMI.SQL.Add('    ,SMPREG,SMPLOC ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmMI.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmMIa '+dmgDV.QuerydmMI.SQL.Text);
      end;
      //QuerydmMI.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmMI.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptDates');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmMI.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      QuerydmMI.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmMI.SQL.Add('AND USEROPTS.USERID = USEROPTDATES.USERID');
      QuerydmMI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTDATES.OPTIONID');
      QuerydmMI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'D'+'''');
      QuerydmMI.SQL.Add('AND ISORGR30.RAGE >= USEROPTDATES.DATEMIN');
      QuerydmMI.SQL.Add('AND ISORGR30.RAGE < USEROPTDATES.DATEMAX');
      if not UserSession.IncludeCoordinates then         //need this for situations where coordinates were not part of original query
      begin
        tempStr := 'AND SMPREG.RECORDID = ISORGR30.RECORDID';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
        QuerydmMI.SQL.Add(tempStr);
        tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
        QuerydmMI.SQL.Add(tempStr);
      end;
      QuerydmMI.SQL.Add('ORDER BY USEROPTS.OPTIONID, SMPLOC.SAMPLENO');
      QuerydmMI.SQL.Add(' ');
      //dmUser.SetDeveloperData('AllocateMapDataBand2 ' + QuerydmMI.SQL.Text);
      QuerydmMI.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydmMI.Close;
      cdsQuerydmMI.Open;
    end;
    if (dmgDV.cdsQuerydmMI.RecordCount >= 1) then
    begin
      UserSession.LatitudeMin := 90.0;
      UserSession.LatitudeMax := -90.0;
      UserSession.LongitudeMin := 180.0;
      UserSession.LongitudeMax := -180.0;
      dmgDV.cdsTempDataMap.EmptyDataSet;
    end;
    dmgDV.cdsQuerydmMI.First;
    try
      dmgDV.cdsTempDataMap.DisableControls;
      repeat
        try
          dmgDV.cdsTempDataMap.Append;
          dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsQuerydmMISampleNo.AsString;
          dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsQuerydmMILatitude.AsFloat;
          dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsQuerydmMILongitude.AsFloat;
          dmgDV.cdsTempDataMapElevation.AsFloat := 0.0;
          dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMIRAge.AsFloat;
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 0;
          dmgDV.cdsTempDataMapColumnNoDate.AsInteger := dmgDV.cdsQuerydmMIOptionID.AsInteger;
          dmgDV.cdsTempDataMapInterpretation.AsString := 'nihil';
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmMIInterpAbr.AsString;
          dmgDV.cdsTempDataMapAgeBand.AsString := dmgDV.cdsQuerydmMIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmMIRECORDID.AsInteger;
          dmgDV.cdsTempDataMap.Post;
        except
        end;
        if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
        if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
        dmgDV.cdsQuerydmMI.Next;
      until dmgDV.cdsQuerydmMI.EOF;
      dmgDV.cdsTempDataMap.EnableControls;
    except
    end;
    dmgDV.cdsQuerydmMI.First;
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
  finally
    dmgDV.cdsQuerydmMI.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataInitial2(tOptionTypeID : string);
var
  Minimum1, Maximum1,
  Minimum2, Maximum2,
  Minimum3, Maximum3,
  Minimum4, Maximum4,
  Minimum5, Maximum5 : double;
  GraphCategoryNum : integer;
  SampleLocalityAlreadyShown : boolean;
  i, nRec : integer;
  tempStr : string;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  try
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    with dmgDV do
    begin
      QuerydmME.Close;
      QuerydmME.SQL.Clear;
      QuerydmME.SQL.Add('select DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,USEROPTS.OPTIONTITLE,ISORGR30.INTERPABR,');
      QuerydmME.SQL.Add('   SMPLOC.LATITUDE,SMPLOC.LONGITUDE,SMPLOC.ELEVATION,');
      QuerydmME.SQL.Add('   ISORGR30.RAGE,ISORGR30.RECORDID,ISOINIT.INITRATIO,ISOINIT.EPSILON,ISOINIT.MU,ISOINIT.INITIALRATIO3D,');
      QuerydmME.SQL.Add('   ISOINIT.INITRATIOERROR,ISOINIT.EPSILONERROR,ISOINIT.MUPERROR,ISOINIT.MUMERROR,ISOINIT.INITIALRATIO3DERROR');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmME.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmME.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,USEROPTS,USEROPTINITIAL,ISOINIT');
        if not UserSession.IncludeCoordinates then    //need this for situations where coordinates were not part of original query
        begin
          QuerydmME.SQL.Add('    ,SMPREG,SMPLOC ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmME.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmMEa '+dmgDV.QuerydmME.SQL.Text);
      end;
      //QuerydmME.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmME.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,USEROPTS,USEROPTINITIAL,ISOINIT');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmME.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      QuerydmME.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmME.SQL.Add('AND USEROPTS.USERID = USEROPTINITIAL.USERID');
      QuerydmME.SQL.Add('AND USEROPTS.OPTIONTYPEID = USEROPTINITIAL.OPTIONTYPEID');
      QuerydmME.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINITIAL.OPTIONID');
      QuerydmME.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+tOptionTypeID+'''');
      if (tOptionTypeID = '0') then
      begin
        QuerydmME.SQL.Add('AND ISOINIT.INITRATIO >= USEROPTINITIAL.VALUEMIN');
        QuerydmME.SQL.Add('AND ISOINIT.INITRATIO < USEROPTINITIAL.VALUEMAX');
      end;
      if (tOptionTypeID = 'E') then
      begin
        QuerydmME.SQL.Add('AND ISOINIT.EPSILON >= USEROPTINITIAL.VALUEMIN');
        QuerydmME.SQL.Add('AND ISOINIT.EPSILON < USEROPTINITIAL.VALUEMAX');
      end;
      if (tOptionTypeID = 'M') then
      begin
        QuerydmME.SQL.Add('AND ISOINIT.MU >= USEROPTINITIAL.VALUEMIN');
        QuerydmME.SQL.Add('AND ISOINIT.MU < USEROPTINITIAL.VALUEMAX');
      end;
      QuerydmME.SQL.Add('AND ISOINIT.RECORDID = ISORGR30.RECORDID');
      if not UserSession.IncludeCoordinates then         //need this for situations where coordinates were not part of original query
      begin
        tempStr := 'AND SMPREG.RECORDID = ISORGR30.RECORDID';
        QuerydmME.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO';
        QuerydmME.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
        QuerydmME.SQL.Add(tempStr);
        tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
        QuerydmME.SQL.Add(tempStr);
      end;
      QuerydmME.SQL.Add('ORDER BY USEROPTS.OPTIONID, SMPLOC.SAMPLENO');
      QuerydmME.SQL.Add(' ');
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmgDV.QuerydmME.SQL.Text);
      end;
      QuerydmME.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydmME.Close;
      cdsQuerydmME.Open;
    end;
    if (dmgDV.cdsQuerydmME.RecordCount >= 1) then
    begin
      UserSession.LatitudeMin := 90.0;
      UserSession.LatitudeMax := -90.0;
      UserSession.LongitudeMin := 180.0;
      UserSession.LongitudeMax := -180.0;
      dmgDV.cdsTempDataMap.EmptyDataSet;
    end;
    dmgDV.cdsQuerydmME.First;
    try
      dmgDV.cdsTempDataMap.DisableControls;
      repeat
        try
          dmgDV.cdsTempDataMap.Append;
          dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsQuerydmMESampleNo.AsString;
          dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsQuerydmMELatitude.AsFloat;
          dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsQuerydmMELongitude.AsFloat;
          dmgDV.cdsTempDataMapElevation.AsFloat := dmgDV.cdsQuerydmMEELEVATION.AsFloat;
          if (tOptionTypeID = '0') then
          begin
            dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMEINITRATIO.AsFloat;
            dmgDV.cdsTempDataMapAgePlus.AsFloat := dmgDV.cdsQuerydmMEINITRATIOERROR.AsFloat;
            dmgDV.cdsTempDataMapAgeMinus.AsFloat := dmgDV.cdsQuerydmMEINITRATIOERROR.AsFloat;
          end;
          if (tOptionTypeID = 'E') then
          begin
            dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMEEPSILON.AsFloat;
            dmgDV.cdsTempDataMapAgePlus.AsFloat := dmgDV.cdsQuerydmMEEPSILONERROR.AsFloat;
            dmgDV.cdsTempDataMapAgeMinus.AsFloat := dmgDV.cdsQuerydmMEEPSILONERROR.AsFloat;
          end;
          if (tOptionTypeID = 'M') then
          begin
            dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMEMU.AsFloat;
            dmgDV.cdsTempDataMapAgePlus.AsFloat := dmgDV.cdsQuerydmMEMUPERROR.AsFloat;
            dmgDV.cdsTempDataMapAgeMinus.AsFloat := dmgDV.cdsQuerydmMEMUMERROR.AsFloat;
          end;
          dmgDV.cdsTempDataMapColumnNo.AsInteger := dmgDV.cdsQuerydmMEOPTIONID.AsInteger;
          dmgDV.cdsTempDataMapColumnNoDate.AsInteger := 0;
          dmgDV.cdsTempDataMapInterpretation.AsString := dmgDV.cdsQuerydmMEINTERPABR.AsString;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmMEInterpAbr.AsString;
          dmgDV.cdsTempDataMapAgeBand.AsString := dmgDV.cdsQuerydmMEOPTIONTITLE.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsQuerydmMERECORDID.AsInteger;
          dmgDV.cdsTempDataMap.Post;
        except
        end;
        if (dmgDV.cdsTempDataMapLatitude.AsFloat < 90.0) then
        begin
          if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
          if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
          if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
          if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
        end;
        dmgDV.cdsQuerydmME.Next;
      until dmgDV.cdsQuerydmME.EOF;
      dmgDV.cdsTempDataMap.EnableControls;
    except
    end;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;

procedure TdmgDV.AllocateClosureTempData2;
var
  i, j : integer;
  tplus, tminus : double;
  nRec : integer;
  tmpStr : string;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  UserSession.LC := 0;
  {Allocate data}
  if (UserSession.DataHaveChanged) then
  begin
    UserSession.StartAtX := SpectrumStartAge;
    UserSession.EndAtX := SpectrumEndAge;
    if (dmgDV.cdsTempDataDT.RecordCount > 0) then
    begin
      dmgDV.cdsTempDataDT.EmptyDataSet;
    end;
  end;
  dmgDV.cdsTempDataDT.Filtered := false;
  dmgDV.cdsTempDataDT.First;
  with dmgDV do
  begin
    QuerydmDT.Close;
    QuerydmDT.SQL.Clear;
    QuerydmDT.SQL.Add('SELECT DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.UNITID,SUITE.UNITNAME, USEROPTGROUPING.GROUPINGNUMBER,');
    QuerydmDT.SQL.Add('   ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,');
    QuerydmDT.SQL.Add('   ISORGR30.ISOTOPESYSTEM, ISORGR30.MATERIALABR,');
    QuerydmDT.SQL.Add('   ISORGR30.APPROACHABR, ISORGR30.INTERPABR,');
    QuerydmDT.SQL.Add('   BLOCKINGT.BLOCKINGT, BLOCKINGT.BLOCKINGTUNCERTAINTY');
    if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
    begin
      QuerydmDT.SQL.Add('FROM ISORGR30,COUNTRY,');
      QuerydmDT.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOptGrouping,BlockingT');
    end;
    if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
    begin
      dmgDV.QuerydmDT.SQL.Add('FROM ISORGR30');
    end;
    if UserSession.IsDeveloper then
    begin
        //dmUser.SetDeveloperData('SubmitQuerydmDTa '+dmgDV.QuerydmDT.SQL.Text);
    end;
    //QuerydmDT.SQL.Add('FROM ISORGR30,COUNTRY,');
    //QuerydmDT.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOptGrouping,BlockingT');
    tmpStringList := TStringList.Create;
    try
      if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      if UserSession.IncludeUserOrgID then
      begin
        if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
      end;
      //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
      i := tmpStringList.Count;
      for i := 0 to tmpStringList.Count - 1 do
      begin
        QuerydmDT.SQL.Add(tmpStringList.Strings[i]);
      end;
    finally
      FreeAndNil(tmpStringList);
    end;
    QuerydmDT.SQL.Add('AND USEROPTGROUPING.USERID = USERSWHOFOR.USERID');
    {
    QuerydmDT.SQL.Text := dmDV.Query1.SQL.Text;
    QuerydmDT.SQL.Strings[0] := 'select DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.UNITID,SUITE.UNITNAME, USEROPTGROUPING.GROUPINGNUMBER,';
    QuerydmDT.SQL.Strings[1] := '   ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,';
    QuerydmDT.SQL.Strings[2] := '   ISORGR30.ISOTOPESYSTEM, ISORGR30.MATERIALABR,';
    QuerydmDT.SQL.Strings[3] := '   ISORGR30.APPROACHABR, ISORGR30.INTERPABR,';
    QuerydmDT.SQL.Strings[4] := '   BLOCKINGT.BLOCKINGT, BLOCKINGT.BLOCKINGTUNCERTAINTY';
    QuerydmDT.SQL.Strings[5] := '   ';
    QuerydmDT.SQL.Strings[6] := '   ';
    QuerydmDT.SQL.Strings[7] := '   ';
    tmpStr := '      Technique, IsoSystem,Suite,UsersWhoFor,IsoFor,SourceA,SourceList,UserOpts,UserOptGrouping,BlockingT';
    if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
    begin
      tmpStr := tmpStr + ',DOMAINS,ISOPROVTERR';
    end;
    QuerydmDT.SQL.Strings[9] := tmpStr;
    QuerydmDT.SQL.Strings[dmDV.Query1.SQL.Count-1] := 'AND USEROPTS.USERID = USERSWHOFOR.USERID';
    }
    if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
    begin
      QuerydmDT.SQL.Add('AND ISOPROVTERR.DOMAINID = USEROPTGROUPING.GROUPINGLINK');
    end;
    if (UserSession.GroupBy = gbGrouping) then
      QuerydmDT.SQL.Add('AND ISOGROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK');
    if (UserSession.GroupBy = gbTerrane) then
      QuerydmDT.SQL.Add('AND TERRANE.TERRANE = USEROPTGROUPING.GROUPINGLINK');
    if (UserSession.GroupBy = gbOrogenicPeriod) then
      QuerydmDT.SQL.Add('AND ISOOROGENIC.OROGENICPERIODID = USEROPTGROUPING.GROUPINGLINK');
    if (UserSession.GroupBy = gbChemicalType) then
      QuerydmDT.SQL.Add('AND ISOCHEMTYPE.CHEMTYPEABR = USEROPTGROUPING.GROUPINGLINK');
    if (UserSession.GroupBy = gbBoundaryPosition) then
      QuerydmDT.SQL.Add('AND ISOBOUNDARY.BOUNDPOSID = USEROPTGROUPING.GROUPINGLINK');
    QuerydmDT.SQL.Add('AND BLOCKINGT.MATERIALABR = ISORGR30.MATERIALABR');
    QuerydmDT.SQL.Add('AND BLOCKINGT.ISOSYSTEM = ISORGR30.ISOTOPESYSTEM');
    QuerydmDT.SQL.Add('AND BLOCKINGT.APPROACHABR = ISORGR30.APPROACHABR');
    QuerydmDT.SQL.Add('ORDER BY USEROPTGROUPING.GROUPINGLINK, ISORGR30.RAGE, SUITE.UNITNAME');
    QuerydmDT.SQL.Add(' ');
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmgDV.QuerydmDT.SQL.Text);
    end;
    QuerydmDT.ParamByName('USERID').AsString := UserSession.UserID;
    cdsQuerydmDT.Close;
    cdsQuerydmDT.Open;
  end;
  try
    if UserSession.DataHaveChanged then
    begin
      dmgDV.cdsQuerydmDT.First;
      repeat
        if (UserSession.StartAtX > dmgDV.cdsQuerydmDTRAGE.AsFloat-dmgDV.cdsQuerydmDTRAGEMERROR.AsFloat) then UserSession.StartAtX := dmgDV.cdsQuerydmDTRAGE.AsFloat-dmgDV.cdsQuerydmDTRAGEMERROR.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsQuerydmDTRAGE.AsFloat+dmgDV.cdsQuerydmDTRAGEPERROR.AsFloat) then UserSession.EndAtX := dmgDV.cdsQuerydmDTRAGE.AsFloat+dmgDV.cdsQuerydmDTRAGEPERROR.AsFloat;
        try
          dmgDV.cdsTempDataDT.Append;
          dmgDV.cdsTempDataDTGrouping.AsString := dmgDV.cdsQuerydmDTGROUPINGLINK.AsString;
          dmgDV.cdsTempDataDTSuitName.AsString := dmgDV.cdsQuerydmDTUNITNAME.AsString;
          dmgDV.cdsTempDataDTColumnNo.AsInteger := dmgDV.cdsQuerydmDTGROUPINGNUMBER.AsInteger;
          dmgDV.cdsTempDataDTAge.AsFloat := dmgDV.cdsQuerydmDTRAGE.AsFloat;
          tPlus := 50.05;
          tMinus := 50.05;
          if (dmgDV.cdsQuerydmDTRAGEPERROR.AsString <> '') then tPlus := dmgDV.cdsQuerydmDTRAGEPERROR.AsFloat;
          if (dmgDV.cdsQuerydmDTRAGEMERROR.AsString <> '') then tMinus := dmgDV.cdsQuerydmDTRAGEMERROR.AsFloat;
          dmgDV.cdsTempDataDTAgePlusError.AsFloat := tPlus;
          dmgDV.cdsTempDataDTAgeMinusError.AsFloat := tMinus;
          dmgDV.cdsTempDataDTIsoSystem.AsString := dmgDV.cdsQuerydmDTISOTOPESYSTEM.AsString;
          dmgDV.cdsTempDataDTMaterialAbr.AsString := dmgDV.cdsQuerydmDTMATERIALABR.AsString;
          dmgDV.cdsTempDataDTApproachAbr.AsString := dmgDV.cdsQuerydmDTAPPROACHABR.AsString;
          dmgDV.cdsTempDataDTBlockingT.AsFloat := dmgDV.cdsQuerydmDTBLOCKINGT.AsFloat;
          dmgDV.cdsTempDataDTBlockingTUncertainty.AsFloat := dmgDV.cdsQuerydmDTBLOCKINGTUNCERTAINTY.AsFloat;
        except
        end;
        dmgDV.cdsQuerydmDT.Next;
      until dmgDV.cdsQuerydmDT.EOF;
    end;
  finally
    dmgDV.cdsQuerydmDT.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataInterp2Grouped;
var
  Minimum1, Maximum1,
  Minimum2, Maximum2,
  Minimum3, Maximum3,
  Minimum4, Maximum4,
  Minimum5, Maximum5 : double;
  GraphCategoryNum : integer;
  SampleLocalityAlreadyShown : boolean;
  i, nRec : integer;
  tmpStr : string;
  tempStr : string;
  tmpStringList : TStringList;
  QueryUse : integer;
begin
  QueryUse := 2;
  try
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    with dmgDV do
    begin
      QuerydmMIG.Close;
      QuerydmMIG.SQL.Clear;
      QuerydmMIG.SQL.Add('select DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,USEROPTGROUPING.GROUPINGLINK,ISORGR30.INTERPABR,');
      QuerydmMIG.SQL.Add('   SMPLOC.LATITUDE,SMPLOC.LONGITUDE,');
      QuerydmMIG.SQL.Add('   ISORGR30.RAGE,ISORGR30.RECORDID');
      if ((not UserSession.IncludeUserOrgID) or (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='Y'))) then
      begin
        QuerydmMIG.SQL.Add('FROM ISORGR30,COUNTRY,');
        QuerydmMIG.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp,UserOptGrouping');
        if not UserSession.IncludeCoordinates then    //need this for situations where coordinates were not part of original query
        begin
          QuerydmMIG.SQL.Add('    ,SMPREG,SMPLOC ');
        end;
      end;
      if (UserSession.IncludeUserOrgID and (UserSession.UserOrgIDValue='N')) then
      begin
        dmgDV.QuerydmMIG.SQL.Add('FROM ISORGR30');
      end;
      if UserSession.IsDeveloper then
      begin
          //dmUser.SetDeveloperData('SubmitQuerydmMIGa '+dmgDV.QuerydmMIG.SQL.Text);
      end;
      //QuerydmMIG.SQL.Add('FROM ISORGR30,COUNTRY,');
      //QuerydmMIG.SQL.Add('      SUITE,USERSWHOFOR,ISOFOR,UserOpts,UserOptInterp,UserOptGrouping');
      tmpStringList := TStringList.Create;
      try
        if not UserSession.IncludeUserOrgID then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        if UserSession.IncludeUserOrgID then
        begin
          if (UserSession.UserOrgIDValue='Y') then dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
          if (UserSession.UserOrgIDValue='N') then dmDV.ConstructQueryStringListJoin(QueryUse,tmpStringList);
        end;
        //dmDV.ConstructQueryStringList(QueryUse,tmpStringList);
        i := tmpStringList.Count;
        for i := 0 to tmpStringList.Count - 1 do
        begin
          QuerydmMIG.SQL.Add(tmpStringList.Strings[i]);
        end;
      finally
        FreeAndNil(tmpStringList);
      end;
      {
      QuerydmMIG.SQL.Text := dmDV.Query1.SQL.Text;
      QuerydmMIG.SQL.Strings[0] := 'select DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,USEROPTGROUPING.GROUPINGLINK,ISORGR30.INTERPABR,';
      QuerydmMIG.SQL.Strings[1] := '   SMPLOC.LATITUDE,SMPLOC.LONGITUDE,';
      QuerydmMIG.SQL.Strings[2] := '   ISORGR30.RAGE,ISORGR30.RECORDID';
      QuerydmMIG.SQL.Strings[3] := '   ';
      QuerydmMIG.SQL.Strings[4] := '   ';
      QuerydmMIG.SQL.Strings[5] := '   ';
      QuerydmMIG.SQL.Strings[6] := '   ';
      QuerydmMIG.SQL.Strings[7] := '   ';
      if UserSession.IncludeCoordinates then
      begin
        tmpStr := '      Technique, IsoSystem,Suite,UsersWhoFor,IsoFor,SourceA,SourceList,UserOpts,UserOptInterp,UserOptGrouping';
      end else
      begin
        tmpStr := '      Technique, IsoSystem,Suite,UsersWhoFor,IsoFor,SourceA,SourceList,UserOpts,UserOptInterp,UserOptGrouping,SmpReg,SmpLoc';
      end;
      QuerydmMIG.SQL.Strings[9] := tmpStr;
      }
      QuerydmMIG.SQL.Add('AND USEROPTS.USERID = USERSWHOFOR.USERID');
      QuerydmMIG.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmMIG.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
      QuerydmMIG.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
      QuerydmMIG.SQL.Add('AND USEROPTINTERP.INTERPABR = ISORGR30.INTERPABR');

      QuerydmMIG.SQL.Add('AND USEROPTGROUPING.USERID = USEROPTINTERP.USERID');
      QuerydmDT.SQL.Add('AND USEROPTS.USERID = USEROPTGROUPING.USERID');
      if not UserSession.IncludeCoordinates then         //need this for situations where coordinates were not part of original query
      begin
        tempStr := 'AND SMPREG.RECORDID = ISORGR30.RECORDID';
        QuerydmMIG.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO';
        QuerydmMIG.SQL.Add(tempStr);
        tempStr := 'AND SMPREG.INCLUDED = '+''''+'Y'+'''';
        QuerydmMIG.SQL.Add(tempStr);
        tempStr := 'AND SMPLOC.LATITUDE <= 90.0';
        QuerydmMIG.SQL.Add(tempStr);
      end;
      if ((UserSession.GroupBy = gbProvince) or (UserSession.GroupBy = gbTerrane)) then
      begin
        QuerydmMIG.SQL.Add('AND ISOPROVTERR.DOMAINID = USEROPTGROUPING.GROUPINGLINK');
      end;
      if (UserSession.GroupBy = gbGrouping) then
        QuerydmMIG.SQL.Add('AND ISOGROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbOrogenicPeriod) then
        QuerydmMIG.SQL.Add('AND ISOOROGENIC.OROGENICPERIODID = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbChemicalType) then
        QuerydmMIG.SQL.Add('AND ISOCHEMTYPE.CHEMTYPEABR = USEROPTGROUPING.GROUPINGLINK');
      if (UserSession.GroupBy = gbBoundaryPosition) then
        QuerydmMIG.SQL.Add('AND ISOBOUNDARY.BOUNDPOSID = USEROPTGROUPING.GROUPINGLINK');
      QuerydmMIG.SQL.Add('ORDER BY USEROPTGROUPING.GROUPINGLINK, USEROPTS.OPTIONID, SMPLOC.SAMPLENO');
      QuerydmMIG.SQL.Add(' ');
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmgDV.QuerydmMIG.SQL.Text);
      end;
      QuerydmMIG.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydmMIG.Close;
      cdsQuerydmMIG.Open;
    end;
    if (dmgDV.cdsQuerydmMIG.RecordCount >= 1) then
    begin
      UserSession.LatitudeMin := 90.0;
      UserSession.LatitudeMax := -90.0;
      UserSession.LongitudeMin := 180.0;
      UserSession.LongitudeMax := -180.0;
      dmgDV.cdsTempDataMap.EmptyDataSet;
    end;
    dmgDV.cdsQuerydmMIG.First;
    try
      repeat
        try
          dmgDV.cdsTempDataMap.Append;
          dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsQuerydmMIGSampleNo.AsString;
          dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsQuerydmMIGLatitude.AsFloat;
          dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsQuerydmMIGLongitude.AsFloat;
          dmgDV.cdsTempDataMapElevation.AsFloat := 0.0;
          dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsQuerydmMIGRAge.AsFloat;
          dmgDV.cdsTempDataMapColumnNo.AsInteger := dmgDV.cdsQuerydmMIGOPTIONID.AsInteger;
          dmgDV.cdsTempDataMapColumnNoDate.AsInteger := 0;
          dmgDV.cdsTempDataMapInterpretation.AsString := dmgDV.cdsQuerydmMIGGROUPINGLINK.AsString;
          dmgDV.cdsTempDataMapInterpAbr.AsString := dmgDV.cdsQuerydmMIGInterpAbr.AsString;
          dmgDV.cdsTempDataMapAgeBand.AsString := 'nihil';
          dmgDV.cdsTempDataMap.Post;
        except
        end;
        if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
        if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
        dmgDV.cdsQuerydmMIG.Next;
      until dmgDV.cdsQuerydmMIG.EOF;
    except
    end;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;



end.
