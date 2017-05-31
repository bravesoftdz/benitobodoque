object WCrEmisor: TWCrEmisor
  Left = 90
  Top = 204
  Width = 726
  Height = 347
  Caption = 'Emisor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNOMBRE_EMISOR: TLabel
    Left = 8
    Top = 83
    Width = 3
    Height = 13
  end
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 0
    Width = 710
    Height = 254
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbID_ACREDITADO: TLabel
        Left = 21
        Top = 31
        Width = 51
        Height = 13
        Caption = 'Acreditado'
      end
      object lbCVE_EMISOR_EXT: TLabel
        Left = 21
        Top = 55
        Width = 97
        Height = 13
        Caption = 'Identificador Externo'
      end
      object Label1: TLabel
        Left = 21
        Top = 80
        Width = 91
        Height = 13
        Caption = 'Comisi�n por Pagar'
      end
      object Label2: TLabel
        Left = 326
        Top = 80
        Width = 48
        Height = 13
        Caption = 'Sobretasa'
      end
      object lbF_ALTA: TLabel
        Left = 21
        Top = 182
        Width = 66
        Height = 13
        Caption = 'Fecha de Alta'
      end
      object lbF_MODIFICA: TLabel
        Left = 21
        Top = 206
        Width = 73
        Height = 13
        Caption = 'Fecha Modifica'
      end
      object LBCVE_USU_ALTA: TLabel
        Left = 445
        Top = 182
        Width = 57
        Height = 13
        Caption = 'Usuario Alta'
      end
      object lbCVE_USU_MODIFICA: TLabel
        Left = 445
        Top = 206
        Width = 79
        Height = 13
        Caption = 'Usuario Modifica'
      end
      object Label8: TLabel
        Left = 21
        Top = 8
        Width = 106
        Height = 13
        Caption = 'Entidad Descontadora'
      end
      object edID_ACREDITADO: TEdit
        Tag = 562
        Left = 160
        Top = 27
        Width = 83
        Height = 21
        HelpContext = 1100
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 3
        OnExit = edID_ACREDITADOExit
      end
      object btACREDITADO: TBitBtn
        Tag = 50
        Left = 246
        Top = 27
        Width = 22
        Height = 20
        HelpContext = 1101
        TabOrder = 4
        OnClick = btACREDITADOClick
        OnExit = edID_ACREDITADOExit
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000010000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF0000001F00000000000000000000000000000000000000
          A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
          F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
          C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
          0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
          00000000D80047330000000046000000360002002E0000001F0000003F002701
          000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
          00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
          47000000000047333F0008E8780000000300F91AB700E7820700000000000000
          01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
          FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
          B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
          C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
          0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
          5E00E0010000FF10040000040000CE4800000000000000008200150000000000
          00000000000007400100000000000100200010000000E74850000B0195000C01
          01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
          000000009B001500D400FFFF030000003C005E0004000000A000010020000000
          0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
          00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
          A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
          20000000F8005B005D00B77F0100000000000000000000002000000034001704
          00000002F4005D00A8005B004700B77F20000000000000200000000205000000
          000000004400071852002A009000301200002011000034875000E01000003012
          0000408750001701A8001405000000000200920400000000A200000000003012
          0000828700006A87000000000000010000000000C80000007600507F1700537F
          E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
          200000002700000001000000E000000000002F01E0005E0020000000BA00507F
          1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
          03030E11110E110E111103030303030303030E01010E010E0101030303030303
          0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
          0311110E110E11110E110303030303030301010E010E01010E01030303030303
          03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
          030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
          03060111060E110E110E030303030303030F0101000E010E010E030303030303
          0606010E110611110E110303030303030F0F010E010F01010E01030303030306
          0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
          010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
          060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
          0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
          06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
          06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
          03030303030303030303030F0F0F0F0F03030303030303030303030306060603
          0303030303030303030303030F0F0F0303030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303}
        NumGlyphs = 2
      end
      object edNOMBRE_ACREDITADO: TEdit
        Left = 270
        Top = 27
        Width = 422
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 5
      end
      object edCVE_EMISOR_EXT: TEdit
        Tag = 18
        Left = 160
        Top = 51
        Width = 83
        Height = 21
        HelpContext = 1200
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 6
        OnExit = edCVE_EMISOR_EXTExit
      end
      object edNOMBRE_EMISOR: TEdit
        Tag = 18
        Left = 246
        Top = 51
        Width = 446
        Height = 21
        HelpContext = 1300
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 7
        OnExit = edNOMBRE_EMISORExit
      end
      object edTASA_COMISION: TInterEdit
        Tag = 18
        Left = 160
        Top = 76
        Width = 100
        Height = 21
        HelpContext = 1400
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edTASA_COMISIONExit
        DisplayMask = '###,##0.00'
        MaxLength = 12
        TabOrder = 8
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edSOBRETASA: TInterEdit
        Tag = 18
        Left = 425
        Top = 76
        Width = 100
        Height = 21
        HelpContext = 1500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edSOBRETASAExit
        DisplayMask = '###,##0.00'
        MaxLength = 12
        TabOrder = 9
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object rgSIT_EMISOR: TRadioGroup
        Tag = 18
        Left = 21
        Top = 137
        Width = 673
        Height = 35
        HelpContext = 1700
        Caption = 'Situaci�n Emisor'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Activo'
          'Inactivo')
        TabOrder = 12
        TabStop = True
        OnExit = rgSIT_EMISORExit
      end
      object edF_MODIFICA: TEdit
        Left = 160
        Top = 202
        Width = 103
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 15
      end
      object edF_ALTA: TEdit
        Left = 160
        Top = 178
        Width = 103
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 13
      end
      object edCVE_USU_MODIFICA: TEdit
        Left = 587
        Top = 202
        Width = 106
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 16
      end
      object edCVE_USU_ALTA: TEdit
        Left = 587
        Top = 178
        Width = 106
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 14
      end
      object chB_VAL_SECTOR: TCheckBox
        Tag = 18
        Left = 589
        Top = 76
        Width = 102
        Height = 21
        HelpContext = 1600
        Alignment = taLeftJustify
        Caption = 'V�lida Sector'
        TabOrder = 10
        OnExit = chB_VAL_SECTORExit
      end
      object edDESC_ENT_DES: TEdit
        Left = 270
        Top = 4
        Width = 422
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 2
      end
      object btnCVE_FND_ENT_DES: TBitBtn
        Tag = 50
        Left = 246
        Top = 4
        Width = 22
        Height = 20
        HelpContext = 1002
        TabOrder = 1
        OnClick = btnCVE_FND_ENT_DESClick
        OnExit = btnCVE_FND_ENT_DESExit
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000010000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF0000001F00000000000000000000000000000000000000
          A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
          F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
          C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
          0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
          00000000D80047330000000046000000360002002E0000001F0000003F002701
          000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
          00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
          47000000000047333F0008E8780000000300F91AB700E7820700000000000000
          01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
          FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
          B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
          C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
          0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
          5E00E0010000FF10040000040000CE4800000000000000008200150000000000
          00000000000007400100000000000100200010000000E74850000B0195000C01
          01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
          000000009B001500D400FFFF030000003C005E0004000000A000010020000000
          0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
          00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
          A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
          20000000F8005B005D00B77F0100000000000000000000002000000034001704
          00000002F4005D00A8005B004700B77F20000000000000200000000205000000
          000000004400071852002A009000301200002011000034875000E01000003012
          0000408750001701A8001405000000000200920400000000A200000000003012
          0000828700006A87000000000000010000000000C80000007600507F1700537F
          E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
          200000002700000001000000E000000000002F01E0005E0020000000BA00507F
          1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
          03030E11110E110E111103030303030303030E01010E010E0101030303030303
          0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
          0311110E110E11110E110303030303030301010E010E01010E01030303030303
          03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
          030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
          03060111060E110E110E030303030303030F0101000E010E010E030303030303
          0606010E110611110E110303030303030F0F010E010F01010E01030303030306
          0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
          010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
          060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
          0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
          06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
          06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
          03030303030303030303030F0F0F0F0F03030303030303030303030306060603
          0303030303030303030303030F0F0F0303030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303}
        NumGlyphs = 2
      end
      object edCVE_FND_ENT_DES: TEdit
        Tag = 562
        Left = 160
        Top = 4
        Width = 83
        Height = 21
        HelpContext = 1001
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnExit = edCVE_FND_ENT_DESExit
      end
      object rbCVE_DIA_PAGO: TRadioGroup
        Tag = 18
        Left = 21
        Top = 99
        Width = 673
        Height = 37
        HelpContext = 1650
        Caption = 'D�a de Pago'
        Columns = 6
        ItemIndex = 0
        Items.Strings = (
          'Indistinto'
          'Lunes'
          'Martes'
          'Miercoles'
          'Jueves'
          'Viernes')
        TabOrder = 11
        OnExit = rbCVE_DIA_PAGOExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Lbtotal: TLabel
        Left = 0
        Top = 154
        Width = 89
        Height = 13
        Caption = 'Total de Registros:'
      end
      object lbTotalReg: TLabel
        Left = 96
        Top = 154
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 174
        Top = 2
        Width = 51
        Height = 13
        Caption = 'Acreditado'
      end
      object Bevel3: TBevel
        Left = 288
        Top = 0
        Width = 5
        Height = 16
      end
      object Bevel1: TBevel
        Left = 621
        Top = 0
        Width = 5
        Height = 16
      end
      object Label3: TLabel
        Left = 426
        Top = 2
        Width = 56
        Height = 13
        Caption = 'Nom.Emisor'
      end
      object Bevel2: TBevel
        Left = 359
        Top = 0
        Width = 5
        Height = 16
      end
      object Label4: TLabel
        Left = 297
        Top = 2
        Width = 51
        Height = 13
        Caption = 'Id. Externo'
      end
      object Bevel5: TBevel
        Left = 540
        Top = 0
        Width = 5
        Height = 16
      end
      object Label5: TLabel
        Left = 548
        Top = 2
        Width = 65
        Height = 13
        Caption = 'Comis. a Pag.'
      end
      object Label6: TLabel
        Left = 631
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Sobretasa'
      end
      object Bevel4: TBevel
        Left = 107
        Top = 0
        Width = 5
        Height = 16
      end
      object Label9: TLabel
        Left = 11
        Top = 2
        Width = 89
        Height = 13
        Caption = 'Ent. Descontadora'
      end
      object btCarga: TBitBtn
        Left = 566
        Top = 150
        Width = 153
        Height = 21
        Caption = 'Carga en Bloques'
        TabOrder = 0
        OnClick = btCargaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object pbRegistros: TProgressBar
        Left = 111
        Top = 155
        Width = 434
        Height = 11
        Min = 0
        Max = 100
        TabOrder = 1
      end
      object MErrores: TMemo
        Left = 0
        Top = 173
        Width = 702
        Height = 53
        Align = alBottom
        Color = clInfoBk
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 16
        Width = 721
        Height = 129
        ColCount = 6
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 3
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          105
          180
          70
          180
          80
          60)
        PropCell = (
          0
          0
          1
          0
          0
          1
          0
          1
          1
          0)
        PropCol = (
          0
          1
          0
          0
          1
          1
          1
          0
          2
          1
          1
          0
          3
          1
          0
          0
          4
          1
          0
          0)
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 279
    Width = 710
    Height = 21
    Align = alTop
    TabOrder = 1
    object lbDempresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 384
      Top = 1
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 384
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 456
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 456
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 254
    Width = 710
    Height = 25
    Align = alTop
    TabOrder = 2
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesModificar = InterForma1AntesModificar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 411
    Top = 24
  end
  object ilACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilACREDITADOCapture
    Left = 536
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 460
    Top = 112
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    OnEjecuta = ilCVE_FND_ENT_DESEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_FND_ENT_DESCapture
    Left = 624
    Top = 24
  end
end
