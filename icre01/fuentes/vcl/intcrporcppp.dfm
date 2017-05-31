object WCrPorcPPP: TWCrPorcPPP
  Left = 287
  Top = 242
  Width = 589
  Height = 344
  Caption = 'Porcentajes de Estimaci�n Preventiva por Riesgo Crediticio'
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
  object PnDatos: TPanel
    Left = 3
    Top = 288
    Width = 573
    Height = 21
    TabOrder = 0
    object lbEmpresa: TLabel
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
    object lbUsuario: TLabel
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
    object lbFecha: TLabel
      Left = 299
      Top = 2
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
    object lbPerfil: TLabel
      Left = 299
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
    object lbDUsuario: TLabel
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
    object lbDPerfil: TLabel
      Left = 363
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
    object lbDFecha: TLabel
      Left = 363
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
    object lbDEmpresa: TLabel
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
  object PageControl1: TPageControl
    Left = 3
    Top = 7
    Width = 575
    Height = 281
    ActivePage = tbsAlta
    OwnerDraw = True
    TabOrder = 1
    OnDrawTab = PageControl1DrawTab
    object tbsAlta: TTabSheet
      Caption = 'Alta de porcentajes'
      object lblID_CREDITO: TLabel
        Left = 9
        Top = 28
        Width = 33
        Height = 13
        Caption = 'Cr�dito'
      end
      object lblPORC_CLIENTE: TLabel
        Left = 10
        Top = 61
        Width = 51
        Height = 13
        Caption = 'Porcentaje'
      end
      object lbF_ALTA: TLabel
        Left = 9
        Top = 231
        Width = 45
        Height = 13
        Caption = 'F. de Alta'
      end
      object lbUSUA_ALTA: TLabel
        Left = 132
        Top = 229
        Width = 43
        Height = 13
        Caption = 'Usu. Alta'
      end
      object lbF_MODIF: TLabel
        Left = 258
        Top = 231
        Width = 52
        Height = 13
        Caption = 'F. Modifica'
      end
      object lbUSUA_MODIF: TLabel
        Left = 385
        Top = 231
        Width = 65
        Height = 13
        Caption = 'Usu. Modifica'
      end
      object edID_CREDITO: TEdit
        Tag = 562
        Left = 78
        Top = 24
        Width = 94
        Height = 21
        HelpContext = 1010
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnExit = edID_CREDITOExit
      end
      object bbCredito: TBitBtn
        Tag = 50
        Left = 175
        Top = 24
        Width = 21
        Height = 21
        HelpContext = 1020
        TabOrder = 1
        TabStop = False
        OnClick = bbCreditoClick
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
      object edTITNombre: TEdit
        Left = 199
        Top = 24
        Width = 343
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 40
        ReadOnly = True
        TabOrder = 2
      end
      object edF_ALTA: TEdit
        Left = 61
        Top = 223
        Width = 70
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
        OnExit = edF_ALTAExit
      end
      object edCVE_USUA_ALTA: TEdit
        Left = 184
        Top = 223
        Width = 70
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
        OnExit = edCVE_USUA_ALTAExit
      end
      object edF_MODIF: TEdit
        Left = 311
        Top = 223
        Width = 69
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        OnExit = edF_MODIFExit
      end
      object edCVE_USUA_MODIF: TEdit
        Left = 456
        Top = 223
        Width = 68
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
        OnExit = edCVE_USUA_MODIFExit
      end
      object iedPORC_EST_PREV_RGO_CRED: TInterEdit
        Tag = 562
        Left = 78
        Top = 56
        Width = 185
        Height = 21
        HelpContext = 1030
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = iedPORC_EST_PREV_RGO_CREDExit
        MaxLength = 12
        TabOrder = 3
        UseReType = True
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object tbsMasiva: TTabSheet
      Caption = 'Alta Masiva'
      ImageIndex = 1
      object Label6: TLabel
        Left = 8
        Top = 12
        Width = 92
        Height = 13
        Caption = 'Importar de Archivo'
      end
      object sbExcel: TSpeedButton
        Left = 107
        Top = 6
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        OnClick = sbExcelClick
      end
      object Label1: TLabel
        Left = 250
        Top = 75
        Width = 110
        Height = 13
        Caption = 'Incidencias de proceso'
      end
      object bbMasivo: TBitBtn
        Left = 251
        Top = 39
        Width = 118
        Height = 25
        Caption = 'Guardar Porcentajes'
        TabOrder = 0
        Visible = False
        OnClick = bbMasivoClick
      end
      object edNbrArch: TEdit
        Left = 137
        Top = 7
        Width = 308
        Height = 21
        Color = clBtnFace
        TabOrder = 1
      end
      object BtnImportar: TButton
        Left = 458
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 2
        Visible = False
        OnClick = BtnImportarClick
      end
      object sgDatos: TStringGrid
        Left = 9
        Top = 38
        Width = 225
        Height = 208
        ColCount = 2
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ColWidths = (
          70
          142)
      end
      object Memo1: TMemo
        Left = 249
        Top = 93
        Width = 315
        Height = 154
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    ShowBtnModificar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 242
    Top = 2
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 211
    Top = 2
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xls'
    InitialDir = 'C:\'
    Title = 'Seleccione archivo Excel origen'
    Left = 384
    Top = 65
  end
end
