object WCrCalifAcred: TWCrCalifAcred
  Left = 288
  Top = 217
  Width = 538
  Height = 288
  Caption = 'Cat�logo de Calificaci�n de Acreditado'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 530
    Height = 233
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object Label5: TLabel
        Left = 8
        Top = 69
        Width = 56
        Height = 13
        Caption = 'Descripci�n'
      end
      object lbCVE_CALIFICACION: TLabel
        Left = 8
        Top = 31
        Width = 108
        Height = 13
        Caption = 'Calificaci�n Acreditado'
      end
      object edCVE_CALIFICACION: TEdit
        Tag = 50
        Left = 128
        Top = 27
        Width = 105
        Height = 21
        HelpContext = 1001
        CharCase = ecUpperCase
        MaxLength = 4
        TabOrder = 0
        OnExit = edCVE_CALIFICACIONExit
      end
      object edDESC_CALIFICA: TEdit
        Tag = 18
        Left = 128
        Top = 65
        Width = 385
        Height = 21
        HelpContext = 2001
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 1
        OnExit = edDESC_CALIFICAExit
      end
      object rgCVE_PER_JURIDICA: TRadioGroup
        Tag = 18
        Left = 8
        Top = 105
        Width = 504
        Height = 37
        Caption = 'Persona Jur�dica'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'F�sica'
          'Moral')
        TabOrder = 2
        OnExit = rgCVE_PER_JURIDICAExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object lbTotal: TLabel
        Left = 15
        Top = 142
        Width = 92
        Height = 13
        Caption = 'Total de Registros :'
      end
      object lbTotalReg: TLabel
        Left = 116
        Top = 142
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label6: TLabel
        Left = 162
        Top = 89
        Width = 357
        Height = 14
        Caption = '**  NOTA:   Persona Moral (PM), Persona F�sica (PF)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 35
        Top = 0
        Width = 27
        Height = 13
        Caption = 'Clave'
      end
      object Label10: TLabel
        Left = 88
        Top = 0
        Width = 73
        Height = 13
        Caption = 'Pers.Jur�dica **'
      end
      object Label12: TLabel
        Left = 184
        Top = 0
        Width = 56
        Height = 13
        Caption = 'Descripci�n'
      end
      object Bevel3: TBevel
        Left = 80
        Top = 0
        Width = 5
        Height = 16
      end
      object Bevel4: TBevel
        Left = 166
        Top = 0
        Width = 5
        Height = 16
      end
      object btCarga: TBitBtn
        Left = 368
        Top = 113
        Width = 153
        Height = 25
        Caption = 'Carga en Bloque'
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
      object RGinformacion: TRadioGroup
        Left = 8
        Top = 108
        Width = 353
        Height = 32
        Caption = 'Informaci�n'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Remplazar registros'
          'Adicionar registros')
        TabOrder = 1
      end
      object pbRegistros: TProgressBar
        Left = 142
        Top = 144
        Width = 377
        Height = 9
        Min = 0
        Max = 100
        TabOrder = 2
      end
      object MErrores: TMemo
        Left = 0
        Top = 158
        Width = 522
        Height = 47
        Align = alBottom
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 16
        Width = 522
        Height = 73
        ColCount = 3
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 4
        OnExit = SAGtaExit
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          80
          85
          320)
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 233
    Width = 530
    Height = 21
    Align = alBottom
    TabOrder = 1
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 442
    Top = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 548
    Top = 32
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
end
