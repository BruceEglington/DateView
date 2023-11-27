unit DVIW_area;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TISFAreas = class(TIWAppForm)
    iwDBgAreas: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1RegionID: TStringField;
    FDMemTable1Region: TStringField;
    FDMemTable1COID: TStringField;
    FDMemTable1ContOcean: TStringField;
    FDMemTable1RegionHasRecords: TStringField;
    FDMemTable1RegionOffset: TFloatField;
    FDMemTable1RegionOffset2: TFloatField;
    FDMemTable1RegionOffset3: TFloatField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_constants;

procedure TISFAreas.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qCountries.Close;
  dmDV.qCountries.SQL.Clear;
  dmDV.qCountries.SQL.Add('select Country.CountryAbr, Country.Country, Country.CountryOffset,');
  dmDV.qCountries.SQL.Add('  Country.CountryOffset2, Country.CountryOffset3, Country.ContinentID,');
  dmDV.qCountries.SQL.Add('  Continent.Continent, Country.CountryHasRecords');
  dmDV.qCountries.SQL.Add('from Country, Continent');
  dmDV.qCountries.SQL.Add('where Country.ContinentID=Continent.ContinentID');
  dmDV.qCountries.SQL.Add('order by Country.Country');
  dmDV.cdsCountries.Close;
  dmDV.cdsCountries.Open;
end;

procedure TISFAreas.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsCountries.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFAreas.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsCountries.MoveBy(-1*iwDBgAreas.RowLimit);
end;

procedure TISFAreas.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsCountries.MoveBy(iwDBgAreas.RowLimit);
end;

procedure TISFAreas.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFAreas.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmDV.cdsCountries.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsCountriesCOUNTRYABR.AsVariant,dmDV.cdsCountriesCOUNTRY.AsVariant,
          dmDV.cdsCountriesCONTINENTID.AsVariant,dmDV.cdsCountriesCOUNTRYOFFSET.AsVariant,
          dmDV.cdsCountriesCOUNTRYOFFSET2.AsVariant,dmDV.cdsCountriesCOUNTRYOFFSET3.AsVariant,
          dmDV.cdsCountriesCONTINENT.AsVariant,dmDV.cdsCountriesCOUNTRYHASRECORDS.AsVariant]);
    dmDV.cdsCountries.Next;
  until dmDV.cdsCountries.Eof;
  FDMemTable1.First;
  dmDV.cdsCountries.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxCountries.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxCountries.xlsx';
  frFileNameStr := 'Regions.xlsx';
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

end.
