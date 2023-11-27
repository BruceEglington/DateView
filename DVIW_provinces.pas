unit DVIW_provinces;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFProvinces = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1DomainName: TStringField;
    FDMemTable1COID: TStringField;
    FDMemTable1DomainID: TIntegerField;
    FDMemTable1DomainTypeID: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject; const AValue: String);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dmStrat, DVIW_uMain, DVIW_provinceedit,
  DVIW_constants, usrIW_dm;

procedure TISFProvinces.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qDomains.Close;
  dmStrat.qDomains.SQL.Clear;
  dmStrat.qDomains.SQL.Add('SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.DOMAINPARENTID,DOMAINS.MAXAGE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE');
  dmStrat.qDomains.SQL.Add('FROM DOMAINS,CONTINENTS,DOMAINTYPES');
  dmStrat.qDomains.SQL.Add('WHERE CONTINENTS.CONTINENTID = DOMAINS.CONTINENTID');
  dmStrat.qDomains.SQL.Add('AND DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID');
  dmStrat.qDomains.SQL.Add('AND DOMAINTYPES.DVLEVEL <= 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qDomains.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qDomains.SQL.Add('OR DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDomains.SQL.Add(' ) ');
  end;
  dmStrat.qDomains.SQL.Add('ORDER BY DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID');
  //dmUser.SetDeveloperData('dmStrat.qDomains');
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  dmStrat.cdsDomains.Open;
end;

procedure TISFProvinces.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmStrat.cdsDomains.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsDomains.RecordCount > iwDBg.RowLimit);
  iwbApplyUpdates.Enabled := UserSession.CanModify and (dmStrat.cdsDomains.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Enabled := UserSession.CanModify and (dmStrat.cdsDomains.State in [dsEdit,dsInsert]);
  iwbAddNew.Enabled := UserSession.CanDelete and (dmStrat.cdsDomains.State in [dsBrowse]);
end;

procedure TISFProvinces.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsDomains.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFProvinces.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsDomains.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFProvinces.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsDomains.MoveBy(iwDBg.RowLimit);
end;

procedure TISFProvinces.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsDomains.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFProvinces.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStrat.cdsDomains.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmStrat.cdsDomainsDOMAINNAME.AsVariant,dmStrat.cdsDomainsCONTINENTID.AsVariant,
      dmStrat.cdsDomainsDOMAINID.AsVariant,dmStrat.cdsDomainsDOMAINTYPEID.AsVariant]);
    dmStrat.cdsDomains.Next;
  until dmStrat.cdsDomains.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxProvinces.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxProvinces.xlsx';
  frFileNameStr := 'Provinces.xlsx';
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

procedure TISFProvinces.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsDomains.ApplyUpdates(0);
  except
  end;
end;

procedure TISFProvinces.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsDomains.CancelUpdates;
  except
  end;
end;

procedure TISFProvinces.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStrat.cdsDomains.Append;
    dmStrat.cdsDomainsDOMAINNAME.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsDomainsCONTINENTID.AsString := 'UND';
    dmStrat.cdsDomains.Post;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFProvinceEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new province',smAlert);
  end;
end;

procedure TISFProvinces.iwDBgColumns0Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFProvinceEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
