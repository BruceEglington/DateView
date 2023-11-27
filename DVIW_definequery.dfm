object ISFDefineQuery: TISFDefineQuery
  Left = 0
  Top = 0
  Width = 2003
  Height = 800
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
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 82
    Height = 745
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
    ExplicitHeight = 423
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 2003
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
    ExplicitWidth = 2003
    inherited IWFrameRegion: TIWRegion
      Width = 2003
      TabOrder = 25
      ExplicitWidth = 2003
      inherited iwrHeader: TIWRegion
        Width = 2003
        ExplicitWidth = 2003
        inherited iwrWelcome: TIWRegion
          Width = 2003
          ExplicitWidth = 2003
          inherited iwrDisplayUserName: TIWRegion
            Width = 1862
            ExplicitWidth = 1862
            inherited lblWelcome: TIWLabel
              Left = 1541
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 2003
          ExplicitWidth = 2003
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object IWRegion3: TIWRegion
    Left = 82
    Top = 55
    Width = 1921
    Height = 745
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object IWRegion2: TIWRegion
      Left = 0
      Top = 0
      Width = 1921
      Height = 65
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbNextStageOfQuery: TIWButton
        Left = 14
        Top = 18
        Width = 293
        Height = 25
        Caption = 'Proceed to next stage of query definition'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbNextStageOfQuery'
        OnClick = iwbNextStageOfQueryClick
      end
      object iwbCancel: TIWButton
        Left = 344
        Top = 18
        Width = 105
        Height = 25
        Caption = 'Cancel'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbCancel'
        TabOrder = 1
        OnClick = iwbCancelClick
      end
    end
    object IWRegion1: TIWRegion
      Left = 0
      Top = 65
      Width = 1921
      Height = 376
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbContinents: TIWCheckBox
        Left = 25
        Top = 16
        Width = 322
        Height = 21
        Caption = 'Include selection from Continents'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 2
        Checked = True
        FriendlyName = 'iwcbContinents'
      end
      object iwlContinents: TIWListbox
        Left = 34
        Top = 43
        Width = 313
        Height = 296
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 3
        NonEditableAsLabel = True
        FriendlyName = 'iwlContinents'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object IWText1: TIWText
        Left = 360
        Top = 19
        Width = 275
        Height = 175
        BGColor = clNone
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select the Continents from which you wish '
          'to obtain data. Note that the values '
          'selected here will influence subsequent lists '
          'used to further refine search conditions and '
          'will also influence the final query.'
          ''
          'Multiple Continents may be selected. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response times '
          'to your queries.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwlblError: TIWLabel
        Left = 59
        Top = 345
        Width = 235
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblError'
        Caption = 'No items selected or box not checked'
      end
    end
    object iwrIncludes: TIWRegion
      Left = 0
      Top = 441
      Width = 1921
      Height = 345
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      Color = clWebALICEBLUE
      object IWText2: TIWText
        Left = 14
        Top = 21
        Width = 601
        Height = 35
        BGColor = clWebALICEBLUE
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          
            'Select which lists are to be populated with values on subsequent' +
            ' pages. Populate only those lists you wish to use so as to speed' +
            ' up processing.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwcbUnits: TIWCheckBox
        Left = 15
        Top = 62
        Width = 218
        Height = 21
        Caption = 'Stratigraphic Units'
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
      object iwcbLithologies: TIWCheckBox
        Left = 15
        Top = 89
        Width = 218
        Height = 21
        Caption = 'Lithologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 5
        Checked = False
        FriendlyName = 'iwcbLithologies'
      end
      object iwcbInterpretations: TIWCheckBox
        Left = 15
        Top = 116
        Width = 218
        Height = 21
        Caption = 'Interpretations'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbInterpretations'
      end
      object iwcbMaterial: TIWCheckBox
        Left = 15
        Top = 143
        Width = 218
        Height = 21
        Caption = 'Material Analysed'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 7
        Checked = False
        FriendlyName = 'iwcbMaterial'
      end
      object iwcbIsotopeSystems: TIWCheckBox
        Left = 15
        Top = 170
        Width = 218
        Height = 21
        Caption = 'Isotope Systems'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 8
        Checked = False
        FriendlyName = 'iwcbIsotopeSystems'
      end
      object iwcbApproaches: TIWCheckBox
        Left = 15
        Top = 197
        Width = 218
        Height = 21
        Caption = 'Approaches'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbApproaches'
      end
      object iwcbTechniques: TIWCheckBox
        Left = 15
        Top = 224
        Width = 218
        Height = 21
        Caption = 'Techniques'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        Checked = False
        FriendlyName = 'iwcbTechniques'
      end
      object iwcbMethods: TIWCheckBox
        Left = 15
        Top = 251
        Width = 218
        Height = 21
        Caption = 'Methodologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 11
        Checked = False
        FriendlyName = 'iwcbMethods'
      end
      object iwcbWhoFor: TIWCheckBox
        Left = 14
        Top = 278
        Width = 219
        Height = 21
        Caption = 'Who For'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 12
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
      object iwcbValidation: TIWCheckBox
        Left = 15
        Top = 305
        Width = 218
        Height = 21
        Caption = 'Validation Status'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
      object iwcbUsersContributed: TIWCheckBox
        Left = 258
        Top = 305
        Width = 208
        Height = 21
        Caption = 'Contributors'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 14
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
      object iwcbBoundaryPos: TIWCheckBox
        Left = 258
        Top = 251
        Width = 231
        Height = 21
        Caption = 'Relative to selected Boundary'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 15
        Checked = False
        FriendlyName = 'iwcbBoundaryPos'
      end
      object iwcbBoundaries: TIWCheckBox
        Left = 258
        Top = 224
        Width = 231
        Height = 21
        Caption = 'Boundaries'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 16
        Checked = False
        FriendlyName = 'iwcbBoundaries'
      end
      object iwcbChemTypes: TIWCheckBox
        Left = 258
        Top = 170
        Width = 231
        Height = 21
        Caption = 'Chemical Associations'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 17
        Checked = False
        FriendlyName = 'iwcbChemTypes'
      end
      object iwcbGroupingList: TIWCheckBox
        Left = 258
        Top = 278
        Width = 208
        Height = 21
        Caption = 'User-defined Groups'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 18
        Checked = False
        FriendlyName = 'iwcbGroupingList'
      end
      object iwcbOrogenicPeriods: TIWCheckBox
        Left = 258
        Top = 197
        Width = 231
        Height = 21
        Caption = 'Orogenic Periods'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 19
        Checked = False
        FriendlyName = 'iwcbOrogenicPeriods'
      end
      object iwcbLIPS: TIWCheckBox
        Left = 258
        Top = 143
        Width = 231
        Height = 21
        Caption = 'Large Igneous Provinces'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 20
        Checked = False
        FriendlyName = 'iwcbLIPS'
      end
      object iwcbTerranes: TIWCheckBox
        Left = 258
        Top = 116
        Width = 231
        Height = 21
        Caption = 'Terranes'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 21
        Checked = False
        FriendlyName = 'iwcbTerranes'
      end
      object iwcbProvinces: TIWCheckBox
        Left = 258
        Top = 89
        Width = 231
        Height = 21
        Caption = 'Provinces'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 22
        Checked = False
        FriendlyName = 'iwcbProvinces'
      end
      object iwcbReferences: TIWCheckBox
        Left = 258
        Top = 62
        Width = 231
        Height = 21
        Caption = 'References'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 23
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
      object iwcbIncludeUserOrgID: TIWCheckBox
        Left = 491
        Top = 305
        Width = 246
        Height = 21
        Caption = 'User Organisation Unique ID'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 24
        Checked = False
        FriendlyName = 'iwcbIncludeUserOrgID'
      end
    end
  end
end
