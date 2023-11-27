object ISFSelectGraph: TISFSelectGraph
  Left = 0
  Top = 0
  Width = 1105
  Height = 600
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
  DesignLeft = 2
  DesignTop = 2
  object iwrgPlotType: TIWRadioGroup
    Left = 112
    Top = 100
    Width = 361
    Height = 245
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgPlotType'
    ItemIndex = 0
    Items.Strings = (
      'Probability density plot'
      'Sequential plot of dates with error bars'
      'Galbraith type plot (Date vs Inverse error)'
      'Initial ratio plot'
      'Epsilon or Gamma or Delta plot'
      'Model source 238U/204Pb plot'
      'Closure temperature plot'
      'Map (by Interpretation)'
      'Map (by Date Band)'
      'Map (by Initial ratio)'
      'Map (by Epsilon, Gamma or Delta value)'
      'Map (by Model source 238U/204Pb)'
      'Test')
    Layout = glVertical
  end
  object IWLabel1: TIWLabel
    Left = 92
    Top = 76
    Width = 152
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Choose the plot required'
  end
  object iwcbPlotTypeGrouped: TIWCheckBox
    Left = 537
    Top = 76
    Width = 392
    Height = 21
    Caption = 'Show grouped version of plot (if available)'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 1
    Checked = False
    FriendlyName = 'iwcbPlotTypeGrouped'
  end
  object iwbSubmitGraphSelection: TIWButton
    Left = 94
    Top = 516
    Width = 220
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitGraphSelection'
    TabOrder = 8
    OnClick = iwbSubmitGraphSelectionClick
  end
  object IWLabel2: TIWLabel
    Left = 552
    Top = 103
    Width = 55
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Group by'
  end
  object iwcbGroupBy: TIWComboBox
    Left = 623
    Top = 103
    Width = 306
    Height = 21
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    OnChange = iwrgPDFChangeClick
    UseSize = False
    TabOrder = 2
    ItemIndex = -1
    Items.Strings = (
      'Boundary Position'
      'Chemical Association'
      'Large Igneous Province'
      'Orogenic Period'
      'Province'
      'Terrane'
      'User-defined Group')
    Sorted = True
    FriendlyName = 'iwcbGroupBy'
    NoSelectionText = '-- No Selection --'
  end
  object iwrgNormalisationType: TIWRadioGroup
    Left = 552
    Top = 190
    Width = 513
    Height = 47
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgPlotType'
    ItemIndex = 0
    Items.Strings = (
      'Normalise most intense peak to 100%'
      
        'True probability (curves normalised to number of contributing da' +
        'ta)')
    Layout = glVertical
    TabOrder = 3
  end
  object IWLabel3: TIWLabel
    Left = 534
    Top = 166
    Width = 181
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Probability plot normalisation'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 545
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 592
  end
  object iwlSpectrumAgeHeading: TIWLabel
    Left = 94
    Top = 396
    Width = 178
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density age limits'
  end
  object iwlFromAge: TIWLabel
    Left = 315
    Top = 419
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlFromAge'
    Caption = 'Older age limit'
  end
  object iweToAge: TIWEdit
    Left = 406
    Top = 417
    Width = 67
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweToAge'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    Text = 'iweToAge'
  end
  object iwlToAge: TIWLabel
    Left = 116
    Top = 419
    Width = 105
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlToAge'
    Caption = 'Younger age limit'
  end
  object iweFromAge: TIWEdit
    Left = 224
    Top = 417
    Width = 67
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweFromAge'
    SubmitOnAsyncEvent = True
    TabOrder = 6
    Text = 'iweFromAge'
  end
  object iwcbSpectrumAges: TIWCheckBox
    Left = 352
    Top = 392
    Width = 177
    Height = 21
    Caption = 'Reset to defaults'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbSpectrumAgesClick
    Checked = False
    FriendlyName = 'iwcbSpectrumAges'
  end
  object iwrgPDFType: TIWRadioGroup
    Left = 552
    Top = 274
    Width = 513
    Height = 43
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgShowAllSampleLocalities'
    ItemIndex = 1
    Items.Strings = (
      'pdf '#39'And'#39'  (default)'
      'pdf '#39'Or'#39' ')
    Layout = glVertical
    TabOrder = 4
  end
  object IWLabel4: TIWLabel
    Left = 536
    Top = 254
    Width = 198
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density function type'
  end
  object iwbReturn: TIWButton
    Left = 599
    Top = 516
    Width = 220
    Height = 25
    Caption = 'Return to Main Form'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 10
    OnClick = iwbReturnClick
  end
  object iwbReturnToResults: TIWButton
    Left = 346
    Top = 516
    Width = 220
    Height = 25
    Caption = 'Return to Query Results Form'
    Color = clWebROSYBROWN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 9
    OnClick = iwbReturnToResultsClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1105
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
    ExplicitWidth = 1105
    inherited IWFrameRegion: TIWRegion
      Width = 1105
      TabOrder = 11
      ExplicitWidth = 1105
      inherited iwrHeader: TIWRegion
        Width = 1105
        ExplicitWidth = 1105
        inherited iwrWelcome: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
          inherited iwrDisplayUserName: TIWRegion
            Width = 964
            ExplicitWidth = 964
            inherited lblWelcome: TIWLabel
              Left = 643
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
