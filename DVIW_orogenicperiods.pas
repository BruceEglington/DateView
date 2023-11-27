unit DVIW_orogenicperiods;

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
  TISFOrogenicPeriods = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1OrogenicPeriodID: TStringField;
    FDMemTable1OrogenicPeriod: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
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




procedure TISFOrogenicPeriods.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsOrogenicPeriods.Open;
end;

procedure TISFOrogenicPeriods.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsOrogenicPeriods.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsOrogenicPeriods.RecordCount > iwDBg.RowLimit);
end;

procedure TISFOrogenicPeriods.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsOrogenicPeriods.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFOrogenicPeriods.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsOrogenicPeriods.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFOrogenicPeriods.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsOrogenicPeriods.MoveBy(iwDBg.RowLimit);
end;

procedure TISFOrogenicPeriods.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsOrogenicPeriods.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFOrogenicPeriods.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmDV.cdsOrogenicPeriods.First;
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsOrogenicPeriodsOROGENICPERIODID.AsVariant,dmDV.cdsOrogenicPeriodsOROGENICPERIOD.AsVariant]);
    dmDV.cdsOrogenicPeriods.Next;
  until dmDV.cdsOrogenicPeriods.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxOrogenicPeriods.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxOrogenicPeriods.xlsx';
  frFileNameStr := 'Orogenic Periods.xlsx';
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
