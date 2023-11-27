object ISFDefineQuery2: TISFDefineQuery2
  Left = 0
  Top = 0
  Width = 1483
  Height = 4750
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1483
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
    ExplicitWidth = 1483
    inherited IWFrameRegion: TIWRegion
      Width = 1483
      TabOrder = 72
      ExplicitWidth = 1483
      inherited iwrHeader: TIWRegion
        Width = 1483
        ExplicitWidth = 1483
        inherited iwrWelcome: TIWRegion
          Width = 1483
          ExplicitWidth = 1483
          inherited iwrDisplayUserName: TIWRegion
            Width = 1342
            ExplicitWidth = 1342
            inherited lblWelcome: TIWLabel
              Left = 1021
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1483
          ExplicitWidth = 1483
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object iwrLeftBar: TIWRegion
    Left = 0
    Top = 55
    Width = 83
    Height = 4695
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    Color = clWebLAVENDER
    ExplicitHeight = 4445
  end
  object iwrRightChannel: TIWRegion
    Left = 83
    Top = 55
    Width = 1400
    Height = 4695
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    ShowHint = False
    ClipRegion = False
    ExplicitHeight = 4445
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 1400
      Height = 355
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbSubmitQuery: TIWButton
        Left = 15
        Top = 18
        Width = 293
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery'
        OnClick = iwbSubmitQueryClick
      end
      object iwbClearCheckboxes: TIWButton
        Left = 322
        Top = 18
        Width = 130
        Height = 25
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 1
        OnClick = iwbClearCheckboxesClick
      end
      object iwbCancel: TIWButton
        Left = 468
        Top = 18
        Width = 130
        Height = 25
        Caption = 'Cancel'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbCancel'
        TabOrder = 2
        OnClick = iwbCancelClick
      end
      object IWText1: TIWText
        Left = 432
        Top = 113
        Width = 261
        Height = 221
        BGColor = clNone
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select parameters which define the records '
          'you require. '
          ''
          'Multiple selections may be made in most list '
          'boxes. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response '
          'times to your queries.'
          ''
          'Note that you also need to check the '#39'Include'#39
          'box above a list if you want the items specified'
          'to be include in your query.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwcbGoDirectToGraphs: TIWCheckBox
        Left = 15
        Top = 134
        Width = 389
        Height = 21
        Caption = 'Do not show data records.  Go direct to graph selection'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 3
        Checked = False
        FriendlyName = 'iwcbGoDirectToGraphs'
      end
      object iwlblErrorTop: TIWLabel
        Left = 96
        Top = 81
        Width = 250
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorTop'
        Caption = 'No items selected or boxes not checked'
      end
      object iwcbIncludeIgneous: TIWCheckBox
        Left = 17
        Top = 200
        Width = 387
        Height = 21
        Caption = 'Include all igneous lithologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 80
        Checked = False
        FriendlyName = 'iwcbIncludeIgneous'
      end
      object iwcbIncludeSedimentary: TIWCheckBox
        Left = 17
        Top = 240
        Width = 387
        Height = 21
        Caption = 'Include all sedimentary lithologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 81
        Checked = False
        FriendlyName = 'iwcbIncludeSedimentary'
      end
      object iwcbIncludeMetamorphicAndOther: TIWCheckBox
        Left = 17
        Top = 280
        Width = 387
        Height = 21
        Caption = 'Include all metamorphic and other lithologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 82
        Checked = False
        FriendlyName = 'iwcbIncludeMetamorphicAndOther'
      end
    end
    object iwrEpsilon: TIWRegion
      Left = 0
      Top = 4125
      Width = 1400
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 3955
      object iwlblErrorEpsilonTo: TIWLabel
        Left = 571
        Top = 33
        Width = 83
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorEpsilonTo'
        Caption = 'Not a number'
      end
      object iweToEpsilon: TIWEdit
        Left = 579
        Top = 6
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweToEpsilon'
        SubmitOnAsyncEvent = True
        TabOrder = 73
      end
      object iwcbToEpsilon: TIWCheckBox
        Left = 382
        Top = 6
        Width = 214
        Height = 21
        Caption = 'to Epsilon (maximum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 71
        Checked = False
        FriendlyName = 'iwcbToEpsilon'
      end
      object iwlblErrorEpsilonFrom: TIWLabel
        Left = 240
        Top = 33
        Width = 83
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorEpsilonFrom'
        Caption = 'Not a number'
      end
      object iweFromEpsilon: TIWEdit
        Left = 252
        Top = 6
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweFromEpsilon'
        SubmitOnAsyncEvent = True
        TabOrder = 66
      end
      object iwcbFromEpsilon: TIWCheckBox
        Left = 15
        Top = 6
        Width = 250
        Height = 21
        Caption = 'Include from Epsilon (minimum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 62
        Checked = False
        FriendlyName = 'iwcbFromEpsilon'
      end
    end
    object iwrLithologies: TIWRegion
      Left = 0
      Top = 645
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsInset
      ExplicitTop = 635
      object IWButton8: TIWButton
        Left = 594
        Top = 63
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 8
        OnClick = iwbSubmitQueryClick
      end
      object iwlLithologies: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 7
        NonEditableAsLabel = True
        FriendlyName = 'iwlLithologies'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbLithologies: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Lithologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbLithologies'
      end
    end
    object iwrUnits: TIWRegion
      Left = 0
      Top = 355
      Width = 1400
      Height = 290
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlUnits: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 240
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 5
        NonEditableAsLabel = True
        FriendlyName = 'iwlUnits'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbUnits: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Stratigraphic Units'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 4
        Checked = False
        FriendlyName = 'iwcbUnits'
      end
    end
    object iwrBoundaryPositions: TIWRegion
      Left = 0
      Top = 3365
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlBoundaryPos: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 53
        NonEditableAsLabel = True
        FriendlyName = 'iwlBoundaryPos'
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbBoundaryPos: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection relative to selected Boundary'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 54
        Checked = False
        FriendlyName = 'iwcbBoundaryPos'
      end
    end
    object iwrBoundaries: TIWRegion
      Left = 0
      Top = 3205
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton2: TIWButton
        Left = 594
        Top = 63
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 50
        OnClick = iwbSubmitQueryClick
      end
      object iwlBoundaries: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 51
        NonEditableAsLabel = True
        FriendlyName = 'iwlBoundaries'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbBoundaries: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Boundaries'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 52
        Checked = False
        FriendlyName = 'iwcbBoundaries'
      end
    end
    object iwrUserGroups: TIWRegion
      Left = 0
      Top = 3045
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlGroupingList: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 48
        NonEditableAsLabel = True
        FriendlyName = 'iwlGroupingList'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbGroupingList: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from User-defined Groups'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 49
        Checked = False
        FriendlyName = 'iwcbGroupingList'
      end
    end
    object iwrChemicalAssociations: TIWRegion
      Left = 0
      Top = 2885
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlChemTypes: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 46
        NonEditableAsLabel = True
        FriendlyName = 'iwlChemTypes'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbChemTypes: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Chemical Associations'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 47
        Checked = False
        FriendlyName = 'iwcbChemTypes'
      end
    end
    object iwrOrogenicPeriods: TIWRegion
      Left = 0
      Top = 2725
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton3: TIWButton
        Left = 594
        Top = 79
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 43
        OnClick = iwbSubmitQueryClick
      end
      object iwlOrogenicPeriods: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 44
        NonEditableAsLabel = True
        FriendlyName = 'iwlOrogenicPeriods'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbOrogenicPeriods: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Orogenic Periods'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 45
        Checked = False
        FriendlyName = 'iwcbOrogenicPeriods'
      end
    end
    object iwrLIPs: TIWRegion
      Left = 0
      Top = 2565
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlLIPS: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 41
        NonEditableAsLabel = True
        FriendlyName = 'iwlLIPS'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbLIPS: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Large Igneous Provinces'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 42
        Checked = False
        FriendlyName = 'iwcbLIPS'
      end
    end
    object iwrTerranes: TIWRegion
      Left = 0
      Top = 2405
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlTerranes: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 39
        NonEditableAsLabel = True
        FriendlyName = 'iwlTerranes'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbTerranes: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Terranes'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 40
        Checked = False
        FriendlyName = 'iwcbTerranes'
      end
    end
    object iwrProvinces: TIWRegion
      Left = 0
      Top = 2245
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton4: TIWButton
        Left = 594
        Top = 79
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 36
        OnClick = iwbSubmitQueryClick
      end
      object iwlProvinces: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 37
        NonEditableAsLabel = True
        FriendlyName = 'iwlProvinces'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbProvinces: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Provinces'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 38
        Checked = False
        FriendlyName = 'iwcbProvinces'
      end
    end
    object iwrReferences: TIWRegion
      Left = 0
      Top = 2035
      Width = 1400
      Height = 210
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlReferences: TIWListbox
        Left = 15
        Top = 25
        Width = 623
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 34
        NonEditableAsLabel = True
        FriendlyName = 'iwlReferences'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbReferences: TIWCheckBox
        Left = 15
        Top = 5
        Width = 623
        Height = 21
        Caption = 'Include selection from References'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 35
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
    end
    object iwrRatingDateRange: TIWRegion
      Left = 0
      Top = 1765
      Width = 1400
      Height = 270
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 1685
      object iwcbDCWith: TIWCheckBox
        Left = 30
        Top = 215
        Width = 316
        Height = 21
        Caption = 'With decay constant uncertainties'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 23
        Checked = False
        FriendlyName = 'iwcbDCWith'
      end
      object iwcbDCWithout: TIWCheckBox
        Left = 30
        Top = 196
        Width = 316
        Height = 21
        Caption = 'Without decay constant uncertainties'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 24
        Checked = False
        FriendlyName = 'iwcbDCWithout'
      end
      object IWButton5: TIWButton
        Left = 594
        Top = 151
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 25
        OnClick = iwbSubmitQueryClick
      end
      object IWLabel2: TIWLabel
        Left = 15
        Top = 175
        Width = 182
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 'Decay constant uncertainties'
      end
      object iwcbMSWD: TIWCheckBox
        Left = 17
        Top = 140
        Width = 347
        Height = 21
        Caption = 'MSWD <= Cutoff / Probability >= Alpha'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 26
        Checked = False
        FriendlyName = 'iwcbMSWD'
      end
      object iwcbAgeUnits: TIWComboBox
        Left = 250
        Top = 105
        Width = 61
        Height = 21
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        StyleRenderOptions.RenderBorder = False
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        UseSize = False
        NonEditableAsLabel = True
        TabOrder = 27
        ItemIndex = -1
        FriendlyName = 'iwcbAgeUnits'
        NoSelectionText = '-- No Selection --'
      end
      object iwcbIncludeAgeUnits: TIWCheckBox
        Left = 15
        Top = 105
        Width = 229
        Height = 21
        Caption = 'Include Age Unit specifier'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 28
        Checked = False
        FriendlyName = 'iwcbIncludeAgeUnits'
      end
      object iweToDate: TIWEdit
        Left = 537
        Top = 62
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 29
      end
      object iwcbToDate: TIWCheckBox
        Left = 356
        Top = 62
        Width = 190
        Height = 21
        Caption = 'to Date (maximum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 30
        Checked = False
        FriendlyName = 'iwcbToDate'
      end
      object iweFromDate: TIWEdit
        Left = 252
        Top = 62
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 31
      end
      object iwcbFromDate: TIWCheckBox
        Left = 15
        Top = 62
        Width = 228
        Height = 21
        Caption = 'Include from Date (minimum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 32
        Checked = False
        FriendlyName = 'iwcbFromDate'
      end
      object iwcbPreferenceLevel: TIWComboBox
        Left = 104
        Top = 19
        Width = 550
        Height = 21
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        StyleRenderOptions.RenderBorder = False
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        UseSize = False
        NonEditableAsLabel = True
        TabOrder = 33
        ItemIndex = -1
        FriendlyName = 'iwcbPreferenceLevel'
        NoSelectionText = '-- No Selection --'
      end
      object IWLabel1: TIWLabel
        Left = 15
        Top = 22
        Width = 58
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Rating >='
      end
    end
    object iwrInterpretations: TIWRegion
      Left = 0
      Top = 1605
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 1535
      object iwlInterpretations: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 21
        NonEditableAsLabel = True
        FriendlyName = 'iwlInterpretations'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbInterpretations: TIWCheckBox
        Left = 15
        Top = 6
        Width = 349
        Height = 21
        Caption = 'Include selection from Interpretations'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 22
        Checked = False
        FriendlyName = 'iwcbInterpretations'
      end
    end
    object iwrTechniques: TIWRegion
      Left = 0
      Top = 1445
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 1385
      object IWButton6: TIWButton
        Left = 594
        Top = 87
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 18
        OnClick = iwbSubmitQueryClick
      end
      object iwlTechniques: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 19
        NonEditableAsLabel = True
        FriendlyName = 'iwlTechniques'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbTechniques: TIWCheckBox
        Left = 15
        Top = 6
        Width = 349
        Height = 21
        Caption = 'Include selection from Techniques'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 20
        Checked = False
        FriendlyName = 'iwcbTechniques'
      end
    end
    object iwrApproaches: TIWRegion
      Left = 0
      Top = 1285
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 1235
      object iwlApproaches: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 16
        NonEditableAsLabel = True
        FriendlyName = 'iwlApproaches'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbApproaches: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Approaches'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 17
        Checked = False
        FriendlyName = 'iwcbApproaches'
      end
    end
    object iwrIsotopeSystems: TIWRegion
      Left = 0
      Top = 1125
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 1085
      object iwlIsotopeSystems: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 14
        NonEditableAsLabel = True
        FriendlyName = 'iwlIsotopeSystems'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbIsotopeSystems: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Isotope Systems'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 15
        Checked = False
        FriendlyName = 'iwcbIsotopeSystems'
      end
    end
    object iwrMaterialAnalysed: TIWRegion
      Left = 0
      Top = 965
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 935
      object IWButton7: TIWButton
        Left = 594
        Top = 71
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 11
        OnClick = iwbSubmitQueryClick
      end
      object iwlMaterial: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 12
        NonEditableAsLabel = True
        FriendlyName = 'iwlMaterial'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbMaterial: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Material Analysed'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        Checked = False
        FriendlyName = 'iwcbMaterial'
      end
    end
    object iwrMethodologies: TIWRegion
      Left = 0
      Top = 805
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 785
      object iwlMethods: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 10
        NonEditableAsLabel = True
        FriendlyName = 'iwlMethods'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbMethods: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Methodologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbMethods'
      end
    end
    object iwrCoordinates: TIWRegion
      Left = 0
      Top = 4005
      Width = 1400
      Height = 120
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 3835
      object iwlNegativeWS: TIWLabel
        Left = 584
        Top = 54
        Width = 146
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNegativeWS'
        Caption = 'Negative west and south'
      end
      object iwlPositiveEN: TIWLabel
        Left = 584
        Top = 35
        Width = 136
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlPositiveEN'
        Caption = 'Positive east and north'
      end
      object iweNELon: TIWEdit
        Left = 473
        Top = 27
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweNELon'
        SubmitOnAsyncEvent = True
        TabOrder = 65
      end
      object iweSWLon: TIWEdit
        Left = 473
        Top = 54
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweSWLon'
        SubmitOnAsyncEvent = True
        TabOrder = 70
      end
      object iwlSWLon: TIWLabel
        Left = 356
        Top = 57
        Width = 80
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlSWLon'
        Caption = 'Longitude >='
      end
      object iwlNELon: TIWLabel
        Left = 356
        Top = 30
        Width = 80
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNELon'
        Caption = 'Longitude <='
      end
      object iweNELat: TIWEdit
        Left = 226
        Top = 27
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweNELat'
        SubmitOnAsyncEvent = True
        TabOrder = 63
      end
      object iweSWLat: TIWEdit
        Left = 226
        Top = 54
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweSWLat'
        SubmitOnAsyncEvent = True
        TabOrder = 67
      end
      object iwlSWLat: TIWLabel
        Left = 40
        Top = 57
        Width = 152
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlSWLat'
        Caption = 'SW corner     Latitude >='
      end
      object iwlNELat: TIWLabel
        Left = 40
        Top = 30
        Width = 150
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNELat'
        Caption = 'NE corner      Latitude <='
      end
      object iwcbCoordinates: TIWCheckBox
        Left = 15
        Top = 5
        Width = 284
        Height = 21
        HelpType = htKeyword
        Caption = 'Include coordinates'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 61
        Checked = False
        FriendlyName = 'iwcbCoordinates'
      end
    end
    object iwrWhoFor: TIWRegion
      Left = 0
      Top = 3685
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 3515
      object IWButton9: TIWButton
        Left = 594
        Top = 47
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 58
        OnClick = iwbSubmitQueryClick
      end
      object iwlWhoFor: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 59
        NonEditableAsLabel = True
        FriendlyName = 'iwlWhoFor'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbWhoFor: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Who For'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 60
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 4333
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 4163
      object iwrgOrderBy: TIWRadioGroup
        Left = 35
        Top = 38
        Width = 417
        Height = 85
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwrgOrderBy'
        ItemIndex = 0
        Items.Strings = (
          
            'Area, Unit, Material, Iso.Sys., Approach, Technique, Interp., ..' +
            '.'
          'RecordID'
          'Age, Area, Unit, Material, ...'
          'Material, Iso.Sys., Approach, Technique, Interp., ...'
          'Area, Unit, Age, Material, ...')
        Layout = glVertical
        TabOrder = 68
      end
      object IWLabel4: TIWLabel
        Left = 15
        Top = 17
        Width = 101
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Order results by'
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 3525
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 3355
      object IWButton1: TIWButton
        Left = 594
        Top = 63
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 55
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 56
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbValidation: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Validation Status'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 57
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrContributors: TIWRegion
      Left = 0
      Top = 3845
      Width = 1400
      Height = 160
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 3675
      object iwlUsersContributed: TIWListbox
        Left = 15
        Top = 25
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 64
        NonEditableAsLabel = True
        FriendlyName = 'iwlWhoFor'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbUsersContributed: TIWCheckBox
        Left = 15
        Top = 5
        Width = 349
        Height = 21
        Caption = 'Include selection from Contributors'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 69
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
    end
    object iwrBottomButtons: TIWRegion
      Left = 0
      Top = 4493
      Width = 1400
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 4323
      object iwlblErrorBottom: TIWLabel
        Left = 328
        Top = 25
        Width = 250
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorBottom'
        Caption = 'No items selected or boxes not checked'
      end
      object iwbSubmitQuery2: TIWButton
        Left = 104
        Top = 15
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 74
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrRecordID: TIWRegion
      Left = 0
      Top = 4185
      Width = 1400
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 4015
      object iweRecordIDFrom: TIWEdit
        Left = 271
        Top = 6
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweRecordIDFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 76
      end
      object iwcbRecordIDrange: TIWCheckBox
        Left = 15
        Top = 6
        Width = 202
        Height = 21
        Caption = 'Include RecordID range'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 75
        Checked = False
        FriendlyName = 'iwcbRecordIDrange'
      end
      object IWLabel3: TIWLabel
        Left = 214
        Top = 10
        Width = 29
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'from'
      end
      object IWLabel5: TIWLabel
        Left = 336
        Top = 10
        Width = 99
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = '(minimum)      to'
      end
      object iweRecordIDTo: TIWEdit
        Left = 472
        Top = 6
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweRecordIDTo'
        SubmitOnAsyncEvent = True
        TabOrder = 77
      end
      object IWLabel6: TIWLabel
        Left = 545
        Top = 10
        Width = 71
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = '(maximum)'
      end
    end
    object iwrAccount: TIWRegion
      Left = 0
      Top = 4245
      Width = 1400
      Height = 88
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 4075
      object iwrgAccountMatch: TIWRadioGroup
        Left = 30
        Top = 40
        Width = 435
        Height = 41
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwrgAccountMatch'
        ItemIndex = 0
        Items.Strings = (
          'Record IDs match existing records in User Organisation database'
          'Record IDs not previously linked to User Organisation database')
        Layout = glVertical
        TabOrder = 79
      end
      object iwcbIncludeUserOrgID: TIWCheckBox
        Left = 15
        Top = 6
        Width = 389
        Height = 21
        Caption = 'Include User Organisation Unique OrgID'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 78
        Checked = False
        FriendlyName = 'iwcbIncludeUserOrgID'
      end
    end
  end
end
