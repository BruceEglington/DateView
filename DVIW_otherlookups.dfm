object ISFOtherLookups: TISFOtherLookups
  Left = 0
  Top = 0
  Width = 708
  Height = 700
  RenderInvisibleControls = False
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
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 645
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
    ExplicitHeight = 488
  end
  object iwlInterpretations: TIWLink
    Left = 100
    Top = 232
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlInterpretations'
    OnClick = iwlInterpretationsClick
    TabOrder = 16
    RawText = False
    Caption = 'Interpretations'
  end
  object IWLabel1: TIWLabel
    Left = 252
    Top = 232
    Width = 201
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Interpretation IDs and descriptors'
  end
  object iwlMethods: TIWLink
    Left = 100
    Top = 372
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlMethods'
    OnClick = iwlMethodsClick
    TabOrder = 13
    RawText = False
    Caption = 'Methods'
  end
  object IWLabel2: TIWLabel
    Left = 252
    Top = 372
    Width = 166
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Method IDs and descriptors'
  end
  object IWLabel3: TIWLabel
    Left = 100
    Top = 80
    Width = 466
    Height = 19
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 12
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Lookup tables used to ensure data integrity in DateView'
  end
  object iwlAreas: TIWLink
    Left = 100
    Top = 139
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlAreas'
    OnClick = iwlAreasClick
    TabOrder = 14
    RawText = False
    Caption = 'Areas'
  end
  object IWLabel4: TIWLabel
    Left = 252
    Top = 139
    Width = 149
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Area IDs and descriptors'
  end
  object iwlTechniques: TIWLink
    Left = 100
    Top = 533
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlTechniques'
    OnClick = iwlTechniquesClick
    TabOrder = 12
    RawText = False
    Caption = 'Techniques'
  end
  object IWLabel5: TIWLabel
    Left = 252
    Top = 533
    Width = 240
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Analytical technique IDs and descriptors'
  end
  object iwlLithologies: TIWLink
    Left = 100
    Top = 325
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlLithologies'
    OnClick = iwlLithologiesClick
    TabOrder = 17
    RawText = False
    Caption = 'Lithologies'
  end
  object IWLabel6: TIWLabel
    Left = 252
    Top = 325
    Width = 78
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Lithology IDs'
  end
  object iwlMaterials: TIWLink
    Left = 100
    Top = 349
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlMaterials'
    OnClick = iwlMaterialsClick
    TabOrder = 15
    RawText = False
    Caption = 'Materials analysed'
  end
  object IWLabel7: TIWLabel
    Left = 252
    Top = 349
    Width = 281
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'IDs and descriptors for material to be analysed'
  end
  object iwlIsoSystems: TIWLink
    Left = 100
    Top = 256
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlIsoSystems'
    OnClick = iwlIsoSystemsClick
    TabOrder = 4
    RawText = False
    Caption = 'Isotope systems'
  end
  object IWLabel8: TIWLabel
    Left = 252
    Top = 256
    Width = 363
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Isotope system IDs, descriptors and default decay constants'
  end
  object iwlPrefLevels: TIWLink
    Left = 100
    Top = 486
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlPrefLevels'
    OnClick = iwlPrefLevelsClick
    TabOrder = 0
    RawText = False
    Caption = 'Ratings'
  end
  object IWLabel9: TIWLabel
    Left = 252
    Top = 486
    Width = 209
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Rating system IDs and descriptors'
  end
  object iwlLaboratories: TIWLink
    Left = 100
    Top = 279
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlLaboratories'
    OnClick = iwlLaboratoriesClick
    TabOrder = 2
    RawText = False
    Caption = 'Laboratories'
  end
  object IWLabel10: TIWLabel
    Left = 252
    Top = 279
    Width = 185
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Laboratory IDs and descriptors'
  end
  object iwlProvinces: TIWLink
    Left = 100
    Top = 463
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlProvinces'
    OnClick = iwlProvincesClick
    TabOrder = 10
    RawText = False
    Caption = 'Provinces'
  end
  object IWLabel11: TIWLabel
    Left = 252
    Top = 463
    Width = 135
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Structural province IDs'
  end
  object iwlTerranes: TIWLink
    Left = 100
    Top = 509
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlTerranes'
    OnClick = iwlTerranesClick
    TabOrder = 6
    RawText = False
    Caption = 'Terranes'
  end
  object IWLabel12: TIWLabel
    Left = 252
    Top = 509
    Width = 127
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Structural terrane IDs'
  end
  object iwlChemTypes: TIWLink
    Left = 100
    Top = 186
    Width = 137
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlChemTypes'
    OnClick = iwlChemTypesClick
    TabOrder = 8
    RawText = False
    Caption = 'Chemical associations'
  end
  object IWLabel13: TIWLabel
    Left = 252
    Top = 186
    Width = 254
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Chemical association IDs and descriptors'
  end
  object iwlOrogenic: TIWLink
    Left = 100
    Top = 395
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlOrogenic'
    OnClick = iwlOrogenicClick
    TabOrder = 5
    RawText = False
    Caption = 'Orogenic periods'
  end
  object IWLabel14: TIWLabel
    Left = 252
    Top = 395
    Width = 218
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Orogenic period IDs and descriptors'
  end
  object iwlBoundaries: TIWLink
    Left = 100
    Top = 162
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlBoundaries'
    OnClick = iwlBoundariesClick
    TabOrder = 3
    RawText = False
    Caption = 'Boundaries'
  end
  object IWLabel15: TIWLabel
    Left = 252
    Top = 162
    Width = 179
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Boundary IDs and descriptors'
  end
  object iwlApproaches: TIWLink
    Left = 100
    Top = 116
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlApproaches'
    OnClick = iwlApproachesClick
    TabOrder = 1
    RawText = False
    Caption = 'Approaches'
  end
  object IWLabel16: TIWLabel
    Left = 252
    Top = 116
    Width = 238
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Analytical approach IDs and descriptors'
  end
  object iwlClosureTemperatures: TIWLink
    Left = 100
    Top = 209
    Width = 137
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlClosureTemperatures'
    OnClick = iwlClosureTemperaturesClick
    TabOrder = 7
    RawText = False
    Caption = 'Closure temperatures'
  end
  object IWLabel17: TIWLabel
    Left = 252
    Top = 209
    Width = 390
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Closure temperatures for different minerals and isotope systems'
  end
  object iwlPlates: TIWLink
    Left = 100
    Top = 419
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlPlates'
    OnClick = iwlPlatesClick
    TabOrder = 11
    RawText = False
    Caption = 'Plates'
  end
  object IWLabel18: TIWLabel
    Left = 252
    Top = 419
    Width = 293
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Tectonic plates for use in palaeo-reconstructions'
  end
  object iwlPoles: TIWLink
    Left = 100
    Top = 441
    Width = 111
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlPlates'
    OnClick = iwlPolesClick
    TabOrder = 9
    RawText = False
    Caption = 'Poles'
  end
  object IWLabel19: TIWLabel
    Left = 252
    Top = 441
    Width = 271
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Euler poles for use in palaeo-reconstructions'
  end
  object iwlUserGroups: TIWLink
    Left = 100
    Top = 556
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlTechniques'
    OnClick = iwlUserGroupsClick
    TabOrder = 18
    RawText = False
    Caption = 'User groups'
  end
  object IWLabel20: TIWLabel
    Left = 252
    Top = 556
    Width = 193
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'User-defined groups for records'
  end
  object iwlUserWhoFor: TIWLink
    Left = 100
    Top = 579
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlTechniques'
    OnClick = iwlUserWhoForClick
    TabOrder = 19
    RawText = False
    Caption = 'User for'
  end
  object IWLabel21: TIWLabel
    Left = 252
    Top = 579
    Width = 453
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 
      'User-defined publication categories (allows storage of confident' +
      'ial records)'
  end
  object iwlLIPs: TIWLink
    Left = 100
    Top = 302
    Width = 146
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    DoSubmitValidation = False
    FriendlyName = 'iwlLIPs'
    OnClick = iwlLIPsClick
    TabOrder = 20
    RawText = False
    Caption = 'Large Igneous Provinces'
  end
  object IWLabel22: TIWLabel
    Left = 252
    Top = 302
    Width = 184
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Large igneous province events'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 708
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
    ExplicitWidth = 708
    inherited IWFrameRegion: TIWRegion
      Width = 708
      TabOrder = 21
      ExplicitWidth = 708
      inherited iwrHeader: TIWRegion
        Width = 708
        ExplicitWidth = 708
        inherited iwrWelcome: TIWRegion
          Width = 708
          ExplicitWidth = 708
          inherited iwrDisplayUserName: TIWRegion
            Width = 567
            ExplicitWidth = 567
            inherited lblWelcome: TIWLabel
              Left = 246
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 708
          ExplicitWidth = 708
        end
      end
    end
  end
end
