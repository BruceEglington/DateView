object ISFSelectPlatePoles: TISFSelectPlatePoles
  Left = 0
  Top = 0
  Width = 716
  Height = 505
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwDBlcbPlate: TIWDBLookupComboBox
    Left = 197
    Top = 412
    Width = 434
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    NonEditableAsLabel = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'PLATEID'
    DataSource = dmdDV.dsUserPlates
    FriendlyName = 'iwDBlcbPlate'
    KeyField = 'PLATEID'
    ListField = 'PLATENAME'
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 201
    Height = 25
    Caption = 'Return to Main Form'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 3
    OnClick = iwbReturnClick
  end
  object IWLabel2: TIWLabel
    Left = 112
    Top = 414
    Width = 30
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Plate'
  end
  object IWLabel3: TIWLabel
    Left = 112
    Top = 442
    Width = 44
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Include'
  end
  object iwDBlcbInclude: TIWDBLookupComboBox
    Left = 197
    Top = 440
    Width = 82
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    NonEditableAsLabel = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'INCLUDEDYN'
    DataSource = dmdDV.dsUserPlates
    FriendlyName = 'iwDBlcbInclude'
    KeyField = 'YESNOID'
    ListField = 'YESNO'
    ListSource = dmDV.dsYesNo
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbSaveChanges: TIWButton
    Left = 317
    Top = 74
    Width = 119
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 5
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 447
    Top = 74
    Width = 119
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelChanges'
    TabOrder = 7
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    Left = 576
    Top = 73
    Width = 119
    Height = 25
    Caption = 'Delete current'
    Confirmation = 'Are you sure you want to delete this sample?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    TabOrder = 4
    OnClick = iwbDeleteClick
  end
  object iwDBgAreas: TIWDBGrid
    Left = 32
    Top = 138
    Width = 663
    Height = 251
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.Size = 8
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
    UseSize = True
    ScrollToCurrentRow = False
    Columns = <
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
        DataField = 'PLATENAME'
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
        Title.Text = 'Plate'
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
        DataField = 'INCLUDEDYN'
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
        Title.Text = 'Incl.'
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
        DataField = 'POLENAME'
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
        Title.Text = 'Pole'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmdDV.dsUserPlates
    FooterRowCount = 0
    FriendlyName = 'iwDBgAreas'
    FromStart = False
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgIndicator, dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 20
    RollOver = True
    RowClick = False
    RollOverColor = clWebPALEGOLDENROD
    RowHeaderColor = clWebLIGHTSTEELBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clWebYELLOW
    TabOrder = -1
  end
  object IWDBNavigator1: TIWDBNavigator
    Left = 32
    Top = 106
    Width = 108
    Height = 29
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmdDV.dsUserPlates
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object IWLabel1: TIWLabel
    Left = 112
    Top = 470
    Width = 61
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Euler pole'
  end
  object iwDBlcbPole: TIWDBLookupComboBox
    Left = 197
    Top = 468
    Width = 436
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    NonEditableAsLabel = True
    TabOrder = 0
    AutoEditable = False
    DataField = 'POLEID'
    DataSource = dmdDV.dsUserPlates
    FriendlyName = 'iwDBlcbPole'
    KeyField = 'POLEID'
    ListField = 'POLENAME'
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 716
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
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 8
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 575
            ExplicitWidth = 575
            inherited lblWelcome: TIWLabel
              Left = 254
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
        end
      end
    end
  end
end
