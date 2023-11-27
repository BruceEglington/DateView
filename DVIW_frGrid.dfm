object ISFGrid: TISFGrid
  Left = 0
  Top = 0
  Width = 1180
  Height = 846
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DateView Query Results'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignSize = (
    1180
    846)
  DesignLeft = -290
  DesignTop = 2
  object lblRecordCount: TIWLabel
    Left = 216
    Top = 71
    Width = 83
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'lblRecordCount'
    Caption = 'records found'
  end
  object iwDBgResults: TIWDBGrid
    Left = 206
    Top = 135
    Width = 888
    Height = 1364
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 2
    CellSpacing = 0
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
    UseSize = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taRightJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'RECORDID'
        LinkField = 'RECORDID'
        OnClick = IWDBGrid1Columns0Click
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'COUNTRY'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Area'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'UNITNAME'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Strat. Unit'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'LITHOLOGY'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Lithology'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = True
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ISOSYSTEMNAME'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Iso. Sys.'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = True
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'MATERIALDESCRIPTION'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Material anal.'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = True
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'APPROACHDESCRIPTION'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Approach'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = True
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'TECHNIQUE'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Technique'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = True
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = True
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'INTERPRETATION'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Interpretation'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'PREFLEVEL'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Rating'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taRightJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '50'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'RAGE'
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Date'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taRightJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '50'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'RAGEPERROR'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = '+95%'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taRightJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '50'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'RAGEMERROR'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = '-95%'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'AGEUNITS'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Units'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'SOURCESHORT'
        LinkField = 'REFNUM'
        OnClick = iwDBgResultsColumns14Click
        OnTitleClick = IWDBGrid1ColumnsTitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Primary Reference'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmDV.dsQuery1
    FooterRowCount = 0
    FriendlyName = 'iwDBgResults'
    FromStart = False
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 50
    RollOver = True
    RowClick = False
    RollOverColor = clWebPALEGOLDENROD
    RowHeaderColor = clWebLIGHTSTEELBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clNone
  end
  object iwlPrevPage: TIWLink
    Left = 256
    Top = 110
    Width = 53
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlPrevPage'
    OnClick = iwlPrevPageClick
    TabOrder = 1
    RawText = False
    Caption = 'Previous'
  end
  object iwlNextPage: TIWLink
    Left = 408
    Top = 110
    Width = 35
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlNextPage'
    OnClick = iwlNextPageClick
    TabOrder = 3
    RawText = False
    Caption = 'Next'
  end
  object iwlSortedBy: TIWLabel
    Left = 953
    Top = 108
    Width = 150
    Height = 14
    Anchors = [akTop, akRight]
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = [fsItalic]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSortedBy'
    Caption = 'Sorted as specified in query'
  end
  object iwlPageNum: TIWLabel
    Left = 315
    Top = 110
    Width = 28
    Height = 15
    Alignment = taRightJustify
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = '1000'
  end
  object IWLabel3: TIWLabel
    Left = 350
    Top = 110
    Width = 11
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'of'
  end
  object iwlPageNumTotal: TIWLabel
    Left = 371
    Top = 110
    Width = 30
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'iwlPageNumTotal'
    Caption = '1100'
  end
  object iwlFirstPage: TIWLink
    Left = 216
    Top = 110
    Width = 33
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlFirstPage'
    OnClick = iwlFirstPageClick
    TabOrder = -1
    RawText = False
    Caption = 'First'
  end
  object iwlLastPage: TIWLink
    Left = 442
    Top = 110
    Width = 35
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlLastPage'
    OnClick = iwlLastPageClick
    TabOrder = 2
    RawText = False
    Caption = 'Last'
  end
  object iwbDownload: TIWButton
    Left = 539
    Top = 61
    Width = 190
    Height = 25
    Caption = 'Download to Excel'
    Enabled = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDownload'
    TabOrder = 5
    OnClick = iwbDownloadCombinedClick
  end
  object iwbDownloadSampleCoordinates: TIWButton
    Left = 750
    Top = 61
    Width = 190
    Height = 25
    Caption = 'Download Sample Coordinates'
    Enabled = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDownload'
    TabOrder = 8
    OnClick = iwbDownloadSampleCoordinatesClick
  end
  object iwbDownloadInit: TIWButton
    Left = 961
    Top = 61
    Width = 190
    Height = 25
    Caption = 'Download Initial Ratios'
    Enabled = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDownloadInit'
    TabOrder = 9
    OnClick = iwbDownloadCombinedClick
  end
  object iwlCanDownload: TIWLabel
    Left = 702
    Top = 88
    Width = 334
    Height = 14
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'iwlCanDownload'
    Caption = 'Users who contribute data can download summary information'
  end
  object iwbDownloadCombined: TIWButton
    Left = 630
    Top = 105
    Width = 190
    Height = 25
    Caption = 'Download Combined to Excel'
    Enabled = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDownload'
    TabOrder = 4
    OnClick = iwbDownloadCombinedClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1180
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 1180
    inherited IWFrameRegion: TIWRegion
      Width = 1180
      TabOrder = 6
      ExplicitWidth = 1180
      inherited iwrHeader: TIWRegion
        Width = 1180
        ExplicitWidth = 1180
        inherited iwrWelcome: TIWRegion
          Width = 1180
          ExplicitWidth = 1180
          inherited iwrDisplayUserName: TIWRegion
            Width = 1039
            ExplicitWidth = 1039
            inherited lblWelcome: TIWLabel
              Left = 718
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1180
          ExplicitWidth = 1180
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  inline FrameMenu: TISFFrameMenu
    Left = 0
    Top = 55
    Width = 200
    Height = 791
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alLeft
    AutoScroll = True
    TabOrder = 1
    TabStop = True
    ExplicitTop = 55
    ExplicitHeight = 791
    inherited IWFrameRegion: TIWRegion
      Height = 791
      TabOrder = 7
      ExplicitHeight = 791
      inherited iwrAll: TIWRegion
        Height = 791
        ExplicitHeight = 791
        inherited iwrMenu: TIWRegion
          Height = 661
          ExplicitHeight = 661
          inherited IWMenu1: TIWMenu
            Height = 661
            ExplicitHeight = 520
          end
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1040
    Top = 144
    object FDMemTable1Region: TStringField
      FieldName = 'Region'
      Size = 30
    end
    object FDMemTable1UnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object FDMemTable1Lithology: TStringField
      FieldName = 'Lithology'
      Size = 50
    end
    object FDMemTable1MaterialDescription: TStringField
      FieldName = 'MaterialDescription'
      Size = 50
    end
    object FDMemTable1IsoSystem: TStringField
      FieldName = 'IsoSystem'
      Size = 30
    end
    object FDMemTable1Interpretation: TStringField
      FieldName = 'Interpretation'
      Size = 30
    end
    object FDMemTable1PrefLevel: TSmallintField
      FieldName = 'PrefLevel'
    end
    object FDMemTable1RAge: TFloatField
      FieldName = 'RAge'
    end
    object FDMemTable1RAgePError: TFloatField
      FieldName = 'RAgePError'
    end
    object FDMemTable1RAgeMError: TFloatField
      FieldName = 'RAgeMError'
    end
    object FDMemTable1AgeUnits: TStringField
      FieldName = 'AgeUnits'
      Size = 2
    end
    object FDMemTable1ApproachDescription: TStringField
      FieldName = 'ApproachDescription'
      Size = 50
    end
    object FDMemTable1Technique: TStringField
      FieldName = 'Technique'
      Size = 40
    end
    object FDMemTable1RecordID: TLargeintField
      FieldName = 'RecordID'
    end
    object FDMemTable1SourceShort: TStringField
      FieldName = 'SourceShort'
      Size = 100
    end
    object FDMemTable1MethodID: TStringField
      FieldName = 'MethodID'
    end
  end
  object FDMemTableInit: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1040
    Top = 208
    object FDMemTableInitRegion: TStringField
      FieldName = 'Region'
      Size = 30
    end
    object FDMemTableInitUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object FDMemTableInitLithology: TStringField
      FieldName = 'Lithology'
      Size = 50
    end
    object FDMemTableInitMaterialDescription: TStringField
      FieldName = 'MaterialDescription'
      Size = 50
    end
    object FDMemTableInitIsoSystem: TStringField
      FieldName = 'IsoSystem'
      Size = 30
    end
    object FDMemTableInitInterpretation: TStringField
      FieldName = 'Interpretation'
      Size = 30
    end
    object FDMemTableInitPrefLevel: TSmallintField
      FieldName = 'PrefLevel'
    end
    object FDMemTableInitRAge: TFloatField
      FieldName = 'RAge'
    end
    object FDMemTableInitRAgePError: TFloatField
      FieldName = 'RAgePError'
    end
    object FDMemTableInitRAgeMError: TFloatField
      FieldName = 'RAgeMError'
    end
    object FDMemTableInitAgeUnits: TStringField
      FieldName = 'AgeUnits'
      Size = 2
    end
    object FDMemTableInitApproachDescription: TStringField
      FieldName = 'ApproachDescription'
      Size = 50
    end
    object FDMemTableInitTechnique: TStringField
      FieldName = 'Technique'
      Size = 40
    end
    object FDMemTableInitRecordID: TLargeintField
      FieldName = 'RecordID'
    end
    object FDMemTableInitSourceShort: TStringField
      FieldName = 'SourceShort'
      Size = 100
    end
    object FDMemTableInitMethodID: TStringField
      FieldName = 'MethodID'
      Size = 1
    end
    object FDMemTableInitInitRatio: TFloatField
      FieldName = 'InitRatio'
    end
    object FDMemTableInitInitRatioError: TFloatField
      FieldName = 'InitRatioError'
    end
    object FDMemTableInitEpsilon: TFloatField
      FieldName = 'Epsilon'
    end
    object FDMemTableInitEpsilonError: TFloatField
      FieldName = 'EpsilonError'
    end
    object FDMemTableInitMu: TFloatField
      FieldName = 'Mu'
    end
    object FDMemTableInitMuPError: TFloatField
      FieldName = 'MuPError'
    end
    object FDMemTableInitMuMError: TFloatField
      FieldName = 'MuMError'
    end
    object FDMemTableInitInitModel: TStringField
      FieldName = 'InitModel'
      Size = 30
    end
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1040
    Top = 280
  end
  object FDMemTablesamples: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1032
    Top = 360
    object FDMemTablesamplesSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object FDMemTablesamplesFrac: TStringField
      FieldName = 'Frac'
      Size = 15
    end
    object FDMemTablesamplesLongitude: TFloatField
      FieldName = 'Longitude'
    end
    object FDMemTablesamplesLatitude: TFloatField
      FieldName = 'Latitude'
    end
    object FDMemTablesamplesElevation: TFloatField
      FieldName = 'Elevation'
    end
    object FDMemTablesamplesLongitudePrecision: TFloatField
      FieldName = 'LongitudePrecision'
    end
    object FDMemTablesamplesLatitudePrecision: TFloatField
      FieldName = 'LatitudePrecision'
    end
    object FDMemTablesamplesElevationPrecision: TFloatField
      FieldName = 'ElevationPrecision'
    end
    object FDMemTablesamplesCOID: TStringField
      FieldName = 'COID'
      Size = 3
    end
    object FDMemTablesamplesCountryID: TStringField
      FieldName = 'CountryID'
      Size = 3
    end
    object FDMemTablesamplesIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object FDMemTablesamplesOriginalNo: TStringField
      FieldName = 'OriginalNo'
    end
    object FDMemTablesamplesRecordID: TIntegerField
      FieldName = 'RecordID'
    end
    object FDMemTablesamplesLithology: TStringField
      FieldName = 'Lithology'
      Size = 50
    end
  end
  object FDMemTableCombined: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 944
    Top = 144
    object FDMemTableCombinedRegion: TStringField
      FieldName = 'Region'
      Size = 30
    end
    object FDMemTableCombinedUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object FDMemTableCombinedLithology: TStringField
      FieldName = 'Lithology'
      Size = 50
    end
    object FDMemTableCombinedMaterialDescription: TStringField
      FieldName = 'MaterialDescription'
      Size = 50
    end
    object FDMemTableCombinedIsoSystem: TStringField
      FieldName = 'IsoSystem'
      Size = 30
    end
    object FDMemTableCombinedInterpretation: TStringField
      FieldName = 'Interpretation'
      Size = 30
    end
    object FDMemTableCombinedPrefLevel: TIntegerField
      FieldName = 'PrefLevel'
    end
    object FDMemTableCombinedRAge: TFloatField
      FieldName = 'RAge'
    end
    object FDMemTableCombinedRAgePError: TFloatField
      FieldName = 'RAgePError'
    end
    object FDMemTableCombinedRAgeMError: TFloatField
      FieldName = 'RAgeMError'
    end
    object FDMemTableCombinedAgeUnits: TStringField
      FieldName = 'AgeUnits'
      Size = 2
    end
    object FDMemTableCombinedApproachDescription: TStringField
      FieldName = 'ApproachDescription'
      Size = 50
    end
    object FDMemTableCombinedTechnique: TStringField
      FieldName = 'Technique'
      Size = 40
    end
    object FDMemTableCombinedRecordID: TIntegerField
      FieldName = 'RecordID'
    end
    object FDMemTableCombinedSourceShort: TStringField
      FieldName = 'SourceShort'
      Size = 100
    end
    object FDMemTableCombinedMethodID: TStringField
      FieldName = 'MethodID'
    end
    object FDMemTableCombinedSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object FDMemTableCombinedFrac: TStringField
      FieldName = 'Frac'
      Size = 15
    end
    object FDMemTableCombinedLongitude: TFloatField
      FieldName = 'Longitude'
    end
    object FDMemTableCombinedLatitude: TFloatField
      FieldName = 'Latitude'
    end
    object FDMemTableCombinedElevation: TFloatField
      FieldName = 'Elevation'
    end
    object FDMemTableCombinedIncluded: TStringField
      FieldName = 'Included'
      Size = 1
    end
  end
end
