unit DVIW_dmopt;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, DBXCommon, SqlExpr, DBClient, Provider,
  midaslib,
  FlexCel.Core, Flexcel.XlsAdapter,
  IWCompRadioButton, IWCompExtCtrls,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type

TExportType = (
    et_Xls,
    et_Xlsx,
    et_Csv,
    et_Pdf,
    et_Html
  );

 TdmOpt = class(TDataModule)
    sqlcDateView: TSQLConnection;
    dsOpt: TDataSource;
    qOpt: TSQLQuery;
    cdsOpt: TClientDataSet;
    qOptInterp: TSQLQuery;
    cdsOptInterp: TClientDataSet;
    dsOptInterp: TDataSource;
    dsQOpt: TDataSource;
    qOptDates: TSQLQuery;
    cdsOptDates: TClientDataSet;
    dsOptDates: TDataSource;
    qOptGraph: TSQLQuery;
    cdsOptGraph: TClientDataSet;
    dsOptGraph: TDataSource;
    dspOpt: TDataSetProvider;
    cdsOptUSERID: TStringField;
    cdsOptOPTIONTYPEID: TStringField;
    cdsOptOPTIONID: TIntegerField;
    cdsOptOPTIONTITLE: TStringField;
    qOptUSERID: TStringField;
    qOptOPTIONTYPEID: TStringField;
    qOptOPTIONID: TIntegerField;
    qOptOPTIONTITLE: TStringField;
    cdsOptInterpUSERID: TStringField;
    cdsOptInterpOPTIONID: TIntegerField;
    cdsOptInterpINTERPABR: TStringField;
    cdsOptDatesUSERID: TStringField;
    cdsOptDatesOPTIONID: TIntegerField;
    cdsOptDatesDATEMIN: TFloatField;
    cdsOptDatesDATEMAX: TFloatField;
    cdsOptGraphUSERID: TStringField;
    cdsOptGraphMINAGEERROR: TFloatField;
    cdsOptGraphSHOWALLLOCALITIES: TStringField;
    cdsOptGraphGROUPCATEGORY: TStringField;
    dspOptAll: TDataSetProvider;
    cdsOptAll: TClientDataSet;
    dsOptAll: TDataSource;
    cdsOptAllUSERID: TStringField;
    cdsOptAllOPTIONTYPEID: TStringField;
    cdsOptAllOPTIONID: TIntegerField;
    cdsOptAllOPTIONTITLE: TStringField;
    qOptInterpAll: TSQLQuery;
    cdsOptInterpAll: TClientDataSet;
    dsOptInterpAll: TDataSource;
    qOptDatesAll: TSQLQuery;
    cdsOptDatesAll: TClientDataSet;
    dsOptDatesAll: TDataSource;
    dspOptInterpAll: TDataSetProvider;
    dspOptDatesAll: TDataSetProvider;
    cdsOptInterpAllUSERID: TStringField;
    cdsOptInterpAllOPTIONID: TIntegerField;
    cdsOptInterpAllINTERPABR: TStringField;
    cdsOptDatesAllUSERID: TStringField;
    cdsOptDatesAllOPTIONID: TIntegerField;
    cdsOptDatesAllDATEMIN: TFloatField;
    cdsOptDatesAllDATEMAX: TFloatField;
    qOptAll: TSQLQuery;
    qOptDatesAllUSERID: TStringField;
    qOptDatesAllOPTIONID: TIntegerField;
    qOptDatesAllDATEMIN: TFloatField;
    qOptDatesAllDATEMAX: TFloatField;
    qOptInterpAllUSERID: TStringField;
    qOptInterpAllOPTIONID: TIntegerField;
    qOptInterpAllINTERPABR: TStringField;
    qOptAllUSERID: TStringField;
    qOptAllOPTIONTYPEID: TStringField;
    qOptAllOPTIONID: TIntegerField;
    qOptAllOPTIONTITLE: TStringField;
    qGraphAll2: TSQLQuery;
    qGraphAll2USERID: TStringField;
    qGraphAll2MINAGEERROR: TFloatField;
    qGraphAll2SHOWALLLOCALITIES: TStringField;
    qGraphAll2GROUPCATEGORY: TStringField;
    qOptGraphAll: TSQLQuery;
    dspOptGraphAll: TDataSetProvider;
    cdsOptGraphAll: TClientDataSet;
    dsOptGraphAll: TDataSource;
    cdsOptGraphAllUSERID: TStringField;
    cdsOptGraphAllMINAGEERROR: TFloatField;
    cdsOptGraphAllSHOWALLLOCALITIES: TStringField;
    cdsOptGraphAllGROUPCATEGORY: TStringField;
    cdsOptGraphAllPDFTYPE: TStringField;
    cdsOptGraphPDFTYPE: TStringField;
    dspOptInterp: TDataSetProvider;
    dspOptDates: TDataSetProvider;
    dspOptGraph: TDataSetProvider;
    qOptM: TSQLQuery;
    dsqOptM: TDataSource;
    dspOptM: TDataSetProvider;
    cdsOptM: TClientDataSet;
    dsOptM: TDataSource;
    cdsOptMUSERID: TStringField;
    cdsOptMOPTIONTYPEID: TStringField;
    cdsOptMOPTIONID: TIntegerField;
    cdsOptMOPTIONTITLE: TStringField;
    qOptMInterp: TSQLQuery;
    cdsOptMInterp: TClientDataSet;
    dsOptMInterp: TDataSource;
    cdsOptMqOptMInterp: TDataSetField;
    cdsOptMInterpUSERID: TStringField;
    cdsOptMInterpOPTIONID: TIntegerField;
    cdsOptMInterpINTERPABR: TStringField;
    qOptMDates: TSQLQuery;
    qOptMGraph: TSQLQuery;
    cdsOptMDates: TClientDataSet;
    cdsOptMGraph: TClientDataSet;
    dsOptMDates: TDataSource;
    dsOptMGraph: TDataSource;
    cdsOptMqOptMGraph: TDataSetField;
    cdsOptMqOptMDates: TDataSetField;
    cdsOptMDatesUSERID: TStringField;
    cdsOptMDatesOPTIONID: TIntegerField;
    cdsOptMDatesDATEMIN: TFloatField;
    cdsOptMDatesDATEMAX: TFloatField;
    cdsOptMGraphUSERID: TStringField;
    cdsOptMGraphMINAGEERROR: TFloatField;
    cdsOptMGraphSHOWALLLOCALITIES: TStringField;
    cdsOptMGraphGROUPCATEGORY: TStringField;
    cdsOptMGraphPDFTYPE: TStringField;
    qUserGroups: TSQLQuery;
    dspUserGroups: TDataSetProvider;
    cdsUserGroups: TClientDataSet;
    dsUserGroups: TDataSource;
    cdsUserGroupsGROUPING: TStringField;
    cdsUserGroupsUSERID: TStringField;
    cdsUserGroupsEXPIRYDATE: TSQLTimeStampField;
    qUserFor: TSQLQuery;
    dspUserFor: TDataSetProvider;
    cdsUserFor: TClientDataSet;
    dsUserFor: TDataSource;
    cdsUserForWHOFORID: TStringField;
    cdsUserForWHOFOR: TStringField;
    cdsUserForOWNER: TStringField;
    qChangeUserFor: TSQLQuery;
    qOptMInitialIR: TSQLQuery;
    cdsOptMInitialIR: TClientDataSet;
    dsOptMInitialIR: TDataSource;
    cdsOptMInitialIRUSERID: TStringField;
    cdsOptMInitialIROPTIONTYPEID: TStringField;
    cdsOptMInitialIROPTIONID: TIntegerField;
    cdsOptMInitialIRVALUEMIN: TFloatField;
    cdsOptMInitialIRVALUEMAX: TFloatField;
    qOptInitial: TSQLQuery;
    dspOptInitial: TDataSetProvider;
    cdsOptInitial: TClientDataSet;
    dsOptInitial: TDataSource;
    cdsOptInitialUSERID: TStringField;
    cdsOptInitialOPTIONID: TIntegerField;
    cdsOptInitialVALUEMIN: TFloatField;
    cdsOptInitialVALUEMAX: TFloatField;
    cdsOptMqOptMInitialIR: TDataSetField;
    qOptMInitialE: TSQLQuery;
    cdsOptMInitialE: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    dsOptMInitialE: TDataSource;
    qOptMInitialM: TSQLQuery;
    cdsOptMInitialM: TClientDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    dsOptMInitialM: TDataSource;
    cdsOptMqOptMInitialM: TDataSetField;
    cdsOptMqOptMInitialE: TDataSetField;
    qOptMInterpCap1: TSQLQuery;
    cdsOptMInterpCap1: TClientDataSet;
    StringField5: TStringField;
    IntegerField3: TIntegerField;
    StringField6: TStringField;
    dsOptMInterpCap1: TDataSource;
    cdsOptMqOptMInterpCap1: TDataSetField;
    qOptMInterpCap2: TSQLQuery;
    cdsOptMInterpCap2: TClientDataSet;
    StringField7: TStringField;
    IntegerField4: TIntegerField;
    StringField8: TStringField;
    dsOptMInterpCap2: TDataSource;
    qOptMInterpCap3: TSQLQuery;
    cdsOptMInterpCap3: TClientDataSet;
    StringField9: TStringField;
    IntegerField5: TIntegerField;
    StringField10: TStringField;
    dsOptMInterpCap3: TDataSource;
    qOptMInterpCap4: TSQLQuery;
    cdsOptMInterpCap4: TClientDataSet;
    StringField11: TStringField;
    IntegerField6: TIntegerField;
    StringField12: TStringField;
    dsOptMInterpCap4: TDataSource;
    qOptMInterpCap5: TSQLQuery;
    cdsOptMInterpCap5: TClientDataSet;
    StringField13: TStringField;
    IntegerField7: TIntegerField;
    StringField14: TStringField;
    dsOptMInterpCap5: TDataSource;
    cdsOptMqOptMInterpCap5: TDataSetField;
    cdsOptMqOptMInterpCap4: TDataSetField;
    cdsOptMqOptMInterpCap3: TDataSetField;
    cdsOptMqOptMInterpCap2: TDataSetField;
    qOptionTypes: TSQLQuery;
    dspOptionTypes: TDataSetProvider;
    cdsOptionTypes: TClientDataSet;
    dsOptionTypes: TDataSource;
    cdsOptionTypesOPTIONTYPEID: TStringField;
    cdsOptionTypesOPTIONTYPE: TStringField;
    qOptRCap1: TSQLQuery;
    cdsOptRCap1: TClientDataSet;
    dsOptRCap1: TDataSource;
    qOptRCap2: TSQLQuery;
    cdsOptRCap2: TClientDataSet;
    dsOptRCap2: TDataSource;
    qOptRCap3: TSQLQuery;
    cdsOptRCap3: TClientDataSet;
    dsOptRCap3: TDataSource;
    qOptRCap4: TSQLQuery;
    cdsOptRCap4: TClientDataSet;
    dsOptRCap4: TDataSource;
    qOptRCap5: TSQLQuery;
    cdsOptRCap5: TClientDataSet;
    dsOptRCap5: TDataSource;
    qOptR: TSQLQuery;
    dsqOptR: TDataSource;
    dspOptR: TDataSetProvider;
    cdsOptR: TClientDataSet;
    dsOptR: TDataSource;
    dsOptRVal5: TDataSource;
    cdsOptRVal5: TClientDataSet;
    qOptRVal5: TSQLQuery;
    dsOptRVal4: TDataSource;
    cdsOptRVal4: TClientDataSet;
    qOptRVal4: TSQLQuery;
    dsOptRVal3: TDataSource;
    cdsOptRVal3: TClientDataSet;
    qOptRVal3: TSQLQuery;
    dsOptRVal2: TDataSource;
    cdsOptRVal2: TClientDataSet;
    qOptRVal2: TSQLQuery;
    dsOptRVal1: TDataSource;
    cdsOptRVal1: TClientDataSet;
    qOptRVal1: TSQLQuery;
    cdsOptRUSERID: TStringField;
    cdsOptROPTIONTYPEID: TStringField;
    cdsOptROPTIONID: TIntegerField;
    cdsOptROPTIONTITLE: TStringField;
    cdsOptRCap1USERID: TStringField;
    cdsOptRCap1OPTIONTYPEID: TStringField;
    cdsOptRCap1OPTIONID: TIntegerField;
    cdsOptRCap1OPTIONTITLE: TStringField;
    cdsOptRCap2USERID: TStringField;
    cdsOptRCap2OPTIONTYPEID: TStringField;
    cdsOptRCap2OPTIONID: TIntegerField;
    cdsOptRCap2OPTIONTITLE: TStringField;
    cdsOptRCap3USERID: TStringField;
    cdsOptRCap3OPTIONTYPEID: TStringField;
    cdsOptRCap3OPTIONID: TIntegerField;
    cdsOptRCap3OPTIONTITLE: TStringField;
    cdsOptRCap4USERID: TStringField;
    cdsOptRCap4OPTIONTYPEID: TStringField;
    cdsOptRCap4OPTIONID: TIntegerField;
    cdsOptRCap4OPTIONTITLE: TStringField;
    cdsOptRCap5USERID: TStringField;
    cdsOptRCap5OPTIONTYPEID: TStringField;
    cdsOptRCap5OPTIONID: TIntegerField;
    cdsOptRCap5OPTIONTITLE: TStringField;
    cdsOptRVal1USERID: TStringField;
    cdsOptRVal1OPTIONTYPEID: TStringField;
    cdsOptRVal1OPTIONID: TIntegerField;
    cdsOptRVal1VALUEMIN: TFloatField;
    cdsOptRVal1VALUEMAX: TFloatField;
    cdsOptRVal2USERID: TStringField;
    cdsOptRVal2OPTIONTYPEID: TStringField;
    cdsOptRVal2OPTIONID: TIntegerField;
    cdsOptRVal2VALUEMIN: TFloatField;
    cdsOptRVal2VALUEMAX: TFloatField;
    cdsOptRVal3USERID: TStringField;
    cdsOptRVal3OPTIONTYPEID: TStringField;
    cdsOptRVal3OPTIONID: TIntegerField;
    cdsOptRVal3VALUEMIN: TFloatField;
    cdsOptRVal3VALUEMAX: TFloatField;
    cdsOptRVal4USERID: TStringField;
    cdsOptRVal4OPTIONTYPEID: TStringField;
    cdsOptRVal4OPTIONID: TIntegerField;
    cdsOptRVal4VALUEMIN: TFloatField;
    cdsOptRVal4VALUEMAX: TFloatField;
    cdsOptRVal5USERID: TStringField;
    cdsOptRVal5OPTIONTYPEID: TStringField;
    cdsOptRVal5OPTIONID: TIntegerField;
    cdsOptRVal5VALUEMIN: TFloatField;
    cdsOptRVal5VALUEMAX: TFloatField;
    cdsOptInitialOPTIONTYPEID: TStringField;
    cdsOptRqOptRCap1: TDataSetField;
    qOptRUSERID: TStringField;
    qOptROPTIONTYPEID: TStringField;
    qOptROPTIONID: TIntegerField;
    qOptROPTIONTITLE: TStringField;
    cdsOptRqOptRCap5: TDataSetField;
    cdsOptRqOptRCap4: TDataSetField;
    cdsOptRqOptRCap3: TDataSetField;
    cdsOptRqOptRCap2: TDataSetField;
    cdsOptRqOptRVal5: TDataSetField;
    cdsOptRqOptRVal4: TDataSetField;
    cdsOptRqOptRVal3: TDataSetField;
    cdsOptRqOptRVal2: TDataSetField;
    cdsOptRqOptRVal1: TDataSetField;
    qForList: TSQLQuery;
    dspForList: TDataSetProvider;
    cdsForList: TClientDataSet;
    cdsForListWHOFORID: TStringField;
    cdsForListWHOFOR: TStringField;
    cdsForListOWNER: TStringField;
    dsForList: TDataSource;
    SQLMonitor1: TSQLMonitor;
    procedure FlexCelReport1AfterGenerateWorkbook(Sender: TObject;
      const ExcelApp: TExcelFile);
  private
    //Private declarations
    function GetExportType: TExportType;
    function GetExt: string;
  public
    //Public declarations
    procedure GetUserOptions;
    procedure GetUserGraphOptions (tOptionTypeID : string);
    procedure SetUserOptions3;
    procedure PublishRecords(tempWhoForID : string;
                             var WasSuccessful : boolean);
    procedure InsertUserFor(tWhoForID : string; tUserID : string;
                             var WasSuccessful : boolean);
  end;

// Procs
  function  dmOpt: TdmOpt;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  VCL.FlexCel.Core, FlexCel.Render, FlexCel.Pdf,
  DVIW_constants, usrIW_dm;


function dmOpt: TdmOpt;
begin
  Result := TUserSession(WebApplication.Data).dmOpt;
end;

procedure ExportToHtml(const MemStream: TStream; const xls: TXlsFile);
var
  html: TFlexCelHtmlExport;
  sw: TStreamWriter;
begin
  html := TFlexCelHtmlExport.Create(xls, true);
  try
    sw := TStreamWriter.Create(MemStream);
    try
      html.ExportAllVisibleSheetsAsOneHtmlFile(sw, 'test.html', '', '', '-----------------');
    finally
      sw.Free;
    end;
  finally
    html.Free;
  end;
end;

procedure ExportToPdf(const MemStream: TStream; const xls: TXlsFile);
var
  pdf: TFlexCelPdfExport;
begin
  pdf := TFlexCelPdfExport.Create(xls, true);
  try
    pdf.Export(MemStream);
  finally
    pdf.Free;
  end;
end;

procedure ExportFile(const MemStream: TStream; const xls: FlexCel.XlsAdapter.TXlsFile; const ExportType: TExportType);
begin
  case ExportType of
    et_Xls: xls.Save(MemStream, TFileFormats.Xls);
    et_Xlsx: xls.Save(MemStream, TFileFormats.Xlsx);
    et_Csv: xls.Save(MemStream, TFileFormats.Text, ',', TEncoding.UTF8);
    et_Html: ExportToHtml(MemStream, xls);
    et_Pdf: ExportToPdf(MemStream, xls);
  end;
  MemStream.Position := 0;
end;

function TdmOpt.GetExportType: TExportType;
begin
  if (UserSession.FlexcelExportExtension='.XLSX') then Exit(et_Xlsx);
  if (UserSession.FlexcelExportExtension='.CSV') then Exit(et_Csv);
  if (UserSession.FlexcelExportExtension='.HTML') then Exit(et_Html);
  if (UserSession.FlexcelExportExtension='.PDF') then Exit(et_Pdf);
  //if cbXlsx.Checked then exit(et_Xlsx);
  //if cbCSV.Checked then exit(et_Csv);
  //if cbHTML.Checked then exit(et_Html);
  //if cbPdf.Checked then exit(et_Pdf);
  Result := et_Xls;
end;

function TdmOpt.GetExt: string;
begin
  if (UserSession.FlexcelExportExtension='.XLSX') then Exit('.xlsx');
  if (UserSession.FlexcelExportExtension='.CSV') then Exit('.csv');
  if (UserSession.FlexcelExportExtension='.HTML') then Exit('.html');
  if (UserSession.FlexcelExportExtension='.PDF') then Exit('.pdf');
  //if cbXlsx.Checked then exit('.xlsx');
  //if cbCSV.Checked then exit('.csv');
  //if cbHTML.Checked then exit('.html');
  //if cbPdf.Checked then exit('.pdf');
  Result := '.xlsx';
end;

procedure TdmOpt.GetUserOptions;
var
  i : integer;
  IsNewUser : boolean;
begin
  IsNewUser := false;
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'I';
  dmOpt.cdsOpt.Close;
  dmOpt.cdsOpt.Open;
  if (dmOpt.cdsOpt.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOpt.Filtered := false;
      dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOpt.Filtered := true;
      case i of
        1 : begin
          UserSession.Interpretation1Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        2 : begin
          UserSession.Interpretation2Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        3 : begin
          UserSession.Interpretation3Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        4 : begin
          UserSession.Interpretation4Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        5 : begin
          UserSession.Interpretation5Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
      end;
    end;
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOpt.Filtered := false;
      dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOpt.Filtered := true;
      case i of
        1 : begin
          UserSession.DateBand1Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        2 : begin
          UserSession.DateBand2Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        3 : begin
          UserSession.DateBand3Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        4 : begin
          UserSession.DateBand4Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        5 : begin
          UserSession.DateBand5Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
      end;
    end;
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'E';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOpt.Filtered := false;
      dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOpt.Filtered := true;
      case i of
        1 : begin
          UserSession.ItemBand1Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        2 : begin
          UserSession.ItemBand2Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        3 : begin
          UserSession.ItemBand3Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        4 : begin
          UserSession.ItemBand4Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        5 : begin
          UserSession.ItemBand5Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
      end;
    end;
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.Interpretation1Caption := 'Emplacement';
    UserSession.Interpretation2Caption := 'Metamorphism';
    UserSession.Interpretation3Caption := 'Cooling';
    UserSession.Interpretation4Caption := 'Inherited';
    UserSession.Interpretation5Caption := 'Disturbed';
    UserSession.DateBand1Caption := '0-700 Ma';
    UserSession.DateBand2Caption := '700-1300 Ma';
    UserSession.DateBand3Caption := '1300-2100 Ma';
    UserSession.DateBand4Caption := '2100-2500 Ma';
    UserSession.DateBand5Caption := '2500-4500 Ma';
    UserSession.DateBand1Minimum := '0.0';
    UserSession.DateBand1Maximum := '700.0';
    UserSession.DateBand2Minimum := '700.0';
    UserSession.DateBand2Maximum := '1300.0';
    UserSession.DateBand3Minimum := '1300.0';
    UserSession.DateBand3Maximum := '2100.0';
    UserSession.DateBand4Minimum := '2100.0';
    UserSession.DateBand4Maximum := '2500.0';
    UserSession.DateBand5Minimum := '2500.0';
    UserSession.DateBand5Maximum := '4500.0';
    UserSession.ItemBand1Caption := 'Range 1';
    UserSession.ItemBand2Caption := 'Range 2';
    UserSession.ItemBand3Caption := 'Range 3';
    UserSession.ItemBand4Caption := 'Range 4';
    UserSession.ItemBand5Caption := 'Range 5';
    UserSession.ItemBand1Minimum := '-20.0';
    UserSession.ItemBand1Maximum := '-10.0';
    UserSession.ItemBand2Minimum := '-10.0';
    UserSession.ItemBand2Maximum := '-5.0';
    UserSession.ItemBand3Minimum := '-5.0';
    UserSession.ItemBand3Maximum := '5.0';
    UserSession.ItemBand4Minimum := '5.0';
    UserSession.ItemBand4Maximum := '10.0';
    UserSession.ItemBand5Minimum := '10.0';
    UserSession.ItemBand5Maximum := '20.0';
  end;
  dmOpt.cdsOpt.Close;

  dmOpt.qOptInterp.Close;
  dmOpt.qOptInterp.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptInterp.Close;
  dmOpt.cdsOptInterp.Open;
  if (dmOpt.cdsOptInterp.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOptInterp.Filtered := false;
      dmOpt.cdsOptInterp.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOptInterp.Filtered := true;
      case i of
        1 : begin
          dmOpt.cdsOptInterp.First;
          UserSession.Interpretation1Values.Clear;
          repeat
            UserSession.Interpretation1Values.Add(dmOpt.cdsOptInterpINTERPABR.AsString);
            dmOpt.cdsOptInterp.Next;
          until dmOpt.cdsOptInterp.Eof;
        end;
        2 : begin
          dmOpt.cdsOptInterp.First;
          UserSession.Interpretation2Values.Clear;
          repeat
            UserSession.Interpretation2Values.Add(dmOpt.cdsOptInterpINTERPABR.AsString);
            dmOpt.cdsOptInterp.Next;
          until dmOpt.cdsOptInterp.Eof;
        end;
        3 : begin
          dmOpt.cdsOptInterp.First;
          UserSession.Interpretation3Values.Clear;
          repeat
            UserSession.Interpretation3Values.Add(dmOpt.cdsOptInterpINTERPABR.AsString);
            dmOpt.cdsOptInterp.Next;
          until dmOpt.cdsOptInterp.Eof;
        end;
        4 : begin
          dmOpt.cdsOptInterp.First;
          UserSession.Interpretation4Values.Clear;
          repeat
            UserSession.Interpretation4Values.Add(dmOpt.cdsOptInterpINTERPABR.AsString);
            dmOpt.cdsOptInterp.Next;
          until dmOpt.cdsOptInterp.Eof;
        end;
        5 : begin
          dmOpt.cdsOptInterp.First;
          UserSession.Interpretation5Values.Clear;
          repeat
            UserSession.Interpretation5Values.Add(dmOpt.cdsOptInterpINTERPABR.AsString);
            dmOpt.cdsOptInterp.Next;
          until dmOpt.cdsOptInterp.Eof;
        end;
      end;
    end;
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.Interpretation1Values.Clear;
    UserSession.Interpretation2Values.Clear;
    UserSession.Interpretation3Values.Clear;
    UserSession.Interpretation4Values.Clear;
    UserSession.Interpretation5Values.Clear;
    UserSession.Interpretation1Values.Add('CrysI');
    UserSession.Interpretation2Values.Add('MetpR');
    UserSession.Interpretation3Values.Add('Cool');
    UserSession.Interpretation4Values.Add('Inher');
    UserSession.Interpretation5Values.Add('DstUn');
  end;
  dmOpt.cdsOptInterp.Close;
  dmOpt.cdsOptInterp.Filtered := false;

  dmOpt.qOptDates.Close;
  dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptDates.Close;
  dmOpt.cdsOptDates.Open;
  if (dmOpt.cdsOptDates.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOptDates.Filtered := false;
      dmOpt.cdsOptDates.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOptDates.Filtered := true;
      case i of
        1 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand1Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand1Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        2 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand2Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand2Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        3 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand3Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand3Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        4 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand4Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand4Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        5 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand5Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand5Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
      end;
    end;
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.DateBand1Minimum := '0';
    UserSession.DateBand1Maximum := '700';
    UserSession.DateBand2Minimum := '700';
    UserSession.DateBand2Maximum := '1300';
    UserSession.DateBand3Minimum := '1300';
    UserSession.DateBand3Maximum := '2100';
    UserSession.DateBand4Minimum := '2100';
    UserSession.DateBand4Maximum := '2500';
    UserSession.DateBand5Minimum := '2500';
    UserSession.DateBand5Maximum := '4500';
    UserSession.DateBand1Caption := '0-700 Ma';
    UserSession.DateBand2Caption := '700-1300 Ma';
    UserSession.DateBand3Caption := '1300-2100 Ma';
    UserSession.DateBand4Caption := '2100-2500 Ma';
    UserSession.DateBand5Caption := '2500-4500 Ma';
  end;
  dmOpt.cdsOptDates.Close;

  dmOpt.qOptInitial.Close;
  dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptInitial.ParamByName('OptionTypeID').AsString := 'E';
  dmOpt.cdsOptInitial.Close;
  dmOpt.cdsOptInitial.Open;
  if (dmOpt.cdsOptInitial.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOptInitial.Filtered := false;
      dmOpt.cdsOptInitial.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOptInitial.Filtered := true;
      case i of
        1 : begin
          dmOpt.cdsOptInitial.First;
          UserSession.ItemBand1Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
          UserSession.ItemBand1Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
        end;
        2 : begin
          dmOpt.cdsOptInitial.First;
          UserSession.ItemBand2Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
          UserSession.ItemBand2Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
        end;
        3 : begin
          dmOpt.cdsOptInitial.First;
          UserSession.ItemBand3Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
          UserSession.ItemBand3Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
        end;
        4 : begin
          dmOpt.cdsOptInitial.First;
          UserSession.ItemBand4Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
          UserSession.ItemBand4Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
        end;
        5 : begin
          dmOpt.cdsOptInitial.First;
          UserSession.ItemBand5Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
          UserSession.ItemBand5Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
        end;
      end;
    end;
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.ItemBand1Minimum := '-20.0';
    UserSession.ItemBand1Maximum := '-10.0';
    UserSession.ItemBand2Minimum := '-10.0';
    UserSession.ItemBand2Maximum := '-5.0';
    UserSession.ItemBand3Minimum := '-5.0';
    UserSession.ItemBand3Maximum := '5.0';
    UserSession.ItemBand4Minimum := '5.0';
    UserSession.ItemBand4Maximum := '10.0';
    UserSession.ItemBand5Minimum := '10.0';
    UserSession.ItemBand5Maximum := '20.0';
    UserSession.ItemBand1Caption := 'Range 1';
    UserSession.ItemBand2Caption := 'Range 2';
    UserSession.ItemBand3Caption := 'Range 3';
    UserSession.ItemBand4Caption := 'Range 4';
    UserSession.ItemBand5Caption := 'Range 5';
  end;
  dmOpt.cdsOptInitial.Close;

  dmOpt.qOptGraph.Close;
  dmOpt.qOptGraph.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptGraph.Close;
  dmOpt.cdsOptGraph.Open;
  if (dmOpt.cdsOptGraph.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    UserSession.GroupBy := dmOpt.cdsOptGraphGROUPCATEGORY.AsString;
    UserSession.MinimumDateUncertainty := dmOpt.cdsOptGraphMINAGEERROR.AsString;
    if  (dmOpt.cdsOptGraphSHOWALLLOCALITIES.AsString = 'Y')
      then UserSession.ShowAllSampleLocalities := true
      else UserSession.ShowAllSampleLocalities := false;
    if  (dmOpt.cdsOptGraphPDFTYPE.AsString = 'AND')
      then UserSession.PDFType := 'AND'
      else UserSession.PDFType := 'OR';
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.GroupBy := 'Province';
    UserSession.MinimumDateUncertainty := '1.0';
    UserSession.PDFType := 'AND';
    UserSession.ShowAllSampleLocalities := false;
  end;
  dmOpt.cdsOptGraph.Close;
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'I';
  dmOpt.cdsOpt.Close;
  dmOpt.cdsOpt.Open;
  //dmOpt.cdsOptInterp.Open;
  //WebApplication.ShowMessage('SetOptions3 new user '+IntToStr(dmOpt.cdsOptInterp.RecordCount));
  if (IsNewUser) then
  begin
    //no record exists for this user. Store default values in database
    dmOpt.SetUserOptions3;
  end;
end;

{
FlexCel 3 had a somehow overcomplicated way to save in different formats: You
could select multiple formats and they all would be saved at the same time. But
of course, this meant that you needed a way to tell the xlsxadapter the filename
or stream for each one of the formats. There are 2 events you can use for that:

[CODE]
procedure TIWForm1.FlexCelReport1GetFilename(Sender: TObject;
  const FileFormat: Integer; var Filename: TFileName);
begin

end;

procedure TIWForm1.FlexCelReport1GetOutStream(Sender: TObject;
  const FileFormat: Integer; var OutStream: TStream);
begin

end;
[/CODE]

In your case, as you are saving to a stream you would use the second one.

But I wouldn't use any of this. As said, this is a bad overcomplicated design
in FlexCel 3. But also, by doing it this way you will only get the formats you
mentioned (csv, xls, xlsx) and you will anyway miss pdf and html, which are
probably more interesting (especially html since you are doing intraweb)

So my advise would be to extract the FlexCel 6 TXlsFile object from the
XlsxAdapter, and use that to export to different file formats.

I've uploaded a little sample on how to do this here:
http://www.tmssoftware.biz/flexcel/samples/TestIW.zip

Basically, you unselect all the save formats in the XlsxAdapter, so when you
call run the report is generated but not saved. Then in the AfterGenerateWorkbook
event, you grab the real FlexCel 6 TXlsFile object used by TXlsxAdapter, and
use that to export. There are much more options this way (for example when
exporting to text you can specify the encoding to be utf8 or whatever). And
you can get pdf and html too.  (the main issue with html is images)

The only thing to be aware is that there is an "old" TExcelFile object (used
in FlexCel 3) and the new TExcelFIle object used in FlexCel 6. You might need
to prefix TExcelFile with FlexCel.Core.TExcelFile.
}

procedure TdmOpt.FlexCelReport1AfterGenerateWorkbook(Sender: TObject;
  const ExcelApp: TExcelFile);
var
  xls: FlexCel.XlsAdapter.TXlsFile;
  MemStream: TMemoryStream;
begin
  {
  xls := (ExcelApp as TXLSXFile).GetTWorkbook;
  MemStream.Free;
  MemStream := TMemoryStream.Create;

  ExportFile(MemStream, xls, GetExportType);
  try
    Report1.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','Approach.xlsx'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
  }
end;

procedure TdmOpt.GetUserGraphOptions (tOptionTypeID : string);
var
  i : integer;
  IsNewUser : boolean;
begin
  IsNewUser := false;
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := tOptionTypeID;
  dmOpt.cdsOpt.Close;
  dmOpt.cdsOpt.Open;
  if (dmOpt.cdsOpt.RecordCount > 0) then
  begin
    //record exists for this user. Read values from database and update UserSession
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOpt.Filtered := false;
      dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOpt.Filtered := true;
      case i of
        1 : begin
          UserSession.ItemBand1Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        2 : begin
          UserSession.ItemBand2Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        3 : begin
          UserSession.ItemBand3Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        4 : begin
          UserSession.ItemBand4Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        5 : begin
          UserSession.ItemBand5Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
      end;
    end;
  end else
  begin
    //no record exists for this user. Create default values for UserSession
    IsNewUser := true;
    UserSession.ItemBand1Caption := 'Emplacement';
    UserSession.ItemBand2Caption := 'Metamorphism';
    UserSession.ItemBand3Caption := 'Cooling';
    UserSession.ItemBand4Caption := 'Inherited';
    UserSession.ItemBand5Caption := 'Disturbed';
    UserSession.ItemBand1Minimum := '0.0';
    UserSession.ItemBand1Maximum := '700.0';
    UserSession.ItemBand2Minimum := '700.0';
    UserSession.ItemBand2Maximum := '1300.0';
    UserSession.ItemBand3Minimum := '1300.0';
    UserSession.ItemBand3Maximum := '2100.0';
    UserSession.ItemBand4Minimum := '2100.0';
    UserSession.ItemBand4Maximum := '2500.0';
    UserSession.ItemBand5Minimum := '2500.0';
    UserSession.ItemBand5Maximum := '4500.0';
  end;
  dmOpt.cdsOpt.Close;
  if (tOptionTypeID = 'D') then
  begin
    dmOpt.qOptDates.Close;
    dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptDates.Close;
    dmOpt.cdsOptDates.Open;
    if (dmOpt.cdsOptDates.RecordCount > 0) then
    begin
      //record exists for this user. Read values from database and update UserSession
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptDates.Filtered := false;
        dmOpt.cdsOptDates.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOptDates.Filtered := true;
        case i of
          1 : begin
            dmOpt.cdsOptDates.First;
            UserSession.DateBand1Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
            UserSession.DateBand1Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
          end;
          2 : begin
            dmOpt.cdsOptDates.First;
            UserSession.DateBand2Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
            UserSession.DateBand2Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
          end;
          3 : begin
            dmOpt.cdsOptDates.First;
            UserSession.DateBand3Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
            UserSession.DateBand3Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
          end;
          4 : begin
            dmOpt.cdsOptDates.First;
            UserSession.DateBand4Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
            UserSession.DateBand4Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
          end;
          5 : begin
            dmOpt.cdsOptDates.First;
            UserSession.DateBand5Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
            UserSession.DateBand5Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
          end;
        end;
      end;
    end else
    begin
      //no record exists for this user. Create default values for UserSession
      IsNewUser := true;
      UserSession.DateBand1Minimum := '0';
      UserSession.DateBand1Maximum := '700';
      UserSession.DateBand2Minimum := '700';
      UserSession.DateBand2Maximum := '1300';
      UserSession.DateBand3Minimum := '1300';
      UserSession.DateBand3Maximum := '2100';
      UserSession.DateBand4Minimum := '2100';
      UserSession.DateBand4Maximum := '2500';
      UserSession.DateBand5Minimum := '2500';
      UserSession.DateBand5Maximum := '4500';
      UserSession.DateBand1Caption := '0-700 Ma';
      UserSession.DateBand2Caption := '700-1300 Ma';
      UserSession.DateBand3Caption := '1300-2100 Ma';
      UserSession.DateBand4Caption := '2100-2500 Ma';
      UserSession.DateBand5Caption := '2500-4500 Ma';
    end;
    dmOpt.cdsOptDates.Close;
  end;
  if ((tOptionTypeID = '0') or (tOptionTypeID = '6') or
      (tOptionTypeID = '7') or (tOptionTypeID = '8') or
      (tOptionTypeID = 'M') or (tOptionTypeID = 'E')) then
  begin
    dmOpt.qOptInitial.Close;
    dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptInitial.ParamByName('OPTIONTYPEID').AsString := tOptionTypeID;
    dmOpt.cdsOptInitial.Close;
    dmOpt.cdsOptInitial.Open;
    if (dmOpt.cdsOptInitial.RecordCount > 0) then
    begin
      //record exists for this user. Read values from database and update UserSession
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptInitial.Filtered := false;
        dmOpt.cdsOptInitial.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOptInitial.Filtered := true;
        case i of
          1 : begin
            dmOpt.cdsOptInitial.First;
            UserSession.ItemBand1Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
            UserSession.ItemBand1Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
          end;
          2 : begin
            dmOpt.cdsOptInitial.First;
            UserSession.ItemBand2Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
            UserSession.ItemBand2Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
          end;
          3 : begin
            dmOpt.cdsOptInitial.First;
            UserSession.ItemBand3Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
            UserSession.ItemBand3Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
          end;
          4 : begin
            dmOpt.cdsOptInitial.First;
            UserSession.ItemBand4Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
            UserSession.ItemBand4Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
          end;
          5 : begin
            dmOpt.cdsOptInitial.First;
            UserSession.ItemBand5Minimum := dmOpt.cdsOptInitialVALUEMIN.AsString;
            UserSession.ItemBand5Maximum := dmOpt.cdsOptInitialVALUEMAX.AsString;
          end;
        end;
      end;
    end else
    begin
      //no record exists for this user. Create default values for UserSession
      IsNewUser := true;
      UserSession.ItemBand1Caption := 'Range 1';
      UserSession.ItemBand2Caption := 'Range 2';
      UserSession.ItemBand3Caption := 'Range 3';
      UserSession.ItemBand4Caption := 'Range 4';
      UserSession.ItemBand5Caption := 'Range 5';
      UserSession.ItemBand1Minimum := '-20.0';
      UserSession.ItemBand1Maximum := '-10.0';
      UserSession.ItemBand2Minimum := '-10.0';
      UserSession.ItemBand2Maximum := '-5.0';
      UserSession.ItemBand3Minimum := '-5.0';
      UserSession.ItemBand3Maximum := '5.0';
      UserSession.ItemBand4Minimum := '5.0';
      UserSession.ItemBand4Maximum := '10.0';
      UserSession.ItemBand5Minimum := '10.0';
      UserSession.ItemBand5Maximum := '20.0';
    end;
    dmOpt.cdsOptInitial.Close;
  end;
end;

procedure TdmOpt.SetUserOptions3;
var
  i, j, iCount : integer;
  IsNewUser : boolean;
begin
  //check whether this is a new user or not
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'I';
  dmOpt.cdsOpt.Close;
  dmOpt.qOptGraph.Close;
  dmOpt.qOptGraph.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptGraph.Close;
  dmOpt.qOptInterp.Close;
  dmOpt.qOptInterp.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptInterp.Close;
  dmOpt.cdsOptInterp.Filtered := false;
  dmOpt.qOptDates.Close;
  dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptDates.Close;
  dmOpt.qOptInitial.Close;
  dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptInitial.ParamByName('OptionTypeID').AsString := 'E';
  dmOpt.cdsOptInitial.Close;
  try
    IsNewUser := false;
    dmOpt.cdsOpt.Open;
    if (dmOpt.cdsOpt.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptGraph.Open;
    if (dmOpt.cdsOptGraph.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptInterp.Open;
    if (dmOpt.cdsOptInterp.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptDates.Open;
    if (dmOpt.cdsOptDates.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptInitial.Open;
    if (dmOpt.cdsOptInitial.RecordCount = 0) then IsNewUser := true;
  except
    IsNewUser := true;
  end;
  //WebApplication.ShowMessage('SetOptions3 new user '+IntToStr(dmOpt.cdsOptInterp.RecordCount));
  if (IsNewUser) then
  begin
    //no record exists for this user. Create records in USEROPTS table for Interpretations
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'I';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'I';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation1Caption;
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation2Caption;
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation3Caption;
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation4Caption;
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation5Caption;
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_I');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_I');
    end;
    dmOpt.cdsOpt.Close;
    //no record exists for this user. Create records in USEROPTS table for DateBands
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'D';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand1Caption;
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand2Caption;
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand3Caption;
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand4Caption;
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand5Caption;
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_D');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_D');
    end;
    dmOpt.cdsOpt.Close;
    //no record exists for this user. Create records in USEROPTS table for Initial Ratio plots
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := '0';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := '0';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Initial ratio range 1';
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Initial ratio range 2';
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Initial ratio range 3';
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Initial ratio range 4';
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Initial ratio range 5';
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_0');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_0');
    end;
    dmOpt.cdsOpt.Close;
    //no record exists for this user. Create records in USEROPTS table for Initial Ratio plots
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'E';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'E';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Epsilon range 1';
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Epsilon range 2';
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Epsilon range 3';
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Epsilon range 4';
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Epsilon range 5';
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_E');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_E');
    end;
    dmOpt.cdsOpt.Close;
    //no record exists for this user. Create records in USEROPTS table for Initial Ratio plots
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'M';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'M';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Mu range 1';
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Mu range 2';
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Mu range 3';
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Mu range 4';
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := 'Mu range 5';
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_M');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_M');
    end;
    dmOpt.cdsOpt.Close;
    //no record exists for this user. Create records in USEROPTGRAPH table
    dmOpt.qOptGraph.Close;
    dmOpt.qOptGraph.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptGraph.Close;
    dmOpt.cdsOptGraph.Open;
    try
      dmOpt.cdsOptGraph.Append;
      dmOpt.cdsOptGraphUSERID.AsString := UserSession.UserID;
      dmOpt.cdsOptGraphGROUPCATEGORY.AsString := UserSession.GroupBy;
      dmOpt.cdsOptGraphMINAGEERROR.AsString := UserSession.MinimumDateUncertainty;
      if  UserSession.ShowAllSampleLocalities
        then dmOpt.cdsOptGraphSHOWALLLOCALITIES.AsString := 'Y'
        else dmOpt.cdsOptGraphSHOWALLLOCALITIES.AsString := 'N';
      if  UserSession.PDFType='AND'
        then dmOpt.cdsOptGraphPDFTYPE.AsString := 'AND'
        else dmOpt.cdsOptGraphPDFTYPE.AsString := 'OR';
      dmOpt.cdsOptGraph.Post;
      dmOpt.cdsOptGraph.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to create new records for OptGraph');
    end;
    dmOpt.cdsOptGraph.Close;
    //no record exists for this user. Create records in USEROPTINTERP table
    dmOpt.qOptInterp.Close;
    dmOpt.qOptInterp.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptInterp.Close;
    dmOpt.cdsOptInterp.Open;
    dmOpt.cdsOptInterp.Filtered := false;
    try
      for i := 1 to MaxSeries do
      begin
        try
          case i of
            1 : begin
              iCount := UserSession.Interpretation1Values.Count;
              if (iCount = 0) then
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
                dmOpt.cdsOptInterp.Post;
              end;
              if (iCount >= 1) then
              begin
                for j := 0 to iCount-1 do
                begin
                  dmOpt.cdsOptInterp.Append;
                  dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                  dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                  dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation1Values.Strings[j];
                  dmOpt.cdsOptInterp.Post;
                end;
              end;
            end;
            2 : begin
              iCount := UserSession.Interpretation2Values.Count;
              if (iCount = 0) then
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
                dmOpt.cdsOptInterp.Post;
              end;
              if (iCount >= 1) then
              begin
                for j := 0 to iCount-1 do
                begin
                  dmOpt.cdsOptInterp.Append;
                  dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                  dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                  dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation2Values.Strings[j];
                  dmOpt.cdsOptInterp.Post;
                end;
              end;
            end;
            3 : begin
              iCount := UserSession.Interpretation3Values.Count;
              if (iCount = 0) then
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
                dmOpt.cdsOptInterp.Post;
              end;
              if (iCount >= 1) then
              begin
                for j := 0 to iCount-1 do
                begin
                  dmOpt.cdsOptInterp.Append;
                  dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                  dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                  dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation3Values.Strings[j];
                  dmOpt.cdsOptInterp.Post;
                end;
              end;
            end;
            4 : begin
              iCount := UserSession.Interpretation4Values.Count;
              if (iCount = 0) then
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
                dmOpt.cdsOptInterp.Post;
              end;
              if (iCount >= 1) then
              begin
                for j := 0 to iCount-1 do
                begin
                  dmOpt.cdsOptInterp.Append;
                  dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                  dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                  dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation4Values.Strings[j];
                  dmOpt.cdsOptInterp.Post;
                end;
              end;
            end;
            5 : begin
              iCount := UserSession.Interpretation5Values.Count;
              if (iCount = 0) then
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
                dmOpt.cdsOptInterp.Post;
              end;
              if (iCount >= 1) then
              begin
                for j := 0 to iCount-1 do
                begin
                  dmOpt.cdsOptInterp.Append;
                  dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                  dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                  dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation5Values.Strings[j];
                  dmOpt.cdsOptInterp.Post;
                end;
              end;
            end;
          end;
        except
          WebApplication.ShowMessage('Not able to modify records for OptInterp '+IntToStr(i));
        end;
      end;
      dmOpt.cdsOptInterp.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptInterp');
    end;
    dmOpt.qOptInterp.Close;
    //no record exists for this user. Create records in USEROPTDATES table
    dmOpt.qOptDates.Close;
    dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptDates.Close;
    dmOpt.cdsOptDates.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptDates.Append;
        dmOpt.cdsOptDatesUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptDatesOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand1Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand1Maximum;
          end;
          2 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand2Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand2Maximum;
          end;
          3 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand3Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand3Maximum;
          end;
          4 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand4Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand4Maximum;
          end;
          5 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand5Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand5Maximum;
          end;
        end;
        dmOpt.cdsOptDates.Post;
      end;
      dmOpt.cdsOptDates.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptDates');
    end;
    dmOpt.cdsOptDates.Close;
    //no record exists for this user. Create records in USEROPTINITIAL table for Initial Ratios
    dmOpt.qOptInitial.Close;
    dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptInitial.ParamByName('OPTIONTYPEID').AsString := '0';
    dmOpt.cdsOptInitial.Close;
    dmOpt.cdsOptInitial.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptInitial.Append;
        dmOpt.cdsOptInitialUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptInitialOPTIONTYPEID.AsString := '0';
        dmOpt.cdsOptInitialOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '0.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '5.0';
          end;
          2 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '5.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '10.0';
          end;
          3 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '10.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '15.0';
          end;
          4 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '15.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '20.0';
          end;
          5 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '20.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '25.0';
          end;
        end;
        dmOpt.cdsOptInitial.Post;
      end;
      dmOpt.cdsOptInitial.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptInitial Initial Ratio');
    end;
    dmOpt.cdsOptInitial.Close;
    //no record exists for this user. Create records in USEROPTINITIAL table for Epsilon
    dmOpt.qOptInitial.Close;
    dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptInitial.ParamByName('OPTIONTYPEID').AsString := 'E';
    dmOpt.cdsOptInitial.Close;
    dmOpt.cdsOptInitial.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptInitial.Append;
        dmOpt.cdsOptInitialUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptInitialOPTIONTYPEID.AsString := 'E';
        dmOpt.cdsOptInitialOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '0.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '5.0';
          end;
          2 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '5.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '10.0';
          end;
          3 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '10.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '15.0';
          end;
          4 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '15.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '20.0';
          end;
          5 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '20.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '25.0';
          end;
        end;
        dmOpt.cdsOptInitial.Post;
      end;
      dmOpt.cdsOptInitial.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptInitial Epsilon');
    end;
    dmOpt.cdsOptInitial.Close;
    //no record exists for this user. Create records in USEROPTINITIAL table for Initial Ratios
    dmOpt.qOptInitial.Close;
    dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptInitial.ParamByName('OPTIONTYPEID').AsString := 'M';
    dmOpt.cdsOptInitial.Close;
    dmOpt.cdsOptInitial.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptInitial.Append;
        dmOpt.cdsOptInitialUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptInitialOPTIONTYPEID.AsString := 'M';
        dmOpt.cdsOptInitialOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '0.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '5.0';
          end;
          2 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '5.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '10.0';
          end;
          3 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '10.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '15.0';
          end;
          4 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '15.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '20.0';
          end;
          5 : begin
            dmOpt.cdsOptInitialVALUEMIN.AsString := '20.0';
            dmOpt.cdsOptInitialVALUEMAX.AsString := '25.0';
          end;
        end;
        dmOpt.cdsOptInitial.Post;
      end;
      dmOpt.cdsOptInitial.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptInitial Mu');
    end;
    dmOpt.cdsOptInitial.Close;
    dmUser.SetUserDownloadLimits(UserSession.UserID,0);
    dmUser.SetUserDownloadLimits(UserSession.UserID,1);
    dmUser.SetUserDownloadLimits(UserSession.UserID,2);
    dmUser.SetUserDownloadLimits(UserSession.UserID,3);
    dmUser.SetUserDownloadLimits(UserSession.UserID,4);
  end else
  begin
    //record exists for this user. Modify records in USEROPTS table for Interpretations
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'I';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      try
        dmOpt.cdsOpt.Filtered := false;
        dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOpt.Filtered := true;
        dmOpt.cdsOpt.Edit;
        case i of
          1 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation1Caption;
          end;
          2 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation2Caption;
          end;
          3 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation3Caption;
          end;
          4 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation4Caption;
          end;
          5 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Interpretation5Caption;
          end;
        end;
        dmOpt.cdsOpt.Post;
      except
        WebApplication.ShowMessage('Not able to modify records for Opt_I '+IntToStr(i));
      end;
    end;
    dmOpt.cdsOpt.Filtered := false;
    dmOpt.cdsOpt.ApplyUpdates(-1);
    //record exists for this user. Modify records in USEROPTS table for DateBands
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      try
        dmOpt.cdsOpt.Filtered := false;
        dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOpt.Filtered := true;
        dmOpt.cdsOpt.Edit;
        case i of
          1 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand1Caption;
          end;
          2 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand2Caption;
          end;
          3 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand3Caption;
          end;
          4 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand4Caption;
          end;
          5 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand5Caption;
          end;
        end;
        dmOpt.cdsOpt.Post;
      except
        WebApplication.ShowMessage('Not able to modify records for Opt_D '+IntToStr(i));
      end;
    end;
    dmOpt.cdsOpt.ApplyUpdates(-1);
    //record exists for this user. Modify records in USEROPTINTERP table
    dmOpt.qOptInterp.Close;
    dmOpt.qOptInterp.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptInterp.Close;
    dmOpt.cdsOptInterp.Open;
    dmOpt.cdsOptInterp.Filtered := false;
    dmOpt.cdsOptInterp.Last;
    {empty cdsOptInterp}
    repeat
      dmOpt.cdsOptInterp.Delete;
    until dmOpt.cdsOptInterp.Bof;
    dmOpt.cdsOptInterp.ApplyUpdates(-1);
    dmOpt.cdsOptInterp.Close;
    dmOpt.cdsOptInterp.Open;
    for i := 1 to MaxSeries do
    begin
      try
        case i of
          1 : begin
            iCount := UserSession.Interpretation1Values.Count;
            if (iCount = 0) then
            begin
              dmOpt.cdsOptInterp.Append;
              dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
              dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
              dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
              dmOpt.cdsOptInterp.Post;
            end;
            if (iCount >= 1) then
            begin
              for j := 0 to iCount-1 do
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation1Values.Strings[j];
                dmOpt.cdsOptInterp.Post;
              end;
            end;
          end;
          2 : begin
            iCount := UserSession.Interpretation2Values.Count;
            if (iCount = 0) then
            begin
              dmOpt.cdsOptInterp.Append;
              dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
              dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
              dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
              dmOpt.cdsOptInterp.Post;
            end;
            if (iCount >= 1) then
            begin
              for j := 0 to iCount-1 do
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation2Values.Strings[j];
                dmOpt.cdsOptInterp.Post;
              end;
            end;
          end;
          3 : begin
            iCount := UserSession.Interpretation3Values.Count;
            if (iCount = 0) then
            begin
              dmOpt.cdsOptInterp.Append;
              dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
              dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
              dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
              dmOpt.cdsOptInterp.Post;
            end;
            if (iCount >= 1) then
            begin
              for j := 0 to iCount-1 do
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation3Values.Strings[j];
                dmOpt.cdsOptInterp.Post;
              end;
            end;
          end;
          4 : begin
            iCount := UserSession.Interpretation4Values.Count;
            if (iCount = 0) then
            begin
              dmOpt.cdsOptInterp.Append;
              dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
              dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
              dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
              dmOpt.cdsOptInterp.Post;
            end;
            if (iCount >= 1) then
            begin
              for j := 0 to iCount-1 do
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation4Values.Strings[j];
                dmOpt.cdsOptInterp.Post;
              end;
            end;
          end;
          5 : begin
            iCount := UserSession.Interpretation5Values.Count;
            if (iCount = 0) then
            begin
              dmOpt.cdsOptInterp.Append;
              dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
              dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
              dmOpt.cdsOptInterpINTERPABR.AsString := 'nd';
              dmOpt.cdsOptInterp.Post;
            end;
            if (iCount >= 1) then
            begin
              for j := 0 to iCount-1 do
              begin
                dmOpt.cdsOptInterp.Append;
                dmOpt.cdsOptInterpUSERID.AsString := UserSession.UserID;
                dmOpt.cdsOptInterpOPTIONID.AsInteger := i;
                dmOpt.cdsOptInterpINTERPABR.AsString := UserSession.Interpretation5Values.Strings[j];
                dmOpt.cdsOptInterp.Post;
              end;
            end;
          end;
        end;
      except
        WebApplication.ShowMessage('Not able to modify records for OptInterp '+IntToStr(i));
      end;
    end;
    dmOpt.cdsOptInterp.ApplyUpdates(-1);
    dmOpt.cdsOptInterp.Close;
    //record exists for this user. Modify records in USEROPTDATES table
    dmOpt.qOptDates.Close;
    dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptDates.Close;
    dmOpt.cdsOptDates.Open;
    if (dmOpt.cdsOptDates.RecordCount > 0) then
    begin
      //record exists for this user. Update values from UserSession
      for i := 1 to MaxSeries do
      begin
        try
          dmOpt.cdsOptDates.Filtered := false;
          dmOpt.cdsOptDates.Filter := 'OptionID = '+IntToStr(i);
          dmOpt.cdsOptDates.Filtered := true;
          case i of
            1 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand1Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand1Maximum;
            end;
            2 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand2Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand2Maximum;
            end;
            3 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand3Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand3Maximum;
            end;
            4 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand4Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand4Maximum;
            end;
            5 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand5Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand5Maximum;
            end;
          end;
          dmOpt.cdsOptDates.Post;
        except
          WebApplication.ShowMessage('Not able to modify records for OptDates '+IntToStr(i));
        end;
      end;
      dmOpt.cdsOptDates.Filtered := false;
      dmOpt.cdsOptDates.ApplyUpdates(-1);
    end;
    dmOpt.cdsOptDates.Close;
    //record exists for this user. Modify records in USEROPTINITIAL table for Epsilon
    dmOpt.qOptInitial.Close;
    dmOpt.qOptInitial.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptInitial.ParamByName('OptionTypeID').AsString := 'E';
    dmOpt.cdsOptInitial.Close;
    dmOpt.cdsOptInitial.Open;
    if (dmOpt.cdsOptInitial.RecordCount > 0) then
    begin
      //record exists for this user. Update values from UserSession
      for i := 1 to MaxSeries do
      begin
        try
          dmOpt.cdsOptInitial.Filtered := false;
          dmOpt.cdsOptInitial.Filter := 'OptionID = '+IntToStr(i);
          dmOpt.cdsOptInitial.Filtered := true;
          case i of
            1 : begin
              dmOpt.cdsOptInitial.Edit;
              dmOpt.cdsOptInitialVALUEMIN.AsString := UserSession.ItemBand1Minimum;
              dmOpt.cdsOptInitialVALUEMAX.AsString := UserSession.ItemBand1Maximum;
            end;
            2 : begin
              dmOpt.cdsOptInitial.Edit;
              dmOpt.cdsOptInitialVALUEMIN.AsString := UserSession.ItemBand2Minimum;
              dmOpt.cdsOptInitialVALUEMAX.AsString := UserSession.ItemBand2Maximum;
            end;
            3 : begin
              dmOpt.cdsOptInitial.Edit;
              dmOpt.cdsOptInitialVALUEMIN.AsString := UserSession.ItemBand3Minimum;
              dmOpt.cdsOptInitialVALUEMAX.AsString := UserSession.ItemBand3Maximum;
            end;
            4 : begin
              dmOpt.cdsOptInitial.Edit;
              dmOpt.cdsOptInitialVALUEMIN.AsString := UserSession.ItemBand4Minimum;
              dmOpt.cdsOptInitialVALUEMAX.AsString := UserSession.ItemBand4Maximum;
            end;
            5 : begin
              dmOpt.cdsOptInitial.Edit;
              dmOpt.cdsOptInitialVALUEMIN.AsString := UserSession.ItemBand5Minimum;
              dmOpt.cdsOptInitialVALUEMAX.AsString := UserSession.ItemBand5Maximum;
            end;
          end;
          dmOpt.cdsOptInitial.Post;
        except
          WebApplication.ShowMessage('Not able to modify records for OptInitial_E '+IntToStr(i));
        end;
      end;
      dmOpt.cdsOptInitial.Filtered := false;
      dmOpt.cdsOptInitial.ApplyUpdates(-1);
    end;
    dmOpt.cdsOptInitial.Close;
    //record exists for this user. Modify records in USEROPTGRAPH
    dmOpt.qOptGraph.Close;
    dmOpt.qOptGraph.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptGraph.Close;
    dmOpt.cdsOptGraph.Open;
    if (dmOpt.cdsOptGraph.RecordCount > 0) then
    begin
      //record exists for this user. Update values from UserSession
      try
        dmOpt.cdsOptGraph.Edit;
        dmOpt.cdsOptGraphGROUPCATEGORY.AsString := UserSession.GroupBy;
        dmOpt.cdsOptGraphMINAGEERROR.AsString := UserSession.MinimumDateUncertainty;
        if  UserSession.ShowAllSampleLocalities
          then dmOpt.cdsOptGraphSHOWALLLOCALITIES.AsString := 'Y'
          else dmOpt.cdsOptGraphSHOWALLLOCALITIES.AsString := 'N';
        if  UserSession.PDFType='AND'
          then dmOpt.cdsOptGraphPDFTYPE.AsString := 'AND'
          else dmOpt.cdsOptGraphPDFTYPE.AsString := 'OR';
        dmOpt.cdsOptGraph.Post;
      except
        WebApplication.ShowMessage('Not able to modify records for OptGraph ');
      end;
      dmOpt.cdsOptGraph.ApplyUpdates(-1);
    end;
    dmOpt.cdsOptGraph.Close;
  end;
  dmOpt.cdsOptInterp.Filtered := false;
end;

procedure TdmOpt.PublishRecords(tempWhoForID : string;
                                var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := false;
  try
    UserSession.WhereAmI := 'Start Publish records';
    dmOpt.qChangeUserFor.Close;
    dmOpt.qChangeUserFor.SQL.Clear;
    dmOpt.qChangeUserFor.SQL.Add('UPDATE ISOFOR');
    dmOpt.qChangeUserFor.SQL.Add('SET ISOFOR.WHOFORID='+''''+'PUBL'+'''');
    dmOpt.qChangeUserFor.SQL.Add('WHERE ISOFOR.WHOFORID='+''''+tempWhoForID+'''');
    dmOpt.qChangeUserFor.Close;
    if not dmOpt.sqlcDateView.InTransaction then
    begin
      TD := dmOpt.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmOpt.qChangeUserFor.ExecSQL(false);
        dmOpt.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        WasSuccessful := true;
      except
        dmOpt.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      end;
    end;
  except
  end;
end;

procedure TdmOpt.InsertUserFor(tWhoForID : string; tUserID : string;
                                var WasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := false;
  try
    UserSession.WhereAmI := 'Start InsertUserWhoFor';
    dmOpt.qChangeUserFor.Close;
    dmOpt.qChangeUserFor.SQL.Clear;
    dmOpt.qChangeUserFor.SQL.Add('INSERT INTO USERSWHOFOR');
    dmOpt.qChangeUserFor.SQL.Add('(USERID, WHOFORID)');
    dmOpt.qChangeUserFor.SQL.Add('Values (:USERID, :WhoForID)');
    //dmUser.SetDeveloperData('UserID = '+tUserID);
    //dmUser.SetDeveloperData('WhoForID = '+tWhoForID);
    //dmUser.SetDeveloperData('dmOpt.qChangeUserFor.SQL.Text');
    //dmUser.SetDeveloperData(dmOpt.qChangeUserFor.SQL.Text);
    dmOpt.qChangeUserFor.ParamByName('USERID').AsString := tUserID;
    dmOpt.qChangeUserFor.ParamByName('WhoForID').AsString := tWhoForID;
    dmOpt.qChangeUserFor.Close;
    //if not dmOpt.sqlcStrat.InTransaction then
    //begin
      TD := dmOpt.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmOpt.qChangeUserFor.ExecSQL(false);
        dmOpt.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
        WasSuccessful := true;
      except
        dmOpt.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
  end;
end;



end.
