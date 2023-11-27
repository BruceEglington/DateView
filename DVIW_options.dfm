object ISFOptions: TISFOptions
  Left = 0
  Top = 0
  Width = 1142
  Height = 3600
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
  DesignTop = -1542
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 1142
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
    ExplicitWidth = 1142
    inherited IWFrameRegion: TIWRegion
      Width = 1142
      TabOrder = 49
      ExplicitWidth = 1142
      inherited iwrHeader: TIWRegion
        Width = 1142
        ExplicitWidth = 1142
        inherited iwrWelcome: TIWRegion
          Width = 1142
          ExplicitWidth = 1142
          inherited iwrDisplayUserName: TIWRegion
            Width = 1001
            ExplicitWidth = 1001
            inherited lblWelcome: TIWLabel
              Left = 680
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1142
          ExplicitWidth = 1142
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object IWRegion6: TIWRegion
    Left = 0
    Top = 55
    Width = 1142
    Height = 3545
    RenderInvisibleControls = False
    Align = alClient
    object IWRegion7: TIWRegion
      Left = 1
      Top = 1
      Width = 88
      Height = 3543
      RenderInvisibleControls = False
      Align = alLeft
      object rectLeft: TIWRectangle
        Left = 1
        Top = 1
        Width = 86
        Height = 3541
        Align = alClient
        ZIndex = 1
        Font.Color = clWebBLACK
        Font.Size = 10
        Font.Style = []
        BorderOptions.Width = 0
        FriendlyName = 'rectLeft'
        Color = clWebLAVENDER
        Alignment = taLeftJustify
        VAlign = vaMiddle
        ExplicitLeft = 0
        ExplicitTop = 47
        ExplicitWidth = 83
        ExplicitHeight = 1684
      end
    end
    object IWRegion5: TIWRegion
      Left = 89
      Top = 1
      Width = 1052
      Height = 3543
      RenderInvisibleControls = False
      Align = alClient
      object iwrTopButtons: TIWRegion
        Left = 1
        Top = 1
        Width = 1050
        Height = 120
        RenderInvisibleControls = False
        Align = alTop
        object iwbSavePreferences: TIWButton
          Left = 93
          Top = 30
          Width = 125
          Height = 25
          Caption = 'Save Preferences'
          Color = clWebLIGHTGREEN
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'iwbSavePreferences'
          OnClick = iwbSavePreferencesClick
        end
        object iwbCancel: TIWButton
          Left = 320
          Top = 30
          Width = 125
          Height = 25
          Caption = 'Cancel'
          Color = clWebLIGHTSALMON
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'iwbCancel'
          TabOrder = 1
          OnClick = iwbCancelClick
        end
        object IWText1: TIWText
          Left = 565
          Top = 12
          Width = 294
          Height = 85
          BGColor = clNone
          ConvertSpaces = True
          Font.Color = clWebDARKSLATEGRAY
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWText1'
          Lines.Strings = (
            'Define the parameters which will be used to'
            'draw and label graphs and maps produced'
            'by DateView. '
            ''
            'Multiple selections may be made in most list '
            'boxes. ')
          RawText = False
          UseFrame = False
          WantReturns = True
        end
      end
      object iwrInterpretations: TIWRegion
        Left = 1
        Top = 121
        Width = 1050
        Height = 954
        RenderInvisibleControls = False
        Align = alTop
        object IWLabel30: TIWLabel
          Left = 112
          Top = 44
          Width = 161
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Interpretations'
        end
        object IWLabel2: TIWLabel
          Left = 163
          Top = 98
          Width = 172
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel2'
          Caption = 'Interpretation 1 caption'
        end
        object iweInterpretation1: TIWEdit
          Left = 321
          Top = 94
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 2
        end
        object IWLabel5: TIWLabel
          Left = 161
          Top = 126
          Width = 77
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel5'
          Caption = 'Categories'
        end
        object iwlInterpretation1: TIWListbox
          Left = 239
          Top = 122
          Width = 271
          Height = 121
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          RequireSelection = False
          UseSize = False
          TabOrder = 3
          NonEditableAsLabel = True
          FriendlyName = 'iwlInterpretation1'
          Items.Strings = (
            'four=4'
            'one=1'
            'three=3'
            'two=2')
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object IWLabel6: TIWLabel
          Left = 163
          Top = 264
          Width = 172
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel6'
          Caption = 'Interpretation 2 caption'
        end
        object iweInterpretation2: TIWEdit
          Left = 321
          Top = 260
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 4
        end
        object IWLabel7: TIWLabel
          Left = 161
          Top = 292
          Width = 77
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel7'
          Caption = 'Categories'
        end
        object iwlInterpretation2: TIWListbox
          Left = 239
          Top = 288
          Width = 271
          Height = 121
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          RequireSelection = False
          UseSize = False
          TabOrder = 5
          NonEditableAsLabel = True
          FriendlyName = 'iwlInterpretation2'
          Items.Strings = (
            'four=4'
            'one=1'
            'three=3'
            'two=2')
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object IWLabel8: TIWLabel
          Left = 163
          Top = 430
          Width = 172
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel8'
          Caption = 'Interpretation 3 caption'
        end
        object iweInterpretation3: TIWEdit
          Left = 321
          Top = 426
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 6
        end
        object IWLabel9: TIWLabel
          Left = 161
          Top = 458
          Width = 77
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel9'
          Caption = 'Categories'
        end
        object iwlInterpretation3: TIWListbox
          Left = 239
          Top = 454
          Width = 271
          Height = 121
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          RequireSelection = False
          UseSize = False
          TabOrder = 7
          NonEditableAsLabel = True
          FriendlyName = 'iwlInterpretation3'
          Items.Strings = (
            'four=4'
            'one=1'
            'three=3'
            'two=2')
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object IWLabel10: TIWLabel
          Left = 163
          Top = 598
          Width = 172
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel10'
          Caption = 'Interpretation 4 caption'
        end
        object iweInterpretation4: TIWEdit
          Left = 321
          Top = 594
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 8
        end
        object IWLabel11: TIWLabel
          Left = 161
          Top = 626
          Width = 77
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Categories'
        end
        object iwlInterpretation4: TIWListbox
          Left = 239
          Top = 622
          Width = 271
          Height = 121
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          RequireSelection = False
          UseSize = False
          TabOrder = 9
          NonEditableAsLabel = True
          FriendlyName = 'iwlInterpretation4'
          Items.Strings = (
            'four=4'
            'one=1'
            'three=3'
            'two=2')
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object IWLabel12: TIWLabel
          Left = 163
          Top = 768
          Width = 172
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel12'
          Caption = 'Interpretation 5 caption'
        end
        object IWLabel13: TIWLabel
          Left = 161
          Top = 796
          Width = 77
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel13'
          Caption = 'Categories'
        end
        object iweInterpretation5: TIWEdit
          Left = 321
          Top = 764
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 10
        end
        object iwlInterpretation5: TIWListbox
          Left = 239
          Top = 792
          Width = 271
          Height = 121
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          RequireSelection = False
          UseSize = False
          TabOrder = 11
          NonEditableAsLabel = True
          FriendlyName = 'iwlInterpretation5'
          Items.Strings = (
            'four=4'
            'one=1'
            'three=3'
            'two=2')
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object lblInterpretation5Values: TIWLabel
          Left = 563
          Top = 814
          Width = 217
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'At least one item must be selected'
        end
        object lblInterpretation5Caption: TIWLabel
          Left = 563
          Top = 766
          Width = 240
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Interpretation 5 caption needs a value'
        end
        object lblInterpretation4Values: TIWLabel
          Left = 563
          Top = 638
          Width = 217
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'At least one item must be selected'
        end
        object lblInterpretation4Caption: TIWLabel
          Left = 563
          Top = 596
          Width = 240
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Interpretation 4 caption needs a value'
        end
        object lblInterpretation3Values: TIWLabel
          Left = 563
          Top = 468
          Width = 217
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'At least one item must be selected'
        end
        object lblInterpretation3Caption: TIWLabel
          Left = 563
          Top = 428
          Width = 240
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Interpretation 3 caption needs a value'
        end
        object lblInterpretation2Values: TIWLabel
          Left = 563
          Top = 302
          Width = 217
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'At least one item must be selected'
        end
        object lblInterpretation2Caption: TIWLabel
          Left = 563
          Top = 264
          Width = 240
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Interpretation 2 caption needs a value'
        end
        object lblInterpretation1Values: TIWLabel
          Left = 563
          Top = 148
          Width = 217
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'At least one item must be selected'
        end
        object lblInterpretation1Caption: TIWLabel
          Left = 563
          Top = 108
          Width = 240
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Interpretation 1 caption needs a value'
        end
      end
      object iwrAgeBands: TIWRegion
        Left = 1
        Top = 1075
        Width = 1050
        Height = 559
        RenderInvisibleControls = False
        Align = alTop
        object IWLabel15: TIWLabel
          Left = 159
          Top = 114
          Width = 114
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel15'
          Caption = 'Minimum date ='
        end
        object lblDateBand1Caption: TIWLabel
          Left = 561
          Top = 80
          Width = 220
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Date Band 1 caption needs a value'
        end
        object lblDate1Values: TIWLabel
          Left = 561
          Top = 114
          Width = 196
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify numeric values'
        end
        object lblDateBand2Caption: TIWLabel
          Left = 561
          Top = 172
          Width = 220
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Date Band 2 caption needs a value'
        end
        object lblDate2Values: TIWLabel
          Left = 561
          Top = 202
          Width = 196
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify numeric values'
        end
        object lblDateBand3Caption: TIWLabel
          Left = 561
          Top = 260
          Width = 220
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Date Band 3 caption needs a value'
        end
        object lblDate3Values: TIWLabel
          Left = 561
          Top = 290
          Width = 196
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify numeric values'
        end
        object lblDateBand4Caption: TIWLabel
          Left = 561
          Top = 348
          Width = 220
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Date Band 4 caption needs a value'
        end
        object lblDate4Values: TIWLabel
          Left = 561
          Top = 380
          Width = 196
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify numeric values'
        end
        object lblDateBand5Caption: TIWLabel
          Left = 561
          Top = 442
          Width = 220
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Date Band 5 caption needs a value'
        end
        object lblDate5Values: TIWLabel
          Left = 561
          Top = 476
          Width = 196
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify numeric values'
        end
        object iweDateBand5Maximum: TIWEdit
          Left = 475
          Top = 468
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 26
        end
        object IWLabel27: TIWLabel
          Left = 357
          Top = 476
          Width = 118
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel27'
          Caption = 'Maximum date ='
        end
        object iweDateBand5Minimum: TIWEdit
          Left = 271
          Top = 468
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 25
        end
        object IWLabel26: TIWLabel
          Left = 159
          Top = 476
          Width = 114
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel26'
          Caption = 'Minimum date ='
        end
        object iweDateBand5: TIWEdit
          Left = 319
          Top = 438
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 24
        end
        object IWLabel25: TIWLabel
          Left = 161
          Top = 442
          Width = 143
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel25'
          Caption = 'Date Band 5 caption'
        end
        object iweDateBand4Maximum: TIWEdit
          Left = 475
          Top = 376
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 23
        end
        object IWLabel24: TIWLabel
          Left = 357
          Top = 380
          Width = 118
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel24'
          Caption = 'Maximum date ='
        end
        object iweDateBand4Minimum: TIWEdit
          Left = 268
          Top = 376
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 22
        end
        object IWLabel23: TIWLabel
          Left = 159
          Top = 380
          Width = 114
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel23'
          Caption = 'Minimum date ='
        end
        object iweDateBand4: TIWEdit
          Left = 319
          Top = 346
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 21
        end
        object IWLabel4: TIWLabel
          Left = 161
          Top = 350
          Width = 143
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel4'
          Caption = 'Date Band 4 caption'
        end
        object iweDateBand3Maximum: TIWEdit
          Left = 481
          Top = 283
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 20
        end
        object IWLabel22: TIWLabel
          Left = 357
          Top = 290
          Width = 118
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel22'
          Caption = 'Maximum date ='
        end
        object iweDateBand3Minimum: TIWEdit
          Left = 268
          Top = 286
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 19
        end
        object IWLabel21: TIWLabel
          Left = 159
          Top = 290
          Width = 114
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel21'
          Caption = 'Minimum date ='
        end
        object iweDateBand3: TIWEdit
          Left = 319
          Top = 256
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 18
        end
        object IWLabel20: TIWLabel
          Left = 161
          Top = 260
          Width = 143
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel20'
          Caption = 'Date Band 3 caption'
        end
        object iweDateBand2Maximum: TIWEdit
          Left = 475
          Top = 198
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 17
        end
        object IWLabel19: TIWLabel
          Left = 357
          Top = 202
          Width = 118
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel19'
          Caption = 'Maximum date ='
        end
        object iweDateBand2Minimum: TIWEdit
          Left = 271
          Top = 198
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 16
        end
        object IWLabel18: TIWLabel
          Left = 159
          Top = 202
          Width = 114
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel18'
          Caption = 'Minimum date ='
        end
        object iweDateBand2: TIWEdit
          Left = 319
          Top = 168
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 15
        end
        object IWLabel17: TIWLabel
          Left = 161
          Top = 172
          Width = 143
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel17'
          Caption = 'Date Band 2 caption'
        end
        object iweDateBand1Maximum: TIWEdit
          Left = 475
          Top = 110
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 14
        end
        object IWLabel16: TIWLabel
          Left = 357
          Top = 114
          Width = 118
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel16'
          Caption = 'Maximum date ='
        end
        object iweDateBand1Minimum: TIWEdit
          Left = 271
          Top = 110
          Width = 61
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 13
        end
        object iweDateBand1: TIWEdit
          Left = 319
          Top = 80
          Width = 189
          Height = 21
          StyleRenderOptions.RenderBorder = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 12
        end
        object IWLabel14: TIWLabel
          Left = 161
          Top = 84
          Width = 143
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel14'
          Caption = 'Date Band 1 caption'
        end
        object IWLabel29: TIWLabel
          Left = 112
          Top = 32
          Width = 122
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Age Bands'
        end
        object iwbSaveAgeBands: TIWButton
          Left = 517
          Top = 24
          Width = 156
          Height = 25
          Caption = 'SaveAgeBands'
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'iwbSaveAgeBands'
          TabOrder = 50
          OnClick = iwbSaveAgeBandsClick
        end
      end
      object iwrGraphOptions: TIWRegion
        Left = 1
        Top = 1634
        Width = 1050
        Height = 336
        RenderInvisibleControls = False
        Align = alTop
        object IWLabel31: TIWLabel
          Left = 110
          Top = 24
          Width = 161
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Graph Options'
        end
        object IWLabel1: TIWLabel
          Left = 159
          Top = 115
          Width = 64
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel1'
          Caption = 'Group by'
        end
        object IWLabel28: TIWLabel
          Left = 159
          Top = 163
          Width = 234
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel28'
          Caption = 'Minimum uncertainty for dates ='
        end
        object iwrgShowAllSampleLocalities: TIWRadioGroup
          Left = 161
          Top = 213
          Width = 293
          Height = 43
          SubmitOnAsyncEvent = True
          RawText = False
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          FriendlyName = 'iwrgShowAllSampleLocalities'
          ItemIndex = 1
          Items.Strings = (
            'Show all sample localities on maps'
            'Show only first included locality on maps')
          Layout = glVertical
          TabOrder = -1
        end
        object iwrgPDFType: TIWRadioGroup
          Left = 159
          Top = 277
          Width = 151
          Height = 43
          SubmitOnAsyncEvent = True
          RawText = False
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          FriendlyName = 'iwrgShowAllSampleLocalities'
          ItemIndex = 1
          Items.Strings = (
            'pdf '#39'And'#39'  (default)'
            'pdf '#39'Or'#39' ')
          Layout = glVertical
          TabOrder = -1
        end
        object iweMinimumUncertaintyForDates: TIWEdit
          Left = 377
          Top = 155
          Width = 49
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 28
        end
        object IWLabel3: TIWLabel
          Left = 432
          Top = 163
          Width = 81
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel28'
          Caption = '(95% conf)'
        end
        object lblGroupBy: TIWLabel
          Left = 553
          Top = 115
          Width = 172
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Group by must be specified'
        end
        object lblMinimumUncertainty: TIWLabel
          Left = 553
          Top = 163
          Width = 202
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'Need to specify a numeric value'
        end
        object lblShowAll: TIWLabel
          Left = 553
          Top = 219
          Width = 191
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'One of these must be selected'
        end
        object lblPDFType: TIWLabel
          Left = 553
          Top = 275
          Width = 191
          Height = 13
          Font.Color = clWebRED
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblInterpretation1Caption'
          Caption = 'One of these must be selected'
        end
        object iwcbGroupBy: TIWComboBox
          Left = 237
          Top = 115
          Width = 223
          Height = 21
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          UseSize = False
          NonEditableAsLabel = True
          TabOrder = 27
          ItemIndex = -1
          Items.Strings = (
            'Boundary'
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
      end
      object iwrBottomButtons: TIWRegion
        Left = 1
        Top = 3433
        Width = 1050
        Height = 64
        RenderInvisibleControls = False
        Align = alTop
        object iwbSubmitQuery2: TIWButton
          Left = 199
          Top = 23
          Width = 125
          Height = 25
          Caption = 'Save Preferences'
          Color = clWebLIGHTGREEN
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'iwbSubmitQuery2'
          TabOrder = 47
          OnClick = iwbSavePreferencesClick
        end
        object IWButton1: TIWButton
          Left = 449
          Top = 23
          Width = 125
          Height = 25
          Caption = 'Cancel'
          Color = clWebLIGHTSALMON
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'iwbCancel'
          TabOrder = 48
          OnClick = iwbCancelClick
        end
      end
      object iwrRatios: TIWRegion
        Left = 1
        Top = 1970
        Width = 1050
        Height = 902
        RenderInvisibleControls = False
        Align = alTop
        object IWLabel32: TIWLabel
          Left = 110
          Top = 24
          Width = 70
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Ratios'
        end
        object iwDBgRatioOptionTypes: TIWDBGrid
          Left = 163
          Top = 96
          Width = 470
          Height = 150
          BorderColors.Color = clNone
          BorderColors.Light = clNone
          BorderColors.Dark = clNone
          BGColor = clNone
          BorderSize = 1
          BorderStyle = tfDefault
          CellPadding = 0
          CellSpacing = 0
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FrameBuffer = 40
          Lines = tlAll
          UseFrame = True
          UseSize = True
          ScrollToCurrentRow = False
          Columns = <
            item
              Alignment = taCenter
              BGColor = clNone
              DoSubmitValidation = True
              Font.Color = clNone
              Font.FontName = 'Verdana'
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
              DataField = 'OPTIONTYPEID'
              LinkField = 'OPTIONTYPEID'
              OnClick = iwDBgRatioOptionTypesColumns0Click
              OnTitleClick = iwDBgRatioOptionTypesColumns0TitleClick
              Title.Alignment = taCenter
              Title.BGColor = clNone
              Title.DoSubmitValidation = True
              Title.Font.Color = clNone
              Title.Font.FontName = 'Verdana'
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
              Font.FontName = 'Verdana'
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
              DataField = 'OPTIONTYPE'
              LinkField = 'OPTIONTYPEID'
              OnClick = iwDBgRatioOptionTypesColumns0Click
              OnTitleClick = iwDBgRatioOptionTypesColumns0TitleClick
              Title.Alignment = taCenter
              Title.BGColor = clNone
              Title.DoSubmitValidation = True
              Title.Font.Color = clNone
              Title.Font.FontName = 'Verdana'
              Title.Font.Size = 8
              Title.Font.Style = [fsBold]
              Title.Header = False
              Title.Height = '0'
              Title.ShowHint = True
              Title.Text = 'Option Type'
              Title.VAlign = vaMiddle
              Title.Visible = True
              Title.Width = '0'
              Title.Wrap = False
              Title.RawText = True
            end>
          DataSource = dmOpt.dsOptionTypes
          FooterRowCount = 0
          FriendlyName = 'iwDBgRatioOptionTypes'
          FromStart = True
          HighlightColor = clNone
          HighlightRows = False
          Options = [dgShowTitles]
          RefreshMode = rmAutomatic
          RowLimit = 0
          RollOver = True
          RowClick = False
          RollOverColor = clWebLIGHTGOLDENRODYELLOW
          RowHeaderColor = clWebLIGHTSTEELBLUE
          RowAlternateColor = clNone
          RowCurrentColor = clWebYELLOW
        end
        object iwdbnOptionTypes: TIWDBNavigator
          Left = 163
          Top = 62
          Width = 120
          Height = 28
          Confirmations.Delete = 'Are you sure you want to delete this record?'
          Confirmations.Post = 'Are you sure you want to update this record?'
          Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
          DataSource = dmOpt.dsOptionTypes
          FriendlyName = 'iwdbnOptionTypes'
          ImageHeight = 24
          ImageWidth = 24
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Orientation = orHorizontal
          OnNext = iwdbnOptionTypesNext
        end
        object IWLabel33: TIWLabel
          Left = 161
          Top = 356
          Width = 146
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel14'
          Caption = 'Ratio Band 1 caption'
        end
        object IWLabel34: TIWLabel
          Left = 159
          Top = 386
          Width = 78
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel15'
          Caption = 'Minimum ='
        end
        object IWLabel35: TIWLabel
          Left = 161
          Top = 444
          Width = 146
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel17'
          Caption = 'Ratio Band 2 caption'
        end
        object IWLabel36: TIWLabel
          Left = 159
          Top = 474
          Width = 78
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel18'
          Caption = 'Minimum ='
        end
        object IWLabel37: TIWLabel
          Left = 161
          Top = 532
          Width = 146
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel20'
          Caption = 'Ratio Band 3 caption'
        end
        object IWLabel38: TIWLabel
          Left = 159
          Top = 562
          Width = 78
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel21'
          Caption = 'Minimum ='
        end
        object IWLabel39: TIWLabel
          Left = 161
          Top = 622
          Width = 146
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel4'
          Caption = 'Ratio Band 4 caption'
        end
        object IWLabel40: TIWLabel
          Left = 159
          Top = 652
          Width = 78
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel23'
          Caption = 'Minimum ='
        end
        object IWLabel41: TIWLabel
          Left = 161
          Top = 714
          Width = 146
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel25'
          Caption = 'Ratio Band 5 caption'
        end
        object IWLabel42: TIWLabel
          Left = 159
          Top = 748
          Width = 78
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel26'
          Caption = 'Minimum ='
        end
        object IWLabel43: TIWLabel
          Left = 357
          Top = 748
          Width = 82
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel27'
          Caption = 'Maximum ='
        end
        object IWLabel44: TIWLabel
          Left = 357
          Top = 652
          Width = 82
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel24'
          Caption = 'Maximum ='
        end
        object IWLabel45: TIWLabel
          Left = 357
          Top = 562
          Width = 82
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel22'
          Caption = 'Maximum ='
        end
        object IWLabel46: TIWLabel
          Left = 357
          Top = 474
          Width = 82
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel19'
          Caption = 'Maximum ='
        end
        object IWLabel47: TIWLabel
          Left = 357
          Top = 386
          Width = 86
          Height = 13
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel16'
          Caption = 'Maximum  ='
        end
        object IWDBEdit1: TIWDBEdit
          Left = 313
          Top = 352
          Width = 248
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 30
          AutoEditable = True
          DataField = 'OPTIONTITLE'
          DataSource = dmOpt.dsOptRCap1
          PasswordPrompt = False
        end
        object IWDBEdit2: TIWDBEdit
          Left = 313
          Top = 440
          Width = 248
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 33
          AutoEditable = True
          DataField = 'OPTIONTITLE'
          DataSource = dmOpt.dsOptRCap2
          PasswordPrompt = False
        end
        object IWDBEdit3: TIWDBEdit
          Left = 313
          Top = 528
          Width = 248
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 36
          AutoEditable = True
          DataField = 'OPTIONTITLE'
          DataSource = dmOpt.dsOptRCap3
          PasswordPrompt = False
        end
        object IWDBEdit4: TIWDBEdit
          Left = 313
          Top = 620
          Width = 248
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 39
          AutoEditable = True
          DataField = 'OPTIONTITLE'
          DataSource = dmOpt.dsOptRCap4
          PasswordPrompt = False
        end
        object IWDBEdit5: TIWDBEdit
          Left = 313
          Top = 712
          Width = 248
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 42
          AutoEditable = True
          DataField = 'OPTIONTITLE'
          DataSource = dmOpt.dsOptRCap5
          PasswordPrompt = False
        end
        object IWDBEdit6: TIWDBEdit
          Left = 243
          Top = 382
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 31
          AutoEditable = True
          DataField = 'VALUEMIN'
          DataSource = dmOpt.dsOptRVal1
          PasswordPrompt = False
        end
        object IWDBEdit7: TIWDBEdit
          Left = 449
          Top = 382
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 32
          AutoEditable = True
          DataField = 'VALUEMAX'
          DataSource = dmOpt.dsOptRVal1
          PasswordPrompt = False
        end
        object IWDBEdit8: TIWDBEdit
          Left = 243
          Top = 470
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 34
          AutoEditable = True
          DataField = 'VALUEMIN'
          DataSource = dmOpt.dsOptRVal2
          PasswordPrompt = False
        end
        object IWDBEdit9: TIWDBEdit
          Left = 449
          Top = 470
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 35
          AutoEditable = True
          DataField = 'VALUEMAX'
          DataSource = dmOpt.dsOptRVal2
          PasswordPrompt = False
        end
        object IWDBEdit10: TIWDBEdit
          Left = 243
          Top = 555
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 37
          AutoEditable = True
          DataField = 'VALUEMIN'
          DataSource = dmOpt.dsOptRVal3
          PasswordPrompt = False
        end
        object IWDBEdit11: TIWDBEdit
          Left = 449
          Top = 558
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 38
          AutoEditable = True
          DataField = 'VALUEMAX'
          DataSource = dmOpt.dsOptRVal3
          PasswordPrompt = False
        end
        object IWDBEdit12: TIWDBEdit
          Left = 243
          Top = 647
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 40
          AutoEditable = True
          DataField = 'VALUEMIN'
          DataSource = dmOpt.dsOptRVal4
          PasswordPrompt = False
        end
        object IWDBEdit13: TIWDBEdit
          Left = 449
          Top = 647
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 41
          AutoEditable = True
          DataField = 'VALUEMAX'
          DataSource = dmOpt.dsOptRVal4
          PasswordPrompt = False
        end
        object IWDBEdit14: TIWDBEdit
          Left = 243
          Top = 739
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 43
          AutoEditable = True
          DataField = 'VALUEMIN'
          DataSource = dmOpt.dsOptRVal5
          PasswordPrompt = False
        end
        object IWDBEdit15: TIWDBEdit
          Left = 449
          Top = 739
          Width = 89
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 44
          AutoEditable = True
          DataField = 'VALUEMAX'
          DataSource = dmOpt.dsOptRVal5
          PasswordPrompt = False
        end
        object iwbRatiosEdit: TIWButton
          Left = 182
          Top = 296
          Width = 101
          Height = 25
          Caption = 'Edit'
          Color = clWebLEMONCHIFFON
          Font.Color = clNone
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iwbRatiosEdit'
          TabOrder = 29
          OnClick = iwbRatiosEditClick
        end
        object iwbRatiosApplyUpdates: TIWButton
          Left = 313
          Top = 296
          Width = 101
          Height = 25
          Caption = 'Save changes'
          Color = clWebPEACHPUFF
          Font.Color = clNone
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iwbRatiosApplyUpdates'
          TabOrder = 45
          OnClick = iwbRatiosApplyUpdatesClick
        end
        object iwbRatiosCancelChanges: TIWButton
          Left = 443
          Top = 296
          Width = 101
          Height = 25
          Caption = 'Cancel changes'
          Color = clWebLIGHTSTEELBLUE
          Font.Color = clNone
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iwbRatiosCancelChanges'
          TabOrder = 46
          OnClick = iwbRatiosCancelChangesClick
        end
      end
      object iwrMaximumDownloadRecords: TIWRegion
        Left = 1
        Top = 2872
        Width = 1050
        Height = 321
        RenderInvisibleControls = False
        Align = alTop
        object IWLabel48: TIWLabel
          Left = 110
          Top = 24
          Width = 322
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Maximum Download Records'
        end
        object iwdbgMaxOutputLimits: TIWDBGrid
          Left = 51
          Top = 64
          Width = 808
          Height = 217
          BorderColors.Color = clNone
          BorderColors.Light = clNone
          BorderColors.Dark = clNone
          BGColor = clNone
          BorderSize = 1
          BorderStyle = tfDefault
          CellPadding = 0
          CellSpacing = 0
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FrameBuffer = 40
          Lines = tlAll
          UseFrame = True
          UseSize = True
          ScrollToCurrentRow = False
          Columns = <
            item
              Alignment = taCenter
              BGColor = clNone
              DoSubmitValidation = True
              Font.Color = clNone
              Font.FontName = 'Verdana'
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
              DataField = 'DOWNLOADTYPEID'
              Title.Alignment = taCenter
              Title.BGColor = clNone
              Title.DoSubmitValidation = True
              Title.Font.Color = clNone
              Title.Font.FontName = 'Verdana'
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
              Font.FontName = 'Verdana'
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
              DataField = 'DOWNLOADTYPE'
              Title.Alignment = taCenter
              Title.BGColor = clNone
              Title.DoSubmitValidation = True
              Title.Font.Color = clNone
              Title.Font.FontName = 'Verdana'
              Title.Font.Size = 8
              Title.Font.Style = [fsBold]
              Title.Header = False
              Title.Height = '0'
              Title.ShowHint = True
              Title.Text = 'Download Type'
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
              Font.FontName = 'Verdana'
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
              DataField = 'MAXALLOWED'
              Title.Alignment = taCenter
              Title.BGColor = clNone
              Title.DoSubmitValidation = True
              Title.Font.Color = clNone
              Title.Font.FontName = 'Verdana'
              Title.Font.Size = 8
              Title.Font.Style = [fsBold]
              Title.Header = False
              Title.Height = '0'
              Title.ShowHint = True
              Title.Text = 'Max. Allowed'
              Title.VAlign = vaMiddle
              Title.Visible = True
              Title.Width = '0'
              Title.Wrap = False
              Title.RawText = True
            end>
          DataSource = dmUser.dsUserMaximumOutputLimits
          FooterRowCount = 0
          FriendlyName = 'iwdbgMaxOutputLimits'
          FromStart = True
          HighlightColor = clNone
          HighlightRows = False
          Options = [dgShowTitles]
          RefreshMode = rmAutomatic
          RowLimit = 20
          RollOver = True
          RowClick = False
          RollOverColor = clWebPALEGOLDENROD
          RowHeaderColor = clWebLIGHTSTEELBLUE
          RowAlternateColor = clNone
          RowCurrentColor = clNone
        end
      end
      object iwrDownloadFileFormat: TIWRegion
        Left = 1
        Top = 3193
        Width = 1050
        Height = 240
        RenderInvisibleControls = True
        Align = alTop
        object iwrgDownloadFileFormat: TIWRadioGroup
          Left = 57
          Top = 54
          Width = 161
          Height = 161
          SubmitOnAsyncEvent = True
          RawText = False
          Editable = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'iwrgDownloadFileFormat'
          ItemIndex = 0
          Layout = glVertical
          TabOrder = -1
        end
        object IWLabel49: TIWLabel
          Left = 110
          Top = 24
          Width = 226
          Height = 24
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'IWLabel29'
          Caption = 'Download file format'
        end
        object cbPDF: TIWRadioButton
          Left = 77
          Top = 179
          Width = 121
          Height = 21
          Cursor = crPointer
          Caption = 'PDF'
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          RawText = False
          Group = 'DownloadFormat'
          Value = 'IWRadioButton1'
          FriendlyName = 'cbPDF'
          SubmitOnAsyncEvent = True
        end
        object cbHTML: TIWRadioButton
          Left = 77
          Top = 152
          Width = 121
          Height = 21
          Cursor = crPointer
          Caption = 'HTML'
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          RawText = False
          Group = 'DownloadFormat'
          Value = 'IWRadioButton1'
          FriendlyName = 'cbHTML'
          SubmitOnAsyncEvent = True
        end
        object cbXls: TIWRadioButton
          Left = 77
          Top = 71
          Width = 121
          Height = 21
          Cursor = crPointer
          Caption = 'XLS'
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          RawText = False
          Checked = True
          Group = 'DownloadFormat'
          Value = 'Xls'
          FriendlyName = 'cbXls'
          SubmitOnAsyncEvent = True
        end
        object cbCSV: TIWRadioButton
          Left = 77
          Top = 125
          Width = 121
          Height = 21
          Cursor = crPointer
          Caption = 'CSV'
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          RawText = False
          Group = 'DownloadFormat'
          Value = 'IWRadioButton1'
          FriendlyName = 'cbCSV'
          SubmitOnAsyncEvent = True
        end
        object cbXlsx: TIWRadioButton
          Left = 77
          Top = 98
          Width = 121
          Height = 21
          Cursor = crPointer
          Caption = 'XLSX'
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          RawText = False
          Group = 'DownloadFormat'
          Value = 'IWRadioButton1'
          FriendlyName = 'cbXlsx'
          SubmitOnAsyncEvent = True
        end
      end
    end
  end
end
