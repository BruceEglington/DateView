object ISFSelectGraph: TISFSelectGraph
  Left = 0
  Top = 0
  Width = 1381
  Height = 750
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
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
  PixelsPerInch = 120
  DesignLeft = 2
  DesignTop = 2
  object iwrgPlotType: TIWRadioGroup
    AlignWithMargins = False
    Left = 140
    Top = 125
    Width = 451
    Height = 306
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
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
    AlignWithMargins = False
    Left = 115
    Top = 95
    Width = 152
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Choose the plot required'
  end
  object iwcbPlotTypeGrouped: TIWCheckBox
    AlignWithMargins = False
    Left = 671
    Top = 95
    Width = 490
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Show grouped version of plot (if available)'
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 1
    Checked = False
    FriendlyName = 'iwcbPlotTypeGrouped'
  end
  object iwbSubmitGraphSelection: TIWButton
    AlignWithMargins = False
    Left = 118
    Top = 645
    Width = 275
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbSubmitGraphSelection'
    TabOrder = 8
    OnClick = iwbSubmitGraphSelectionClick
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 690
    Top = 129
    Width = 55
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Group by'
  end
  object iwcbGroupBy: TIWComboBox
    AlignWithMargins = False
    Left = 779
    Top = 129
    Width = 382
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderBorder = False
    Font.Size = 9
    Font.PxSize = 12
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
  end
  object iwrgNormalisationType: TIWRadioGroup
    AlignWithMargins = False
    Left = 690
    Top = 238
    Width = 641
    Height = 58
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
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
    AlignWithMargins = False
    Left = 668
    Top = 208
    Width = 181
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Probability plot normalisation'
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 69
    Width = 104
    Height = 681
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwlSpectrumAgeHeading: TIWLabel
    AlignWithMargins = False
    Left = 118
    Top = 495
    Width = 178
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density age limits'
  end
  object iwlFromAge: TIWLabel
    AlignWithMargins = False
    Left = 394
    Top = 524
    Width = 88
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlFromAge'
    Caption = 'Older age limit'
  end
  object iweToAge: TIWEdit
    AlignWithMargins = False
    Left = 508
    Top = 521
    Width = 83
    Height = 27
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    StyleRenderOptions.RenderBorder = False
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iweToAge'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    Text = 'iweToAge'
  end
  object iwlToAge: TIWLabel
    AlignWithMargins = False
    Left = 145
    Top = 524
    Width = 105
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlToAge'
    Caption = 'Younger age limit'
  end
  object iweFromAge: TIWEdit
    AlignWithMargins = False
    Left = 280
    Top = 521
    Width = 84
    Height = 27
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    StyleRenderOptions.RenderBorder = False
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iweFromAge'
    SubmitOnAsyncEvent = True
    TabOrder = 6
    Text = 'iweFromAge'
  end
  object iwcbSpectrumAges: TIWCheckBox
    AlignWithMargins = False
    Left = 440
    Top = 490
    Width = 221
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Reset to defaults'
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbSpectrumAgesClick
    OnChange = iwcbSpectrumAgesChange
    Checked = False
    FriendlyName = 'iwcbSpectrumAges'
  end
  object iwrgPDFType: TIWRadioGroup
    AlignWithMargins = False
    Left = 690
    Top = 343
    Width = 641
    Height = 53
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwrgShowAllSampleLocalities'
    ItemIndex = 1
    Items.Strings = (
      'pdf '#39'And'#39'  (default)'
      'pdf '#39'Or'#39' ')
    Layout = glVertical
    TabOrder = 4
  end
  object IWLabel4: TIWLabel
    AlignWithMargins = False
    Left = 670
    Top = 318
    Width = 198
    Height = 15
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density function type'
  end
  object iwbReturn: TIWButton
    AlignWithMargins = False
    Left = 749
    Top = 645
    Width = 275
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Return to Main Form'
    Color = clWebLIGHTSALMON
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    TabOrder = 10
    OnClick = iwbReturnClick
  end
  object iwbReturnToResults: TIWButton
    AlignWithMargins = False
    Left = 433
    Top = 645
    Width = 275
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Return to Query Results Form'
    Color = clWebROSYBROWN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    TabOrder = 9
    OnClick = iwbReturnToResultsClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1381
    Height = 69
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 69
    Constraints.MinHeight = 69
    Constraints.MinWidth = 750
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 1381
    inherited IWFrameRegion: TIWRegion
      Width = 1381
      TabOrder = 11
      ExplicitWidth = 1381
      inherited iwrHeader: TIWRegion
        Width = 1381
        ExplicitWidth = 1381
        inherited iwrWelcome: TIWRegion
          Width = 1381
          ExplicitWidth = 1381
          inherited iwrDisplayUserName: TIWRegion
            Width = 1205
            ExplicitWidth = 1205
            inherited lblWelcome: TIWLabel
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 804
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1381
          ExplicitWidth = 1381
          inherited iwlSignOut: TIWLink
            Font.Style = [fsUnderline]
            Font.Color = clWebBLUE
          end
          inherited lnkSignIn: TIWLink
            Font.Style = [fsUnderline]
            Font.Color = clWebBLUE
          end
          inherited lblProgTitle: TIWLabel
            Width = 532
            Height = 24
            Font.Color = clWebSTEELBLUE
            ExplicitWidth = 532
            ExplicitHeight = 24
          end
        end
      end
    end
  end
end
