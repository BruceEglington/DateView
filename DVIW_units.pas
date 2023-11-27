unit DVIW_units;

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
  TISFUnits = class(TIWAppForm)
    iwDBgUnits: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewUnit: TIWButton;
    iwlSortedBy: TIWLabel;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
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
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_constants, DVIW_unitedit,
  usrIW_dm;

procedure TISFUnits.IWAppFormRender(Sender: TObject);
begin
  iwbApplyUpdates.Visible := UserSession.CanModify and (dmDV.cdsUnits.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Visible := UserSession.CanModify and (dmDV.cdsUnits.State in [dsEdit,dsInsert]);
  iwbAddNewUnit.Visible := UserSession.CanModify and (dmDV.cdsUnits.State in [dsBrowse]);
end;

procedure TISFUnits.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  {Units}
  dmDV.qUnits.Close;
  dmDV.qUnits.SQL.Clear;
  dmDV.qUnits.SQL.Add('SELECT SUITE.UNITID, SUITE.UNITNAME, SUITE.UNITRANK, SUITE.GISID,');
  dmDV.qUnits.SQL.Add('  SUITE.FORMATIONOFFSET, SUITE.FORMATIONOFFSET2, SUITE.FORMATIONOFFSET3');
  dmDV.qUnits.SQL.Add('FROM SUITE');
  dmDV.qUnits.SQL.Add('WHERE (SUITE.UNITNAME >= :FirstValue');
  dmDV.qUnits.SQL.Add('AND SUITE.UNITNAME <= :LastValue'+')');
  dmDV.qUnits.SQL.Add('OR SUITE.UNITNAME STARTING WITH '+quotedstr('NEW'+UserSession.UserID));
  dmDV.qUnits.SQL.Add('ORDER BY SUITE.UNITNAME');
  dmDV.qUnits.ParamByName('FIRSTVALUE').AsString := UserSession.UnitStartFrom;
  dmDV.qUnits.ParamByName('LASTVALUE').AsString := UserSession.UnitEndWith;
  dmDV.cdsUnits.Close;
  dmDV.cdsUnits.Open;
  iwlPrevPage.Visible := (dmDV.cdsUnits.RecordCount > iwDBgUnits.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsUnits.RecordCount > iwDBgUnits.RowLimit);
end;

procedure TISFUnits.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFUnits.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnits.Post;
  except
  end;
  try
    dmDV.cdsUnits.ApplyUpdates(0);
  except
  end;
end;

procedure TISFUnits.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmDV.cdsUnits.CancelUpdates;
  except
  end;
end;

procedure TISFUnits.iwbAddNewUnitClick(Sender: TObject);
var
  tUnitName : string;
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  tUnitName := 'NEW'+UserSession.UserID;
  dmDV.AddUnit(tUnitName,WasSuccessful);
  if WasSuccessful then
  begin
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    dmDV.qUnits.Close;
    //dmDV.qUnits.ParamByName('FIRSTVALUE').AsString := 'NEW';
    //dmDV.qUnits.ParamByName('LASTVALUE').AsString := 'NEX';
    dmDV.qUnits.ParamByName('FIRSTVALUE').AsString := UserSession.UnitStartFrom;
    dmDV.qUnits.ParamByName('LASTVALUE').AsString := UserSession.UnitEndWith;
    //dmUser.SetDeveloperData(dmDV.qUnits.SQL.Text);
    dmDV.cdsUnits.Close;
    dmDV.cdsUnits.Open;
    dmDV.cdsUnits.Locate('UNITNAME',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
    UserSession.Parameter2Chosen := dmDV.cdsUnitsUNITID.AsString;
    dmDV.cdsUnits.Close;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFUnitEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Not able to add new Stratigraphic Unit.',smAlert);
  end;
end;

procedure TISFUnits.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsUnits.MoveBy(-1*iwDBgUnits.RowLimit);
end;

procedure TISFUnits.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsUnits.MoveBy(iwDBgUnits.RowLimit);
end;

procedure TISFUnits.iwDBgUnitsColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUnits.iwDBgUnitsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  dmDV.cdsUnits.Locate('UNITNAME',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  UserSession.Parameter2Chosen := dmDV.cdsUnitsUNITID.AsString;
  dmDV.cdsUnits.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFUnitEdit.Create(WebApplication).Show;
end;

procedure TISFUnits.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsUnits.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsUnitsUNITNAME.AsVariant,dmDV.cdsUnitsUNITRANK.AsVariant,
           dmDV.cdsUnitsGISID.AsVariant,dmDV.cdsUnitsFORMATIONOFFSET.AsVariant,
           dmDV.cdsUnitsFORMATIONOFFSET2.AsVariant,dmDV.cdsUnitsFORMATIONOFFSET3.AsVariant,
           dmDV.cdsUnitsUNITID.AsVariant]);
    dmDV.cdsUnits.Next;
  until dmDV.cdsUnits.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxUnits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxUnits.xlsx';
  frFileNameStr := 'Units.xlsx';
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
