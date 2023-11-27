unit DVIW_constants;

interface

const
  ValueForUndefinedContinentID = 'UND';
  ValueForUndefinedCountryAbr = 'UND';
  ValueForPrimaryReferenceType = 'A';
  ValueForCitedReferenceType = 'C';
  ValueForCanView = 'ViewDateView';
  ValueForCanModify = 'ModifyDateView';
  ValueForCanInsert = 'InsertDateView';
  ValueForCanDelete = 'DeleteDateView';
  ValueForIsDeveloper = 'DeveloperOnly';
  ValueForCanValidate = 'ValidateDateView';
  ValueForCanExport = 'ExportDateView';
  ValueForCanViewPlus = 'ViewDateViewPlus';
  ValueForCanModifyPlus = 'ModifyDateViewPlus';
  ValueForPublished = 'PUBL';
  ValueForCaptured = 'Capt';

  gbGrouping = 'User-defined Group';
  gbProvince = 'Province';
  gbTerrane = 'Terrane';
  gbOrogenicPeriod = 'Orogenic Period';
  gbChemicalType = 'Chemical Type';
  gbBoundaryPosition = 'Boundary Position';
  gbLIP = 'Large Igneous Province';

  gtInitialRatio = 'Initial ratio';
  gtEpsilon = 'Epsilon or Gamma at T';
  gtMu = 'Model source 238U/204Pb';
  gtGalbraith = 'Galbraith';
  gtInterpretationWithErrorBars = 'Interpretation with error bars';
  gtGroupedWithErrorBars = 'Grouped with error bars';
  gtInterpretationProbabilityCurves = 'Interpretation probability curves';
  gtGroupedProbabilityCurves = 'Grouped probability curves';
  gtMapInterpretation = 'Map (by Interpretation)';
  gtMapDateBand = 'Map (by Date Band)';
  gtMapEpsilonBand = 'Map (by Epsilon, Gamma or Delta value)';
  gtMapInitialRatioBand = 'Map (by Initial ratio)';
  gtMapMuBand = 'Map (by Model source 238U/204Pb)';
  gtMapInterpretationGrouped = 'Map (grouped)';
  gtClosureTemperature = 'Closure temperature';
  gtWeightedAverage = 'Weighted average';
  gtInitialRatioGrouped = 'Initial ratios (grouped)';
  gtEpsilonGrouped = 'Epsilon or Gamma at T (grouped)';
  gtMuGrouped = 'Model source 238U/204Pb (grouped)';
  gtPalaeoReconstruction = 'Palaeo-reconstruction';

  nt100Percent = 'Major peak normalised to 100%';
  ntTrueProbability = 'True probability (normalised to number of data)';

  usDetails = 'Details';
  usDetailsEdit = 'DetailsEdit';
  usReferences = 'References';
  usGrid = 'Grid';
  usProvinces = 'Provinces';
  usSample = 'Sample';
  usSampleFrac = 'SampleFrac';
  usIdentifyPeaks = 'IdentifyPeaks';
  usShowDetrital = 'ShowDetrital';
  usIndividualAgeHf = 'IndivAgeHf';
  usMultipleAgeHf = 'MultiAgeHf';
  usIndividualAgeChem = 'IndivAgeChem';
  usMultipleAgeChem = 'MultiAgeChem';

  MaxSamp    = 1000;
  MaxSeries  = 5;
  MaxGuestRecords = 10;
  AgeTolerance : double = 20000.0;
  Steps        = 2500;
  SpectrumStartAge = 0.0;
  SpectrumEndAge = 4600.0;
  DefaultMapFolder = './wwwroot/files/maps/';
  DefaultMapFileName = 'country.shp';
  DefaultMapDBFName = 'country.dbf';
  DefaultFlexCellFolder = './wwwroot/files/flexcell/';
  DefaultMissingValue = -999.99;

  NothingChosen = 'nothing';
  Copyright1 = '(c) Dr Bruce Eglington (2004-2022)';
  Copyright2 = 'DateView Geochronology Database';



implementation

end.
