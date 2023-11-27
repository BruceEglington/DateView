object ISFDefineRawDataSampleQuery: TISFDefineRawDataSampleQuery
  Left = 0
  Top = 0
  Width = 1483
  Height = 2100
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
      TabOrder = 27
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
    Width = 82
    Height = 2045
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    Color = clWebLAVENDER
  end
  object iwrRightChannel: TIWRegion
    Left = 82
    Top = 55
    Width = 1401
    Height = 2045
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    ShowHint = False
    ClipRegion = False
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 1401
      Height = 49
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbSubmit: TIWButton
        Left = 22
        Top = 18
        Width = 293
        Height = 25
        Caption = 'Submit'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmit'
        TabOrder = 22
        OnClick = iwbSubmitClick
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
        TabOrder = 23
        OnClick = iwbCancelClick
      end
    end
    object iwrBottomButtons: TIWRegion
      Left = 0
      Top = 1569
      Width = 1401
      Height = 65
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton1: TIWButton
        Left = 22
        Top = 18
        Width = 293
        Height = 25
        Caption = 'Submit'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmit'
        TabOrder = 25
        OnClick = iwbSubmitClick
      end
      object IWButton2: TIWButton
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
        TabOrder = 26
        OnClick = iwbCancelClick
      end
    end
    object iwrDateRange: TIWRegion
      Left = 0
      Top = 49
      Width = 1401
      Height = 48
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbFromDate: TIWCheckBox
        Left = 21
        Top = 14
        Width = 207
        Height = 21
        Caption = 'Include from Date (minimum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        Checked = False
        FriendlyName = 'iwcbFromDate'
      end
      object iweFromDate: TIWEdit
        Left = 234
        Top = 14
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 1
      end
      object iwcbToDate: TIWCheckBox
        Left = 362
        Top = 14
        Width = 159
        Height = 21
        Caption = 'to Date (maximum)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 2
        Checked = False
        FriendlyName = 'iwcbToDate'
      end
      object iweToDate: TIWEdit
        Left = 519
        Top = 14
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 3
      end
    end
    object iwrCoordinates: TIWRegion
      Left = 0
      Top = 385
      Width = 1401
      Height = 90
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlNegativeWS: TIWLabel
        Left = 584
        Top = 46
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
        Top = 27
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
        Left = 442
        Top = 19
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweNELon'
        SubmitOnAsyncEvent = True
        TabOrder = 12
      end
      object iweSWLon: TIWEdit
        Left = 442
        Top = 46
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweSWLon'
        SubmitOnAsyncEvent = True
        TabOrder = 13
      end
      object iwlSWLon: TIWLabel
        Left = 356
        Top = 49
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
        Top = 22
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
        Left = 196
        Top = 19
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweNELat'
        SubmitOnAsyncEvent = True
        TabOrder = 10
      end
      object iweSWLat: TIWEdit
        Left = 198
        Top = 46
        Width = 73
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweSWLat'
        SubmitOnAsyncEvent = True
        TabOrder = 11
      end
      object iwlSWLat: TIWLabel
        Left = 40
        Top = 49
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
        Top = 22
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
        Top = -3
        Width = 211
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
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbCoordinates'
      end
    end
    object iwrReferenceRange: TIWRegion
      Left = 0
      Top = 97
      Width = 1401
      Height = 88
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWLabel5: TIWLabel
        Left = 22
        Top = 23
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
        Top = 23
        Width = 179
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 4
      end
      object IWLabel6: TIWLabel
        Left = 22
        Top = 50
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
        Top = 50
        Width = 179
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 5
      end
      object lblFromErrorRefs: TIWLabel
        Left = 273
        Top = 24
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
        Top = 53
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
      object iwbRefreshReferences: TIWButton
        Left = 442
        Top = 46
        Width = 200
        Height = 25
        Caption = 'Refresh Reference List'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbRefreshReferences'
        TabOrder = 6
        OnClick = iwbRefreshReferencesClick
      end
      object IWLabel1: TIWLabel
        Left = 22
        Top = 2
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
    object iwrReferences: TIWRegion
      Left = 0
      Top = 185
      Width = 1401
      Height = 200
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
        TabOrder = 8
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
        TabOrder = 7
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
    end
    object iwrSampleInfo: TIWRegion
      Left = 0
      Top = 874
      Width = 1401
      Height = 389
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwrSampleRange: TIWRegion
        Left = 0
        Top = 0
        Width = 1401
        Height = 92
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        OnCreate = iwrSampleRangeCreate
        object IWLabel2: TIWLabel
          Left = 22
          Top = 4
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
          Top = 30
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
          Top = 57
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
          Top = 54
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweSampleTo'
          SubmitOnAsyncEvent = True
          TabOrder = 20
        end
        object iweSampleFrom: TIWEdit
          Left = 62
          Top = 27
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweSampleFrom'
          SubmitOnAsyncEvent = True
          TabOrder = 19
        end
        object lblFromErrorSamples: TIWLabel
          Left = 273
          Top = 28
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
          Top = 57
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
        object iwbSamplesWithDataRefresh: TIWButton
          Left = 442
          Top = 54
          Width = 200
          Height = 25
          Caption = 'Refresh Sample List'
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'iwbSamplesWithDataRefresh'
          TabOrder = 28
          OnClick = iwbSamplesWithDataRefreshClick
        end
      end
      object iwrSampleList: TIWRegion
        Left = 0
        Top = 92
        Width = 1401
        Height = 284
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwcbSamples: TIWCheckBox
          Left = 22
          Top = 1
          Width = 392
          Height = 21
          Caption = 'Sample(s)'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 21
          Checked = True
          FriendlyName = 'iwcbSamples'
        end
        object iwlSamples: TIWListbox
          Left = 65
          Top = 30
          Width = 349
          Height = 240
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          RequireSelection = False
          TabOrder = 24
          FriendlyName = 'iwlSamples'
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object iwmChooseSamplesExplanation: TIWMemo
          Left = 442
          Top = 30
          Width = 280
          Height = 81
          ShowHint = False
          StyleRenderOptions.RenderBorder = False
          BGColor = clNone
          Editable = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          InvisibleBorder = True
          HorizScrollBar = False
          VertScrollBar = False
          Required = False
          TabOrder = 29
          SubmitOnAsyncEvent = True
          FriendlyName = 'iwmChooseSamplesExplanation'
          Lines.Strings = (
            
              'Select specific samples if you want some of those listed. To get' +
              ' all samples in the range specified, uncheck the Sample(s) check' +
              'box')
        end
        object lblNoSamplesSelected: TIWLabel
          Left = 440
          Top = 155
          Width = 141
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblNoSamplesSelected'
          Caption = 'lblNoSamplesSelected'
        end
        object iwmQueryType: TIWMemo
          Left = 442
          Top = 190
          Width = 280
          Height = 81
          ShowHint = False
          StyleRenderOptions.RenderBorder = False
          BGColor = clNone
          Editable = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = [fsBold]
          InvisibleBorder = True
          HorizScrollBar = False
          VertScrollBar = False
          Required = False
          TabOrder = 30
          SubmitOnAsyncEvent = True
          FriendlyName = 'iwmQueryType'
          Lines.Strings = (
            ' ')
        end
      end
    end
    object iwrDomainInfo: TIWRegion
      Left = 0
      Top = 475
      Width = 1401
      Height = 399
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwrDomainRange: TIWRegion
        Left = 0
        Top = 0
        Width = 1401
        Height = 92
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        OnCreate = iwrSampleRangeCreate
        object IWLabel7: TIWLabel
          Left = 22
          Top = 4
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
          Top = 30
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
          Top = 57
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
          Top = 54
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweDomainTo'
          SubmitOnAsyncEvent = True
          TabOrder = 15
        end
        object iweDomainFrom: TIWEdit
          Left = 62
          Top = 27
          Width = 179
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          FriendlyName = 'iweDomainFrom'
          SubmitOnAsyncEvent = True
          TabOrder = 14
        end
        object lblFromErrorDomains: TIWLabel
          Left = 273
          Top = 28
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
          Top = 57
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
        object iwbDomainsRefresh: TIWButton
          Left = 442
          Top = 54
          Width = 200
          Height = 25
          Caption = 'Refresh Domain List'
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'iwbDomainsRefresh'
          TabOrder = 16
          OnClick = iwbDomainsRefreshClick
        end
      end
      object iwrDomains: TIWRegion
        Left = 0
        Top = 92
        Width = 1401
        Height = 284
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwcbDomains: TIWCheckBox
          Left = 22
          Top = 1
          Width = 392
          Height = 21
          Caption = 'Domain(s)'
          Editable = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          SubmitOnAsyncEvent = True
          Style = stNormal
          TabOrder = 17
          Checked = False
          FriendlyName = 'iwcbDomains'
        end
        object iwlDomains: TIWListbox
          Left = 65
          Top = 30
          Width = 349
          Height = 240
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          RequireSelection = False
          TabOrder = 18
          FriendlyName = 'iwlDomains'
          Sorted = True
          MultiSelect = True
          NoSelectionText = '-- No Selection --'
        end
        object iwmChooseDomainsExplanation: TIWMemo
          Left = 442
          Top = 30
          Width = 280
          Height = 81
          ShowHint = False
          StyleRenderOptions.RenderBorder = False
          BGColor = clNone
          Editable = False
          Font.Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.Style = []
          InvisibleBorder = True
          HorizScrollBar = False
          VertScrollBar = False
          Required = False
          TabOrder = 31
          SubmitOnAsyncEvent = True
          FriendlyName = 'iwmChooseDomainsExplanation'
          Lines.Strings = (
            
              'Select specific domains if you want samples to be restricted to ' +
              'these domains (assuming appropriate links exist in the database)')
        end
        object lblNoDomainsSelected: TIWLabel
          Left = 440
          Top = 155
          Width = 62
          Height = 15
          Font.Color = clWebRED
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblNoDomainsSelected'
          Caption = 'lblToError'
        end
      end
    end
    object IWRegion1: TIWRegion
      Left = 0
      Top = 1263
      Width = 1401
      Height = 306
      RenderInvisibleControls = True
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbSampleZones: TIWCheckBox
        Left = 30
        Top = 9
        Width = 384
        Height = 21
        Caption = 'Grain zone(s)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 32
        Checked = True
        FriendlyName = 'iwcbSampleZones'
      end
      object iwlSampleZones: TIWListbox
        Left = 65
        Top = 38
        Width = 349
        Height = 203
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 33
        FriendlyName = 'iwlSampleZones'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object lblNoGrainZones: TIWLabel
        Left = 448
        Top = 163
        Width = 104
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'lblNoGrainZones'
        Caption = 'lblNoGrainZones'
      end
    end
  end
end
