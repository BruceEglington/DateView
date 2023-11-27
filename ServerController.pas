unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  IWApplication, IWAppForm, IW.Browser.Browser,
  IW.HTTP.Request, IW.HTTP.Reply,
  Windows,
  IWGlobal,
  // For OnNewSession Event
  IniFiles,
  midaslib,
  DVIW_constants,
  usrIW_dm, DVIW_dmopt, DVIW_dm, DVIW_dmstrat,
  DVIW_dmdata, DVIW_dmgraphics;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
  private
    procedure GetIniFile;
  public
  end;

  TExportType = (
    et_Xls,
    et_Xlsx,
    et_Csv,
    et_Pdf,
    et_Html
  );

  TUserSession = class(TComponent)
  public
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    UserID : string;
    ThisProgram : string;
    ThisProgramName : string;
    UserPassword,
    UserDisplayName : string;
    //URLonTerminate : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanExport : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    //UserSessionID : integer;
    ThisLoginTime : TDateTime;
    DoMemCheck : boolean;
    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    Parameter2Chosen : string;
    GoDirectToGraphs : boolean;
    DataHaveChanged : boolean;
    PDFHasChanged : boolean;

    NumRecordsPerPage : integer;
    PageNum, PageNumTotal : integer;

    NumRecordsFound : integer;
    AgeChosen : double;

    IncludeContinentValues : boolean;
    IncludeAreaValues : boolean;
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
    IncludeReferenceValues: Boolean;
    IncludeChemicalTypeValues: Boolean;
    IncludeBoundaryPositionValues: Boolean;
    IncludeBoundaryValues: Boolean;
    IncludeValidationValues: Boolean;
    IncludeWhoForValues: Boolean;
    IncludePlateValues: Boolean;
    IncludeAgeUnitsValue: Boolean;
    AgeUnitsValue: string;
    PreferenceLevelValue: string;
    ConfidentialValue: string;
    IncludeIsochronOnlyValue: Boolean;
    IncludeIgneous, IncludeSedimentary,
    IncludeMetamorphicAndOther : boolean;

    ContinentValues : TStringList;
    AreaValues : TStringList;
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
    ReferenceValues: TStringList;
    ChemicalTypeValues: TStringList;
    BoundaryPositionValues: TStringList;
    BoundaryValues: TStringList;
    ValidationValues: TStringList;
    WhoForValues: TStringList;
    PlateValues: TStringList;
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

    FromAge, ToAge : double;

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
    //dmReplicate : TdmReplicate;


    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCookies;
    procedure GetCookies;
    function LocalDateTimeFromUTCDateTime(const UTCDateTime: TDateTime): TDateTime;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure MakeDonation(AForm: TIWAppFormClass);
    procedure AfterDonate;
    procedure CheckGetIniFile;
  end;

// Procs
  function UserSession: TUserSession;
  function IWServerController: TIWServerController;


implementation

{$R *.dfm}

uses
  System.IOUtils,
  IWInit, usr_insufficientright, usr_uDBInterface, usr_uDonate,
  DVIW_uMain, usr_uForgotten, usr_uLogin, usr_uRegister, usr_constants;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TUserSession.Create(nil);  //note this is a TUserSession
                                              //NOT to be confused with TIWUserSession
  GetIniFile;
end;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

{
LocalDateTime := TTimeZone.Local.ToLocalTime(UniversalDateTime);
In the other direction use ToUniversalTime
SystemTimeToTzSpecificLocalTimeEx instead of FileTimeToLocalFileTime



you can use TzSpecificLocalTimeToSystemTime and SystemTimeToTzSpecificLocalTime from kernel32.

var
  Form1: TForm1;

function TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation: PTimeZoneInformation; var lpLocalTime, lpUniversalTime: TSystemTime): BOOL; stdcall;
function SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation: PTimeZoneInformation; var lpUniversalTime,lpLocalTime: TSystemTime): BOOL; stdcall;

implementation

function TzSpecificLocalTimeToSystemTime; external kernel32 name 'TzSpecificLocalTimeToSystemTime';
function SystemTimeToTzSpecificLocalTime; external kernel32 name 'SystemTimeToTzSpecificLocalTime';


Function DateTime2UnivDateTime(d:TDateTime):TDateTime;
var
 TZI:TTimeZoneInformation;
 LocalTime, UniversalTime:TSystemTime;
begin
  GetTimeZoneInformation(tzi);
  DateTimeToSystemTime(d,LocalTime);
  TzSpecificLocalTimeToSystemTime(@tzi,LocalTime,UniversalTime);
  Result := SystemTimeToDateTime(UniversalTime);

end;

Function UnivDateTime2LocalDateTime(d:TDateTime):TDateTime;
var
 TZI:TTimeZoneInformation;
 LocalTime, UniversalTime:TSystemTime;
begin
  GetTimeZoneInformation(tzi);
  DateTimeToSystemTime(d,UniversalTime);
  SystemTimeToTzSpecificLocalTime(@tzi,UniversalTime,LocalTime);
  Result := SystemTimeToDateTime(LocalTime);
end;


procedure TForm1.Button1Click(Sender: TObject);
var

 Date,Univdate,DateAgain:TDateTime;

begin
  Date := Now;
  Univdate := DateTime2UnivDateTime(Date);
  DateAgain := UnivDateTime2LocalDateTime(Univdate);
  Showmessage(DateTimeToStr(Date) +#13#10 + DateTimeToStr(Univdate)+#13#10 + DateTimeToStr(DateAgain));
end;

There is a small mistake in the code above. In UnivDateTime2LocalDateTime,
the line DateTimeToSystemTime(d,LocalTime); should read DateTimeToSystemTime(d,UniversalTime);




function NowUTC: TDateTime;
Var UTC: TSystemTime;
begin
  GetSystemTime(UTC);
  Result := SystemTimeToDateTime(UTC);
end;

function UTCToLocal(UTC: TDateTime): TDateTime;
begin
  Result := IncMinute(UTC, UTCToLocalTimeOffsetMinutes);
end;

function UTCToLocalTimeOffsetMinutes: Int16;
Var UTC: TSystemTime;
    UTC2: TSystemTime;
    t  : TDateTime;
    t2 : TDateTime;
begin
  GetSystemTime(UTC);
  GetLocalTime(UTC2);
  t  := SystemTimeToDateTime(UTC);
  t2 := SystemTimeToDateTime(UTC2);
  Result := System.DateUtils.MinutesBetween(t,t2);
end;


}

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  //tmpStr   : string;
  //iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  DBUserName, DBPassword,
  //DBSpecific,
  DBSQLDialectStr,DBCharSet,
  //DataPath   : string;
  PublicPath : string;
begin
  // --------------------------------------------------------------------------------
  //
  // uses GetPublicPath i.e. based on INI file in the PrgramData folder of subfolders
  //
  // --------------------------------------------------------------------------------
  URLBase := '/';
  DBMonitor := 'Active';
  UserSession.ShowDebugButtons := false;
  UserSession.DelayConnections := false;
  UserControlPath := 'bromo2.usask.ca:s:\Data\Firebird\UserControl2021v30.fdb';
  StratDBPath := 'bromo2.usask.ca:s:\Data\Firebird\StratDB2021v30.fdb';
  DateViewPath := 'bromo2.usask.ca:s:\Data\Firebird\DateView2021v30.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  PublicPath := TPath.GetPublicPath;
  //PublicPath := TPath.GetHomePath;  //changed to HomePath to see if this is cause of program not working on Thera2
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'dateview.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/dateview');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','bromo2.usask.ca:s:\Data\Firebird\UserControl2021v30.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','bromo2.usask.ca:s:\Data\Firebird\StratDB2021v30.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','bromo2.usask.ca:s:\Data\Firebird\DateView2021v30.fdb');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Inactive');
    DebugButtons := AppIni.ReadString('Debug','Buttons','InActive');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;

    FromEmailAddress := AppIni.ReadString('Email','FromEmailAddress','aht820@usask.ca');
    FromName := AppIni.ReadString('Email','FromName','EggSoft developer and database administrator');
    HostName := AppIni.ReadString('Email','HostName','smtp.office365.com');
    HostPort := AppIni.ReadString('Email','HostPort','587');
    EmailUserID := AppIni.ReadString('Email','EmailUserID','aht820@usask.ca');
    EmailPassword := AppIni.ReadString('Email','EmailPassword','nuC7Sy3Af4bu');
    URLonTerminate := AppIni.ReadString('URL','URLonTerminate','https://sil.usask.ca');
    FromEmailAddress := Trim(FromEmailAddress);
    FromName := Trim(FromName);
    HostName := Trim(HostName);
    HostPort := Trim(HostPort);
    EmailUserID := Trim(EmailUserID);
    EmailPassword := Trim(EmailPassword);
    URLonTerminate := Trim(URLonTerminate);
    {
    DriverName=DevartInterBase
    DataBase=bromo:f:\data\firebird\usercontrol2011v25.fdb
    RoleName=
    User_Name=SYSDBA
    Password=masterkey
    SQLDialect=3
    BlobSize=-1
    ErrorResourceFile=
    LocaleCode=0000
    DevartInterBase TransIsolation=ReadCommitted
    WaitOnLocks=True
    Charset=ASCII
    CharLength=1
    EnableBCD=True
    OptimizedNumerics=True
    LongStrings=True
    UseQuoteChar=False
    FetchAll=False
    UseUnicode=False
  }
  //define connection parameters for UserControl connection
  dmUser.sqlcWebUser.Connected := false;
  dmUser.sqlcWebUser.Params.Clear;
  dmUser.sqlcWebUser.DriverName := DriverName;
  dmUser.sqlcWebUser.LibraryName := LibraryName;
  dmUser.sqlcWebUser.VendorLib := VendorLib;
  dmUser.sqlcWebUser.GetDriverFunc := GetDriverFunc;
  dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
  dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
  dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
  dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
  dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
  dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
  dmUser.sqlcWebUser.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
  dmUser.sqlcWebUser.Params.Append('CharLength=1');
  dmUser.sqlcWebUser.Params.Append('EnableBCD=True');
  dmUser.sqlcWebUser.Params.Append('OptimizedNumerics=False');
  dmUser.sqlcWebUser.Params.Append('LongStrings=True');
  dmUser.sqlcWebUser.Params.Append('UseQuoteChar=False');
  dmUser.sqlcWebUser.Params.Append('FetchAll=False');
  dmUser.sqlcWebUser.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB connection
  dmStrat.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Params.Clear;
  dmStrat.sqlcStrat.LibraryName := LibraryName;
  dmStrat.sqlcStrat.VendorLib := VendorLib;
  dmStrat.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmStrat.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStrat.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStrat.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStrat.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStrat.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStrat.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStrat.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStrat.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmStrat.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStrat.sqlcStrat.Params.Append('CharLength=1');
  dmStrat.sqlcStrat.Params.Append('EnableBCD=True');
  dmStrat.sqlcStrat.Params.Append('OptimizedNumerics=False');
  dmStrat.sqlcStrat.Params.Append('LongStrings=True');
  dmStrat.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStrat.sqlcStrat.Params.Append('FetchAll=False');
  dmStrat.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB charts connection
  dmgDV.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Params.Clear;
  dmgDV.sqlcDateView.LibraryName := LibraryName;
  dmgDV.sqlcDateView.VendorLib := VendorLib;
  dmgDV.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmgDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmgDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmgDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmgDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmgDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmgDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmgDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmgDV.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmgDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmgDV.sqlcDateView.Params.Append('CharLength=1');
  dmgDV.sqlcDateView.Params.Append('EnableBCD=True');
  dmgDV.sqlcDateView.Params.Append('OptimizedNumerics=False');
  dmgDV.sqlcDateView.Params.Append('LongStrings=True');
  dmgDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmgDV.sqlcDateView.Params.Append('FetchAll=False');
  dmgDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB data connection
  dmdDV.sqlcDateView.Connected := false;
  dmdDV.sqlcDateView.Params.Clear;
  dmdDV.sqlcDateView.LibraryName := LibraryName;
  dmdDV.sqlcDateView.VendorLib := VendorLib;
  dmdDV.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmdDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmdDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmdDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmdDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmdDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmdDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmdDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmdDV.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmdDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmdDV.sqlcDateView.Params.Append('CharLength=1');
  dmdDV.sqlcDateView.Params.Append('EnableBCD=True');
  dmdDV.sqlcDateView.Params.Append('OptimizedNumerics=False');
  dmdDV.sqlcDateView.Params.Append('LongStrings=True');
  dmdDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmdDV.sqlcDateView.Params.Append('FetchAll=False');
  dmdDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for DateView connection
  dmDV.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Params.Clear;
  dmDV.sqlcDateView.LibraryName := LibraryName;
  dmDV.sqlcDateView.VendorLib := VendorLib;
  dmDV.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmDV.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmDV.sqlcDateView.Params.Append('CharLength=1');
  dmDV.sqlcDateView.Params.Append('EnableBCD=True');
  dmDV.sqlcDateView.Params.Append('OptimizedNumerics=False');
  dmDV.sqlcDateView.Params.Append('LongStrings=True');
  dmDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmDV.sqlcDateView.Params.Append('FetchAll=False');
  dmDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for Options connection
  dmOpt.sqlcDateView.Connected := false;
  dmOpt.sqlcDateView.Params.Clear;
  dmOpt.sqlcDateView.LibraryName := LibraryName;
  dmOpt.sqlcDateView.VendorLib := VendorLib;
  dmOpt.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmOpt.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmOpt.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmOpt.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmOpt.sqlcDateView.Params.Append('Password='+DBPassword);
  dmOpt.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmOpt.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmOpt.sqlcDateView.Params.Append('LocaleCode=0000');
  dmOpt.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmOpt.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmOpt.sqlcDateView.Params.Append('CharLength=1');
  dmOpt.sqlcDateView.Params.Append('EnableBCD=True');
  dmOpt.sqlcDateView.Params.Append('OptimizedNumerics=False');
  dmOpt.sqlcDateView.Params.Append('LongStrings=True');
  dmOpt.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmOpt.sqlcDateView.Params.Append('FetchAll=False');
  dmOpt.sqlcDateView.Params.Append('UseUnicode=False');
  {
  //define connection parameters for Replication connection
  dmReplicate.sqlcStrat.Connected := false;
  dmReplicate.sqlcStrat.Params.Clear;
  dmReplicate.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmReplicate.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmReplicate.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmReplicate.sqlcStrat.Params.Append('Password='+DBPassword);
  dmReplicate.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmReplicate.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmReplicate.sqlcStrat.Params.Append('LocaleCode=0000');
  dmReplicate.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmReplicate.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmReplicate.sqlcStrat.Params.Append('CharLength=1');
  dmReplicate.sqlcStrat.Params.Append('EnableBCD=True');
  dmReplicate.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmReplicate.sqlcStrat.Params.Append('LongStrings=True');
  dmReplicate.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmReplicate.sqlcStrat.Params.Append('FetchAll=False');
  dmReplicate.sqlcStrat.Params.Append('UseUnicode=False');
  }
  if (DBMonitor = 'Active') then
  begin
    dmUser.SQLMonitor1.Active := true;
    dmStrat.SQLMonitor1.Active := true;
    dmgDV.SQLMonitor1.Active := true;
    dmDV.SQLMonitor1.Active := true;
    dmOpt.SQLMonitor1.Active := true;
    //dmReplicate.SQLMonitor1.Active := true;
  end else
  begin
    dmUser.SQLMonitor1.Active := false;
    dmStrat.SQLMonitor1.Active := false;
    dmgDV.SQLMonitor1.Active := false;
    dmDV.SQLMonitor1.Active := false;
    dmOpt.SQLMonitor1.Active := false;
    //dmReplicate.SQLMonitor1.Active := false;
  end;
  finally
    AppIni.Free;
  end;
  //dmUser.SetDeveloperData('GetIniFile');
  //dmUser.SetDeveloperData('IniFile = '+IniFileName);
  //dmUser.SetDeveloperData('URLBase = '+URLBase);
  //dmUser.SetDeveloperData('UserControlPath = '+UserControlPath);
  //dmUser.SetDeveloperData('StratDBPath = '+StratDBPath);
  //dmUser.SetDeveloperData('DateViewPath = '+DateViewPath);
end;

procedure TUserSession.CheckGetIniFile;
var
  AppIni   : TIniFile;
  //tmpStr   : string;
  //iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  LibraryName, VendorLib, GetDriverFunc,
  DriverName,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  DBUserName, DBPassword,
  //DBSpecific,
  DBSQLDialectStr,DBCharSet,
  //DataPath   : string;
  PublicPath : string;
begin
  PublicPath := TPath.GetPublicPath;
  //PublicPath := TPath.GetHomePath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  URLBase := '/';
  UserSession.ShowDebugButtons := true;
  UserSession.DelayConnections := false;
  UserControlPath := 'localhost:c:/Data/Firebird/UserControl.fdb';
  StratDBPath := 'localhost:c:/Data/Firebird/StratDB.fdb';
  DateViewPath := 'localhost:c:/Data/Firebird/DateView.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  DBMonitor := 'Active';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'dateview.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/dateview');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','bromo2.usask.ca:s:/Data/Firebird/UserControl2015v25.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','bromo2.usask.ca:s:/Data/Firebird/StratDB2015v25.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','bromo2.usask.ca:s:/Data/Firebird/DateView2015v25.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','masterkey');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','active');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;
    dmUser.SetDeveloperData('CheckGetIniFile');
    dmUser.SetDeveloperData('IniFile = '+IniFileName);
    dmUser.SetDeveloperData('URLBase = '+URLBase);
    dmUser.SetDeveloperData('UserControlPath = '+UserControlPath);
    dmUser.SetDeveloperData('StratDBPath = '+StratDBPath);
    dmUser.SetDeveloperData('DateViewPath = '+DateViewPath);
    dmUser.SetDeveloperData('DriverName = '+DriverName);
    dmUser.SetDeveloperData('SQLDialect = '+DBSQLDialectStr);
    dmUser.SetDeveloperData('Charset = '+DBCharset);
  finally
    AppIni.Free;
  end;
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmOpt := TdmOpt.Create(Self);
  dmDV := TdmDV.Create(Self);
  dmStrat := TdmStrat.Create(Self);
  dmgDV := TdmgDV.Create(Self);
  dmdDV := TdmdDV.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmOpt.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmdDV.sqlcDateView.Connected := false;
  //dmReplicate := TdmReplicate.Create(Self);
  //dmReplicate.sqlcStrat.Connected := false;
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
  PlateValues := TStringList.Create;
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

destructor TUserSession.Destroy;
begin
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
  FreeAndNil(PlateValues);
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
  //dmReplicate.sqlcStrat.Connected := false;
  dmdDV.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmOpt.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
var
  //tmpStr : string;
  WasSuccessful : boolean;
begin
  //UserSession.DoMemCheck := false;
  //if UserSession.DoMemCheck then MemChk;
  UserSession.IsFirstShow := true;
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'DateViewWeb';
  //dmUser.SetDeveloperData('AfterLogin');
  //dmDV.SQLMonitor1.Active := false;
  //dmDV.SQLMonitor1.FileName := DefaultFlexCellFolder+dmDV.sqlcDateView.Name+'.TXT';
  //dmDV.SQLMonitor1.Active := true;
  IncrementNumUses(UserSession.ThisProgram);
  UserSession.NumRecordsPerPage := 50;
  LoggedIn := TRUE;
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;
  UserSession.CanValidate := false;
  UserSession.CanExport := false;
  UserSession.CanViewPlus := false;
  UserSession.CanModifyPlus := false;
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  //UserSession.GoDirectTographs := false;
  dmDV.qUsers.Close;
  dmDV.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
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
    {
    try
      //dmDV.cdsUsers.Close;
      //dmDV.cdsUsers.Open;
      dmDV.cdsUsers.Append;
      dmDV.cdsUsersUSERID.AsString := UserSession.UserID;
      dmDV.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmDV.cdsUsers.Post;
      dmDV.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Problem with User account');
      end;
    end;
    dmDV.qUsersWhoFor.Close;
    dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
    try
      dmDV.cdsUsersWhoFor.Close;
      dmDV.cdsUsersWhoFor.Open;
      dmDV.cdsUsersWhoFor.Append;
      //dmDV.cdsUsersWhoForUSERID.AsString := UserSession.UserID;
      dmDV.cdsUsersWhoForWHOFORID.AsString := ValueForPublished;
      dmDV.cdsUsersWhoFor.Post;
      dmDV.cdsUsersWhoFor.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Problem with UserWhoFor account');
      end;
    end;
    }
    dmDV.cdsUsers.Close;
    dmDV.cdsUsersWhoFor.Close;
    dmDV.qUsers.Close;
    dmDV.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsUsers.Close;
    dmDV.cdsUsers.Open;
  end;
  if (dmDV.cdsUsers.RecordCount > 0) then
  begin
    try
      dmDV.cdsUsers.Edit;
      //dmDV.cdsUsersUSERID.AsString := UserSession.UserID;
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
    dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
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
  //dmUser.SetDeveloperData('UserSession.AfterLogin');
  UserSession.WhoForValues.Add(ValueForPublished);
  dmDV.qUsersWhoFor.Close;
  dmDV.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.qGroupingList.Close;
  dmDV.qGroupingList.ParamByName('USERID').AsString := UserSession.UserID;
  UserSession.DataHaveChanged := true;
  UserSession.PDFHasChanged := true;
  UserSession.IncludeIgneous := false;
  UserSession.IncludeSedimentary := false;
  UserSession.IncludeMetamorphicAndOther := false;

  UserSession.Interpretation1Values.Clear;
  UserSession.Interpretation1Caption := 'Emplacement';
  UserSession.Interpretation1Values.Add('Cryst');
  UserSession.Interpretation2Values.Clear;
  UserSession.Interpretation2Caption := 'Metamorphism';
  UserSession.Interpretation2Values.Add('Metph');
  UserSession.Interpretation3Values.Clear;
  UserSession.Interpretation3Caption := 'Cooling';
  UserSession.Interpretation3Values.Add('Cool');
  UserSession.Interpretation4Values.Clear;
  UserSession.Interpretation4Caption := 'Inherited';
  UserSession.Interpretation4Values.Add('Inher');
  UserSession.Interpretation5Values.Clear;
  UserSession.Interpretation5Caption := 'Disturbed';
  UserSession.Interpretation5Values.Add('DstUn');
  UserSession.DateBand1Caption := '0-700 Ma';
  UserSession.DateBand1Minimum := '0';
  UserSession.DateBand1Maximum := '700';
  UserSession.DateBand2Caption := '700-1300 Ma';
  UserSession.DateBand2Minimum := '700';
  UserSession.DateBand2Maximum := '1300';
  UserSession.DateBand3Caption := '1300-2100 Ma';
  UserSession.DateBand3Minimum := '1300';
  UserSession.DateBand3Maximum := '2100';
  UserSession.DateBand4Caption := '2100-2500 Ma';
  UserSession.DateBand4Minimum := '2100';
  UserSession.DateBand4Maximum := '2500';
  UserSession.DateBand5Caption := '2500-4500 Ma';
  UserSession.DateBand5Minimum := '2500';
  UserSession.DateBand5Maximum := '4500';
  UserSession.GroupBy := 'Province';
  UserSession.MinimumDateUncertainty := '5.0';
  UserSession.NormalisationType := nt100Percent;
  UserSession.PDFType := 'AND';
  UserSession.ShowAllSampleLocalities := true;
  UserSession.FlexcelExportType := et_Xlsx;
  UserSession.FlexcelExportExtension := '.XLSX';
  dmOpt.GetUserOptions;

  UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapFileName;
  UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapDBFName;
  UserSession.MapFieldName := 'WB_CNTRY';
  UserSession.MapValueFieldName := 'CONTINENT';
  UserSession.UseDBF := false;
  UserSession.HORZSIZE := 1024; // horizontal screen size in pixels
  UserSession.VERTSIZE := 768;  // vertical screen size in pixels
  UserSession.FromAge := SpectrumStartAge;
  UserSession.ToAge := SpectrumEndAge;

  UserSession.NewContinentID := 'UND';
  UserSession.NewAreaID := 'UND';
  UserSession.NewUnitID := 'UNDEFINED';
  UserSession.NewLithologyID := 'Not defined';
  UserSession.NewMaterialID := 'nd';
  UserSession.NewIsotopeSystemID := 'UPb';
  UserSession.NewApproachID := 'PbPb';
  UserSession.NewTechniqueID := 'TIMSE';
  UserSession.NewInterpretationID := 'Cryst';
  UserSession.NewRatingNum := '1';
  UserSession.NewMethodID := 'R';
  UserSession.NewAgeUnit := 'Ma';
  UserSession.NewReferenceID := 'not defined';
  UserSession.NewAge := 1.0;
  UserSession.NewAgePError := 1.0;
  UserSession.NewAgeMError := 1.0;
  UserSession.NewLaboratory := 'nd';
  UserSession.NewSample := 'New';
  UserSession.NewProvince := 'Undefined';
  UserSession.NewTerrane := 'Undefined';

  UserSession.ReferenceStartFrom := 'A';
  UserSession.ReferenceEndWith := 'zz';
  UserSession.SampleStartFrom := 'A';
  UserSession.SampleEndWith := 'zz';
  UserSession.UnitStartFrom := 'A';
  UserSession.UnitEndWith := 'zz';
  UserSession.StartAtZ := 0.0;
  UserSession.EndAtZ := 200.0;
  UserSession.IncludeCoordinates := false;
  UserSession.NELat := '  90.0';
  UserSession.NELon := ' 180.0';
  UserSession.SWLat := ' -90.0';
  UserSession.SWLon := '-180.0';

  UserSession.Parameter2Chosen := 'SmNd';

  UserSession.GetCookies;
  {
  tmpStr := '';
  dmUser.cdsUserAccount.Close;
  dmUser.qUserAccount.Close;
  dmUser.qUserAccount.ParamByName('USERID').AsString := UserSession.UserID;
  dmUser.qUserAccount.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserAccount.Open;
  if (dmUser.cdsUserAccount.RecordCount > 0) then
  begin
    if ((dmUser.cdsUserAccountMEMTYPEID.AsString = 'ANNUC')
    or (dmUser.cdsUserAccountMEMTYPEID.AsString = 'ANNUL')
    or (dmUser.cdsUserAccountMEMTYPEID.AsString = 'LIFEC')
    or (dmUser.cdsUserAccountMEMTYPEID.AsString = 'LIFEL')
    or (dmUser.cdsUserAccountMEMTYPEID.AsString = 'LIFES')
    or (dmUser.cdsUserAccountMEMTYPEID.AsString = 'ANNUS')) then
    begin
      tmpStr := dmUser.cdsUserAccountACCOUNTID.AsString;
    end;
  end;
  //dmUser.SetDeveloperData('User '+UserSession.UserID+' associated with account '+tmpStr+' for software '+UserSession.ThisProgram);
  dmUser.cdsUserAccount.Close;

  if (tmpStr <> '') then
  begin
    dmDV.cdsUserAccount.Close;
    dmDV.qUserAccount.Close;
    dmDV.qUserAccount.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsUserAccount.Open;
    //dmUser.SetDeveloperData('cdsUserAccount recordcount is '+IntToStr(dmDV.cdsUserAccount.RecordCount));
    if (dmDV.cdsUserAccount.RecordCount < 1) then
    begin
      //dmUser.SetDeveloperData('DV User '+UserSession.UserID+' associated with account '+tmpStr);
      try
        dmDV.cdsUserAccount.Append;
        dmDV.cdsUserAccountUSERID.AsString := UserSession.UserID;
        dmDV.cdsUserAccountACCOUNTID.AsString := tmpStr;
        dmDV.cdsUserAccount.Post;
        dmDV.cdsUserAccount.ApplyUpdates(0);
      except
      end;
    end;
    dmDV.cdsUserAccount.Close;
  end;
  }

  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  //dmUser.SetDeveloperData('DateView - NeedLogin');
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TUserSession.SetCookies;
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
    //AStringList.Add('URLonTerminate='+UserSession.URLonTerminate);
    if UserSession.IncludeContinentValues then
    begin
      AStringList.Add('IncludeContinentValues='+IntToStr(UserSession.ContinentValues.Count));
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        AStringList.Add('ContinentValues='+UserSession.ContinentValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeAreaValues then
    begin
      AStringList.Add('IncludeAreaValues='+IntToStr(UserSession.AreaValues.Count));
      for i := 1 to UserSession.AreaValues.Count do
      begin
        AStringList.Add('AreaValues='+UserSession.AreaValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeUnitValues then
    begin
      AStringList.Add('IncludeUnitValues='+IntToStr(UserSession.UnitValues.Count));
      for i := 1 to UserSession.UnitValues.Count do
      begin
        AStringList.Add('UnitValues='+UserSession.UnitValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeLithologyValues then
    begin
      AStringList.Add('IncludeLithologyValues='+IntToStr(UserSession.LithologyValues.Count));
      for i := 1 to UserSession.LithologyValues.Count do
      begin
        AStringList.Add('LithologyValues='+UserSession.LithologyValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeIgneous then AStringList.Add('IncludeIgneous='+IntToStr(1))
                                  else AStringList.Add('IncludeIgneous='+IntToStr(0));
    if UserSession.IncludeSedimentary then AStringList.Add('IncludeIgneous='+IntToStr(1))
                                      else AStringList.Add('IncludeIgneous='+IntToStr(0));
    if UserSession.IncludeMetamorphicAndOther then AStringList.Add('IncludeIgneous='+IntToStr(1))
                                              else AStringList.Add('IncludeIgneous='+IntToStr(0));
    if UserSession.IncludeMaterialValues then
    begin
      AStringList.Add('IncludeMaterialValues='+IntToStr(UserSession.MaterialValues.Count));
      for i := 1 to UserSession.MaterialValues.Count do
      begin
        AStringList.Add('MaterialValues='+UserSession.MaterialValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeMethodValues then
    begin
      AStringList.Add('IncludeMethodValues='+IntToStr(UserSession.MethodValues.Count));
      for i := 1 to UserSession.MethodValues.Count do
      begin
        AStringList.Add('MethodValues='+UserSession.MethodValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeIsotopeSystemValues then
    begin
      AStringList.Add('IncludeIsotopeSystemValues='+IntToStr(UserSession.IsotopeSystemValues.Count));
      for i := 1 to UserSession.IsotopeSystemValues.Count do
      begin
        AStringList.Add('IsotopeSystemValues='+UserSession.IsotopeSystemValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeInterpretationValues then
    begin
      AStringList.Add('IncludeInterpretationValues='+IntToStr(UserSession.InterpretationValues.Count));
      for i := 1 to UserSession.InterpretationValues.Count do
      begin
        AStringList.Add('InterpretationValues='+UserSession.InterpretationValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeApproachValues then
    begin
      AStringList.Add('IncludeApproachValues='+IntToStr(UserSession.ApproachValues.Count));
      for i := 1 to UserSession.ApproachValues.Count do
      begin
        AStringList.Add('ApproachValues='+UserSession.ApproachValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeTechniqueValues then
    begin
      AStringList.Add('IncludeTechniqueValues='+IntToStr(UserSession.TechniqueValues.Count));
      for i := 1 to UserSession.TechniqueValues.Count do
      begin
        AStringList.Add('TechniqueValues='+UserSession.TechniqueValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeGroupValues then
    begin
      AStringList.Add('IncludeGroupValues='+IntToStr(UserSession.GroupValues.Count));
      for i := 1 to UserSession.GroupValues.Count do
      begin
        AStringList.Add('GroupValues='+UserSession.GroupValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeProvinceValues then
    begin
      AStringList.Add('IncludeProvinceValues='+IntToStr(UserSession.ProvinceValues.Count));
      for i := 1 to UserSession.ProvinceValues.Count do
      begin
        AStringList.Add('ProvinceValues='+UserSession.ProvinceValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeTerraneValues then
    begin
      AStringList.Add('IncludeTerraneValues='+IntToStr(UserSession.TerraneValues.Count));
      for i := 1 to UserSession.TerraneValues.Count do
      begin
        AStringList.Add('TerraneValues='+UserSession.TerraneValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeOrogenicPeriodValues then
    begin
      AStringList.Add('IncludeOrogenicPeriodValues='+IntToStr(UserSession.OrogenicPeriodValues.Count));
      for i := 1 to UserSession.OrogenicPeriodValues.Count do
      begin
        AStringList.Add('OrogenicPeriodValues='+UserSession.OrogenicPeriodValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(UserSession.ReferenceValues.Count));
      for i := 1 to UserSession.ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+UserSession.ReferenceValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeChemicalTypeValues then
    begin
      AStringList.Add('IncludeChemicalTypeValues='+IntToStr(UserSession.ChemicalTypeValues.Count));
      for i := 1 to UserSession.ChemicalTypeValues.Count do
      begin
        AStringList.Add('ChemicalTypeValues='+UserSession.ChemicalTypeValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeBoundaryPositionValues then
    begin
      AStringList.Add('IncludeBoundaryPositionValues='+IntToStr(UserSession.BoundaryPositionValues.Count));
      for i := 1 to UserSession.BoundaryPositionValues.Count do
      begin
        AStringList.Add('BoundaryPositionValues='+UserSession.BoundaryPositionValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeBoundaryValues then
    begin
      AStringList.Add('IncludeBoundaryValues='+IntToStr(UserSession.BoundaryValues.Count));
      for i := 1 to UserSession.BoundaryValues.Count do
      begin
        AStringList.Add('BoundaryValues='+UserSession.BoundaryValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeValidationValues then
    begin
      AStringList.Add('IncludeValidationValues='+IntToStr(UserSession.ValidationValues.Count));
      for i := 1 to UserSession.ValidationValues.Count do
      begin
        AStringList.Add('ValidationValues='+UserSession.ValidationValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeWhoForValues then
    begin
      AStringList.Add('IncludeWhoForValues='+IntToStr(UserSession.WhoForValues.Count));
      for i := 1 to UserSession.WhoForValues.Count do
      begin
        AStringList.Add('WhoForValues='+UserSession.WhoForValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludePlateValues then
    begin
      AStringList.Add('IncludePlateValues='+IntToStr(UserSession.PlateValues.Count));
      for i := 1 to UserSession.PlateValues.Count do
      begin
        AStringList.Add('PlateValues='+UserSession.PlateValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeLIPValues then
    begin
      AStringList.Add('IncludeLIPValues='+IntToStr(UserSession.LIPValues.Count));
      for i := 1 to UserSession.LIPValues.Count do
      begin
        AStringList.Add('LIPValues='+UserSession.LIPValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeAgeUnitsValue then
    begin
      AStringList.Add('IncludeAgeUnitsValue='+IntToStr(1));
      AStringList.Add('AgeUnitsValue='+UserSession.AgeUnitsValue);
    end;
    if UserSession.IncludeIsochronOnlyValue then
    begin
      AStringList.Add('IncludeIsochronOnlyValues='+IntToStr(1));
    end;
    if UserSession.IncludeDateFromValue then
    begin
      AStringList.Add('IncludeDateFromValue='+IntToStr(1));
      AStringList.Add('DateFromField='+UserSession.DateFromField);
    end;
    if UserSession.IncludeDateToValue then
    begin
      AStringList.Add('IncludeDateToValue='+IntToStr(1));
      AStringList.Add('DateToField='+UserSession.DateToField);
    end;
    if UserSession.IncludeEpsilonFromValue then
    begin
      AStringList.Add('IncludeEpsilonFromValue='+IntToStr(1));
      AStringList.Add('EpsilonFromValue='+UserSession.EpsilonFromValue);
    end;
    if UserSession.IncludeEpsilonToValue then
    begin
      AStringList.Add('IncludeEpsilonToValue='+IntToStr(1));
      AStringList.Add('EpsilonToValue='+UserSession.EpsilonToValue);
    end;
    if UserSession.IncludeUsersContributedValues then
    begin
      AStringList.Add('IncludeUsersContributedValues='+IntToStr(UserSession.UsersContributedValues.Count));
      for i := 1 to UserSession.UsersContributedValues.Count do
      begin
        AStringList.Add('UsersContributedValues='+UserSession.UsersContributedValues.Strings[i-1]);
      end;
    end;
    AStringList.Add('PreferenceLevelValue='+UserSession.PreferenceLevelValue);
    AStringList.Add('ConfidentialValue='+UserSession.ConfidentialValue);
    AStringList.Add('IncludeDecayUncertaintyValues='+IntToStr(UserSession.DecayUncertaintyValues.Count));
    for i := 1 to UserSession.DecayUncertaintyValues.Count do
    begin
      AStringList.Add('DecayUncertaintyValues='+UserSession.DecayUncertaintyValues.Strings[i-1]);
    end;
    //AStringList.Add('DateUnitsValue='+UserSession.DateUnitsValue);
    if UserSession.IncludeCoordinates then
    begin
      AStringList.Add('IncludeCoordinates='+IntToStr(1));
      AStringList.Add('NELat='+UserSession.NELat);
      AStringList.Add('NELon='+UserSession.NELon);
      AStringList.Add('SWLat='+UserSession.SWLat);
      AStringList.Add('SWLon='+UserSession.SWLon);
    end;
    if UserSession.IncludeRecordIDValueRange then
    begin
      AStringList.Add('IncludeRecordIDValues='+IntToStr(1));
      AStringList.Add('RecordIDValueFrom='+UserSession.RecordIDValueFrom);
      AStringList.Add('RecordIDValueTo='+UserSession.RecordIDValueTo);
    end;
    if UserSession.IncludeSampleValues then
    begin
      iNumSampleValues := UserSession.SampleValues.Count;
      if (UserSession.SampleValues.Count > iMaxSampleValues) then  iNumSampleValues := iMaxSampleValues;
      AStringList.Add('IncludeSampleValues='+IntToStr(UserSession.SampleValues.Count));
      for i := 1 to iNumSampleValues do
      begin
        AStringList.Add('SampleValues='+UserSession.SampleValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeSampleZoneValues then
    begin
      AStringList.Add('IncludeSampleZoneValues='+IntToStr(UserSession.SampleZoneValues.Count));
      for i := 1 to UserSession.SampleZoneValues.Count do
      begin
        AStringList.Add('SampleZoneValues='+UserSession.SampleZoneValues.Strings[i-1]);
      end;
    end;
    AStringList.Add('SampleStartFrom='+UserSession.SampleStartFrom);
    AStringList.Add('SampleEndWith='+UserSession.SampleEndWith);
    AStringList.Add('ReferenceStartFrom='+UserSession.ReferenceStartFrom);
    AStringList.Add('ReferenceEndWith='+UserSession.ReferenceEndWith);
    AStringList.Add('UnitStartFrom='+UserSession.UnitStartFrom);
    AStringList.Add('UnitEndWith='+UserSession.UnitEndWith);
    if UserSession.IncludeUserOrgID then
    begin
      AStringList.Add('IncludeUserOrgID='+IntToStr(1));
      AStringList.Add('IncludeUserOrgIDValue='+UserSession.UserOrgIDValue);
    end;
    AStringList.Add('OrderByValue='+UserSession.OrderByValue);
    if UserSession.CanInsert then
    begin
      AStringList.Add('NewContinentID='+UserSession.NewContinentID);
      AStringList.Add('NewAreaID='+UserSession.NewAreaID);
      AStringList.Add('NewUnitID='+UserSession.NewUnitID);
      AStringList.Add('NewLithologyID='+UserSession.NewLithologyID);
      AStringList.Add('NewMaterialID='+UserSession.NewMaterialID);
      AStringList.Add('NewIsotopeSystemID='+UserSession.NewIsotopeSystemID);
      AStringList.Add('NewApproachID='+UserSession.NewApproachID);
      AStringList.Add('NewTechniqueID='+UserSession.NewTechniqueID);
      AStringList.Add('NewInterpretationID='+UserSession.NewInterpretationID);
      AStringList.Add('NewRatingNum='+UserSession.NewRatingNum);
      AStringList.Add('NewMethodID='+UserSession.NewMethodID);
      AStringList.Add('NewAgeUnit='+UserSession.NewAgeUnit);
      AStringList.Add('NewReferenceID='+UserSession.NewReferenceID);
      AStringList.Add('NewLaboratoryID='+UserSession.NewLaboratory);
      AStringList.Add('NewSampleID='+UserSession.NewSample);
      AStringList.Add('NewProvinceID='+UserSession.NewProvince);
      AStringList.Add('NewTerraneID='+UserSession.NewTerrane);
    end;
    AStringList.Add('FlexcelExportExtension='+UserSession.FlexcelExportExtension);
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
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
      dmUser.cdsCookieInfoUSERID.AsString := UserSession.UserID;
      dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end;
    dmUser.cdsCookieInfo.ApplyUpdates(0);
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetCookies;
var
  //tmpString : string;
  i, tmpi, iCode : integer;
  //tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    //UserSession.URLonTerminate := AStringList.Values['URLonTerminate'];
    Val(AStringList.Values['IncludeContinentValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeContinentValues := true;
      UserSession.GetStringsValues(AStringList,'ContinentValues',UserSession.ContinentValues);
    end;
    Val(AStringList.Values['IncludeAreaValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAreaValues := true;
      UserSession.GetStringsValues(AStringList,'AreaValues',UserSession.AreaValues);
    end;
    Val(AStringList.Values['IncludeUnitValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUnitValues := true;
      UserSession.GetStringsValues(AStringList,'UnitValues',UserSession.UnitValues);
    end;
    Val(AStringList.Values['IncludeLithologyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeLithologyValues := true;
      UserSession.GetStringsValues(AStringList,'LithologyValues',UserSession.LithologyValues);
    end;
    UserSession.IncludeIgneous := false;
    Val(AStringList.Values['IncludeIgneous'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeIgneous := true;
    end;
    UserSession.IncludeSedimentary := false;
    Val(AStringList.Values['IncludeSedimentary'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSedimentary := true;
    end;
    UserSession.IncludeMetamorphicAndOther := false;
    Val(AStringList.Values['IncludeMetamorphicAndOther'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeMetamorphicAndOther := true;
    end;
    Val(AStringList.Values['IncludeMaterialValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeMaterialValues := true;
      UserSession.GetStringsValues(AStringList,'MaterialValues',UserSession.MaterialValues);
    end;
    Val(AStringList.Values['IncludeMethodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeMethodValues := true;
      UserSession.GetStringsValues(AStringList,'MethodValues',UserSession.MethodValues);
    end;
    Val(AStringList.Values['IncludeIsotopeSystemValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeIsotopeSystemValues := true;
      UserSession.GetStringsValues(AStringList,'IsotopeSystemValues',UserSession.IsotopeSystemValues);
    end;
    Val(AStringList.Values['IncludeInterpretationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeInterpretationValues := true;
      UserSession.GetStringsValues(AStringList,'InterpretationValues',UserSession.InterpretationValues);
    end;
    Val(AStringList.Values['IncludeApproachValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeApproachValues := true;
      UserSession.GetStringsValues(AStringList,'ApproachValues',UserSession.ApproachValues);
    end;
    Val(AStringList.Values['IncludeTechniqueValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeTechniqueValues := true;
      UserSession.GetStringsValues(AStringList,'TechniqueValues',UserSession.TechniqueValues);
    end;
    Val(AStringList.Values['IncludeGroupValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeGroupValues := true;
      UserSession.GetStringsValues(AStringList,'GroupValues',UserSession.GroupValues);
    end;
    Val(AStringList.Values['IncludeProvinceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeProvinceValues := true;
      UserSession.GetStringsValues(AStringList,'ProvinceValues',UserSession.ProvinceValues);
    end;
    Val(AStringList.Values['IncludeTerraneValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeTerraneValues := true;
      UserSession.GetStringsValues(AStringList,'TerraneValues',UserSession.TerraneValues);
    end;
    Val(AStringList.Values['IncludeOrogenicPeriodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeOrogenicPeriodValues := true;
      UserSession.GetStringsValues(AStringList,'OrogenicPeriodValues',UserSession.OrogenicPeriodValues);
    end;
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReferenceValues := true;
      UserSession.GetStringsValues(AStringList,'ReferenceValues',UserSession.ReferenceValues);
    end;
    Val(AStringList.Values['IncludeChemicalTypeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeChemicalTypeValues := true;
      UserSession.GetStringsValues(AStringList,'ChemicalTypeValues',UserSession.ChemicalTypeValues);
    end;
    Val(AStringList.Values['IncludeBoundaryPositionValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeBoundaryPositionValues := true;
      UserSession.GetStringsValues(AStringList,'BoundaryPositionValues',UserSession.BoundaryPositionValues);
    end;
    Val(AStringList.Values['IncludeBoundaryValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeBoundaryValues := true;
      UserSession.GetStringsValues(AStringList,'BoundaryValues',UserSession.BoundaryValues);
    end;
    Val(AStringList.Values['IncludeValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeValidationValues := true;
      UserSession.GetStringsValues(AStringList,'ValidationValues',UserSession.ValidationValues);
    end;
    Val(AStringList.Values['IncludeWhoForValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeWhoForValues := true;
      UserSession.GetStringsValues(AStringList,'WhoForValues',UserSession.WhoForValues);
    end;
    Val(AStringList.Values['IncludePlateValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludePlateValues := true;
      UserSession.GetStringsValues(AStringList,'PlateValues',UserSession.PlateValues);
    end;
    Val(AStringList.Values['IncludeLIPValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeLIPValues := true;
      UserSession.GetStringsValues(AStringList,'LIPValues',UserSession.LIPValues);
    end;
    Val(AStringList.Values['IncludeUsersContributedValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUsersContributedValues := true;
      UserSession.GetStringsValues(AStringList,'UsersContributedValues',UserSession.UsersContributedValues);
    end;
    Val(AStringList.Values['IncludeAgeUnitsValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAgeUnitsValue := true;
      UserSession.AgeUnitsValue := AStringList.Values['AgeUnitsValue'];
    end;
    Val(AStringList.Values['IncludeIsochronOnlyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeIsochronOnlyValue := true;
    end;
    Val(AStringList.Values['IncludeDateFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateFromValue := true;
      UserSession.DateFromField := AStringList.Values['DateFromField'];
    end;
    Val(AStringList.Values['IncludeDateToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateToValue := true;
      UserSession.DateToField := AStringList.Values['DateToField'];
    end;
    Val(AStringList.Values['IncludeEpsilonFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeEpsilonFromValue := true;
      UserSession.EpsilonFromValue := AStringList.Values['EpsilonFromValue'];
    end;
    Val(AStringList.Values['IncludeEpsilonToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeEpsilonToValue := true;
      UserSession.EpsilonToValue := AStringList.Values['EpsilonToValue'];
    end;
    UserSession.PreferenceLevelValue := AStringList.Values['PreferenceLevelValue'];
    UserSession.ConfidentialValue := AStringList.Values['ConfidentialValue'];
    Val(AStringList.Values['IncludeDecayUncertaintyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.GetStringsValues(AStringList,'DecayUncertaintyValues',UserSession.DecayUncertaintyValues);
      for i := 1 to tmpi do
      begin
        //dmUser.SetDeveloperData(UserSession.DecayUncertaintyValues[i-1]);
      end;
    end;
    //UserSession.DateUnitsValue := AStringList.Values['DateUnitsValue'];
    Val(AStringList.Values['IncludeCoordinates'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCoordinates := true;
      UserSession.NELat := AStringList.Values['NELat'];
      UserSession.NELon := AStringList.Values['NELon'];
      UserSession.SWLat := AStringList.Values['SWLat'];
      UserSession.SWLon := AStringList.Values['SWLon'];
    end;
    Val(AStringList.Values['IncludeRecordIDValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeRecordIDValueRange := true;
      UserSession.RecordIDValueFrom := AStringList.Values['RecordIDValueFrom'];
      UserSession.RecordIDValueTo := AStringList.Values['RecordIDValueTo'];
    end;
    Val(AStringList.Values['IncludeSampleValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSampleValues := true;
      UserSession.GetStringsValues(AStringList,'SampleValues',UserSession.SampleValues);
    end;
    Val(AStringList.Values['IncludeSampleZoneValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSampleZoneValues := true;
      UserSession.GetStringsValues(AStringList,'SampleZoneValues',UserSession.SampleZoneValues);
    end;
    UserSession.SampleStartFrom := AStringList.Values['SampleStartFrom'];
    UserSession.SampleEndWith := AStringList.Values['SampleEndWith'];
    UserSession.ReferenceStartFrom := AStringList.Values['ReferenceStartFrom'];
    UserSession.ReferenceEndWith := AStringList.Values['ReferenceEndWith'];
    UserSession.UnitStartFrom := AStringList.Values['UnitStartFrom'];
    UserSession.UnitEndWith := AStringList.Values['UnitEndWith'];
    //WebApplication.ShowMessage('NELat is '+UserSession.NELat);
    //WebApplication.ShowMessage('NELon is '+UserSession.NELon);
    Val(AStringList.Values['IncludeUserOrgID'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUserOrgID := true;
      UserSession.UserOrgIDValue := AStringList.Values['IncludeUserOrgIDValue'];
    end;
    UserSession.OrderByValue := AStringList.Values['OrderByValue'];
    if UserSession.CanInsert then
    begin
      UserSession.NewContinentID := AStringList.Values['NewContinentID'];
      UserSession.NewAreaID := AStringList.Values['NewAreaID'];
      UserSession.NewUnitID := AStringList.Values['NewUnitID'];
      UserSession.NewLithologyID := AStringList.Values['NewLithologyID'];
      UserSession.NewMaterialID := AStringList.Values['NewMaterialID'];
      UserSession.NewIsotopeSystemID := AStringList.Values['NewIsotopeSystemID'];
      UserSession.NewApproachID := AStringList.Values['NewApproachID'];
      UserSession.NewTechniqueID := AStringList.Values['NewTechniqueID'];
      UserSession.NewInterpretationID := AStringList.Values['NewInterpretationID'];
      UserSession.NewRatingNum := AStringList.Values['NewRatingNum'];
      UserSession.NewMethodID := AStringList.Values['NewMethodID'];
      UserSession.NewAgeUnit := AStringList.Values['NewAgeUnit'];
      UserSession.NewReferenceID := AStringList.Values['NewReferenceID'];
      UserSession.NewLaboratory := AStringList.Values['NewLaboratoryID'];
      UserSession.NewSample := AStringList.Values['NewSampleID'];
      UserSession.NewProvince := AStringList.Values['NewProvinceID'];
      UserSession.NewTerrane := AStringList.Values['NewTerraneID'];
    end;
    UserSession.FlexcelExportExtension := AStringList.Values['FlexcelExportExtension'];
    UserSession.FlexcelExportExtension := UpperCase(UserSession.FlexcelExportExtension);
    if (UserSession.FlexcelExportExtension = '.XLSX') then UserSession.FlexcelExportType := et_Xlsx;
    if (UserSession.FlexcelExportExtension = '.XLS') then UserSession.FlexcelExportType := et_Xls;
    if (UserSession.FlexcelExportExtension = '.CSV') then UserSession.FlexcelExportType := et_Csv;
    if (UserSession.FlexcelExportExtension = '.HTML') then UserSession.FlexcelExportType := et_Html;
    if (UserSession.FlexcelExportExtension = '.PDF') then UserSession.FlexcelExportType := et_Pdf;
  finally
    AStringList.Free;
  end;
end;

function TUserSession.LocalDateTimeFromUTCDateTime(const UTCDateTime: TDateTime): TDateTime;
var
  LocalSystemTime: TSystemTime;
  UTCSystemTime: TSystemTime;
  LocalFileTime: TFileTime;
  UTCFileTime: TFileTime;
begin
  DateTimeToSystemTime(UTCDateTime, UTCSystemTime);
  SystemTimeToFileTime(UTCSystemTime, UTCFileTime);
  if FileTimeToLocalFileTime(UTCFileTime, LocalFileTime)
  and FileTimeToSystemTime(LocalFileTime, LocalSystemTime) then begin
    Result := SystemTimeToDateTime(LocalSystemTime);
  end else begin
    Result := UTCDateTime;  // Default to UTC if any conversion function fails.
  end;
end;

procedure TUserSession.GetStringsValues(AStrings: TStrings;
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
    if Pos(AKey, FieldValue) = 1 then { exact match }
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;

procedure TUserSession.MakeDonation(AForm: TIWAppFormClass);
begin
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDonate.Create(WebApplication).Show;
end;

procedure TUserSession.AfterDonate;
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFDonate.ClassName))  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;



initialization
  TIWServerController.SetServerControllerClass;

end.

