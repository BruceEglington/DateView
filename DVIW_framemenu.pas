unit DVIW_framemenu;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, Menus, IWCompMenu, jpeg,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWHTMLContainer, ImgList, Graphics, IWHTML40Container,
  DVIW_dmdata, System.ImageList;

type
  TISFFrameMenu = class(TFrame)
    IWFrameRegion: TIWRegion;
    iwrAll: TIWRegion;
    iwrEggTimer: TIWRegion;
    IWImageDVIW: TIWImage;
    IWMenu1: TIWMenu;
    MainMenu1: TMainMenu;
    Select1: TMenuItem;
    SelectUnit1: TMenuItem;
    SelectSampleFracs1: TMenuItem;
    SelectSamples1: TMenuItem;
    SelectReferences1: TMenuItem;
    LookupTables1: TMenuItem;
    Options1: TMenuItem;
    New1: TMenuItem;
    NewRecord1: TMenuItem;
    LookupsApproaches1: TMenuItem;
    LookupsBoundaries1: TMenuItem;
    LookupsClosureTemperatures1: TMenuItem;
    LookupsInterpretations1: TMenuItem;
    LookupIsotopeSystems1: TMenuItem;
    LookupsMaterialAnalysed1: TMenuItem;
    LookupsChemicalAssociations1: TMenuItem;
    LookupsLaboratories1: TMenuItem;
    LookupsAreas1: TMenuItem;
    LookupsLargeIgneousProvinces1: TMenuItem;
    MainPage1: TMenuItem;
    iwrImageTop: TIWRegion;
    SelectUnitsAreas1: TMenuItem;
    ImageList1: TImageList;
    LookupsLithologies1: TMenuItem;
    SelectSampleData1: TMenuItem;
    SelectCalculations1: TMenuItem;
    LookupsMethods1: TMenuItem;
    LookupsOrogenicPeriods1: TMenuItem;
    LookupsProvinces1: TMenuItem;
    LookupsRatings1: TMenuItem;
    LookupsTerranes1: TMenuItem;
    LookupsTechniques1: TMenuItem;
    LookupsData1: TMenuItem;
    Query1: TMenuItem;
    Define1: TMenuItem;
    DefineSQL1: TMenuItem;
    Graph1: TMenuItem;
    LookupsUserGroups1: TMenuItem;
    LookupsUserFor1: TMenuItem;
    LookupsModels1: TMenuItem;
    LookupsStandards1: TMenuItem;
    RawDataIdentifyAgePeaks1: TMenuItem;
    iwrMenu: TIWRegion;
    Data1: TMenuItem;
    RawDataMultipleDetrital1: TMenuItem;
    RawDataIndivAgeHf: TMenuItem;
    RawDataMultiAgeHf: TMenuItem;
    LookupsVariables1: TMenuItem;
    RawDataIndivAgeChem: TMenuItem;
    RawDataMultiAgeChem: TMenuItem;
    procedure SelectUnit1Click(Sender: TObject);
    procedure SelectReferences1Click(Sender: TObject);
    procedure SelectSampleFracs1Click(Sender: TObject);
    procedure SelectInterpretedRecords1Click(Sender: TObject);
    procedure SelectUnitsAreas1Click(Sender: TObject);
    procedure MainPage1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure NewRecord1Click(Sender: TObject);
    procedure LookupsData1Click(Sender: TObject);
    procedure SelectSQL1Click(Sender: TObject);
    procedure SelectGraph1Click(Sender: TObject);
    procedure SelectCalculations1Click(Sender: TObject);
    procedure SelectSamples1Click(Sender: TObject);
    procedure LookupsApproaches1Click(Sender: TObject);
    procedure LookupsAreas1Click(Sender: TObject);
    procedure LookupsBoundaries1Click(Sender: TObject);
    procedure LookupsChemicalAssociations1Click(Sender: TObject);
    procedure LookupsClosureTemperatures1Click(Sender: TObject);
    procedure LookupsInterpretations1Click(Sender: TObject);
    procedure LookupIsotopeSystems1Click(Sender: TObject);
    procedure LookupsLaboratories1Click(Sender: TObject);
    procedure LookupsLargeIgneousProvinces1Click(Sender: TObject);
    procedure LookupsLithologies1Click(Sender: TObject);
    procedure LookupsMaterialAnalysed1Click(Sender: TObject);
    procedure LookupsMethods1Click(Sender: TObject);
    procedure LookupsOrogenicPeriods1Click(Sender: TObject);
    procedure LookupsProvinces1Click(Sender: TObject);
    procedure LookupsRatings1Click(Sender: TObject);
    procedure LookupsTerranes1Click(Sender: TObject);
    procedure LookupsTechniques1Click(Sender: TObject);
    procedure LookupsUserGroups1Click(Sender: TObject);
    procedure LookupsUserFor1Click(Sender: TObject);
    procedure LookupsModels1Click(Sender: TObject);
    procedure LookupsStandards1Click(Sender: TObject);
    procedure RawDataIdentifyAgePeaks1Click(Sender: TObject);
    procedure RawDataMultipleDetrital1Click(Sender: TObject);
    procedure RawDataIndivAgeHfClick(Sender: TObject);
    procedure RawDataMultiAgeHfClick(Sender: TObject);
    procedure LookupsVariables1Click(Sender: TObject);
    procedure RawDataMultiAgeChemClick(Sender: TObject);
    procedure RawDataIndivAgeChemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IWAppForm, IWForm, IWInit, DVIW_datalookups, DVIW_definequery, DVIW_defineSQL,
    DVIW_isosystems,
  DVIW_approaches, DVIW_area, DVIW_boundaries, DVIW_chemtypes,
  DVIW_closurequery, DVIW_interpretations, DVIW_laboratories, DVIW_LIPs,
  DVIW_lithologies, DVIW_material, DVIW_methods, DVIW_modelquery,
  DVIW_orogenicperiods, DVIW_preflevels, DVIW_standards, DVIW_techniques,
  DVIW_terranes, DVIW_userwhofor, DVIW_usergroups,
  DVIW_newrecord1, DVIW_options,
  DVIW_samples, DVIW_samplesfractions, DVIW_selectgraph, DVIW_units,
  DVIW_unitareas, ServerController, DVIW_dm, DVIW_uMain, DVIW_referencequery,
  DVIW_constants, DVIW_samplequery, DVIW_unitquery, DVIW_selectcalculations,
  DVIW_variables;

procedure TISFFrameMenu.LookupIsotopeSystems1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFIsoSystems.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsApproaches1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFApproaches.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsAreas1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAreas.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsBoundaries1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFBoundaries.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsChemicalAssociations1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFChemTypes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsClosureTemperatures1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFClosuretemperatureQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsData1Click(Sender: TObject);
begin
  if UserSession.IsDeveloper then
  begin
    if UserSession.LoggedIn then
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFDataLookups.Create(WebApplication).Show;
    end else
    begin
      UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
    end;
  end;
end;

procedure TISFFrameMenu.LookupsInterpretations1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFInterpretations.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsLaboratories1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLaboratories.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsLargeIgneousProvinces1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLIPS.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsLithologies1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLithologies.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsMaterialAnalysed1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMaterial.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsMethods1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMethods.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsModels1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Models';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFModelQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsOrogenicPeriods1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFOrogenicPeriods.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsProvinces1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usProvinces;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
    {
    TISFProvinces.Create(WebApplication).Show;
    }
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsRatings1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPrefLevels.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsStandards1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Standards';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFStandards.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsTechniques1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFTechniques1.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsTerranes1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFTerranes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsUserFor1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUserWhoFor.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsUserGroups1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUserGroups.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsVariables1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFVariables.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.MainPage1Click(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFFrameMenu.NewRecord1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFNewRecord1.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.Options1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFOptions.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataIdentifyAgePeaks1Click(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usIdentifyPeaks;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataIndivAgeChemClick(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usIndividualAgeChem;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataIndivAgeHfClick(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usIndividualAgeHf;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataMultiAgeChemClick(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usMultipleAgeChem;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataMultiAgeHfClick(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usMultipleAgeHf;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.RawDataMultipleDetrital1Click(Sender: TObject);
begin
  try
    dmdDV.cdsSamplesWithData.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usShowDetrital;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectReferences1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFReferenceQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectSQL1Click(Sender: TObject);
begin
 try
    dmDV.cdsQuery1.Close;
  except
  end;
  if UserSession.LoggedIn and UserSession.IsDeveloper then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDetailsEdit
    else UserSession.UnitSender := usDetails;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineSQL.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectSampleFracs1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify then UserSession.UnitSender := usSampleFrac;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectSamples1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify then UserSession.UnitSender := usSample;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectUnitsAreas1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'UnitAreas';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectCalculations1Click(Sender: TObject);
var
  NumRecords : integer;
begin
  if UserSession.LoggedIn then
  begin
    try
      NumRecords := dmDV.cdsQuery1.RecordCount;
    except
      NumRecords := 0;
    end;
    if (NumRecords > 0) then
    begin
      dmDV.cdsQuery1.Close;
      dmDV.cdsRecordIDs.Close;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFSelectCalculations.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('No data are selected. Run a query first.');
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectGraph1Click(Sender: TObject);
var
  NumRecords : integer;
begin
  if UserSession.LoggedIn then
  begin
    try
      NumRecords := dmDV.cdsQuery1.RecordCount;
    except
      NumRecords := 0;
    end;
    if (NumRecords > 0) then
    begin
      dmDV.cdsQuery1.Close;
      dmDV.cdsRecordIDs.Close;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFSelectGraph.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('No data are selected. Run a query first.');
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectInterpretedRecords1Click(Sender: TObject);
begin
  try
    dmDV.cdsQuery1.Close;
  except
  end;
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDetailsEdit
    else UserSession.UnitSender := usDetails;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectUnit1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Units';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.