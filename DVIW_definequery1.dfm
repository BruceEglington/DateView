object ISFDefineQuery1: TISFDefineQuery1
  Left = 0
  Top = 0
  Width = 784
  Height = 1200
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
    Width = 83
    Height = 1145
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
    ExplicitHeight = 404
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 784
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
    ExplicitWidth = 784
    inherited IWFrameRegion: TIWRegion
      Width = 784
      TabOrder = 31
      ExplicitWidth = 784
      inherited iwrHeader: TIWRegion
        Width = 784
        ExplicitWidth = 784
        inherited iwrWelcome: TIWRegion
          Width = 784
          ExplicitWidth = 784
          inherited iwrDisplayUserName: TIWRegion
            Width = 643
            ExplicitWidth = 643
            inherited lblWelcome: TIWLabel
              Left = 322
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 784
          ExplicitWidth = 784
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object iwrPage: TIWRegion
    Left = 83
    Top = 55
    Width = 701
    Height = 1145
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrRight: TIWRegion
      Left = 0
      Top = 0
      Width = 701
      Height = 1145
      RenderInvisibleControls = False
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwrIncludes: TIWRegion
        Left = 0
        Top = 406
        Width = 701
        Height = 265
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
          Width = 226
          Height = 21
          Caption = 'Stratigraphic Units'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 2
          Checked = False
          FriendlyName = 'iwcbUnits'
        end
        object iwcbLithologies: TIWCheckBox
          Left = 15
          Top = 89
          Width = 226
          Height = 21
          Caption = 'Lithologies'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 3
          Checked = False
          FriendlyName = 'iwcbLithologies'
        end
        object iwcbInterpretations: TIWCheckBox
          Left = 15
          Top = 116
          Width = 226
          Height = 21
          Caption = 'Interpretations'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 4
          Checked = False
          FriendlyName = 'iwcbInterpretations'
        end
        object iwcbMaterial: TIWCheckBox
          Left = 15
          Top = 143
          Width = 226
          Height = 21
          Caption = 'Material Analysed'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 5
          Checked = False
          FriendlyName = 'iwcbMaterial'
        end
        object iwcbIsotopeSystems: TIWCheckBox
          Left = 15
          Top = 170
          Width = 226
          Height = 21
          Caption = 'Isotope Systems'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 6
          Checked = False
          FriendlyName = 'iwcbIsotopeSystems'
        end
        object iwcbApproaches: TIWCheckBox
          Left = 15
          Top = 197
          Width = 226
          Height = 21
          Caption = 'Approaches'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 7
          Checked = False
          FriendlyName = 'iwcbApproaches'
        end
        object iwcbTechniques: TIWCheckBox
          Left = 15
          Top = 224
          Width = 226
          Height = 21
          Caption = 'Techniques'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 8
          Checked = False
          FriendlyName = 'iwcbTechniques'
        end
        object iwcbMethods: TIWCheckBox
          Left = 490
          Top = 143
          Width = 208
          Height = 21
          Caption = 'Methodologies'
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
        object iwcbWhoFor: TIWCheckBox
          Left = 489
          Top = 170
          Width = 209
          Height = 21
          Caption = 'Who For'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 10
          Checked = False
          FriendlyName = 'iwcbWhoFor'
        end
        object iwcbValidation: TIWCheckBox
          Left = 490
          Top = 197
          Width = 208
          Height = 21
          Caption = 'Validation Status'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 11
          Checked = False
          FriendlyName = 'iwcbValidation'
        end
        object iwcbUsersContributed: TIWCheckBox
          Left = 490
          Top = 116
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
          TabOrder = 21
          Checked = False
          FriendlyName = 'iwcbWhoFor'
        end
        object iwcbBoundaryPos: TIWCheckBox
          Left = 258
          Top = 224
          Width = 207
          Height = 21
          Caption = 'Relative to selected Boundary'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 19
          Checked = False
          FriendlyName = 'iwcbBoundaryPos'
        end
        object iwcbBoundaries: TIWCheckBox
          Left = 258
          Top = 197
          Width = 199
          Height = 21
          Caption = 'Boundaries'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 18
          Checked = False
          FriendlyName = 'iwcbBoundaries'
        end
        object iwcbChemTypes: TIWCheckBox
          Left = 258
          Top = 143
          Width = 199
          Height = 21
          Caption = 'Chemical Associations'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 16
          Checked = False
          FriendlyName = 'iwcbChemTypes'
        end
        object iwcbGroupingList: TIWCheckBox
          Left = 490
          Top = 89
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
          TabOrder = 20
          Checked = False
          FriendlyName = 'iwcbGroupingList'
        end
        object iwcbOrogenicPeriods: TIWCheckBox
          Left = 258
          Top = 170
          Width = 199
          Height = 21
          Caption = 'Orogenic Periods'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 17
          Checked = False
          FriendlyName = 'iwcbOrogenicPeriods'
        end
        object iwcbLIPS: TIWCheckBox
          Left = 490
          Top = 62
          Width = 208
          Height = 21
          Caption = 'Large Igneous Provinces'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 15
          Checked = False
          FriendlyName = 'iwcbLIPS'
        end
        object iwcbTerranes: TIWCheckBox
          Left = 258
          Top = 116
          Width = 207
          Height = 21
          Caption = 'Terranes'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 14
          Checked = False
          FriendlyName = 'iwcbTerranes'
        end
        object iwcbProvinces: TIWCheckBox
          Left = 258
          Top = 89
          Width = 207
          Height = 21
          Caption = 'Provinces'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 13
          Checked = False
          FriendlyName = 'iwcbProvinces'
        end
        object iwcbReferences: TIWCheckBox
          Left = 258
          Top = 62
          Width = 207
          Height = 21
          Caption = 'References'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 12
          Checked = False
          FriendlyName = 'iwcbReferences'
        end
        object iwcbIncludeUserOrgID: TIWCheckBox
          Left = 490
          Top = 224
          Width = 208
          Height = 21
          Caption = 'User Organisation Unique ID'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 22
          Checked = False
          FriendlyName = 'iwcbIncludeUserOrgID'
        end
      end
      object iwrButtonsTop: TIWRegion
        Left = 0
        Top = 0
        Width = 701
        Height = 56
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
          TabOrder = 29
          OnClick = iwbNextStageOfQueryClick
        end
        object iwbCancel: TIWButton
          Left = 352
          Top = 18
          Width = 105
          Height = 25
          Caption = 'Cancel'
          Color = clWebLIGHTSALMON
          Font.Color = clNone
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iwbCancel'
          TabOrder = 30
          OnClick = iwbCancelClick
        end
      end
      object iwrAreas: TIWRegion
        Left = 0
        Top = 56
        Width = 701
        Height = 350
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwcbAreas: TIWCheckBox
          Left = 15
          Top = 16
          Width = 313
          Height = 21
          Caption = 'Include selection from Areas'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          Checked = True
          FriendlyName = 'iwcbAreas'
        end
        object iwlAreas: TIWListbox
          Left = 15
          Top = 43
          Width = 313
          Height = 272
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          RequireSelection = False
          TabOrder = 1
          NonEditableAsLabel = True
          FriendlyName = 'iwlAreas'
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object iwlblError: TIWLabel
          Left = 58
          Top = 321
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
        object IWText1: TIWText
          Left = 352
          Top = 43
          Width = 341
          Height = 203
          BGColor = clNone
          ConvertSpaces = True
          Font.Color = clWebDARKSLATEGRAY
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'IWText1'
          Lines.Strings = (
            'Select the Areas from which you wish to obtain data. '
            'Note that the values selected here will influence '
            'subsequent lists used to further refine search '
            'conditions and will also influence the final query.'
            ''
            'Multiple Areas may be selected. '
            ''
            'A more restricted range in data will improve performance '
            'and provide faster response times to your queries.'
            ''
            
              'If you require all the areas in previously specified continents,' +
              ' '
            'ignore the items here and leave the checkbox unchecked.')
          RawText = False
          UseFrame = False
          WantReturns = True
        end
      end
      object iwrSampleRange: TIWRegion
        Left = 0
        Top = 671
        Width = 701
        Height = 124
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        Color = clWebBURLYWOOD
        object IWLabel2: TIWLabel
          Left = 22
          Top = 20
          Width = 143
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel1'
          Caption = 'Show samples ranging'
        end
        object IWLabel3: TIWLabel
          Left = 22
          Top = 46
          Width = 29
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel2'
          Caption = 'from'
        end
        object IWLabel4: TIWLabel
          Left = 22
          Top = 81
          Width = 12
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel3'
          Caption = 'to'
        end
        object iweSampleTo: TIWEdit
          Left = 62
          Top = 78
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 24
        end
        object iweSampleFrom: TIWEdit
          Left = 62
          Top = 43
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 23
        end
        object lblFromErrorSamples: TIWLabel
          Left = 273
          Top = 44
          Width = 135
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblFromErrorSamples'
          Caption = 'lblFromErrorSamples'
        end
        object lblToErrorSamples: TIWLabel
          Left = 273
          Top = 81
          Width = 117
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblToErrorSamples'
          Caption = 'lblToErrorSamples'
        end
      end
      object iwrReferenceRange: TIWRegion
        Left = 0
        Top = 795
        Width = 701
        Height = 113
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        Color = clWebDARKKHAKI
        object IWLabel5: TIWLabel
          Left = 22
          Top = 42
          Width = 29
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel2'
          Caption = 'from'
        end
        object iweReferenceFrom: TIWEdit
          Left = 62
          Top = 39
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 25
        end
        object IWLabel6: TIWLabel
          Left = 22
          Top = 70
          Width = 12
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel3'
          Caption = 'to'
        end
        object iweReferenceTo: TIWEdit
          Left = 62
          Top = 67
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 26
        end
        object lblFromErrorRefs: TIWLabel
          Left = 273
          Top = 47
          Width = 106
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblFromErrorRefs'
          Caption = 'lblFromErrorRefs'
        end
        object lblToErrorRefs: TIWLabel
          Left = 273
          Top = 68
          Width = 90
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblToErrorRefs'
          Caption = 'lblToErrorRefs'
        end
        object IWLabel1: TIWLabel
          Left = 22
          Top = 18
          Width = 158
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel1'
          Caption = 'Show references ranging'
        end
      end
      object iwrDomainRange: TIWRegion
        Left = 0
        Top = 908
        Width = 701
        Height = 111
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        Color = clWebDARKSEAGREEN
        object IWLabel7: TIWLabel
          Left = 22
          Top = 20
          Width = 143
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel1'
          Caption = 'Show domains ranging'
        end
        object IWLabel8: TIWLabel
          Left = 22
          Top = 46
          Width = 29
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel2'
          Caption = 'from'
        end
        object IWLabel9: TIWLabel
          Left = 22
          Top = 73
          Width = 12
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel3'
          Caption = 'to'
        end
        object iweDomainTo: TIWEdit
          Left = 62
          Top = 70
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweDomainTo'
          SubmitOnAsyncEvent = True
          TabOrder = 28
        end
        object iweDomainFrom: TIWEdit
          Left = 62
          Top = 43
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweDomainFrom'
          SubmitOnAsyncEvent = True
          TabOrder = 27
        end
        object lblFromErrorDomains: TIWLabel
          Left = 273
          Top = 44
          Width = 136
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblFromErrorDomains'
          Caption = 'lblFromErrorDomains'
        end
        object lblToErrorDomains: TIWLabel
          Left = 273
          Top = 73
          Width = 118
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblToErrorDomains'
          Caption = 'lblToErrorDomains'
        end
      end
    end
  end
end
