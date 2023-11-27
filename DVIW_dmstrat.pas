unit DVIW_dmstrat;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, DBXCommon, SqlExpr, DBClient, Provider,
  midaslib,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type
  TdmStrat = class(TDataModule)
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TStringField;
    qContinentsCONTINENT: TStringField;
    dspContinents: TDataSetProvider;
    cdsContinents: TClientDataSet;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    qCountries: TSQLQuery;
    dspCountries: TDataSetProvider;
    cdsCountries: TClientDataSet;
    qReferences: TSQLQuery;
    dspReferences: TDataSetProvider;
    cdsReferences: TClientDataSet;
    qRefDetail: TSQLQuery;
    dspRefDetail: TDataSetProvider;
    cdsRefDetail: TClientDataSet;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    dsContinents: TDataSource;
    dsCountries: TDataSource;
    dsReferences: TDataSource;
    dsRefFull: TDataSource;
    dsRefDetail: TDataSource;
    cdsCountriesCOUNTRYID: TStringField;
    cdsCountriesCOUNTRY: TStringField;
    cdsCountriesCONTINENTID: TStringField;
    cdsCountriesCONTINENT: TStringField;
    cdsCountriesCOUNTRYHASRECORDS: TStringField;
    cdsReferencesSOURCENUM: TIntegerField;
    cdsReferencesSOURCESHORT: TStringField;
    cdsReferencesCONTINENTID: TStringField;
    cdsReferencesCONTINENT: TStringField;
    qReferencesSOURCENUM: TIntegerField;
    qReferencesSOURCESHORT: TStringField;
    qReferencesCONTINENTID: TStringField;
    qReferencesCONTINENT: TStringField;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINNAME: TStringField;
    qDomains: TSQLQuery;
    qDomainsDOMAINNAME: TStringField;
    qDomainsCONTINENTID: TStringField;
    cdsDomainsCONTINENTID: TStringField;
    qDomainsDOMAINID: TIntegerField;
    qDomainsSPOTLATITUDE: TFloatField;
    qDomainsSPOTLONGITUDE: TFloatField;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    qContinentsDEFAULTDOMAINID: TIntegerField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    qDomainsMAXAGE: TFloatField;
    cdsDomainsMAXAGE: TFloatField;
    qDomainsDOMAINPARENTID: TIntegerField;
    qDomainsDOMAINTYPEID: TStringField;
    qDomainsMINPLOTAGE: TFloatField;
    qDomainsMAXPLOTAGE: TFloatField;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TStringField;
    cdsDomainsMINPLOTAGE: TFloatField;
    cdsDomainsMAXPLOTAGE: TFloatField;
    qDomainTypes: TSQLQuery;
    dspDomainTypes: TDataSetProvider;
    cdsDomainTypes: TClientDataSet;
    dsDomainTypes: TDataSource;
    cdsDomainTypesDOMAINTYPEID: TStringField;
    cdsDomainTypesDOMAINTYPE: TStringField;
    cdsDomainTypesDVLEVEL: TIntegerField;
    cdsCountriesSTARTINGVALUE: TIntegerField;
    cdsCountriesDEFAULTMAPID: TStringField;
    sqlcStrat: TSQLConnection;
    qRefDetailSOURCENUM: TIntegerField;
    qRefDetailSOURCESHORT: TStringField;
    qRefDetailSOURCEYEAR: TSmallintField;
    qRefDetailSOURCEDESCRIPTION: TMemoField;
    qRefDetailCONTINENTID: TStringField;
    qRefDetailDOI: TStringField;
    qRefFull: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    MemoField1: TMemoField;
    StringField2: TStringField;
    StringField3: TStringField;
    cdsRefFullSOURCENUM: TIntegerField;
    cdsRefFullSOURCESHORT: TStringField;
    cdsRefFullSOURCEYEAR: TSmallintField;
    cdsRefFullSOURCEDESCRIPTION: TMemoField;
    cdsRefFullCONTINENTID: TStringField;
    cdsRefFullDOI: TStringField;
    qRefNew: TSQLQuery;
    qRefNewSOURCEID: TStringField;
    qRefNewCONTINENTID: TStringField;
    qReferencesSOURCEYEAR: TSmallintField;
    cdsReferencesSOURCEYEAR: TSmallintField;
    qInsertLink: TSQLQuery;
    qProvinces: TSQLQuery;
    qProvincesDOMAINNAME: TStringField;
    qProvincesCONTINENTID: TStringField;
    qProvincesDOMAINID: TIntegerField;
    qProvincesDOMAINTYPEID: TStringField;
    dspProvinces: TDataSetProvider;
    cdsProvinces: TClientDataSet;
    cdsProvincesDOMAINNAME: TStringField;
    cdsProvincesCONTINENTID: TStringField;
    cdsProvincesDOMAINID: TIntegerField;
    cdsProvincesDOMAINTYPEID: TStringField;
    dsProvinces: TDataSource;
    qTerranes: TSQLQuery;
    qTerranesDOMAINNAME: TStringField;
    qTerranesCONTINENTID: TStringField;
    qTerranesDOMAINID: TIntegerField;
    qTerranesDOMAINTYPEID: TStringField;
    dspTerranes: TDataSetProvider;
    cdsTerranes: TClientDataSet;
    cdsTerranesDOMAINNAME: TStringField;
    cdsTerranesCONTINENTID: TStringField;
    cdsTerranesDOMAINID: TIntegerField;
    cdsTerranesDOMAINTYPEID: TStringField;
    dsTerranes: TDataSource;
    cdsRefDetailSOURCENUM: TIntegerField;
    cdsRefDetailSOURCESHORT: TStringField;
    cdsRefDetailSOURCEYEAR: TSmallintField;
    cdsRefDetailSOURCEDESCRIPTION: TMemoField;
    cdsRefDetailCONTINENTID: TStringField;
    cdsRefDetailDOI: TStringField;
    qRefFullWHOFORID: TStringField;
    cdsRefFullWHOFORID: TStringField;
    qUsersWhoFor: TSQLQuery;
    qUsersWhoForUSERID: TStringField;
    qUsersWhoForWHOFORID: TStringField;
    qUsersWhoForWHOFOR: TStringField;
    qUsersWhoForOWNER: TStringField;
    dspUsersWhoFor: TDataSetProvider;
    cdsUsersWhoFor: TClientDataSet;
    cdsUsersWhoForUSERID: TStringField;
    cdsUsersWhoForWHOFORID: TStringField;
    cdsUsersWhoForWHOFOR: TStringField;
    cdsUsersWhoForOWNER: TStringField;
    dsUsersWhoFor: TDataSource;
    SQLMonitor1: TSQLMonitor;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    procedure InsertReference (var wasSuccessful : boolean);
    procedure SubmitNewReference(var WasSuccessful : boolean);
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
  end;

// Procs
  function dmStrat: TdmStrat;

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

function dmStrat: TdmStrat;
begin
  Result := TUserSession(WebApplication.Data).dmStrat;
end;

procedure TdmStrat.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

function TdmStrat.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmStrat.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmStrat.InsertReference (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
  NewRefNum : integer;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReference start';
  NewRefNum := 0;
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SOURCELIST');
    dmStrat.qInsertLink.SQL.Add('(SourceNum, SourceShort, SourceYear, ContinentID)');
    dmStrat.qInsertLink.SQL.Add('Values (:SourceNum, :SourceShort, :SourceYear, :ContinentID)');
    dmStrat.qInsertLink.ParamByName('SourceNum').AsInteger := NewRefNum;
    dmStrat.qInsertLink.ParamByName('SourceShort').AsString := 'NEW'+UserSession.UserID;
    dmStrat.qInsertLink.ParamByName('SourceYear').AsInteger := 1900;
    dmStrat.qInsertLink.ParamByName('ContinentID').AsString := UserSession.NewContinentID;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.SubmitNewReference(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  try
    WasSuccessful := true;
    dmStrat.qRefNew.SQL.Clear;
    dmStrat.qRefNew.SQL.Add('DELETE FROM SOURCELIST');
    dmStrat.qRefNew.SQL.Add('WHERE SOURCELIST.SOURCESHORT = '+''''+'NEW'+UserSession.UserID+'''');
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qRefNew.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    dmStrat.qRefNew.SQL.Clear;
    dmStrat.qRefNew.SQL.Add('INSERT INTO SOURCELIST');
    dmStrat.qRefNew.SQL.Add('(SOURCESHORT, CONTINENTID)');
    dmStrat.qRefNew.SQL.Add('VALUES ('+''''+'NEW'+UserSession.UserID+''''+', '+''''+ValueForUndefinedContinentID+''''+')');

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStrat.qRefNew.SQL.Text);
    end;

    WasSuccessful := true;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qRefNew.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
  end;
end;

end.
