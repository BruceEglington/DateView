object ISFNewRecord3: TISFNewRecord3
  Left = 0
  Top = 0
  Width = 1103
  Height = 696
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
  object iwbSubmitQuery: TIWButton
    Left = 234
    Top = 636
    Width = 250
    Height = 25
    Caption = 'Submit new data record'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 16
    OnClick = iwbSubmitQueryClick
  end
  object iwcbUnit: TIWComboBox
    Left = 234
    Top = 77
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    NonEditableAsLabel = True
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel3: TIWLabel
    Left = 100
    Top = 81
    Width = 107
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Stratigraphic unit'
  end
  object IWLabel4: TIWLabel
    Left = 100
    Top = 107
    Width = 56
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Lithology'
  end
  object iwcbLithology: TIWComboBox
    Left = 234
    Top = 103
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 1
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbContinent'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel5: TIWLabel
    Left = 100
    Top = 131
    Width = 110
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Material analysed'
  end
  object iwcbMaterial: TIWComboBox
    Left = 234
    Top = 129
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 2
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel6: TIWLabel
    Left = 100
    Top = 161
    Width = 95
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Isotope system'
  end
  object iwcbIsotopeSystem: TIWComboBox
    Left = 234
    Top = 155
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 3
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel7: TIWLabel
    Left = 100
    Top = 187
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Approach'
  end
  object iwcbApproach: TIWComboBox
    Left = 234
    Top = 181
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 4
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel8: TIWLabel
    Left = 100
    Top = 213
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Technique'
  end
  object iwcbTechnique: TIWComboBox
    Left = 234
    Top = 207
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 5
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel9: TIWLabel
    Left = 100
    Top = 239
    Width = 46
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Method'
  end
  object iwcbMethod: TIWComboBox
    Left = 234
    Top = 233
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 6
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object iweDate: TIWEdit
    Left = 234
    Top = 312
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweDate'
    SubmitOnAsyncEvent = True
    TabOrder = 9
  end
  object iweDatePError: TIWEdit
    Left = 330
    Top = 312
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
    TabOrder = 10
  end
  object IWLabel10: TIWLabel
    Left = 100
    Top = 315
    Width = 39
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Date ='
  end
  object IWLabel11: TIWLabel
    Left = 318
    Top = 313
    Width = 7
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = '+'
  end
  object iweDateMError: TIWEdit
    Left = 418
    Top = 312
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
    TabOrder = 11
  end
  object IWLabel12: TIWLabel
    Left = 404
    Top = 313
    Width = 4
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = '-'
  end
  object iwcbNewAgeUnit: TIWComboBox
    Left = 508
    Top = 311
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
    TabOrder = 12
    ItemIndex = -1
    FriendlyName = 'iwcbAgeUnits'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel13: TIWLabel
    Left = 100
    Top = 265
    Width = 84
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Interpretation'
  end
  object iwcbInterpretation: TIWComboBox
    Left = 234
    Top = 259
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 7
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel14: TIWLabel
    Left = 100
    Top = 291
    Width = 39
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Rating'
  end
  object iwcbRating: TIWComboBox
    Left = 234
    Top = 284
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 8
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel1: TIWLabel
    Left = 100
    Top = 365
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference'
  end
  object iwcbReference: TIWComboBox
    Left = 234
    Top = 359
    Width = 623
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 14
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object iwlWhoFor: TIWListbox
    Left = 106
    Top = 408
    Width = 349
    Height = 146
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 15
    NonEditableAsLabel = True
    FriendlyName = 'iwlWhoFor'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object lblStratigraphicUnitError: TIWLabel
    Left = 568
    Top = 78
    Width = 144
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblStratigraphicUnitError'
    Caption = 'lblStratigraphicUnitError'
  end
  object lblLithologyError: TIWLabel
    Left = 568
    Top = 106
    Width = 97
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblLithologyError'
    Caption = 'lblLithologyError'
  end
  object lblMaterialError: TIWLabel
    Left = 568
    Top = 132
    Width = 91
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblMaterialError'
    Caption = 'lblMaterialError'
  end
  object lblIsoSystemError: TIWLabel
    Left = 568
    Top = 156
    Width = 107
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblIsoSystemError'
    Caption = 'lblIsoSystemError'
  end
  object lblApproachError: TIWLabel
    Left = 568
    Top = 182
    Width = 101
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblApproachError'
    Caption = 'lblApproachError'
  end
  object lblTechniqueError: TIWLabel
    Left = 568
    Top = 212
    Width = 107
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblTechniqueError'
    Caption = 'lblTechniqueError'
  end
  object lblMethodError: TIWLabel
    Left = 568
    Top = 236
    Width = 88
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblMethodError'
    Caption = 'lblMethodError'
  end
  object lblinterpretationError: TIWLabel
    Left = 568
    Top = 262
    Width = 123
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblinterpretationError'
    Caption = 'lblinterpretationError'
  end
  object lblRatingError: TIWLabel
    Left = 568
    Top = 286
    Width = 83
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatingError'
    Caption = 'lblRatingError'
  end
  object lblAgeUnitsError: TIWLabel
    Left = 606
    Top = 312
    Width = 99
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblAgeUnitsError'
    Caption = 'lblAgeUnitsError'
  end
  object lblReferenceError: TIWLabel
    Left = 606
    Top = 386
    Width = 106
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblReferenceError'
    Caption = 'lblReferenceError'
  end
  object lblWhoForError: TIWLabel
    Left = 606
    Top = 416
    Width = 91
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblWhoForError'
    Caption = 'lblWhoForError'
  end
  object IWLabel2: TIWLabel
    Left = 100
    Top = 387
    Width = 91
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Accessable by'
  end
  object lblDatesError: TIWLabel
    Left = 606
    Top = 336
    Width = 80
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDatesError'
    Caption = 'lblDatesError'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 641
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
    ExplicitHeight = 578
  end
  object iwCancel: TIWButton
    Left = 576
    Top = 636
    Width = 250
    Height = 25
    Caption = 'Cancel and return to main page'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwCancel'
    TabOrder = 17
    OnClick = iwCancelClick
  end
  object IWLabel15: TIWLabel
    Left = 576
    Top = 455
    Width = 68
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Laboratory'
  end
  object iwcbLaboratory: TIWComboBox
    Left = 710
    Top = 449
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 18
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbLaboratory'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel16: TIWLabel
    Left = 576
    Top = 483
    Width = 47
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Sample'
  end
  object iwcbSample: TIWComboBox
    Left = 710
    Top = 477
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 19
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbSample'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel17: TIWLabel
    Left = 576
    Top = 511
    Width = 55
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Province'
  end
  object iwcbProvince: TIWComboBox
    Left = 710
    Top = 505
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 20
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbProvince'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel18: TIWLabel
    Left = 576
    Top = 539
    Width = 49
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Terrane'
  end
  object iwcbTerrane: TIWComboBox
    Left = 710
    Top = 533
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 21
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbTerrane'
    NoSelectionText = '-- No Selection --'
  end
  object iwcbIncludeProvince: TIWCheckBox
    Left = 674
    Top = 508
    Width = 23
    Height = 21
    Caption = ' '
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 22
    Checked = True
    FriendlyName = 'iwcbIncludeProvince'
  end
  object iwcbIncludeTerrane: TIWCheckBox
    Left = 674
    Top = 535
    Width = 23
    Height = 21
    Caption = ' '
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 23
    Checked = True
    FriendlyName = 'iwcbIncludeTerrane'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1103
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
    ExplicitWidth = 1103
    inherited IWFrameRegion: TIWRegion
      Width = 1103
      TabOrder = 13
      ExplicitWidth = 1103
      inherited iwrHeader: TIWRegion
        Width = 1103
        ExplicitWidth = 1103
        inherited iwrWelcome: TIWRegion
          Width = 1103
          ExplicitWidth = 1103
          inherited iwrDisplayUserName: TIWRegion
            Width = 962
            ExplicitWidth = 962
            inherited lblWelcome: TIWLabel
              Left = 641
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1103
          ExplicitWidth = 1103
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
