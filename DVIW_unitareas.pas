unit DVIW_unitareas;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFUnitAreas = class(TIWAppForm)
    iwDBgUnitAreas: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewUnit: TIWButton;
    iwlSortedBy: TIWLabel;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    iwbDownload: TIWButton;
    FDMemTable1: TFDMemTable;
    FDMemTable1ApproachID: TStringField;
    FDMemTable1ApproachDescription: TStringField;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewUnitClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgUnitsColumns0TitleClick(Sender: TObject);
    procedure iwDBgUnitsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbDownloadClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DVIW_uMain, DVIW_constants, DVIW_unitlinkquery,
  usrIW_dm;




procedure TISFUnitAreas.IWAppFormRender(Sender: TObject);
begin
  iwbApplyUpdates.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsEdit,dsInsert]);
  iwbAddNewUnit.Visible := UserSession.CanModify and (dmDV.cdsUnitCountry.State in [dsBrowse]);
end;

procedure TISFUnitAreas.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //dmUser.SetDeveloperData('Starting UnitAreas');
  {UnitCountry}
  dmDV.cdsUnitCountry.Close;
  dmDV.qUnitCountry.Close;
  dmDV.qUnitCountry.SQL.Clear;
  dmDV.qUnitCountry.SQL.Add('SELECT SUITECOUNTRY.CountryAbr, SUITECOUNTRY.UnitID, SUITE.UNITNAME');
  dmDV.qUnitCountry.SQL.Add('FROM SUITECOUNTRY, SUITE');
  dmDV.qUnitCountry.SQL.Add('WHERE SUITE.UnitName >= :FirstValue');
  dmDV.qUnitCountry.SQL.Add('AND SUITE.UnitName <= :LastValue');
  dmDV.qUnitCountry.SQL.Add('AND ( SUITECOUNTRY.CountryAbr = '+''''+UserSession.AreaValues.Strings[0]+'''');
  if (UserSession.AreaValues.Count > 1) then
  begin
    for i := 2 to UserSession.AreaValues.Count do
    begin
      dmDV.qUnitCountry.SQL.Add('OR SUITECOUNTRY.CountryAbr = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
    end;
  end;
  dmDV.qUnitCountry.SQL.Add(' )');
  dmDV.qUnitCountry.SQL.Add('AND SUITE.UnitID = SUITECOUNTRY.UNITID');
  dmDV.qUnitCountry.SQL.Add('ORDER BY SUITE.UNITNAME, SUITECOUNTRY.COUNTRYABR');
  //dmUser.SetDeveloperData(dmDV.qUnitCountry.SQL.Text);
  dmDV.qUnitCountry.ParamByName('FIRSTVALUE').AsString := UserSession.UnitStartFrom;
  dmDV.qUnitCountry.ParamByName('LASTVALUE').AsString := UserSession.UnitEndWith;
  dmDV.cdsUnitCountry.Open;
  iwlPrevPage.Visible := (dmDV.cdsUnitCountry.RecordCount > iwDBgUnitAreas.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsUnitCountry.RecordCount > iwDBgUnitAreas.RowLimit);
end;

procedure TISFUnitAreas.iwbCloseClick(Sender: TObject);
begin
  dmDV.qCountries.Close;
  dmDV.qCountries.SQL.Clear;
  dmDV.qCountries.SQL.Add('SELECT COUNTRY.COUNTRYABR, COUNTRY.COUNTRY, COUNTRY.COUNTRYOFFSET,');
  dmDV.qCountries.SQL.Add('  COUNTRY.COUNTRYOFFSET2, COUNTRY.COUNTRYOFFSET3, COUNTRY.CONTINENTID,');
  dmDV.qCountries.SQL.Add('  CONTINENT.CONTINENT, COUNTRY.COUNTRYHASRECORDS');
  dmDV.qCountries.SQL.Add('from COUNTRY, CONTINENT');
  dmDV.qCountries.SQL.Add('where COUNTRY.CONTINENTID=CONTINENT.CONTINENTID');
  dmDV.qCountries.SQL.Add('and COUNTRY.COUNTRYHASRECORDS = '+''''+'Y'+'''');
  dmDV.qCountries.SQL.Add('order by COUNTRY.COUNTRY');
  dmDV.cdsCountries.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFUnitAreas.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmDV.cdsUnitCountry.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsUnitCountryCOUNTRYABR.AsVariant,dmDV.cdsUnitCountryUNITNAME.AsVariant,dmDV.cdsUnitCountryUNITID.AsVariant]);
    dmDV.cdsUnitCountry.Next;
  until dmDV.cdsUnitCountry.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxUnitAreas.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxUnitAreas.xlsx';
  frFileNameStr := 'UnitAreas.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFUnitAreas.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnitCountry.Post;
  except
  end;
  try
    dmDV.cdsUnitCountry.ApplyUpdates(0);
  except
  end;
end;

procedure TISFUnitAreas.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnitCountry.CancelUpdates;
  except
  end;
end;

procedure TISFUnitAreas.iwbAddNewUnitClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFUnitAreaLinkQuery.Create(WebApplication).Show;
end;

procedure TISFUnitAreas.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsUnitCountry.MoveBy(-1*iwDBgUnitAreas.RowLimit);
end;

procedure TISFUnitAreas.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsUnitCountry.MoveBy(iwDBgUnitAreas.RowLimit);
end;

procedure TISFUnitAreas.iwDBgUnitsColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsUnitCountry.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUnitAreas.iwDBgUnitsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  {
  TISFUnitAreaDetails.Create(WebApplication).Show;
  }
end;

end.
