unit ServerController;

interface


uses
  System.SysUtils, System.Classes, IWServerControllerBase, IWBaseForm,
 //Web.HTTPApp,
  System.DateUtils,
  // For OnNewSession Event
  //UserSessionUnit,
  IWApplication, IWAppForm, IW.Browser.Browser,
  IW.HTTP.Request, IW.HTTP.Reply,
  IWGlobal,
  //IW.Browser.Browser,
  IW.Browser.Other, IW.Browser.Firefox, IW.Browser.FirefoxMobile,
  IW.Browser.InternetExplorer, IW.Browser.Webkit, IW.Browser.SafariMobile,
  IW.Browser.Safari, IW.Browser.Chrome, IW.Browser.Android, IW.Browser.ChromeMobile,
  IW.Browser.OperaNext,IW.Browser.Opera,IW.Browser.OperaMobile,
  IW.Browser.SearchEngine,
  //Winapi.Windows,
  // For OnNewSession Event
  System.IniFiles,
  IW.Common.AppInfo,
  midaslib,
  DVIW_constants,
  usrIW_dm,
  DVIW_dmopt, DVIW_dm, DVIW_dmstrat,
  DVIW_dmdata, DVIW_dmgraphics, UserSessionUnit;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
    procedure IWServerControllerBaseBrowserCheck(aSession: TIWApplication;
      var rBrowser: TBrowser);
  private
    { Private declarations }
    procedure GetIniFile;
  public
    { Public declarations }
  end;

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.

// Procs
  function UserSession: TIWUserSession;
  function IWServerController: TIWServerController;


implementation

{$R *.dfm}

uses
  System.IOUtils,
  IWInit,
  usr_insufficientright,
  usr_uLogin, usr_uRegister,
  usr_uDBInterface, 
  DVIW_uMain, usr_uForgotten,
  usr_constants;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil);
  GetIniFile;
end;

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

procedure TIWServerController.IWServerControllerBaseBrowserCheck(
  aSession: TIWApplication; var rBrowser: TBrowser);
  {
  //use the following in the uses interface to be able to use code in this procedure
  //IW.Browser.Browser,
  IW.Browser.Other, IW.Browser.Firefox, IW.Browser.FirefoxMobile,
  IW.Browser.InternetExplorer, IW.Browser.Webkit, IW.Browser.SafariMobile,
  IW.Browser.Safari, IW.Browser.Chrome, IW.Browser.Android, IW.Browser.ChromeMobile,
  IW.Browser.OperaNext,IW.Browser.Opera,IW.Browser.OperaMobile,
  IW.Browser.SearchEngine,
  }
var
  uas : string;
begin
  //uas := Lowercase(ASession.Request.UserAgent); //convert user-agent string to lowercase for comparison
  {
  if (rBrowser is TSearchEngine) then //Use IW's built-in detection
  begin
    ASession.Terminate('403 Forbidden. Indexing of this resource by search engines is not allowed!');
    rBrowser.destroy;
    rBrowser := TInternetExplorer.Create(9);
    //Log this session including the uas so you know that the server defended itself
  end
  else if (Pos('baidu',uas) > 0) //Screen deeperinto user-agent string. These conditions can be moved to a function or class. They are exposed here for simplicity.
    or (Pos('yandex',uas) > 0)
    or (Pos('naverbot',uas) > 0)
    or (Pos('yeti',uas) > 0)
    or (Pos('seznambot',uas) > 0)
    or (Pos('slurp',uas) > 0)
    or (Pos('teoma',uas) > 0)
    or (Pos('moget',uas) > 0)
    or (Pos('ichiro',uas) > 0)
    or (Pos('sogu',uas) > 0)
    or (Pos('bot',uas) > 0)
    or (Pos('spider',uas) > 0) then
  begin
    ASession.Terminate('403 Forbidden. Crawling this site is not allowed!');
    rBrowser.destroy;
    rBrowser := TInternetExplorer.Create(9);
    //Log this session including the uas so you have a record of it
  end;
  // unknown browser
  if (rBrowser is TOther) then begin
    rBrowser.Free;
    // accept the unknown browser as Firefox (probably the best idea)
    rBrowser := TFireFox.Create(TFireFox.MIN_VERSION);
  end
  // if is Safari, but older or unsupported version
  else if (rBrowser is TSafari) and (not rBrowser.IsSupported) then begin
    rBrowser.Free;
    // we will create it as the minimum supported version. Please note that we are using TSafari.MIN_VERSION class property
    rBrowser := TSafari.Create(TSafari.MIN_VERSION);
  end
  // if is Chrome, but older or unsupported version
  else if (rBrowser is TChrome) and (not rBrowser.IsSupported) then begin
    rBrowser.Free;
    // we will create it as the minimum supported version. Please note that we are using TChrome.MIN_VERSION class property
    rBrowser := TChrome.Create(TChrome.MIN_VERSION);
  end
  // if is Firefox, but older or unsupported version
  else if (rBrowser is TFirefox) and (not rBrowser.IsSupported) then begin
    rBrowser.Free;
    // we will create it as the minimum supported version. Please note that we are using TFirefox.MIN_VERSION class property
    rBrowser := TFirefox.Create(TFirefox.MIN_VERSION);
  end
  // if is IE, but older or unsupported version
  else if (rBrowser is TInternetExplorer) and (not rBrowser.IsSupported) then begin
    rBrowser.Free;
    // we will create it as the minimum supported version. Please note that we are using TInternetExplorer.MIN_VERSION class property
    rBrowser := TInternetExplorer.Create(TInternetExplorer.MIN_VERSION);
  end;
  }
end;

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
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
  DBSQLDialectStr,DBCharSet,
  PublicPath : string;
begin
  // --------------------------------------------------------------------------------
  //
  // uses GetPublicPath i.e. based on INI file in the ProgramData folder of subfolders
  //
  // --------------------------------------------------------------------------------

  dmUser.sqlcWebUser.Connected := false;
  dmOpt.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmdDV.sqlcDateView.Connected := false;
  URLBase := '/';
  DBMonitor := 'Active';
  UserSession.ShowDebugButtons := true;
  UserSession.DelayConnections := false;
  UserControlPath := 'c:\Data\Firebird\UserControl2025v50_utf8.fdb';
  StratDBPath := 'c:\Data\Firebird\StratDB2025v50_utf8.fdb';
  DateViewPath := 'c:\Data\Firebird\DateView2025v50_utf8.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'c:\exe64\dbexpida41.dll';
  VendorLib := 'c:\exe64\fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'V0lcano3^';
  DBSQLDialectStr := '3';
  DBCharSet := 'UTF8';
  PublicPath := TPath.GetPublicPath;
  //PublicPath := TPath.GetHomePath;  //changed to HomePath to see if this is cause of program not working on Thera2
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'dateview.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/dateview');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','c:\Data\Firebird\UserControl2025v50_utf8.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','c:\Data\Firebird\StratDB2025v50_utf8.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','c:\Data\Firebird\DateView2025v50_utf8.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','c:\exe64\dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','c:\exe64\fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','UTF8');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Active');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    //DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
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
    //define connection parameters for UserControl connection
    try
      dmUser.sqlcWebUser.Connected := false;
      dmUser.sqlcWebUser.Params.Clear;
      dmUser.sqlcWebUser.Params.Append('LibraryName='+LibraryName);
      dmUser.sqlcWebUser.Params.Append('VendorLib='+VendorLib);
      dmUser.sqlcWebUser.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);

      dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
      dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
      dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
      dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
      //dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
      dmUser.sqlcWebUser.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmUser.sqlcWebUser.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dmUser.sqlcWebUser');
    end;
    //define connection parameters for StratDB connection
    try
      dmStrat.sqlcStrat.Connected := false;
      dmStrat.sqlcStrat.Params.Clear;
      dmStrat.sqlcStrat.Params.Append('LibraryName='+LibraryName);
      dmStrat.sqlcStrat.Params.Append('VendorLib='+VendorLib);
      dmStrat.sqlcStrat.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmStrat.sqlcStrat.Params.Append('DriverName='+DriverName);
      dmStrat.sqlcStrat.Params.Append('Database='+StratDBPath);
      dmStrat.sqlcStrat.Params.Append('User_Name='+DBUserName);
      dmStrat.sqlcStrat.Params.Append('Password='+DBPassword);
      dmStrat.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmStrat.sqlcStrat.Params.Append('Charset='+DBCharSet);
      //dmStrat.sqlcStrat.Params.Append('LocaleCode=0000');
      dmStrat.sqlcStrat.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmStrat.sqlcStrat.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dmStrat.sqlcStrat');
    end;
    //define connection parameters for DateView connection
    try
      dmDV.sqlcDateView.Connected := false;
      dmDV.sqlcDateView.Params.Clear;
      dmDV.sqlcDateView.Params.Append('LibraryName='+LibraryName);
      dmDV.sqlcDateView.Params.Append('VendorLib='+VendorLib);
      dmDV.sqlcDateView.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmDV.sqlcDateView.Params.Append('DriverName='+DriverName);
      dmDV.sqlcDateView.Params.Append('Database='+DateViewPath);
      dmDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
      dmDV.sqlcDateView.Params.Append('Password='+DBPassword);
      dmDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
      //dmDV.sqlcDateView.Params.Append('LocaleCode=0000');
      dmDV.sqlcDateView.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmDV.sqlcDateView.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dmDV.sqlcDateView');
    end;
    //define connection parameters for DateView graphics connection
    try
      dmgDV.sqlcDateView.Connected := false;
      dmgDV.sqlcDateView.Params.Clear;
      dmgDV.sqlcDateView.Params.Append('LibraryName='+LibraryName);
      dmgDV.sqlcDateView.Params.Append('VendorLib='+VendorLib);
      dmgDV.sqlcDateView.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmgDV.sqlcDateView.Params.Append('DriverName='+DriverName);
      dmgDV.sqlcDateView.Params.Append('Database='+DateViewPath);
      dmgDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
      dmgDV.sqlcDateView.Params.Append('Password='+DBPassword);
      dmgDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmgDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
      //dmgDV.sqlcDateView.Params.Append('LocaleCode=0000');
      dmgDV.sqlcDateView.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmgDV.sqlcDateView.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dgmDV.sqlcDateView');
    end;
    //define connection parameters for DateView data connection
    try
      dmdDV.sqlcDateView.Connected := false;
      dmdDV.sqlcDateView.Params.Clear;
      dmdDV.sqlcDateView.Params.Append('LibraryName='+LibraryName);
      dmdDV.sqlcDateView.Params.Append('VendorLib='+VendorLib);
      dmdDV.sqlcDateView.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmdDV.sqlcDateView.Params.Append('DriverName='+DriverName);
      dmdDV.sqlcDateView.Params.Append('Database='+DateViewPath);
      dmdDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
      dmdDV.sqlcDateView.Params.Append('Password='+DBPassword);
      dmdDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmdDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
      //dmdDV.sqlcDateView.Params.Append('LocaleCode=0000');
      dmdDV.sqlcDateView.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmdDV.sqlcDateView.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dgmDV.sqlcDateView');
    end;
    //define connection parameters for DateView options connection
    try
      dmOpt.sqlcDateView.Connected := false;
      dmOpt.sqlcDateView.Params.Clear;
      dmOpt.sqlcDateView.Params.Append('LibraryName='+LibraryName);
      dmOpt.sqlcDateView.Params.Append('VendorLib='+VendorLib);
      dmOpt.sqlcDateView.Params.Append('GetDriverFunc='+GetDriverFunc);
      dmOpt.sqlcDateView.Params.Append('DriverName='+DriverName);
      dmOpt.sqlcDateView.Params.Append('Database='+DateViewPath);
      dmOpt.sqlcDateView.Params.Append('User_Name='+DBUserName);
      dmOpt.sqlcDateView.Params.Append('Password='+DBPassword);
      dmOpt.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
      dmOpt.sqlcDateView.Params.Append('Charset='+DBCharSet);
      //dmOpt.sqlcDateView.Params.Append('LocaleCode=0000');
      dmOpt.sqlcDateView.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
      dmOpt.sqlcDateView.Params.Append('UseUnicode=true');
    except
      WebApplication.ShowMessage('Problem defining dgmDV.sqlcDateView');
    end;
    if (DBMonitor = 'Active') then
    begin
      dmUser.SQLMonitor1.Active := true;
      dmStrat.SQLMonitor1.Active := true;
      dmDV.SQLMonitor1.Active := true;
      dmOpt.SQLMonitor1.Active := true;
    end else
    begin
      dmUser.SQLMonitor1.Active := false;
      dmStrat.SQLMonitor1.Active := false;
      dmDV.SQLMonitor1.Active := false;
      dmOpt.SQLMonitor1.Active := false;
    end;
  finally
    AppIni.Free;
  end;
end;


initialization
  TIWServerController.SetServerControllerClass;


end.

