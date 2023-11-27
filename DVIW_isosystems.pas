unit DVIW_isosystems;

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
  TISFIsoSystems = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1IsoSystem: TStringField;
    FDMemTable1IsoSystemName: TStringField;
    FDMemTable1IsoSysNo: TIntegerField;
    FDMemTable1DecayConst1: TFloatField;
    FDMemTable1DecayConst2: TFloatField;
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




procedure TISFIsoSystems.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsIsoSystems.Open;
end;

procedure TISFIsoSystems.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsIsoSystems.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsIsoSystems.RecordCount > iwDBg.RowLimit);
end;

procedure TISFIsoSystems.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsIsoSystems.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFIsoSystems.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsIsoSystems.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFIsoSystems.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsIsoSystems.MoveBy(iwDBg.RowLimit);
end;

procedure TISFIsoSystems.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsIsoSystems.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFIsoSystems.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmDV.cdsIsoSystems.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsIsoSystemsISOSYSTEM.AsVariant,dmDV.cdsIsoSystemsISOSYSTEMNAME.AsVariant,
           dmDV.cdsIsoSystemsISOSYSNO.AsVariant,dmDV.cdsIsoSystemsDECAYCONST1.AsVariant,
           dmDV.cdsIsoSystemsDECAYCONST2.AsVariant]);
    dmDV.cdsIsoSystems.Next;
  until dmDV.cdsIsoSystems.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxIsoSystems.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIsoSystems.xlsx';
  frFileNameStr := 'Isotope Systems.xlsx';
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
