unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm,
  //HTTPApp,
  // For OnNewSession Event
  IWApplication, IWAppForm, IW.Browser.Browser,
  IWUserSessionBase,
  IW.HTTP.Request, IW.HTTP.Reply,
  usrIW_dm, DVIW_constants, DVIW_dmdata, DVIW_dmgraphics,
  DVIW_dmopt, DVIW_dmstrat, DVIW_dm;

type
  TExportType = (
    et_Xls,
    et_Xlsx,
    et_Csv,
    et_Pdf,
    et_Html
  );

type
  TIWUserSession = class(TIWUserSessionBase)
    procedure IWUserSessionBaseDestroy(Sender: TObject);
    procedure IWUserSessionBaseCreate(Sender: TObject);
  private
    { Private declarations }
  public
    UserID,
	  UserPassword,
	  UserDisplayName : widestring;

    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    ThisProgram : widestring;
    ThisProgramName : widestring;
    ProgTitle : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanExport : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    ThisLoginTime : TDateTime;
    DoMemCheck : boolean;

    NumRecordsFound : integer;

    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    Parameter2Chosen : string;
    GoDirectToGraphs : boolean;
    DataHaveChanged : boolean;
    PDFHasChanged : boolean;

    NumRecordsPerPage : integer;
    PageNum, PageNumTotal : integer;

    AgeChosen : double;

    IncludeContinentValues : boolean;
    ContinentValues : TStringList;
    IncludeAreaValues : boolean;
    AreaValues : TStringList;
    IncludeReferenceValues: Boolean;
    ReferenceValues: TStringList;
    IncludeValidationValues: Boolean;
    ValidationValues: TStringList;
    IncludeWhoForValues: Boolean;
    WhoForValues: TStringList;
    IncludeUnitValues: Boolean;
    IncludeLithologyValues: Boolean;
    IncludeMaterialValues: Boolean;
    IncludeMethodValues: Boolean;
    IncludeIsotopeSystemValues: Boolean;
    IncludeInterpretationValues: Boolean;
    IncludeApproachValues: Boolean;
    IncludeTechniqueValues: Boolean;
    IncludeGroupValues: Boolean;
    IncludeProvinceValues: Boolean;
    IncludeTerraneValues: Boolean;
    IncludeOrogenicPeriodValues: Boolean;
    IncludeChemicalTypeValues: Boolean;
    IncludeBoundaryPositionValues: Boolean;
    IncludeBoundaryValues: Boolean;
    IncludePlateValues: Boolean;
    IncludeAgeUnitsValue: Boolean;
    AgeUnitsValue: string;
    PreferenceLevelValue: string;
    ConfidentialValue: string;
    IncludeIsochronOnlyValue: Boolean;
    IncludeIgneous, IncludeSedimentary,
    IncludeMetamorphicAndOther : boolean;
    //IncludePlateModelValues : boolean;
    IncludeGDUValues : boolean;

    PlateModelValue : String;
    GDUValues : TStringList;
    UnitValues: TStringList;
    LithologyValues: TStringList;
    MaterialValues: TStringList;
    MethodValues: TStringList;
    IsotopeSystemValues: TStringList;
    InterpretationValues: TStringList;
    ApproachValues: TStringList;
    TechniqueValues: TStringList;
    GroupValues: TStringList;
    ProvinceValues: TStringList;
    TerraneValues: TStringList;
    OrogenicPeriodValues: TStringList;
    ChemicalTypeValues: TStringList;
    BoundaryPositionValues: TStringList;
    BoundaryValues: TStringList;
    //PlateValues: TStringList;
    DecayUncertaintyValues: TStringList;
    UsersContributedValues : TStringList;
    LIPValues: TStringList;
    SampleValues: TStringList;
    SampleZoneValues: TStringList;
    Interpretation1Values, Interpretation2Values, Interpretation3Values,
    Interpretation4Values, Interpretation5Values: TStringList;

    IncludeDateFromValue: Boolean;
    DateFromField: string;
    IncludeDateToValue: Boolean;
    DateToField: string;
    IncludeRecordIDValueRange: Boolean;
    RecordIDValueFrom, RecordIDValueTo: string;
    IncludeUserOrgID: Boolean;
    UserOrgIDValue: string;
    //DateUnitsValue: string;
    OrderByValue: string;
    SampleStartFrom, SampleEndWith: string;
    ReferenceStartFrom, ReferenceEndWith: string;
    UnitStartFrom, UnitEndWith : string;
    ProvinceStartFrom, ProvinceEndWith: string;
    TerraneStartFrom, TerraneEndWith: string;
    ShowAllSampleLocalities : boolean;
    IncludeEpsilonFromValue, IncludeEpsilonToValue : Boolean;
    EpsilonFromValue, EpsilonToValue : string;
    IncludeUsersContributedValues : boolean;
    IncludeLIPValues: Boolean;
    IncludeSampleValues: Boolean;
    IncludeSampleZoneValues: Boolean;

    NewContinentID, NewAreaID,
    NewUnitID, NewLithologyID,
    NewFrac,
    NewMaterialID, NewIsotopeSystemID,
    NewApproachID, NewTechniqueID,
    NewInterpretationID, NewRatingNum,
    NewMethodID, NewAgeUnit,
    NewReferenceID : string;
    NewLaboratory, NewSample,
    NewProvince, NewTerrane : string;
    NewAge, NewAgePError, NewAgeMError : double;

    //tmpStrList : TStringList;

    Interpretation1Caption, Interpretation2Caption, Interpretation3Caption,
    Interpretation4Caption, Interpretation5Caption: string;
    DateBand1Caption, DateBand2Caption, DateBand3Caption,
    DateBand4Caption, DateBand5Caption: string;
    DateBand1Minimum, DateBand1Maximum, DateBand2Minimum, DateBand2Maximum,
    DateBand3Minimum, DateBand3Maximum, DateBand4Minimum, DateBand4Maximum,
    DateBand5Minimum, DateBand5Maximum: string;
    ItemBand1Caption, ItemBand2Caption, ItemBand3Caption,
    ItemBand4Caption, ItemBand5Caption: string;
    ItemBand1Minimum, ItemBand1Maximum, ItemBand2Minimum, ItemBand2Maximum,
    ItemBand3Minimum, ItemBand3Maximum, ItemBand4Minimum, ItemBand4Maximum,
    ItemBand5Minimum, ItemBand5Maximum: string;
    GroupBy: string;
    Group1Caption, Group2Caption, Group3Caption, Group4Caption,
    Group5Caption : string;
    GraphType : string;
    MinimumDateUncertainty: string;
    NormalisationType: string;
    PDFType : string;
    AxisChoiceX, AxisChoiceY : string;
    MapFileName : string;
    MapDBFName : string;
    MapFieldName : string;
    MapValueFieldName : string;
    UseDBF : boolean;
    HORZSIZE, VERTSIZE : integer;
    ShowDebugButtons : boolean;
    DelayConnections : boolean;
    FlexcelExportType : TExportType;
    FlexcelExportExtension : string;

    IncludeCoordinates : boolean;
    SWLat, SWLon, NELat, NELon : string;
    Xtra, Xtra1,
    Xtra2, Xtra3      :  array [0..MaxSamp] of double;
    NumberOfPoints    :  integer;

    FromAge, ToAge : double;

    StartAtX, EndAtX,
    StartAtY, EndAtY,
    StartAtZ, EndAtZ  : double;
    LongitudeMin, LongitudeMax,
    LatitudeMin, LatitudeMax : double;
    TMultiplier : double;

    WhereAmI :  string;  // string used to identify where one is in program process
    LC : integer;    // counter to identify unneeded iterations through data when graphing

    NumUses : integer;
    IsFirstShow : boolean;
    ProgressDate : string;

    dmUser : TdmUser;
    dmOpt : TdmOpt;
    dmDV : TdmDV;
    dmgDV : TdmgDV;
    dmdDV : TdmdDV;
    dmStrat : TdmStrat;

    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure SetCookies;
    procedure GetCookies;
    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
  end;


implementation

{$R *.dfm}

uses usr_uDBInterface, usr_uLogin,
  usr_uRegister, DVIW_uMain;

{
function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;
}

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
  //inherited Create(AOwner);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmStrat := TdmStrat.Create(Self);
  dmStrat.sqlcStrat.Connected := false;
  dmDV := TdmDV.Create(Self);
  dmDV.sqlcDateView.Connected := false;
  dmdDV := TdmdDV.Create(Self);
  dmdDV.sqlcDateView.Connected := false;
  dmgDV := TdmgDV.Create(Self);
  dmgDV.sqlcDateView.Connected := false;
  dmOpt := TdmOpt.Create(Self);
  dmOpt.sqlcDateView.Connected := false;
  ContinentValues := TStringList.Create;
  AreaValues := TStringList.Create;
  UnitValues := TStringList.Create;
  LithologyValues := TStringList.Create;
  MaterialValues := TStringList.Create;
  MethodValues := TStringList.Create;
  IsotopeSystemValues := TStringList.Create;
  InterpretationValues := TStringList.Create;
  ApproachValues := TStringList.Create;
  TechniqueValues := TStringList.Create;
  GroupValues := TStringList.Create;
  ProvinceValues := TStringList.Create;
  TerraneValues := TStringList.Create;
  OrogenicPeriodValues := TStringList.Create;
  ReferenceValues := TStringList.Create;
  ChemicalTypeValues := TStringList.Create;
  BoundaryPositionValues := TStringList.Create;
  BoundaryValues := TStringList.Create;
  ValidationValues := TStringList.Create;
  WhoForValues := TStringList.Create;
  DecayUncertaintyValues := TStringList.Create;
  UsersContributedValues := TStringList.Create;
  Interpretation1Values := TStringList.Create;
  Interpretation2Values := TStringList.Create;
  Interpretation3Values := TStringList.Create;
  Interpretation4Values := TStringList.Create;
  Interpretation5Values := TStringList.Create;
  LIPValues := TStringList.Create;
  SampleValues := TStringList.Create;
  SampleZoneValues := TStringList.Create;
end;

procedure TIWUserSession.IWUserSessionBaseDestroy(Sender: TObject);
begin
  FreeAndNil(GDUValues);
  FreeAndNil(ContinentValues);
  FreeAndNil(AreaValues);
  FreeAndNil(UnitValues);
  FreeAndNil(LithologyValues);
  FreeAndNil(MaterialValues);
  FreeAndNil(MethodValues);
  FreeAndNil(IsotopeSystemValues);
  FreeAndNil(InterpretationValues);
  FreeAndNil(ApproachValues);
  FreeAndNil(TechniqueValues);
  FreeAndNil(GroupValues);
  FreeAndNil(ProvinceValues);
  FreeAndNil(TerraneValues);
  FreeAndNil(OrogenicPeriodValues);
  FreeAndNil(ReferenceValues);
  FreeAndNil(ChemicalTypeValues);
  FreeAndNil(BoundaryPositionValues);
  FreeAndNil(BoundaryValues);
  FreeAndNil(ValidationValues);
  FreeAndNil(WhoForValues);
  FreeAndNil(DecayUncertaintyValues);
  FreeAndNil(UsersContributedValues);
  FreeAndNil(Interpretation1Values);
  FreeAndNil(Interpretation2Values);
  FreeAndNil(Interpretation3Values);
  FreeAndNil(Interpretation4Values);
  FreeAndNil(Interpretation5Values);
  FreeAndNil(LIPValues);
  FreeAndNil(SampleValues);
  FreeAndNil(SampleZoneValues);
  dmdDV.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmOpt.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  //inherited Destroy;
end;

procedure TIWUserSession.GetStringsValues(AStrings: TStrings;
                           AKey: String; AValueList: TStringList);
//from routine published by Bob Swart
var
  FieldValue: String;
  i, match: Integer;
begin
  AKey := AKey + '=';
  for i:=0 to Pred(AStrings.Count) do
  begin
    FieldValue := AStrings.Strings[i];
    if Pos(AKey, FieldValue) = 1 then //exact match
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;

procedure TIWUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  //dmUser.SetDeveloperData('StratDB - NeedLogin');
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TIWUserSession.AfterLogin;
var
  //tmpStr : string;
  WasSuccessful : boolean;
begin
  //DoMemCheck := false;
  //if DoMemCheck then MemChk;
  IsFirstShow := true;
  WhereAmI := 'AfterLogin';
  ThisProgram := 'DateViewWeb';
  dmUser.SetDeveloperData('AfterLogin');
  //dmDV.SQLMonitor1.Active := false;
  //dmDV.SQLMonitor1.FileName := DefaultFlexCellFolder+dmDV.sqlcDateView.Name+'.TXT';
  //dmDV.SQLMonitor1.Active := true;
  IncrementNumUses(ThisProgram);
  NumRecordsPerPage := 50;
  LoggedIn := TRUE;
  CanModify := false;
  CanInsert := false;
  CanDelete := false;
  IsDeveloper := true;        //bme  - should be false here
  CanValidate := false;
  CanExport := false;
  CanViewPlus := false;
  CanModifyPlus := false;
  dmUser.SetDeveloperData('AfterLogin before CheckRights');
  //if not IsDeveloper then dmUser.SetDeveloperData('IsDeveloper is FALSE')
  //                               else dmUser.SetDeveloperData('IsDeveloper is TRUE');
  CheckRights(ThisProgram,UserID,UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  //dmUser.SetDeveloperData('AfterLogin after CheckRights');
  //if not IsDeveloper then dmUser.SetDeveloperData('IsDeveloper is FALSE')
  //                               else dmUser.SetDeveloperData('IsDeveloper is TRUE');
  //GoDirectTographs := false;
  dmDV.qUsers.Close;
  dmDV.qUsers.ParamByName('USERID').AsWideString := UserID;
  dmDV.cdsUsers.Close;
  dmDV.cdsUsers.Open;
  if (dmDV.cdsUsers.RecordCount < 1) then
  begin
    WasSuccessful := false;
    dmDV.AddNewUser(WasSuccessful);
    if (not WasSuccessful) then
    begin
      WebApplication.ShowMessage('Problem with User account');
    end;
    WasSuccessful := false;
    dmDV.AddNewUserWhoFor(WasSuccessful);
    if (not WasSuccessful) then
    begin
      WebApplication.ShowMessage('Problem with UserWhoFor account');
    end;
    dmDV.cdsUsers.Close;
    dmDV.cdsUsersWhoFor.Close;
    dmDV.qUsers.Close;
    dmDV.qUsers.ParamByName('USERID').AsWideString := UserID;
    dmDV.cdsUsers.Close;
    dmDV.cdsUsers.Open;
  end;
  if (dmDV.cdsUsers.RecordCount > 0) then
  begin
    try
      dmDV.cdsUsers.Edit;
      //dmDV.cdsUsersUSERID.AsString := UserID;
      dmDV.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmDV.cdsUsers.Post;
      dmDV.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Problem updating date for User account');
      end;
    end;
    dmDV.qUsersWhoFor.Close;
    dmDV.qUsersWhoFor.ParamByName('USERID').AsWideString := UserID;
    dmDV.cdsUsersWhoFor.Close;
    dmDV.cdsUsersWhoFor.Open;
    if (dmDV.cdsUsersWhoFor.RecordCount < 1) then
    begin
      WasSuccessful := false;
      dmDV.AddNewUserWhoFor(WasSuccessful);
      if (not WasSuccessful) then
      begin
        WebApplication.ShowMessage('Problem with UserWhoFor account');
      end;
    end;
  end;
  //dmUser.SetDeveloperData('AfterLogin');
  WhoForValues.Add(ValueForPublished);
  dmDV.qUsersWhoFor.Close;
  dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserID;
  dmDV.qGroupingList.Close;
  dmDV.qGroupingList.ParamByName('USERID').AsString := UserID;
  DataHaveChanged := true;
  PDFHasChanged := true;
  IncludeIgneous := false;
  IncludeSedimentary := false;
  IncludeMetamorphicAndOther := false;

  Interpretation1Values.Clear;
  Interpretation1Caption := 'Emplacement';
  Interpretation1Values.Add('Cryst');
  Interpretation2Values.Clear;
  Interpretation2Caption := 'Metamorphism';
  Interpretation2Values.Add('Metph');
  Interpretation3Values.Clear;
  Interpretation3Caption := 'Cooling';
  Interpretation3Values.Add('Cool');
  Interpretation4Values.Clear;
  Interpretation4Caption := 'Inherited';
  Interpretation4Values.Add('Inher');
  Interpretation5Values.Clear;
  Interpretation5Caption := 'Disturbed';
  Interpretation5Values.Add('DstUn');
  DateBand1Caption := '0-700 Ma';
  DateBand1Minimum := '0';
  DateBand1Maximum := '700';
  DateBand2Caption := '700-1300 Ma';
  DateBand2Minimum := '700';
  DateBand2Maximum := '1300';
  DateBand3Caption := '1300-2100 Ma';
  DateBand3Minimum := '1300';
  DateBand3Maximum := '2100';
  DateBand4Caption := '2100-2500 Ma';
  DateBand4Minimum := '2100';
  DateBand4Maximum := '2500';
  DateBand5Caption := '2500-4500 Ma';
  DateBand5Minimum := '2500';
  DateBand5Maximum := '4500';
  GroupBy := 'Province';
  MinimumDateUncertainty := '5.0';
  NormalisationType := nt100Percent;
  PDFType := 'AND';
  ShowAllSampleLocalities := true;
  FlexcelExportType := et_Xlsx;
  FlexcelExportExtension := '.XLSX';
  dmOpt.GetUserOptions;

  MapFileName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapFileName;
  MapDBFName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapDBFName;
  MapFieldName := 'WB_CNTRY';
  MapValueFieldName := 'CONTINENT';
  UseDBF := false;
  HORZSIZE := 1024; // horizontal screen size in pixels
  VERTSIZE := 768;  // vertical screen size in pixels
  FromAge := SpectrumStartAge;
  ToAge := SpectrumEndAge;

  NewContinentID := 'UND';
  NewAreaID := 'UND';
  NewUnitID := 'UNDEFINED';
  NewLithologyID := 'Not defined';
  NewMaterialID := 'nd';
  NewIsotopeSystemID := 'UPb';
  NewApproachID := 'PbPb';
  NewTechniqueID := 'TIMSE';
  NewInterpretationID := 'Cryst';
  NewRatingNum := '1';
  NewMethodID := 'R';
  NewAgeUnit := 'Ma';
  NewReferenceID := 'not defined';
  NewAge := 1.0;
  NewAgePError := 1.0;
  NewAgeMError := 1.0;
  NewLaboratory := 'nd';
  NewSample := 'New';
  NewProvince := 'Undefined';
  NewTerrane := 'Undefined';

  ReferenceStartFrom := 'A';
  ReferenceEndWith := 'zz';
  SampleStartFrom := 'A';
  SampleEndWith := 'zz';
  UnitStartFrom := 'A';
  UnitEndWith := 'zz';
  StartAtZ := 0.0;
  EndAtZ := 200.0;
  IncludeCoordinates := false;
  NELat := '  90.0';
  NELon := ' 180.0';
  SWLat := ' -90.0';
  SWLon := '-180.0';

  Parameter2Chosen := 'SmNd';

  GetCookies;

  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TIWUserSession.SetCookies;
var
  //tmpString : string;
  i : integer;
  AStringList : TStringList;
  iMaxSampleValues : integer;
  iNumSampleValues : integer;
begin
  iMaxSampleValues := 100;
  //iNumSampleValues := iMaxSampleValues;
  AStringList := TStringList.Create;
  try
    AStringList.Clear;
    //AStringList.Add('URLonTerminate='+URLonTerminate);
    if IncludeGDUValues then
    begin
      AStringList.Add('PlateModelValue='+PlateModelValue);
      AStringList.Add('IncludeGDUValues='+IntToStr(GDUValues.Count));
      for i := 1 to GDUValues.Count do
      begin
        AStringList.Add('GDUValues='+GDUValues.Strings[i-1]);
      end;
    end;
    if IncludeContinentValues then
    begin
      AStringList.Add('IncludeContinentValues='+IntToStr(ContinentValues.Count));
      for i := 1 to ContinentValues.Count do
      begin
        AStringList.Add('ContinentValues='+ContinentValues.Strings[i-1]);
      end;
    end;
    if IncludeAreaValues then
    begin
      AStringList.Add('IncludeAreaValues='+IntToStr(AreaValues.Count));
      for i := 1 to AreaValues.Count do
      begin
        AStringList.Add('AreaValues='+AreaValues.Strings[i-1]);
      end;
    end;
    if IncludeUnitValues then
    begin
      AStringList.Add('IncludeUnitValues='+IntToStr(UnitValues.Count));
      for i := 1 to UnitValues.Count do
      begin
        AStringList.Add('UnitValues='+UnitValues.Strings[i-1]);
      end;
    end;
    if IncludeLithologyValues then
    begin
      AStringList.Add('IncludeLithologyValues='+IntToStr(LithologyValues.Count));
      for i := 1 to LithologyValues.Count do
      begin
        AStringList.Add('LithologyValues='+LithologyValues.Strings[i-1]);
      end;
    end;
    if IncludeIgneous then AStringList.Add('IncludeIgneous='+IntToStr(1))
                                  else AStringList.Add('IncludeIgneous='+IntToStr(0));
    if IncludeSedimentary then AStringList.Add('IncludeSedimentary='+IntToStr(1))
                                      else AStringList.Add('IncludeSedimentary='+IntToStr(0));
    if IncludeMetamorphicAndOther then AStringList.Add('IncludeMetamorphicAndOther='+IntToStr(1))
                                              else AStringList.Add('IncludeMetamorphicAndOther='+IntToStr(0));
    if IncludeMaterialValues then
    begin
      AStringList.Add('IncludeMaterialValues='+IntToStr(MaterialValues.Count));
      for i := 1 to MaterialValues.Count do
      begin
        AStringList.Add('MaterialValues='+MaterialValues.Strings[i-1]);
      end;
    end;
    if IncludeMethodValues then
    begin
      AStringList.Add('IncludeMethodValues='+IntToStr(MethodValues.Count));
      for i := 1 to MethodValues.Count do
      begin
        AStringList.Add('MethodValues='+MethodValues.Strings[i-1]);
      end;
    end;
    if IncludeIsotopeSystemValues then
    begin
      AStringList.Add('IncludeIsotopeSystemValues='+IntToStr(IsotopeSystemValues.Count));
      for i := 1 to IsotopeSystemValues.Count do
      begin
        AStringList.Add('IsotopeSystemValues='+IsotopeSystemValues.Strings[i-1]);
      end;
    end;
    if IncludeInterpretationValues then
    begin
      AStringList.Add('IncludeInterpretationValues='+IntToStr(InterpretationValues.Count));
      for i := 1 to InterpretationValues.Count do
      begin
        AStringList.Add('InterpretationValues='+InterpretationValues.Strings[i-1]);
      end;
    end;
    if IncludeApproachValues then
    begin
      AStringList.Add('IncludeApproachValues='+IntToStr(ApproachValues.Count));
      for i := 1 to ApproachValues.Count do
      begin
        AStringList.Add('ApproachValues='+ApproachValues.Strings[i-1]);
      end;
    end;
    if IncludeTechniqueValues then
    begin
      AStringList.Add('IncludeTechniqueValues='+IntToStr(TechniqueValues.Count));
      for i := 1 to TechniqueValues.Count do
      begin
        AStringList.Add('TechniqueValues='+TechniqueValues.Strings[i-1]);
      end;
    end;
    if IncludeGroupValues then
    begin
      AStringList.Add('IncludeGroupValues='+IntToStr(GroupValues.Count));
      for i := 1 to GroupValues.Count do
      begin
        AStringList.Add('GroupValues='+GroupValues.Strings[i-1]);
      end;
    end;
    if IncludeProvinceValues then
    begin
      AStringList.Add('IncludeProvinceValues='+IntToStr(ProvinceValues.Count));
      for i := 1 to ProvinceValues.Count do
      begin
        AStringList.Add('ProvinceValues='+ProvinceValues.Strings[i-1]);
      end;
    end;
    if IncludeTerraneValues then
    begin
      AStringList.Add('IncludeTerraneValues='+IntToStr(TerraneValues.Count));
      for i := 1 to TerraneValues.Count do
      begin
        AStringList.Add('TerraneValues='+TerraneValues.Strings[i-1]);
      end;
    end;
    if IncludeOrogenicPeriodValues then
    begin
      AStringList.Add('IncludeOrogenicPeriodValues='+IntToStr(OrogenicPeriodValues.Count));
      for i := 1 to OrogenicPeriodValues.Count do
      begin
        AStringList.Add('OrogenicPeriodValues='+OrogenicPeriodValues.Strings[i-1]);
      end;
    end;
    if IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(ReferenceValues.Count));
      for i := 1 to ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+ReferenceValues.Strings[i-1]);
      end;
    end;
    if IncludeChemicalTypeValues then
    begin
      AStringList.Add('IncludeChemicalTypeValues='+IntToStr(ChemicalTypeValues.Count));
      for i := 1 to ChemicalTypeValues.Count do
      begin
        AStringList.Add('ChemicalTypeValues='+ChemicalTypeValues.Strings[i-1]);
      end;
    end;
    if IncludeBoundaryPositionValues then
    begin
      AStringList.Add('IncludeBoundaryPositionValues='+IntToStr(BoundaryPositionValues.Count));
      for i := 1 to BoundaryPositionValues.Count do
      begin
        AStringList.Add('BoundaryPositionValues='+BoundaryPositionValues.Strings[i-1]);
      end;
    end;
    if IncludeBoundaryValues then
    begin
      AStringList.Add('IncludeBoundaryValues='+IntToStr(BoundaryValues.Count));
      for i := 1 to BoundaryValues.Count do
      begin
        AStringList.Add('BoundaryValues='+BoundaryValues.Strings[i-1]);
      end;
    end;
    if IncludeValidationValues then
    begin
      AStringList.Add('IncludeValidationValues='+IntToStr(ValidationValues.Count));
      for i := 1 to ValidationValues.Count do
      begin
        AStringList.Add('ValidationValues='+ValidationValues.Strings[i-1]);
      end;
    end;
    if IncludeWhoForValues then
    begin
      AStringList.Add('IncludeWhoForValues='+IntToStr(WhoForValues.Count));
      for i := 1 to WhoForValues.Count do
      begin
        AStringList.Add('WhoForValues='+WhoForValues.Strings[i-1]);
      end;
    end;
    if IncludePlateValues then
    begin
      AStringList.Add('IncludeGDUValues='+IntToStr(GDUValues.Count));
      for i := 1 to GDUValues.Count do
      begin
        AStringList.Add('GDUValues='+GDUValues.Strings[i-1]);
      end;
    end;
    if IncludeLIPValues then
    begin
      AStringList.Add('IncludeLIPValues='+IntToStr(LIPValues.Count));
      for i := 1 to LIPValues.Count do
      begin
        AStringList.Add('LIPValues='+LIPValues.Strings[i-1]);
      end;
    end;
    if IncludeAgeUnitsValue then
    begin
      AStringList.Add('IncludeAgeUnitsValue='+IntToStr(1));
      AStringList.Add('AgeUnitsValue='+AgeUnitsValue);
    end;
    if IncludeIsochronOnlyValue then
    begin
      AStringList.Add('IncludeIsochronOnlyValues='+IntToStr(1));
    end;
    if IncludeDateFromValue then
    begin
      AStringList.Add('IncludeDateFromValue='+IntToStr(1));
      AStringList.Add('DateFromField='+DateFromField);
    end;
    if IncludeDateToValue then
    begin
      AStringList.Add('IncludeDateToValue='+IntToStr(1));
      AStringList.Add('DateToField='+DateToField);
    end;
    if IncludeEpsilonFromValue then
    begin
      AStringList.Add('IncludeEpsilonFromValue='+IntToStr(1));
      AStringList.Add('EpsilonFromValue='+EpsilonFromValue);
    end;
    if IncludeEpsilonToValue then
    begin
      AStringList.Add('IncludeEpsilonToValue='+IntToStr(1));
      AStringList.Add('EpsilonToValue='+EpsilonToValue);
    end;
    if IncludeUsersContributedValues then
    begin
      AStringList.Add('IncludeUsersContributedValues='+IntToStr(UsersContributedValues.Count));
      for i := 1 to UsersContributedValues.Count do
      begin
        AStringList.Add('UsersContributedValues='+UsersContributedValues.Strings[i-1]);
      end;
    end;
    AStringList.Add('PreferenceLevelValue='+PreferenceLevelValue);
    AStringList.Add('ConfidentialValue='+ConfidentialValue);
    AStringList.Add('IncludeDecayUncertaintyValues='+IntToStr(DecayUncertaintyValues.Count));
    for i := 1 to DecayUncertaintyValues.Count do
    begin
      AStringList.Add('DecayUncertaintyValues='+DecayUncertaintyValues.Strings[i-1]);
    end;
    //AStringList.Add('DateUnitsValue='+DateUnitsValue);
    if IncludeCoordinates then
    begin
      AStringList.Add('IncludeCoordinates='+IntToStr(1));
      AStringList.Add('NELat='+NELat);
      AStringList.Add('NELon='+NELon);
      AStringList.Add('SWLat='+SWLat);
      AStringList.Add('SWLon='+SWLon);
    end;
    if IncludeRecordIDValueRange then
    begin
      AStringList.Add('IncludeRecordIDValues='+IntToStr(1));
      AStringList.Add('RecordIDValueFrom='+RecordIDValueFrom);
      AStringList.Add('RecordIDValueTo='+RecordIDValueTo);
    end;
    if IncludeSampleValues then
    begin
      iNumSampleValues := SampleValues.Count;
      if (SampleValues.Count > iMaxSampleValues) then  iNumSampleValues := iMaxSampleValues;
      AStringList.Add('IncludeSampleValues='+IntToStr(SampleValues.Count));
      for i := 1 to iNumSampleValues do
      begin
        AStringList.Add('SampleValues='+SampleValues.Strings[i-1]);
      end;
    end;
    if IncludeSampleZoneValues then
    begin
      AStringList.Add('IncludeSampleZoneValues='+IntToStr(SampleZoneValues.Count));
      for i := 1 to SampleZoneValues.Count do
      begin
        AStringList.Add('SampleZoneValues='+SampleZoneValues.Strings[i-1]);
      end;
    end;
    AStringList.Add('SampleStartFrom='+SampleStartFrom);
    AStringList.Add('SampleEndWith='+SampleEndWith);
    AStringList.Add('ReferenceStartFrom='+ReferenceStartFrom);
    AStringList.Add('ReferenceEndWith='+ReferenceEndWith);
    AStringList.Add('UnitStartFrom='+UnitStartFrom);
    AStringList.Add('UnitEndWith='+UnitEndWith);
    if IncludeUserOrgID then
    begin
      AStringList.Add('IncludeUserOrgID='+IntToStr(1));
      AStringList.Add('IncludeUserOrgIDValue='+UserOrgIDValue);
    end;
    AStringList.Add('OrderByValue='+OrderByValue);
    if CanInsert then
    begin
      AStringList.Add('NewContinentID='+NewContinentID);
      AStringList.Add('NewAreaID='+NewAreaID);
      AStringList.Add('NewUnitID='+NewUnitID);
      AStringList.Add('NewLithologyID='+NewLithologyID);
      AStringList.Add('NewMaterialID='+NewMaterialID);
      AStringList.Add('NewIsotopeSystemID='+NewIsotopeSystemID);
      AStringList.Add('NewApproachID='+NewApproachID);
      AStringList.Add('NewTechniqueID='+NewTechniqueID);
      AStringList.Add('NewInterpretationID='+NewInterpretationID);
      AStringList.Add('NewRatingNum='+NewRatingNum);
      AStringList.Add('NewMethodID='+NewMethodID);
      AStringList.Add('NewAgeUnit='+NewAgeUnit);
      AStringList.Add('NewReferenceID='+NewReferenceID);
      AStringList.Add('NewLaboratoryID='+NewLaboratory);
      AStringList.Add('NewSampleID='+NewSample);
      AStringList.Add('NewProvinceID='+NewProvince);
      AStringList.Add('NewTerraneID='+NewTerrane);
    end;
    AStringList.Add('FlexcelExportExtension='+FlexcelExportExtension);
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      dmUser.cdsCookieInfo.Edit;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end else
    begin
      dmUser.cdsCookieInfo.Append;
      dmUser.cdsCookieInfoUSERID.AsString := UserID;
      dmUser.cdsCookieInfoSOFTWAREID.AsString := ThisProgram;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end;
    dmUser.cdsCookieInfo.ApplyUpdates(0);
  finally
    AStringList.Free;
  end;
end;

procedure TIWUserSession.GetCookies;
var
  //tmpString : string;
  i, tmpi, iCode : integer;
  //tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    //URLonTerminate := AStringList.Values['URLonTerminate'];
    Val(AStringList.Values['IncludeGDUValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      PlateModelValue := AStringList.Values['PlateModelValue'];
      IncludeGDUValues := true;
      GetStringsValues(AStringList,'GDUValues',GDUValues);
    end;
    Val(AStringList.Values['IncludeContinentValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeContinentValues := true;
      GetStringsValues(AStringList,'ContinentValues',ContinentValues);
    end;
    Val(AStringList.Values['IncludeAreaValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeAreaValues := true;
      GetStringsValues(AStringList,'AreaValues',AreaValues);
    end;
    Val(AStringList.Values['IncludeUnitValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeUnitValues := true;
      GetStringsValues(AStringList,'UnitValues',UnitValues);
    end;
    Val(AStringList.Values['IncludeLithologyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeLithologyValues := true;
      GetStringsValues(AStringList,'LithologyValues',LithologyValues);
    end;
    IncludeIgneous := false;
    Val(AStringList.Values['IncludeIgneous'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeIgneous := true;
    end;
    IncludeSedimentary := false;
    Val(AStringList.Values['IncludeSedimentary'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSedimentary := true;
    end;
    IncludeMetamorphicAndOther := false;
    Val(AStringList.Values['IncludeMetamorphicAndOther'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeMetamorphicAndOther := true;
    end;
    Val(AStringList.Values['IncludeMaterialValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeMaterialValues := true;
      GetStringsValues(AStringList,'MaterialValues',MaterialValues);
    end;
    Val(AStringList.Values['IncludeMethodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeMethodValues := true;
      GetStringsValues(AStringList,'MethodValues',MethodValues);
    end;
    Val(AStringList.Values['IncludeIsotopeSystemValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeIsotopeSystemValues := true;
      GetStringsValues(AStringList,'IsotopeSystemValues',IsotopeSystemValues);
    end;
    Val(AStringList.Values['IncludeInterpretationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeInterpretationValues := true;
      GetStringsValues(AStringList,'InterpretationValues',InterpretationValues);
    end;
    Val(AStringList.Values['IncludeApproachValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeApproachValues := true;
      GetStringsValues(AStringList,'ApproachValues',ApproachValues);
    end;
    Val(AStringList.Values['IncludeTechniqueValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeTechniqueValues := true;
      GetStringsValues(AStringList,'TechniqueValues',TechniqueValues);
    end;
    Val(AStringList.Values['IncludeGroupValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeGroupValues := true;
      GetStringsValues(AStringList,'GroupValues',GroupValues);
    end;
    Val(AStringList.Values['IncludeProvinceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeProvinceValues := true;
      GetStringsValues(AStringList,'ProvinceValues',ProvinceValues);
    end;
    Val(AStringList.Values['IncludeTerraneValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeTerraneValues := true;
      GetStringsValues(AStringList,'TerraneValues',TerraneValues);
    end;
    Val(AStringList.Values['IncludeOrogenicPeriodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeOrogenicPeriodValues := true;
      GetStringsValues(AStringList,'OrogenicPeriodValues',OrogenicPeriodValues);
    end;
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeReferenceValues := true;
      GetStringsValues(AStringList,'ReferenceValues',ReferenceValues);
    end;
    Val(AStringList.Values['IncludeChemicalTypeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeChemicalTypeValues := true;
      GetStringsValues(AStringList,'ChemicalTypeValues',ChemicalTypeValues);
    end;
    Val(AStringList.Values['IncludeBoundaryPositionValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeBoundaryPositionValues := true;
      GetStringsValues(AStringList,'BoundaryPositionValues',BoundaryPositionValues);
    end;
    Val(AStringList.Values['IncludeBoundaryValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeBoundaryValues := true;
      GetStringsValues(AStringList,'BoundaryValues',BoundaryValues);
    end;
    Val(AStringList.Values['IncludeValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeValidationValues := true;
      GetStringsValues(AStringList,'ValidationValues',ValidationValues);
    end;
    Val(AStringList.Values['IncludeWhoForValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeWhoForValues := true;
      GetStringsValues(AStringList,'WhoForValues',WhoForValues);
    end;
    Val(AStringList.Values['IncludeLIPValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeLIPValues := true;
      GetStringsValues(AStringList,'LIPValues',LIPValues);
    end;
    Val(AStringList.Values['IncludeUsersContributedValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeUsersContributedValues := true;
      GetStringsValues(AStringList,'UsersContributedValues',UsersContributedValues);
    end;
    Val(AStringList.Values['IncludeAgeUnitsValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeAgeUnitsValue := true;
      AgeUnitsValue := AStringList.Values['AgeUnitsValue'];
    end;
    Val(AStringList.Values['IncludeIsochronOnlyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeIsochronOnlyValue := true;
    end;
    Val(AStringList.Values['IncludeDateFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDateFromValue := true;
      DateFromField := AStringList.Values['DateFromField'];
    end;
    Val(AStringList.Values['IncludeDateToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDateToValue := true;
      DateToField := AStringList.Values['DateToField'];
    end;
    Val(AStringList.Values['IncludeEpsilonFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeEpsilonFromValue := true;
      EpsilonFromValue := AStringList.Values['EpsilonFromValue'];
    end;
    Val(AStringList.Values['IncludeEpsilonToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeEpsilonToValue := true;
      EpsilonToValue := AStringList.Values['EpsilonToValue'];
    end;
    PreferenceLevelValue := AStringList.Values['PreferenceLevelValue'];
    ConfidentialValue := AStringList.Values['ConfidentialValue'];
    Val(AStringList.Values['IncludeDecayUncertaintyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      GetStringsValues(AStringList,'DecayUncertaintyValues',DecayUncertaintyValues);
      for i := 1 to tmpi do
      begin
        //dmUser.SetDeveloperData(DecayUncertaintyValues[i-1]);
      end;
    end;
    //DateUnitsValue := AStringList.Values['DateUnitsValue'];
    Val(AStringList.Values['IncludeCoordinates'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeCoordinates := true;
      NELat := AStringList.Values['NELat'];
      NELon := AStringList.Values['NELon'];
      SWLat := AStringList.Values['SWLat'];
      SWLon := AStringList.Values['SWLon'];
    end;
    Val(AStringList.Values['IncludeRecordIDValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeRecordIDValueRange := true;
      RecordIDValueFrom := AStringList.Values['RecordIDValueFrom'];
      RecordIDValueTo := AStringList.Values['RecordIDValueTo'];
    end;
    Val(AStringList.Values['IncludeSampleValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSampleValues := true;
      GetStringsValues(AStringList,'SampleValues',SampleValues);
    end;
    Val(AStringList.Values['IncludeSampleZoneValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSampleZoneValues := true;
      GetStringsValues(AStringList,'SampleZoneValues',SampleZoneValues);
    end;
    SampleStartFrom := AStringList.Values['SampleStartFrom'];
    SampleEndWith := AStringList.Values['SampleEndWith'];
    ReferenceStartFrom := AStringList.Values['ReferenceStartFrom'];
    ReferenceEndWith := AStringList.Values['ReferenceEndWith'];
    UnitStartFrom := AStringList.Values['UnitStartFrom'];
    UnitEndWith := AStringList.Values['UnitEndWith'];
    //WebApplication.ShowMessage('NELat is '+NELat);
    //WebApplication.ShowMessage('NELon is '+NELon);
    Val(AStringList.Values['IncludeUserOrgID'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeUserOrgID := true;
      UserOrgIDValue := AStringList.Values['IncludeUserOrgIDValue'];
    end;
    OrderByValue := AStringList.Values['OrderByValue'];
    if CanInsert then
    begin
      NewContinentID := AStringList.Values['NewContinentID'];
      NewAreaID := AStringList.Values['NewAreaID'];
      NewUnitID := AStringList.Values['NewUnitID'];
      NewLithologyID := AStringList.Values['NewLithologyID'];
      NewMaterialID := AStringList.Values['NewMaterialID'];
      NewIsotopeSystemID := AStringList.Values['NewIsotopeSystemID'];
      NewApproachID := AStringList.Values['NewApproachID'];
      NewTechniqueID := AStringList.Values['NewTechniqueID'];
      NewInterpretationID := AStringList.Values['NewInterpretationID'];
      NewRatingNum := AStringList.Values['NewRatingNum'];
      NewMethodID := AStringList.Values['NewMethodID'];
      NewAgeUnit := AStringList.Values['NewAgeUnit'];
      NewReferenceID := AStringList.Values['NewReferenceID'];
      NewLaboratory := AStringList.Values['NewLaboratoryID'];
      NewSample := AStringList.Values['NewSampleID'];
      NewProvince := AStringList.Values['NewProvinceID'];
      NewTerrane := AStringList.Values['NewTerraneID'];
    end;
    FlexcelExportExtension := AStringList.Values['FlexcelExportExtension'];
    FlexcelExportExtension := UpperCase(FlexcelExportExtension);
    if (FlexcelExportExtension = '.XLSX') then FlexcelExportType := et_Xlsx;
    if (FlexcelExportExtension = '.XLS') then FlexcelExportType := et_Xls;
    if (FlexcelExportExtension = '.CSV') then FlexcelExportType := et_Csv;
    if (FlexcelExportExtension = '.HTML') then FlexcelExportType := et_Html;
    if (FlexcelExportExtension = '.PDF') then FlexcelExportType := et_Pdf;
  finally
    AStringList.Free;
  end;
end;


end.
