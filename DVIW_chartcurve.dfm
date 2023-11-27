object IWChartInterpretation: TIWChartInterpretation
  Left = 0
  Top = 0
  Width = 1000
  Height = 800
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DateView'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWRegion1: TIWRegion
    Left = 0
    Top = 0
    Width = 1000
    Height = 73
    RenderInvisibleControls = True
    TabOrder = 16
    Align = alTop
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwbClose: TIWButton
      Left = 11
      Top = 14
      Width = 75
      Height = 21
      Caption = 'Close'
      Color = clWebLIGHTGREEN
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbClose'
      OnClick = iwbCloseClick
    end
    object iwbExportGraphValues: TIWButton
      Left = 11
      Top = 36
      Width = 75
      Height = 21
      Caption = 'Export'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbExportGraphValues'
      TabOrder = 15
      OnClick = iwbExportGraphValuesClick
    end
    object IWLabel3: TIWLabel
      Left = 107
      Top = 16
      Width = 64
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel3'
      Caption = 'Y axis min.'
    end
    object IWLabel4: TIWLabel
      Left = 107
      Top = 40
      Width = 64
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel4'
      Caption = 'X axis min.'
    end
    object iweYMinimum: TIWEdit
      Left = 194
      Top = 12
      Width = 69
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iweYMinimum'
      SubmitOnAsyncEvent = True
      TabOrder = 1
    end
    object iweXMinimum: TIWEdit
      Left = 194
      Top = 39
      Width = 69
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iweXMinimum'
      SubmitOnAsyncEvent = True
      TabOrder = 3
    end
    object IWLabel6: TIWLabel
      Left = 269
      Top = 40
      Width = 28
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel4'
      Caption = 'max.'
    end
    object IWLabel5: TIWLabel
      Left = 269
      Top = 16
      Width = 28
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel3'
      Caption = 'max.'
    end
    object iweYMaximum: TIWEdit
      Left = 303
      Top = 12
      Width = 69
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'IWEdit1'
      SubmitOnAsyncEvent = True
      TabOrder = 2
    end
    object iweXMaximum: TIWEdit
      Left = 303
      Top = 36
      Width = 69
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'IWEdit2'
      SubmitOnAsyncEvent = True
      TabOrder = 4
    end
    object iwcbAutomaticScaling: TIWCheckBox
      Left = 389
      Top = 36
      Width = 197
      Height = 21
      Cursor = crAuto
      Caption = 'Automatic scale'
      Editable = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      SubmitOnAsyncEvent = True
      Style = stNormal
      TabOrder = 6
      OnClick = iwcbAutomaticScalingClick
      Checked = True
      FriendlyName = 'iwcbAutomaticScaling'
    end
    object iwbChangeAxisScales: TIWButton
      Left = 389
      Top = 14
      Width = 75
      Height = 21
      Caption = 'Change'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbChangeAxisScales'
      TabOrder = 5
      OnClick = iwbChangeAxisScalesClick
    end
    object iwcbShowErrorBars: TIWCheckBox
      Left = 509
      Top = 14
      Width = 116
      Height = 21
      Cursor = crAuto
      Caption = 'Error bars'
      Editable = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      SubmitOnAsyncEvent = True
      Style = stNormal
      TabOrder = 7
      OnClick = iwcbShowErrorBarsClick
      Checked = True
      FriendlyName = 'iwcbShowErrorBars'
    end
    object iwcbShowLegend: TIWCheckBox
      Left = 617
      Top = 14
      Width = 176
      Height = 21
      Cursor = crAuto
      Caption = 'Show Legend'
      Editable = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      SubmitOnAsyncEvent = True
      Style = stNormal
      TabOrder = 8
      OnClick = iwcbShowLegendClick
      Checked = True
      FriendlyName = 'iwcbShowLegend'
    end
    object iwcbShowBackground: TIWCheckBox
      Left = 617
      Top = 34
      Width = 176
      Height = 21
      Cursor = crAuto
      Caption = 'Show background'
      Editable = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      SubmitOnAsyncEvent = True
      Style = stNormal
      TabOrder = 9
      OnClick = iwcbShowBackgroundClick
      Checked = True
      FriendlyName = 'iwcbShowBackground'
    end
  end
  object IWRegion4: TIWRegion
    Left = 0
    Top = 73
    Width = 1000
    Height = 727
    RenderInvisibleControls = True
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object IWRegion3: TIWRegion
      Left = 700
      Top = 0
      Width = 300
      Height = 727
      RenderInvisibleControls = True
      Align = alRight
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbSeries1: TIWCheckBox
        Left = 18
        Top = 18
        Width = 250
        Height = 21
        Cursor = crAuto
        Caption = 'Series1'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        OnClick = iwcbSeries1Click
        Checked = True
        FriendlyName = 'iwcbSeries1'
      end
      object iwcbSeries2: TIWCheckBox
        Left = 18
        Top = 37
        Width = 250
        Height = 21
        Cursor = crAuto
        Caption = 'Series2'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 11
        OnClick = iwcbSeries2Click
        Checked = True
        FriendlyName = 'iwcbSeries2'
      end
      object iwcbSeries3: TIWCheckBox
        Left = 18
        Top = 57
        Width = 250
        Height = 21
        Cursor = crAuto
        Caption = 'Series3'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 12
        OnClick = iwcbSeries3Click
        Checked = True
        FriendlyName = 'iwcbSeries3'
      end
      object iwcbSeries4: TIWCheckBox
        Left = 18
        Top = 76
        Width = 250
        Height = 21
        Cursor = crAuto
        Caption = 'Series4'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        OnClick = iwcbSeries4Click
        Checked = True
        FriendlyName = 'iwcbSeries4'
      end
      object iwcbSeries5: TIWCheckBox
        Left = 18
        Top = 96
        Width = 250
        Height = 21
        Cursor = crAuto
        Caption = 'Series5'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 14
        OnClick = iwcbSeries5Click
        Checked = True
        FriendlyName = 'iwcbSeries5'
      end
    end
    object IWRegion5: TIWRegion
      Left = 0
      Top = 0
      Width = 700
      Height = 727
      RenderInvisibleControls = True
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWChart1: TIWChart
        Left = 0
        Top = 0
        Width = 700
        Height = 653
        Align = alClient
        BorderOptions.Width = 0
        UseSize = True
        Chart = Chart1
        ExplicitLeft = -435
        ExplicitTop = -316
        ExplicitWidth = 713
        ExplicitHeight = 459
      end
      object IWRegion2: TIWRegion
        Left = 0
        Top = 653
        Width = 700
        Height = 74
        RenderInvisibleControls = True
        Align = alBottom
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwlNormalisationType: TIWLabel
          Left = 442
          Top = 44
          Width = 112
          Height = 14
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'iwlNormalisationType'
          Caption = 'iwlNormalisationType'
        end
        object iwlMinimumDateUncertainty: TIWLabel
          Left = 442
          Top = 24
          Width = 144
          Height = 14
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'iwlMinimumDateUncertainty'
          Caption = 'iwlMinimumDateUncertainty'
        end
        object iwlPDFType: TIWLabel
          Left = 442
          Top = 3
          Width = 62
          Height = 14
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.Style = []
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'iwlPDFType'
          Caption = 'iwlPDFType'
        end
      end
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 700
        Height = 653
        BackWall.Brush.Gradient.Direction = gdBottomTop
        BackWall.Brush.Gradient.EndColor = clWhite
        BackWall.Brush.Gradient.StartColor = 15395562
        BackWall.Brush.Gradient.Visible = True
        BackWall.Transparent = False
        Foot.Alignment = taLeftJustify
        Foot.Font.Color = 5131854
        Foot.Font.Name = 'Verdana'
        Foot.Font.Style = []
        Foot.Text.Strings = (
          '(c) Bruce Eglington (2004-2022)'
          'DateView Geochronology Database')
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = clSilver
        Gradient.MidColor = clWhite
        Gradient.StartColor = clSilver
        Gradient.Visible = True
        LeftWall.Color = 14745599
        Legend.CheckBoxesStyle = cbsRadio
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = [fsBold]
        Legend.Font.Shadow.Color = clWhite
        Legend.Font.Shadow.HorizSize = 1
        Legend.Font.Shadow.VertSize = 1
        Legend.LegendStyle = lsSeries
        Legend.Shadow.Transparency = 0
        Legend.Symbol.Shadow.Visible = False
        RightWall.Color = 14745599
        SubFoot.Font.Name = 'Verdana'
        SubTitle.Font.Name = 'Verdana'
        Title.Brush.Gradient.Direction = gdLeftRight
        Title.Brush.Gradient.EndColor = clGray
        Title.Brush.Gradient.Visible = True
        Title.Font.Color = clBlack
        Title.Font.Height = -21
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'TChart')
        BottomAxis.Axis.Color = 4210752
        BottomAxis.Grid.Color = 11119017
        BottomAxis.LabelsFormat.Font.Name = 'Verdana'
        BottomAxis.TicksInner.Color = 11119017
        BottomAxis.Title.Caption = 'Date'
        BottomAxis.Title.Font.Name = 'Verdana'
        BottomAxis.Title.Font.Style = [fsBold]
        DepthAxis.Axis.Color = 4210752
        DepthAxis.Grid.Color = 11119017
        DepthAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthAxis.TicksInner.Color = 11119017
        DepthAxis.Title.Font.Name = 'Verdana'
        DepthTopAxis.Axis.Color = 4210752
        DepthTopAxis.Grid.Color = 11119017
        DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthTopAxis.TicksInner.Color = 11119017
        DepthTopAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Axis.Color = 4210752
        LeftAxis.Grid.Color = 11119017
        LeftAxis.LabelsFormat.Font.Name = 'Verdana'
        LeftAxis.TicksInner.Color = 11119017
        LeftAxis.Title.Caption = 'Date'
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = [fsBold]
        RightAxis.Axis.Color = 4210752
        RightAxis.Grid.Color = 11119017
        RightAxis.LabelsFormat.Font.Name = 'Verdana'
        RightAxis.TicksInner.Color = 11119017
        RightAxis.Title.Font.Name = 'Verdana'
        TopAxis.Axis.Color = 4210752
        TopAxis.Grid.Color = 11119017
        TopAxis.LabelsFormat.Font.Name = 'Verdana'
        TopAxis.TicksInner.Color = 11119017
        TopAxis.Title.Font.Name = 'Verdana'
        View3D = False
        Align = alClient
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          21
          15
          21)
        ColorPaletteIndex = 11
        object Series1: TLineSeries
          HoverElement = [heCurrent]
          SeriesColor = clRed
          Brush.BackColor = clDefault
          LinePen.Color = clRed
          LinePen.Width = 2
          Pointer.Brush.Gradient.EndColor = clRed
          Pointer.Gradient.EndColor = clRed
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            011900000000000000000000000000000000005940000000000000F83F000000
            0000C06240000000000000004000000000000069400000000000000440000000
            0000406F4000000000000008400000000000C072400000000000000C40000000
            0000406F40000000000000104000000000000069400000000000001C40000000
            0000C06240000000000000204000000000000059400000000000002240000000
            0000004940000000000000244000000000000058400000000000002640000000
            000080604000000000000028400000000000E06B400000000000002A40000000
            0000E064400000000000002C400000000000E06B400000000000002E40000000
            0000A07040000000000000304000000000000075400000000000003140000000
            0000E0744000000000000032400000000000B07B400000000000003340000000
            0000888040000000000000344000000000007082400000000000003540000000
            0000D88240000000000000364000000000005085400000000000003740000000
            0000C8884000000000000038400000000000188940}
        end
        object Series3: TLineSeries
          HoverElement = [heCurrent]
          SeriesColor = clBlue
          Title = 'Series2'
          Brush.BackColor = clDefault
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psDiamond
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            00190000000000000000707F400000000000A079400000000000407840000000
            000070784000000000004075400000000000D07A400000000000A07540000000
            00001075400000000000D071400000000000006A400000000000E06840000000
            0000E069400000000000806B4000000000002061400000000000805440000000
            000000204000000000000054400000000000002A400000000000405340000000
            0000A0604000000000000053400000000000805B400000000000C05240000000
            000000F03F0000000000002640}
        end
        object Series2: TLineSeries
          HoverElement = [heCurrent]
          SeriesColor = clGreen
          Title = 'Series3'
          Brush.BackColor = clDefault
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            00190000000000000000C06F4000000000000075400000000000707840000000
            0000C077400000000000C075400000000000507B400000000000007E40000000
            0000707F40000000000040794000000000007079400000000000707440000000
            0000F07640000000000000714000000000003077400000000000F07840000000
            00006077400000000000B07A4000000000008075400000000000A06E40000000
            00006070400000000000F0744000000000002074400000000000B07240000000
            00006075400000000000607040}
        end
        object Series4: TLineSeries
          HoverElement = [heCurrent]
          SeriesColor = clYellow
          Brush.BackColor = clDefault
          LinePen.Color = clYellow
          LinePen.Width = 3
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            0019000000000000000048884000000000008888400000000000488B40000000
            0000188D400000000000788C400000000000B889400000000000808A40000000
            0000B089400000000000C0894000000000000888400000000000C08640000000
            0000708840000000000058854000000000003084400000000000988140000000
            0000907F400000000000507C400000000000A076400000000000807240000000
            0000206F4000000000002070400000000000C063400000000000406D40000000
            00006067400000000000A06940}
        end
        object Series5: TLineSeries
          HoverElement = [heCurrent]
          SeriesColor = clFuchsia
          Brush.BackColor = clDefault
          LinePen.Color = clFuchsia
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psDownTriangle
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            00190000000000000000D07F4000000000004881400000000000008240000000
            00005880400000000000E080400000000000407C400000000000F07C40000000
            0000507B400000000000D074400000000000C06F400000000000C07040000000
            0000607540000000000080754000000000006073400000000000E06A40000000
            0000206440000000000080614000000000008063400000000000406B40000000
            0000C0594000000000000056400000000000005B400000000000004740000000
            00008056400000000000003340}
        end
        object Series6: TErrorSeries
          HoverElement = []
          Legend.Visible = False
          Marks.Visible = False
          Marks.OnTop = True
          SeriesColor = clRed
          ShowInLegend = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          ErrorPen.Color = clRed
          ErrorPen.EndStyle = esSquare
          ErrorValues.Name = 'StdError'
          ErrorValues.Order = loNone
          Data = {
            010600000000000000000000000000000000805A40D39BDEF4A6374440333333
            33333313400000000000E88840A38B2EBAE82245403333333333332340000000
            0000B07B400000000000404740CCCCCCCCCCCC2C400000000000488340D39BDE
            F4A637444033333333333333400000000000206A404992244992244640000000
            00000038400000000000804540A38B2EBAE8224540}
        end
        object Series7: TErrorSeries
          HoverElement = []
          Legend.Visible = False
          Marks.Visible = False
          Marks.OnTop = True
          SeriesColor = clBlue
          ShowInLegend = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          ErrorPen.Color = clBlue
          ErrorValues.Name = 'StdError'
          ErrorValues.Order = loNone
          Data = {
            01060000000000000000000000000000000068844041A930F17E244540333333
            33333313400000000000806A40C49687822B3944403333333333332340000000
            000080724041A930F17E244540CCCCCCCCCCCC2C400000000000B8874062ED1B
            D6BE41474033333333333333400000000000788340EF981AD83B264640000000
            00000038400000000000B08240C49687822B394440}
        end
        object Series8: TErrorSeries
          HoverElement = []
          Legend.Visible = False
          Marks.Visible = False
          Marks.OnTop = True
          SeriesColor = clGreen
          ShowInLegend = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          ErrorPen.Color = clGreen
          ErrorValues.Name = 'StdError'
          ErrorValues.Order = loNone
          Data = {
            010600000000000000000000000000000000208040EF981AD83B264640333333
            33333313400000000000108540C49687822B3944403333333333332340000000
            0000F88340EF981AD83B264640CCCCCCCCCCCC2C400000000000C06040EF981A
            D83B26464033333333333333400000000000807140EF981AD83B264640000000
            00000038400000000000388B4062ED1BD6BE414740}
        end
        object Series9: TErrorSeries
          HoverElement = []
          Legend.Visible = False
          Marks.Visible = False
          Marks.OnTop = True
          SeriesColor = clYellow
          ShowInLegend = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          ErrorPen.Color = clYellow
          ErrorValues.Name = 'StdError'
          ErrorValues.Order = loNone
          Data = {
            010600000000000000000000000000000000B08B4062ED1BD6BE414740333333
            33333313400000000000806840C49687822B3944403333333333332340000000
            0000C08B40C49687822B394440CCCCCCCCCCCC2C40000000000040554041A930
            F17E24454033333333333333400000000000B8814062ED1BD6BE414740000000
            0000003840000000000040534062ED1BD6BE414740}
        end
        object Series10: TErrorSeries
          HoverElement = []
          Legend.Visible = False
          Marks.Visible = False
          Marks.OnTop = True
          SeriesColor = 8388863
          ShowInLegend = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          ErrorPen.Color = 8388863
          ErrorValues.Name = 'StdError'
          ErrorValues.Order = loNone
          Data = {
            01060000000000000000000000000000000070824016A124FB97414440333333
            333333134000000000008053403DA489B1752F46403333333333332340000000
            0000B086403DA489B1752F4640CCCCCCCCCCCC2C400000000000A0654073EC36
            C76E4B474033333333333333400000000000F88A4016A124FB97414440000000
            00000038400000000000B0724073EC36C76E4B4740}
        end
      end
    end
  end
  object FDMemTitles: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 192
    object FDMemTitlesCurve1Title: TStringField
      FieldName = 'Curve1Title'
      Size = 50
    end
    object FDMemTitlesCurve2Title: TStringField
      FieldName = 'Curve2Title'
      Size = 50
    end
    object FDMemTitlesCurve3Title: TStringField
      FieldName = 'Curve3Title'
      Size = 50
    end
    object FDMemTitlesCurve4Title: TStringField
      FieldName = 'Curve4Title'
      Size = 50
    end
    object FDMemTitlesCurve5Title: TStringField
      FieldName = 'Curve5Title'
      Size = 50
    end
  end
  object FDMemProb: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 248
    object FDMemProbAge: TFloatField
      FieldName = 'Age'
    end
    object FDMemProbCurve1Value: TFloatField
      FieldName = 'Curve1Value'
    end
    object FDMemProbCurve2Value: TFloatField
      FieldName = 'Curve2Value'
    end
    object FDMemProbCurve3Value: TFloatField
      FieldName = 'Curve3Value'
    end
    object FDMemProbCurve4Value: TFloatField
      FieldName = 'Curve4Value'
    end
    object FDMemProbCurve5Value: TFloatField
      FieldName = 'Curve5Value'
    end
  end
  object FDMemTempDataDI: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 304
    object FDMemTempDataDIInterpretation: TStringField
      FieldName = 'Interpretation'
      Size = 50
    end
    object FDMemTempDataDIAge: TFloatField
      FieldName = 'Age'
    end
    object FDMemTempDataDIUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object FDMemTempDataDIInterpAbr: TStringField
      FieldName = 'InterpAbr'
      Size = 10
    end
    object FDMemTempDataDIColumnNo: TIntegerField
      FieldName = 'ColumnNo'
    end
    object FDMemTempDataDIAgeErrorAv: TFloatField
      FieldName = 'AgeErrorAv'
    end
    object FDMemTempDataDIAgePlusError: TFloatField
      FieldName = 'AgePlusError'
    end
    object FDMemTempDataDIAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
    end
  end
  object FDMemTempDataDG: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 360
    object FDMemTempDataDGGrouping: TStringField
      FieldName = 'Grouping'
      Size = 50
    end
    object FDMemTempDataDGAge: TFloatField
      FieldName = 'Age'
    end
    object FDMemTempDataDGUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object FDMemTempDataDGInterpAbr: TStringField
      FieldName = 'InterpAbr'
      Size = 10
    end
    object FDMemTempDataDGColumnNo: TIntegerField
      FieldName = 'ColumnNo'
    end
    object FDMemTempDataDGAgeErrorAv: TFloatField
      FieldName = 'AgeErrorAv'
    end
    object FDMemTempDataDGAgePlusError: TFloatField
      FieldName = 'AgePlusError'
    end
    object FDMemTempDataDGAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
    end
  end
  object FDMemTempDataDT: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 416
    object FDMemTempDataDTGrouping: TStringField
      FieldName = 'Grouping'
      Size = 50
    end
    object FDMemTempDataDTMaterialAbr: TStringField
      FieldName = 'MaterialAbr'
      Size = 10
    end
    object FDMemTempDataDTIsoSystem: TStringField
      FieldName = 'IsoSystem'
      Size = 10
    end
    object FDMemTempDataDTApproachAbr: TStringField
      FieldName = 'ApproachAbr'
      Size = 10
    end
    object FDMemTempDataDTAge: TFloatField
      FieldName = 'Age'
    end
    object FDMemTempDataDTSuiteName: TStringField
      FieldName = 'SuiteName'
      Size = 50
    end
    object FDMemTempDataDTColumnNo: TIntegerField
      FieldName = 'ColumnNo'
    end
    object FDMemTempDataDTAgePlusError: TFloatField
      FieldName = 'AgePlusError'
    end
    object FDMemTempDataDTAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
    end
    object FDMemTempDataDTBlockingT: TFloatField
      FieldName = 'BlockingT'
    end
    object FDMemTempDataDTBlockingTUncertainty: TFloatField
      FieldName = 'BlockingTUncertainty'
    end
  end
end
