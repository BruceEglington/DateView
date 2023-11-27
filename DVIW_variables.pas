unit DVIW_variables;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,IWCompMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFVariables = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    iwmComment: TIWMemo;
    FDMemTable1: TFDMemTable;
    FDMemTable1VariableID: TStringField;
    FDMemTable1VariableName: TStringField;
    FDMemTable1IsotopeSystemID: TStringField;
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
  ServerController, DBClient, DVIW_dmData, DVIW_uMain, DVIW_constants;

procedure TISFVariables.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmdDV.cdsVarVar.Open;
end;

procedure TISFVariables.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmdDV.cdsVarVar.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmdDV.cdsVarVar.RecordCount > iwDBg.RowLimit);
end;

procedure TISFVariables.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmdDV.cdsVarVar.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFVariables.iwlPrevPageClick(Sender: TObject);
begin
  dmdDV.cdsVarVar.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFVariables.iwlNextPageClick(Sender: TObject);
begin
  dmdDV.cdsVarVar.MoveBy(iwDBg.RowLimit);
end;

procedure TISFVariables.iwbCloseClick(Sender: TObject);
begin
  dmdDV.cdsVarVar.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFVariables.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmdDV.cdsVarVar.First;
  repeat
    FDMemTable1.AppendRecord([dmdDV.cdsVarVarVARIABLEID.AsVariant,dmdDV.cdsVarVarVARIABLENAME.AsVariant,
       dmdDV.cdsVarVarISOTOPESYSTEM.AsVariant]);
    dmdDV.cdsVarVar.Next;
  until dmdDV.cdsVarVar.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxVariables.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxVariables.xlsx';
  frFileNameStr := 'Variables.xlsx';
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



