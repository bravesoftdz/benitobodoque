unit IntMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterApl, Intfrm, IntWFind, intParamCre,InterFor, ExtCtrls;

type
  TwPrincipal = class(TForm)
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InterApliMenuClick(Sender: TObject; var NomFuncion: String);
  public
    ParamCre    : TParamCre;
  end;

var
  wPrincipal: TwPrincipal;
implementation
uses
    IntDmMain,
    {------------------------------------             SALDOSEXCEL        ----------------------------------------}
	IntSdoAgrMas,         //Generaci�n de saldos en excel 20/10/2010 MAGV
    {------------------------------------             GARANTIAS        ----------------------------------------}
    IntCrAnNaf,         //Generaci�n y emisi�n de Archivo NAFIN Anexo 8 y 9
    {------------------------------------         FACTORAJE ELECTRONICO         ----------------------------------------}
    IntCrDocFact,      //M�dulo de consulta y monitorio de Factoraje Electr�nico    ROIM Agosto 2010
    IntCRFEReP,        //Reporte de pagos de Factoraje Electr�nico ROIM Agosto 2010
    IntCrFeNeCt,       //Relaci�n Contrato INET Emisor Proveedor
    {------------------------------------         REINICIO DE DOLARES EN CONTABILIDAD ----------------------------------------}
    IntCorrecP,        //Clase para Reinicio de dolares en PCORP
    {-------------------------------- CONTA - ICRE-----------------------------}
    IntCrCoinSap,       //Configuraci�n Conciliador SAP    AGOSTO 2010
	
    {------------------------------------               ACREDITADO              ----------------------------------------}
    IntCrConInv,        //Conceptos de Inversi�n AgroMasivo         30/03/2010  MAGV	
    IntCrAcredit,       //Datos Adreditado            //ROIM
    IntCrCreChe,        //Alta Chequeras para Acreditados
    IntCrChqDll,        //Registro de Chequeras en d�lares

    IntCrBlqDblq,       //Monitor de Bloqueos / Desbloqueos Saldos Chequeras
    IntCrMonDep,        //Monitor de Dep�sitos de cheuqeras

    IntMAcredRel,       //Acreditados Relacionado
    IntMAutCred,        //Autorizaciones de Cr�ditos Relacionados
    IntMCapBasic,       //Cat�logo de Capital B�sico
    IntMRepCrRel,       //Proceso y Reporte de Cr�ditos Relacionado

    IntCrAtribut,       //Cat�logo de Atributos del Acreditado
    IntCrAgrAtr,        //Cat�logo de Relaci�n de Agrupaci�n - Atributos
    IntCrAgrupac,       //Cat�logo de Agrupaciones del Acreditado

    IntCrCartrIm,       //Detalle CArtera Impagada por Acreditado  
    IntCrEdoMun,        // Cat�logo de Estados y Municipios para Bur� de Cr�dito
    IntCrAcredCM,       // Acreditado en Concurso Mercantil   RABA ABR 2013
    IntCrAcrDmPs,       //Evidencia de Capacidad de Pago Acreditado JFOF 01/04/2013
    {------------------------------------         LINEAS DE AUTORIZACXION       ----------------------------------------}
    IntCrCto,           //Alta de Autorizaci�n
    IntCrAutClin,       //Relaci�n autorizaci�n - disposici�n marco
    {------------------------------------              DIPOSICIONES             ----------------------------------------}
    IntCrCredito,       //Alta de solicitudes de Disposici�n / DISPOSICION
    IntMDispFond,       //Alta de solicitudes de Redescuento
    IntCrMonDisp,       //Monitor de Disposiciones
    {------------------------------------            CONTROL OPERATIVO          ----------------------------------------}
    IntCrExcepci,       //Aplicaci�n de Excepciones por disposi.
    IntExcepApli,       //Excepciones por Aplicaci�n.

    IntCrPerfiUs,       //Identificaci�n de Perfil de Cr�ditos
    IntCrPePrUs,        //Perfil de Usuario por Producto

    IntCrPromAsc,       //Actualiza Promotor Asociado.
    IntCrPromAdm,       //Actualiza promotor Administrador.

    IntCrComisEv,       //Comisiones Eventuales
    IntCrCaMoCom,       //Modificacion de Comisiones
    {------------------------------------                CAT�LOGOS              ----------------------------------------}
    IntCrRoeFond,       //Cat�logo Costo Fondeo Roe JFOF JUN-2012
    IntCrRoeProd,       //Cat�logo Producto Roe     JFOF JUN-2012
    IntCrRoeLneg,       //Cat�logo Linea de Producto ROE JFOF JUL-2012
    IntCrRoePneg,       //Cat�logo Producto Negocio ROE JFOF JUN-2012	

    IntCrTraInt,        //Cat�logo de Tasas por rangos                      Aar�n Hernandez Asteci Octubre 2009
    IntCrImpDire,       //Cat�logo de Directores .                          Reporte Consolidado de Cartera Impagada.   Juan Javier Amado Asteci Octubre 2009
    IntCrImDiPr,        //Cat�logo de Relaci�n Directores - Productos .     Reporte Consolidado de Cartera Impagada.   Juan Javier Amado Asteci Octubre 2009
    IntCrTAcreR,        //Cat�logo de Tipo de Acreditados
    IntCrGrupEco,       //Cat�logo de Grupo Econ�mico
    IntCrSectEco,       //Cat�logo de Sector Econ�mico
    IntCrTamAcre,       //Cat�logo de Tama�o de Acreditado
    IntCrCalAcr,        //Cat�logo de Calilficaci�n del Acreditado
    IntCrClaLeg,        //Cat�logo de Clasificaci�n Legal en bloques.
    IntCrOrigRec,       //Cat�logo de Origen de Recursos
    IntCrDestino,       //Cat�logo de Destino del Cr�dito
    IntCrCatMini,       //Cat�logo de Clasificaci�n Contable
    IntCrAmortiz,       //Cat�logo de Tipos de Amortizaci�n
    IntCrPagInt,        //Cat�logo de tipos de pagos de Inter�s
    IntCrPctCapi,       //Porcentaje de Capitalizacion
    IntCrSeTaAc,        //Cat�logo de Sectores por Tama�o Acred.
    IntCrTipRel,        //Cat�logo Tipos de Relaci�n    //easa  24052005
    IntCrProCor,        //Cat�logo de Productos Corporativos
    IntCrRePaCnb,       //Cat�logo de Regi�n o Pa�s
    IntCrMunCnb,        // Catalogo de Claves de Municipio  // RUCJ4248
    IntCrReLiMn,        //Relaci�n Medio Liquidaci�n - Moneda
    IntCrUniTie,        //Cat�logo de Unidades de Tiempo
    IntCrAcrCon,        //Puestos en la Empresa o del Consejo de Administraci�n
    IntCrTRedond,       //Cat�logo Tipo de redondeo
    IntCrTCredit,       //Cat�logo Tipo de Cr�dito
    IntCrGpPrSe,        //Relaci�n Grupo Producto - Sector Contable

    IntCrAplSal,        //Cat�logo de Aplica Saldos
    IntCrLiqMedi,       //Tipos o medios Liquidaci�n
    IntCrCalcInt,       //Tipos de C�lculos de Intereses
    IntCrAgrChe,        //Catalogo de Agrupaci�n de Chequeras
    IntCrGpCheq,        //Catalogo de Grupos de Chequeras

    IntCrOperaci,       //Cat�logo de Operaciones
    IntCrConcept,       //Cat�logo de Conceptos
    IntCrCatComi,       //Cat�logo de Comisi�n
    IntCrAfectac,       //Cat�logo de Afectaci�n
    IntCrParamet,       //Cat�logo de Parametros del SIstema
    IntCrAccesor,       //Cat�logo de Accesorio
    IntCrSituaci,       //Cat�logo de Situaciones

    IntMInstDesc,       //Cat�logo de Entidad Descontadora
    IntMPrgApoyo,       //Cat�logo de Programa de apoyo

    IntCrFrmtNaf,       //Cat�logo de Formatos de NAFIN

    IntCrCoiCon,        //Relaci�n Producto Cuentas Contables

    IntCrSalMin,        //Catalogo de Actulizacion de Salarios Minimos
    IntCrGruCla,        //Cat�logo de Grupos de claves
    IntCrTpoTel,         //Catalogo de tipos de telefonos (linea hogar, empresa, celular, etc.)
    IntCrCatHrFe,       // Cat�logo de Horario Descuento de Documentos

    IntCrCtaCont,       //Cat�logo de Cuentas Contables JFOF OCT-2013

    IntCrCaCaMi,        //Cat�logo para Clasificaci�n Contable RABA FEB-2016

    {---------O17---------}
    IntCrProdBca,       //Cat�logo de Productos de Banca JFOF JUL-2013
    IntCrGpoPBca,       //Cat�logo de Grupo Producto de Banca JFOF AGO-2013
    IntCrCatArNe,       //Cat�logo de �rea de Negocio JFOF JUL-2013
    IntCrRelTCre,       //Cat�logo Tipo de Credito JFOF JUL-2013

    {------------------------------------              CONFIGURACI�N            ----------------------------------------}
    IntCrCfgTasa,       //Tasas de Inter�s
    IntCrProduct,       //Configuraci�n de productos de Cr�ditos
    IntMProdGpo,        //Cat�logo de Grupo de Productos
    IntCrProdCom,       //Configuraci�n Producto Moneda
    IntCrPrSeCo,        //Relaci�n Producto - Sector Contable EASA 

    IntCrReCoAf,        //Relaci�n Concepto - Afectaci�n
    IntCrReOpCo,        //Relaci�n Operaci�n - Concepto

    IntCrStConfi,       //Configura Situaciones
    IntCrStValid,       //Cat�logo de Situaciones Manuales
    IntCrCaStMa,        //actualiza situaci�n de creditos
    {------------------------------------                CONSULTAS              ----------------------------------------}
    IntCrInteres,       //Consulta a Periodos de Intereses
    IntCrTransac,       //Consulta Transacciones
    IntCrDetTran,       //Consulta de detalle de transacciones
    IntCrCoMail,        //Consulta Mails enviados
    IntCrCapital,       //Consulta a Periodos de Capital
    IntContents,        //Cat�logo de Contens
    IntVcrcapita,       //Consulta de Periodos de Capital
    IntVcrcomisi,       //Consulta de periodos de Comisi�n
    IntVcrIntere,       //Periodos de interes
    IntCrCapOp,         //Captura de Operaciones ( Actualizador )
    IntCrTblAmo,        //Consulta Consoldado de Amortizaci�n RIRA4281 31Dic10
    IntCrCarPlaz,       //Consulta de cartera de cr�ditos Icre e Intercreditos por plazos de vencimiento  //RABA4523 AGO-2016
    {------------------------------------         DESCUENTO DE DOCUMENTOS       ----------------------------------------}
    IntCrEmisor,        //Emisor
    IntCrEmGpPr,        //Cat�logo de Proveedores por Emisor
    IntCrTDocto,        //Tipos de Documentos
    IntCrEmisDoc,       //Documentos por Emisor
    IntCrProveed,       //Proveedor
    IntCrGruPro,        //Grupo de Proveedores
    IntCrEmiPro,        //Relaci�n Emisor - Proveedor
    IntCrCesion,        //Alta de Cesi�n
    IntCrDocto,         //Alta Documento
    IntCrEmiSeg,        //Relaci�n Emisor - Seguimiento
    IntCrCesCom,        //Consulta de Comisi�n a Proveedor
    IntCrProSec,        //Sector por proveedor
    IntCrArchNaf,       //Carga de Archivos NAFIN
    IntCrNotific,       //Notificaci�n de Cesiones
    IntCrveemipr,       //Notificaci�n de Vencimientos Email
    IntCrEmaEmi,        //Relaci�n Destinatarios (email) con el Emisor
    IntCrCoCtDt, // FJR catalogo de catalogos restringido para tipos de liquidacion
    IntCrManRem,        //Manejo de Reman}entes
    IntCrReFaEle,       //Reporte de Documentos de Factoraje Electr�nico JFOF 16/10/2012
    IntCrRepAler,       //Reporte de Alertas de Vencimientos "Emisor" JFOF 07/02/2013

    IntCrAmefac,        //Genera Informaci�n AMEFAC
    IntSfeRecept,       //Factura Electr�nica  ROIM Nov 2009
    {------------------------------------                 COBRANZA              ----------------------------------------}
    IntCrSeCoPr,        //Seguimiento de Cobranza (Promotor)
    IntCrSeCoTo,        //Seguimiento de Cobranza (Tesoreria)
    IntCrcobranz,       //Cobranza de cr�ditos
    IntCrCancCob,       //Cancela Cobranza
    IntCrFinAdic,       //Financiamiento Adicional
    IntCrCdQtQbC,       //Quitas, Condonaciones, Quebrantos y Castigos
    IntCrCobPas,        //Liquidaci�n de cr�ditos pasivos
    IntCrProCap,        //Prorrateo Capital Sofoles   ROIM 20/06/2006    
    IntMProrrateo,      //Prorrateo Capital   ROIM 20/06/2007
    IntCrVtaCart,       //Venta de cartera vencida JAGF24/11/2010
    {------------------------------------                 REPORTES              ----------------------------------------}
    IntCrMQCoIm,        //Referencia de unidad para:                        Reporte Consolidado de Cartera Impagada.
    IntCrMQSGLI,        //Referencia de unidad para:                        Reporte Seguimiento de Garant�a Liquida.
    IntQMColCob,        //Reporte resumen colocaci�n/cobranza  ROIM 27112008    
    IntMProVeMa,        //Pronostico de Vencimiento Masivo    // ROIM Agosto 2009
    IntMReEmiPro,       //Documentos por Emisor/Proveedor
    IntMReDocEmi,       //Documentos por Emisor
    IntMAvCesion,       //Avisos por Cesi�n
    IntMAvDoc,          //Avisos por Remanentes, Inter por Dev.
    IntMProxEmi,        //Proveedores por Emisor
    IntMReDevCom,       //Devoluciones(Remanente-Intereses Devengados, Comisi�n por pago Oportuno)
    IntMReAuCred,       //Autorizaciones de Dispos.
    IntMInfCobr,        //Informe de Cobranza.
    IntMSgCobr,         //Seguimiento de Cobranza.
    IntMProgVen,        //Programaci�n de Vencimientos.
    IntMColoca,         //Reporte de Colocaci�n y/o Vencimientos.
    IntMRecPremi,       //Intereses cobrados por anticipado.
    IntMCoChAd,         //Consulta de Chequeras Adminstrativas.
    IntCrMFinAdi,       //Informe Financiamiento Adicional.
    IntMReFondeo,       //Fondeo Diario.
    IntMCrCobCom,       //Reporte de Comisiones Cobradas
    IntMBiAvMail,        //Bitacora de control de avisos por mail
    IntMProVeGl,        //Reporte de Adeudos Global JFOF Diciembre 2011  
    IntMCtrlColo,       //  FJR 06/01/2012  CONTROL DE COLOCACION	
    IntRsmColo,	        //ENVIO DE RESUMEN DE COLOCACION

    IntCrRepFov,        //Reporte de Eventos Fovis
    IntCrEstHist,       //Consultas Estad�sticas Hist�ricas.

    IntMRepCtrol,       //Reporte de Control de Garant�as.
    IntMRepGarAc,       //Reporte de Estado Garant�as-Disposici�n.
    IntMRepGlbCr,       //Reporte de Garant�as Global de Cr�ditos al Sector Agropecuario.

    IntMInfCoCob,       //Informe de la Cobranza  Contable.
    IntMSenicreb,       //Reporte Relaci�n de Responsabilidades para Banco de M�xico
    //< EASA4011  28/07/2006
    IntMCedExPg,        //C�dula de Experiencia de Pago
    IntMEdoMovto,       //Estado de Movimientos
    //EASA4011 >/
    IntMProAdeudo,      //Pron�stico de Adeudo.
    IntMDispDet,        //Orden de Disposici�n/Detalle de Cr�dito.
    IntMCaTMin,         //Reporte de Cat�logo M�nimo.
                        //Colocaci�n por Promotor.
    IntMIngProm,        //Reporte Ingresos por Promotor
    IntMCartVenc,       //Reporte Cartera Vencida por Promotor
    IntMGarFeg,         //Reporte de Garant�as FEGA
    IntMAccion,         //Reporte Integraci�n Accionaria
    IntMAAFega,         //Reporte de antiguedad de Aplicaci�n de Garant�as FEGA
    IntMSegGar,         //Reporte de Situaci�n de P�lizas de Seguro por Garant�a
    IntMCrCostFe,       //Reporte de Costo Fega

    IntMRepSieb,        //Reporte de Sieban

    IntMProvDiar,       // Reporte de Provisi�n Diaria

    IntMFndColoc,       //Reporte de colocaci�n pasiva
    IntMFndProv,        //Reporte de Provision pasiva
    IntMFndVenc,        //Reporte de Vencimientos pasivo
    IntMrPasivo,        //Reporte de cartera pasiva JFOF 12/04/2012
    IntMFndCLP,         //Reporte de Pasivo Corto Largo Plazo ROIM 2014.06.13

    IntMContVenc,       //Reporte de Vencimeintos Contabilidad
    IntMrCocamor,       //Reporte Comisiones, Castigos y Moras Cobradas JFOF 12/04/2012

    IntMRepCtaChqAcr,   //Ctas de Chq Asociadas al Acreditado  QR
    IntMRepSdoPr,       //Saldo Proyectado Mes Siguiente   QR
    IntMSdosProm,       //Saldos por Promotor
    IntMResSdosProm,    //Resumen de Saldos por Promotor
    IntMCreInscDeu,     //Cr�ditos con Inscripci�n de Deuda
    IntMComCobPr,       //Comisiones Cobradas por Promotor
    IntMDetAcred,       //Resumen Detalle por Acreditado
    IntMExpPago,        //Experiencia de Pago
    IntMConsAdeu,       //Consolidado de Adeudos
    IntCnsadto,         //Consolidado de Adeudos Total c/Cartas de Credito
    IntMCliEntFi,       //Reporte de Clientes de Entidades Finacieras, Municipios y sus Organismos Descentralizados
    IntMSdoBloqDesblq,  //Relaci�n de Saldos Bloquedos y Desbloqueados
    IntMBitQCQC,        //Bit�cora de Quitas, Condonaciones, Quebrantos y Castigos
    IntMCompDep,        //Comparativo de Dep�sitos esperados contra Dep�sitos recibidos por Concepto de Fuente de Pago
    IntMMovEntFe,       //Reporte Mensual de Movimientos de Creditos a Entidades Federativas, Municipios y sus Organismos Descentralizados
    IntMRecRecib,       //Recursos Recibidos
    IntMRepVenc,        //Reporte de Vencimientos

    IntMCalifAcr,       //Reporte de Calificaci�n por Acreditado
    IntMCapGobMp,       //Capitalizaci�n Gobiernos y Municipios
    IntCrFISoPa,        //Solicitudes Pago FIDEICOMISO
    IntCrplazoresi,         //Plazo Residual Largo Plazo y Corto Plazo    06/Nov/2009


    IntMPlazoRes,       //Reporte Plazo Residual
    IntMQResumCR,       //Reporte Plazo Residual
    IntCrPlazoRes,      // Plazo Residual                                       HEGC 03/11/2009

    IntCrCartera, //MARA4356 OCT2006 reporte cartera crediticia institucional

    IntMQLiMaxFi,       //L�mite M�ximo de Financiamiento       EASA4011        12.FEB.2007 Req. 2006 - 08 / 011

    IntRepCre50M,      //AACE4754   Reporte Semanal de Creditos con montos autorizados mayores a 50 millones
    IntMQDApIVA,        //Referencia de unidad para: Reporte de Detalle de Aplicacion de IVA.
    IntCrCarFinq,       //Carta finiquito                       // RABA 13 JUL 2011
    IntCrMBiCarF,       //Bit�cora Cartas Finiquito / Confirmaci�n de Saldos  // RABA 27 JUL 2011
    IntCrmprvea,        //Reporte de Vencimientos              // JFOF 20/07/2011
    IntMOpeInt,        // RABA JUN 2012   Reporte Operativo de Inter�ses
    IntMCVdaRan,       // RABA JUL 2012   Reporte Cartera vencida por Rangos
    IntMMovCVda,       // RABA JUL 2012   Reporte de Movimientos de Cartera vencida	
    IntCrVarMge,       // Reporte Variaci�n de Margen // GAHA4823 21/08/2012
    IntCrRepInfr,      //Reporte Mensual de Infraestructura JFOF 13/05/2013
    IntCrBitTran,       //Bitacora de Transacciones JFOF 30/07/2013
    IntCrDispLiq,       //Reporte de Disposiciones y Liquidaciones JFOF 03/09/2013

    IntCrContPpo,       //Res�men de Movimientos de Provisi�n (PPO) - Reportes JFOF 21/10/2013
    {------------------------------------             ESTADOS DE CUENTA          ----------------------------------------}
    IntCrImpEdCt,       //Generador de Estado de Cuenta
    IntMEdoCta,         //Estado de Cuenta
    IntMEdoCtaDD,       //Estado de Cuenta de Descuento de Documentos
	IntEdoMailAb,      //Env�o x Mail de Estados de Cuenta ABCD 
    
    IntMEdoCtaC,        //Estado de Cuenta certificado
    IntCrEcCoSo,        //Estado de Cuenta certificado
    IntMImpECC,         //Impresion de Estado de Cuenta Certificado
    IntCrCfdBit,        // CAPM JUN.2013 PRUEBAS DE DESARROLLO 

    {------------------------------------             APERTURA Y CIERRE          ----------------------------------------}
    IntCrcierre,        //CIERRE
    IntCrCierCo,        //CIERRE COINCRE JFOF 12/11/2013
    IntCrCieEdc,        //CIERRE EDOCTA JFOF 25/02/2014
    IntCrApert,         //APERTURA
	
    IntCrGenBCL,        //Genera BC_LAYOUT 13/05/2010 MAGV	
    //#################################################################
    // RUCJ4248 : Se agrega unidad de Re-digitalizaci�n de Doc. de Cierre
    //#################################################################
    IntCrRedigitaDoc,
    {------------------------------------              LIQUIDACIONES            ----------------------------------------}
    IntCrLiqPerf,       //Grupo Perfil de liquidaci�n
    IntCrliquida,       //M�dulo de Liquidaciones
    IntCrLiqDis,        //M�dios de Liquidaci�n para Disposiciones
    IntMliquidac,       //Reporte de Liquidaciones
    {------------------------------------              AGROPECUARIO             ----------------------------------------}
    IntProrroga,        //Bit�cora de Pr�rrogas

    IntCrFiCaSe,        //Cat�logo FIRA Seguros
    IntCrFiCoIn,        //Cat�logo FIRA Concepto Inversi�n
    IntCrFiCaPa,        //Cat�logo de FIRA Causa de Pago
    IntCrSubPro,        //Cat�logo de Subdivisiones de PROCAMPO
    IntCrCiProc,        //Cat�logo de Ciclos de PROCAMPO

    IntCrGaSoApl,       //Consulta de Solicitud de de Garant�as
    IntCrGaSoLi,        //Solicitud de Garant�a Liquida
	  IntCrVencAnt,    //Modulo de Vencimientos Anticipados 08.04.2011
	  IntCrCancPas,    //Modulo de Cancelacion Pasiva 08.04.2011
    IntCrGaSoFe,        //Solicitud de Garant�a FEGA
    IntSolFEGAco,       //Solicitud de Garant�a FEGA (Gtia. Liq Cero)

    IntMSolFact,        //Facturaci�n de SIEBAN

    IntCrApGaFe,        //Aplicaci�n de Garant�a FEGA
    {------------------------------------            INSTRUMENTACI�N            ----------------------------------------}
    IntMCatEncab,       //Cat�logo de Encabezados
    IntMCatDet,         //Cat�logo de Detalle
    IntMCatFirma,       //Cat�logo de Grupo de Firmas
    IntMUsuFirma,       //Cat�logo de Usuarios por grupo de Firmas
    IntMTpCto,          //Tipo de Contrato
    IntMReCto,          //Impresiones por Solicitud
    IntMProemio,        //Proemio
    {------------------------------------                GARANT�AS              ----------------------------------------}
    IntMTipoGar,        //Cat�logo de Clasificaci�n de Garant�as
    IntMGarantia,       //Cat�logo de Tipo de Garant�a
    IntMProdGar,        //Producto - Garant�a
    IntMFiraEq,         //Equivalencia de Cobertura Porcentual
    IntMTipoRamo,       //Tipo de Ramo
    IntMTipoPol,        //Tipo de P�liza
    IntMPerito,         //Cat�logo de Peritos
    IntMNotario,        //Cat�logo de Notario / Corredor
    IntMFiraOpe,        //Cat�logp de Operativa
    IntMRegistro,       //Registro de Garant�as
    IntMConAcred,       //Garant�as por Acreditado
    IntCrGaraPer,       //Garant�as Personales
    IntCrCaTiGa,        //Cat�logo Tipo de Garant�as
    IntCrCaTiAv,        //Cat�logo Tipo de Avales
    IntCrGaraCto,       //Consolidado de garantias por linea
    IntCredExcGa,       //Cr�ditos Excluidos de las Garant�as L�quidas
    IntCrHistGar,       // Reporte de Hist�rico para Estados y Municipios
    IntCrGaPpReg,       //Registro Garant�as Primeras P�rdidas      ROUY4095 032015
    {------------------------------------           PORTAFOLIO DE CREDITO       ----------------------------------------}
    IntCrTAve,          // Cat�logo de Acreditado en Vigilancia Especial -AVE- Se relaciona con el Acreditado
    IntCrRegion,        // Cat�logo de regiones - Tiene relacion con el Contrato
    IntCrMercObj,       // Cat�logo de mercado al que esta dirigido el contrato
    IntCrMeObDe,        // Cat�logo de Sub Mercado Objetivo
    IntCrGpFiMa,        // Cat�logo de L�mites
    IntCrCapBas,        // Cat�logo de Capital B�sico para Estados y Municipios
    IntCrMaxFnEd,       // Reporte de L�mite M�ximo de Financiamiento a Estados
    IntCrCarteraBc,     // Consulta Cartera por Banca
    IntCrLCbVsCr,       // L�mite de Capital B�sico Vs Cartera Real
    IntIntCrGpIn,       // Reporte de Infraestructura y construcci�n
	IntCrCartReg,       // Reporte de Cartera por Regi�n
    IntCrCartDiv,       // Reporte Cartera por Divisa
    IntCrPlazoVenc,     // Consulta por Plazo de Vencimiento
    IntCrSecPubl,       // Reporte Cartera por Sector P�blico
    IntCrEdMpios,       // Reporte Cartera a Estados y Municipios
    IntCrAcreMax,       // Reporte de Cartera de Estados y Municipios - Acreditados Mayores -
    IntCRCartCon,       // Cartera por Consumo
    IntCrCrtScPu,       // Reporte de Cartera por Sector Econ�mico (Sector P�blico)
    IntCRInfAves,       // Informe de Seguimiento (AVES)
    IntCrCompBan,       // Comparativo por Banca
    IntCrCompInf,       // Comparativo por Banca (Infraestructura y construcci�n)
    IntCrResCali,       // Reservas Totales por Calificaci�n
    IntCrResEyMC,       // Reservas EyM por Calificaci�n
    IntCrCompSeP,       // Comparativo Sector P�blico
    {------------------           Modelo din�mico para Metodolog�as de Comercial       -------------------------------}
    IntCrMetMode,       // Configuraci�n de Modelos din�micos
    IntCrMeTaRe,        // Configuraci�n de Tablas referenciadas
    IntCrMetVari,       // Configuraci�n de Variables
    IntCrMetMeto,       // Configuraci�n de Metodolog�as
    IntCrMetPers,       // Configuraci�n de Personas
    IntCrMeAsMo,        // Asignaci�n de Modelos a Personas y Metodolog�as
    IntCrAnxMasv,       // Carga masiva por Anexo 20, 21, 22, 24 y 25
    {------------------------------------              DOCUMENTACI�N            ----------------------------------------}
    IntMTramite,        //Cat�logo de Tr�mites
    IntMDoctos,         //Cat�logo de Documentos
    IntMRelDocTr,       //Cat�logo de Relaci�n Tr�mite - Documento
    IntMProdTram,       //Cat�logo de Relaci�n Producto -Tr�mite
    IntMNRiesgo,        //Cat�logo de Niveles de Riesgo
    IntMDoMedio,        //Cat�logo de Medio
    IntMPerfUsu,        //Alta de Acceso
    IntMRecTra,         //Alta de Tr�mite
    IntMCteDoc,         //Alta de Documento por Acreditado...
    IntMExpAcreD,       //Documentos por Acreditado
    IntMReExcPen,       //Reporte de Excepciones
    IntMReDocCte,       //Reporte de Seguimiento del Cliente
    IntMColProm,        //
    {------------------------------------         Mantenimiento de Pagar�s      ----------------------------------------}
    IntCrRelPag,        // Relaci�n de Pagar� - Disposici�n
    IntCrRnvPag,        // Renovaci�n en Bloque de Pagar�s
    IntMRepCau,          // Reporte de Garant�as

    IntVcrdocume,       //documentos
    IntCrGpTaIn,        //grupo de Tasas
    IntCrEmail,         //Cat�logo de Cr Email
    IntCrEmaDat,        //Cat�logo de Cr Email Datos
//    IntCrTasdesc,       //Consulta de Tasas Equivalentes
    IntCrCoArNaf,       //Configuraci�n del Archivo de NAFIN
    {-------------------------------------             HIPOTECARIOS           -----------------------------------------}
    IntCrArchSAT,        //Generador de Archivos de impuestos cr�ditos Hipotecarios

    {-------------------------------------             TAS                    -----------------------------------------}
    IntCrTAS,

    {----------------------------- Constancias -----------------------------}
    IntMqrconsta,       // Control Impresi�n Constancias Hipo,
    IntSatCreLay,       // Constancias Hipotecarias

    {----------------------------- Calificadoras ------------------------------}
    IntCrCalific,       // Cat�logo de Calificadoras
    IntCrTRiesgo,       // Cat�logo Tipo de Riesgo
    IntCrCalCali,       // Cat�logo Calificaciones de Calificadoras
    IntCrReCaAc,        // Relaci�n Calificadora - Acreditado
    IntCrCalAcre,       // Calificaci�n Acreditado por Calificadora
    IntCrCaArDe,        // Administraci�n Archivos de Calificaci�n
    IntCrCalCons,       // Consulta Calificaciones por Acreditado


    {----------------------------- Fideicomiso Maestro ------------------------}
    IntCrFidReg,        // Reglas para Emisi�n Solicitudes Fideicomisos
    IntCrFidDele,       // Cat�logo Delegados Fiduciarios
    IntCrFidMae,        // Alta FIDEICOMISO Maestro
    IntCrReFiDi,        // Relaci�n FIDEICOMISO Maestro-Disposici�n
    IntCrFidCorr,       // Destinatarios de Avisos FIDEICOMISOS

    {----------------------------- Capitalizaci�n -----------------------------}
    IntCrCalCapi,       // Par�metros de Capitalizaci�n

    {----------------------------- Creditos PYME -----------------------------}
    IntMGenArch,        // Generaci�n de archivos
    IntCrCbSoNa,        // Solicitud de garantia NAFIN

    {----------------------------- Riesgo Mercado -----------------------------}
    IntCrRiesMdo,       // Pct. para Criterios Capit. Agropecuario
    IntMRsgMdoAg,       // Req. Capitalizaci�n de Agropecuario

    {----------------------- Digitalizaci�n de Reportes -----------------------}
    InTCrCRepDig,
    IntCrBcClOb,

    {-------------------------------- COINCRE ---------------------------------}
    IntMQrCoCo,         //Reporte Comparativo COINCRE Contable vs Operativo
    IntCrUpCoCo,        //Pantalla de Cambios Contables
    IntMQrCoin,         //Pantallas de Consulta COINCRE          ROIM 20/06/2006
    IntCrCoincPb,       //Registro Promotor BONO
    IntCrCoincR,        //Consulta R�pida de COINCRE              SATV 25.01.2008
    IntCrCoInRi,        //Consulta Integral de Riesgos    ROIM 20/10/2008
    IntEstResRC,        //Estimacion Preventiva para Riesgos Crediticios RUCJ4248

    IntCrCarRie,        // Carga masiva para informaci�n de Riesgos para Anexo 19   //RABA JUN 2016 ACTUALIZACI�N R04C


    {-------------------------------- COSTO ANUAL TOTAL CAT--------------------}
    //IntCrCat      ,   //ROIM Se cambia por la unidad IntCrCatSol     15/05/2008
    IntCrCatSol,	//ROIM Pantalla de C�lculo del CAT 15/05/2008

    {--------------------------------  eBur� ------------------------}
    IntCrConc,           // M�dulo de conciliaci�n para Bur� de Cr�dito       MAGV 200911
	IntCrRegenHistoCred, // M�dulo de regeneraci�n para Bur� de Cr�dito       AGF  20120117

    {-------------------------------- Interfase metify ------------------------}
    IntCreConDri,       //MARA4356  OCT2006 configuraci�n para Interfase metify
    IntCrMetify,        //MARA4356 OCT2006 generaci�n de archivo metify


    {LOLS 26 DIC 2006. CREDITO EN LINEA }
   
    IntCrbloqaut,       //Captura manual de bloqueos
    IntCrCobAcc,        //Cobranza de comisiones x acred/aut
    IntCrCreMar,        //Disposici�n marco
    IntCrMoOpDia,       //Monitoreo de operaciones del dia
    IntCrMoPrOp,        //Monitoreo de proyecci�n de operaciones
    IntMComCobAn,       //Devengaci�n de comisiones
    IntMIncDecPe,       //Incrementos/Decrementos del per�odo
    IntMProxVenc,       //Proximos vencimientos de temporada
    IntMMovXInt,        //Bitacora de movimientos x internet
    IntMAuBlqDes,       //Reporte de Autorizaciones Bloqueadas / Desbloqueadas
    {ENDS_LOLS}

    IntMQrComCta,       //Reporte de Comisiones Contables                      SATV4766 11/05/2007
    IntCrCoCtCc,        //Asignaci�n de Centros de Costo a Cuentas Contables   SATV4766 11/05/2007
    IntRepEdoCta,       //Carta de Dep�sito Referenciado para ICRE   MARA4356 10/10/2007

    IntIcresap,         //Interfaz ICRE-SAP                                    SATV4766 07/04/2008
    IntMQrSHF,          //Reporte Disposiciones con Garant�a SHF               SATV4766 14/04/2008
    IntCgCueEqu,        //Cat�logo Ctas. Equivalentes                          SATV4766 18/04/2008

    IntCrReAcCt,        //Relaci�n Emisor-Contrato                             SATV4766 07/05/2008
    IntCrCoAdHi,         //Actualizador de Consolidado Adeudo y COINCRE         SATV4766 03/11/2008

    IntCrBlqConc,       // Cat�logo Concepto de Bloqueo                        SATV4766 07/11/2008
    IntCrBlqOper,       // Cat�logo Operaci�n de Bloqueo                       SATV4766 10/11/2008
    IntCrTraBlo,        // Relaci�n Garant�a Chequera - Disposici�n            SATV4766 11/11/2008
    IntCrTrBlMa,        // Adm. General Chequera Garant�a de Disposici�n       SATV4766 11/11/2008
    IntMBlqMa,          // Reporte de Garant�a por Chequera - Disposici�n      SATV4766 18/11/2008
    IntCrCaCoBl,         // Captura de Conceptos a Bloquear                     SATV4766 21/12/2008

    // Regulatorios
    IntCrCoReCc,         // Cartas de Cr�dito
    IntCrCciConc,        // Conceptos Cartas de Cr�dito
    IntCrCciRepo,         // Reporte de Cartas de Cr�dito

    IntCrCoABRep,        // Reporte de Nomina. Cr�ditos ABCD                     MAGV     26/12/2010

    {------------------------------------             ESTADOS DE CUENTA          ----------------------------------------}
    IntMEdoCtaCt,     // Estado de cuenta certificado 13/01/2010   ROIM
    {------------------------------------               AGRONEGOCIOS              ----------------------------------------}
    IntCrAmBitac,       //Bitacora AgroMasivo         19/03/2010  ROIM
    IntCrCoBita,        //Consulta Bitacora         19/03/2010  ROIM

    IntCrDispF,         //Disposici�n                  19/04/2010  MAGV
    IntCrPersF,         //Persona                      26/04/2010  MAGV
    IntMProAdeuF,       //Reporte de edo cuenta        03/05/2010  MAGV
    IntCrAmOtrad,	//Otros adeudos
    IntCrContrF,        //Contrato
    IntCrSeguroF,       //Seguro                  
    IntCrAmMacro,       //Macrobase
    IntCrPobGar,        //Poblador de garant�as     25/03/2010  MAGV
    IntCrPobSeg,        //Poblador de seguros       12/07/2010  MAGV
    IntCrPobInd,        //Poblador de seguros       19/07/2010  MAGV
    IntCrSigDirr,        //Cat�logo de direcciones SIGIA 20110920 MAGV
    {------------------------------------             CR�DITO RESTRINGIDO        ----------------------------------------}
    IntCrCreRest,        //Cr�dito residual 07/06/2010 MAGV
    {------------------------------------                 REPORTES              ----------------------------------------}
    IntMDCartVda,       //Reporte de d�as de cartera vencida.   // Ana Lilia Escalona Asteci
    {------------------------------------  CARGA MASIVA DE ACREDITDOS EN RECUPERACION  ----------------------------------------}
    IntCrAcrReCM,
     {------------------------------------  REPORTE DE APLICACIONES Y RECUPERACIONES  ----------------------------------------}
    IntMApliRecu,   //Modulo de Reporte de Aplicaciones y Recuperaciones de Garantias
    {--------------------------------------  CAMBIO DE LINEA  ----------------------------------------}
    IntCrcamblin,
	IntCrRevGar,     //Modulo de Reversa de Garantias 15.03.2011	
    {------------------------------------  CAMBIO DE OPERATIVAS  ----------------------------------------}
    IntCrCambiaO,
    {------------------------------------  MODULO BUR�  ----------------------------------------}
    IntCrBCParm,   // FJR 03.12.2012 Pantalla de par�metros para BC_LAYOUT.
    IntBcLayExc,   // FJR 21.12.2012 Carga de excepciones BC_LAYOUT.
    IntCBCOpn,      //HCF 05Feb2013 Consultas Repositorio Bur�
    IntCrBCAfec,    //FJR 27.06.2013 Para determinar afectaci�n de claves de operaci�n en generaci�n BCLayout.
    IntBcLayVC,    // FJR 18.09.2013 Carga de venta de cartera BC_LAYOUT.
    IntBCTBaja,    // FJR 17.02.2014 Pantalla de consulta para tipos de baja y clave de observaci�n con l�gica bur�.
    IntCrCaTiAB,   // ROUY4095 OCT2015 Claves Tipo Aval Bur�
    {------------------------------------  CONTROL DE POSIBLE PREMIO A OTORGAR  ----------------------------------------}
    IntCrPorcPPP,   // Porcentajes de PPO.
    IntMIntAplPr,   // Reporte de Integraci�n y Aplicaci�n de Premios por Pagar.
    IntMCtrlPre,    // Reporte de control de premios.
    IntCrRegPPP,    // Registro de Movimientos.
    IntCrProrPPP,   // Prorrateo de PPO.
    IntCrMovPPP,    // Cat�logo de Movimientos de PPO.
    IntCrPPP,       // Posible premio a otorgar.
    IntCrPPOMen,    // Calculo de ajustes de provision mensual PPO.
    IntConsitpre,   // Consulta Situaci�n de Premio (Contraloria)
    IntCrConsLin,    // Consulta Lineas de Cr�dito (Contralor�a)

    IntCrParamTC   // Actualizaci�n de par�metros para traspaso entre carteras        //RABA OCT 2014
    ,IntCrR04ACatOper  // Cat�logo de claves de operaci�n de reportes R04A           // ERF 22/12/2015
    ,IntCRR4Carga      // Cargas de reportes R04A                                    // ERF 28/12/2015
    ,IntCrR4Conf;        // Configuraci�n de Reportes Regulatorios                   // ERF 22/02/2016
    //MODULO Y

{$R *.DFM}


procedure TwPrincipal.InterApliMenuClick(Sender: TObject; var NomFuncion: String);
var //pruebas    : TPruebas;
    CrConInv   	: TCrConInv;   //Conceptos de Inversi�n AgroMasivo         30/03/2010  ROIM
    CrGenBCL  	: TCrGenBCL;   //Genera BC_LAYOUT          				   13/05/2010  MAGV
    CrAnNaf: TCrAnNaf;         //Generaci�n y emisi�n de Archivo NAFIN Anexo 8 y 9    ROIM JULIO 2009

	SdoAgrMas: TSdoAgrMas;         //Generaci�n de saldos en excel 20/10/2010 MAGV	
	
    Acredit    : TCrAcredit;
    CreChe     : TCrCreChe;
    chqradlls  : TCrChqDll;

    BloqDesblq : TCrBlqDblq;
    MonitDepos : TCrMonDep;


    MAcredRel : TMAcredRel;
    MAutCred  : TMAutCred;
    MCapBasic : TMCapBasic;
    MRepCrRel : TMRepCrRel;
    CrCartrIm : TCrCartrIm;       //Detalle CArtera Impagada por Acreditado
    CrEdoMun  : TCrEdoMun;	  //Cat�logo de Estados y Municipios para Bur� de Cr�dito
    CrAcredCM : TCrAcredCM;   //Acreditado en Concurso Mercantil    RABA ABR 2013
    CrAcrDmPs : TCrAcrDmPs;   //Evidencia de Capacidad de Pago Acreditado JFOF 01/04/2013
    
    //CONTRATO
    Contrato   : TCrCto;
    AutLinDisp : TCrAutClin;

    //DISPOSICIONES
    Credito    : TCrCredito;
    MDispFond  : TMDispFond;
    CrMonDisp  : TCrMonDisp;

    //CONTROL OPERATIVO
    Excepci    : TCrExcepci;
    ExcepApli  : TExcepApli;

    PerfilUs   : TCrPerfiUs;
    PerfUsProd : TCrPePrUs;

    PromAsocia : TCrPromAsc;
    PromAdmon  : TCrPromAdm;

    ComEvent   : TCrComisEv;
    CaMoCom    : TCrCaMoCom;

    //CATALOGOS
    CrRoeFond  : TCrRoeFond;
    CrRoeProd  : TCrRoeProd;
    CrRoeLneg  : TcrRoeLneg;
    CrRoePneg  : TcrRoePneg;		
		
    TraInt    : TCrTraInt;   //Cat�logo de Tasas por rangos                      Aar�n Hernandez Asteci Octubre 2009
    CrImpDire  : TCrImpDire; //Cat�logo de directores para reporte de consolidado de cartera impagada   .   Juan Javier Amado Asteci Octubre 2009
    CrImDiPr   : TCrImDiPr;  //CAt�logo de las relaciones Directores - Productos                        .   Juan Javier Amado Asteci Octubre 2009

    CrCoiCon   : TCrCoiCon;
    tipacred   : TCrTAcre;
    gpoeco     : TCrGrupEco;
    sececo     : TCrSectEco;
    tamacred   : TCrTamAcre;
    CalAcr     : TCrCalAcr;
    ClaLegal   : TCrClaLeg;
    OrigRec    : TCrOrigRec;
    Destino    : TCrDestino;
    CatMini    : TCrCatMini;
    Amortiza   : TCrAmortiz;
    PagInt     : TCrPagInt;
    PctCapital : TCrPctCapi;
    SecTamAcr  : TCrSeTaAc;
    TiposRelac : TCrTipRel; //easa4011  24052005
    ProdCorp   : TCrProCor;
    CrLocCnb   : TCrRePaCnb;
    CrMunCnb   : TCrMunCnb; //RUCJ4248
    LiqMoneda  : TCrReLiMn;
    CrUniTie   : TCrUniTie;
    CrAcrCon   : TCrAcrCon;
    CrTRedond  : TCrTRedond;
    TipoCred   : TCrTCredit;
    SectCont   : TCrGpPrSe;

    AplicSaldo : TCrAplSal;
    MedioLiq  : TCrLiqMedi;
    CalculoInt : TCrCalcInt;
    CrAgrChe   : TCrAgrChe;
    CrGpCheq   : TCrGpCheq;

    Operacion  : TCrOperaci;
    Concept    : TCrConcept;
    CatComi    : TCrCatComi;
    Afectac    : TCrAfectac;
    CrParametro: TCrParamet;
    Accesorio  : TCrAccesor;
    Situacion  : TCrSituaci;

    MInstDesc  : TMInstDesc;
    MPrgApoyo  : TMPrgApoyo;

    CrFrmtoNaf : TCrFrmtNaf;

    CrSalMin   : TCrSalMin;
    GruClaves  : TCrGruCla;
    CrTpoTel   : TCrTpoTel ;  // FJR CATALOGO DE TIPOS DE TELEFONO.
    CrCatHrFe  : TCrCatHrFe;  // Cat�logo de Horario Descuento de Documentos JFOF
    CrCtaCont  : TCrCtaCont;  //Cat�logo de Cuentas Contables JFOF OCT-2013

    CrCaCaMi   : TCrCaCaMi;   //Cat�logo para Clasificaci�n Contable RABA FEB-2016

    // CAT�LOGOS PARA O17  OCT 2013
    CrProdBca  : TCrProdBca;  //Cat�logo de Productos de Banca JFOF JUL-2013
    CrGpoPBca  : TCrGpoPBca;  //Cat�logo de Grupo Producto de Banca JFOF AGO-2013
    CrCatArNe  : TCrCatArNe;  //Cat�logo de �rea de Negocio JFOF JUL-2013
    CrRelTCre  : TCrRelTCre;  //Cat�logo Tipo de Cr�dito JFOF JUL-2013

    //CONFIGURACION
    CrCfgTasa  : TCrCfgTasa;
    Producto   : TCrProduct;
    MProdGpo   : TMProdGpo;
    ProdComis  : TCrProdCom;
    ProdSecCont: TCrPrSeCo;

    ReCoAf     : TCrReCoAf;
    ReOpCo     : TCrReOpCo;

    ConfiSit  : TCrStConfi;
    SitManual : TCrCaStMa;
    ValiaSit   : TCrStValid;

    //CONSULTAS
    Interes    : TCrInteres;
    Transac    : TCrTransac;
    DetTransac : TCrDetTran;
    CrMailEnv  : TCrCoMail;
    Capital    : TCrCapital;
    CatContens : TContents;
    PerCap     : TVcrcapita;
    PerComis   : TVcrcomisi;
    PerInt     : TVcrIntere;
    CapOper    : TCrcapop;
    //DESCUENTO DE DOCUMENTOS
    Emisor     : TCrEmisor;
    EmisGpoPrv : TCrEmGpPr;
    TipoDocto  : TCrTDocto;
    EmisDocto  : TCrEmisDoc;
    Proveedor  : TCrProveed;
    GrupoProv  : TCrGruPro;
    EmiPro     : TCrEmiPro;
    Cesion     : TCrCesion;
    Documento  : TCrDocto;
    EmiSeguim  : TCrEmiSeg;
    CrCesComis : TCrCesCom;
    ProvSector : TCrProSec;
    CarArchNaf : TCrArchNaf;
    CrNotific  : TCrNotific;
    Crveemipr  : TCrveemipr;
    CrEmaEmi   : TCrEmaEmi;
    CrCoCtDt : TCrCoCtDt ;
    ManRem     : TCrManRem;
    CrReFaEle : TCrReFaEle;  // Reporte de Documentos de Factoraje Electr�nico
    CrRepAler  : TCrRepAler;  //Reporte de Alertas de Vencimientos "Emisor" JFOF 07/02/2013
    
    Amefac     : TCrAmefac;
    SfeRecept  : TSfeRecept;   //Factura Electr�nica  ROIM Nov 2009

    //COBRANZA
    SegCobProm : TCrSeCoPr;
    SegCobTeso : TCrSeCoTo;
    CobranzaCre: TCrcobranz;
    CancelaCob : TCrCanCob;
    FinAdic    : TCrFinAdic;
    CrCdQtQbC  : TCrCdQtQbC;
    CrCobPas   : TCrCobPas;
    MProrra    : TMProrrat;  //CAMBIO PRORRATEO DE CAPITAL   ROIM 20/06/2007
    VtaCartera : TCrVtaCart;
    //REPORTES
    MQSGLI    : TCrMQSGLI;  //Referencia a la nueva clase de impresion de reporte de Seguimiento de Garant�a Liquida
    MQCoIm    : TCrMQCoIm;  //Referencia a la nueva clase de impresion de reporte de consolidado de impagados
    CrRepFov  : TCrRepFov;       //Reporte de ebventos Fovis

    QMColCob  : TQMColCob;   //Reporte resumen colocaci�n/cobranza  ROIM 27112008
    MReEmiPro :TMReEmiPro;
    MReDocEmi :TMReDocEmi;
    MAvCesion :TMAvCesion;
    MAvDoc    :TMAvDoc;
    MProxEmi  :TMProxEmi;
    MReDevCom :TMReDevCom;
    MReAuCred :TMReAuCred;
    MInfCobr  :TMInfCobr;
    MSgCobr   :TMSgCobr;
    MProgVen  :TMProgVen;
    MProVeMa  :TMProVeMa;// ROIM Agosto 2009  Pronostico de Vencimiento Masivo
    MColoca   :TMColoca;
    MRecPremi :TMRecPremi;
    MCoChAd   :TMCoChAd;
    MFinAdi   :TCrMFinAdi;
    MReFondeo :TMReFondeo;
    MCrCobCom :TMCrCobCom;
    MColProm  : TMColProm;
    BiAvMail  :TMBiAvMail;
    MProVeGl  :TMProVeGl;   //Reporte de Adeudos Global JFOF Diciembre 2011 
    MCtrlColo :TMCtrlColo;  // FJR CONTROL DE COLOCACION
    RsmColo : TRsmColo ;
	
    EstadHist :TCrEstHist;

    MRepCtrol : TMRepCtrol;
    MRepGarAc : TMRepGarAc;
    MRepGlbCr : TMRepGlbCr;

    MInfCoCob :TMInCoCob;
    Senicreb  : TMSenicreb;
    //< EASA4011  28/07/2006
    MCedExPg  : TMCedExPg;
    MEdoMovto : TMEdoMovto;
    //EASA4011 >/

    MPrAdeudo :TMPrAdeudo;
    MDispDet  :TMDispDet;
    MCatMin   :TMCatMin;
    MIngProm  :TMIngProm;
    MCartVenc :TMCartVenc;
    MGarFeg   :TMGarFeg;
    MAccion   :TMAccion;
    MAAFega   :TMAAFega;
    MSegGar   :TMSegGar;
    MRepSieb  :TMRepSieb;
    MCrCostFe : TMCrCostFe;

    MProvDiar : TMProvDiar;

    MFndColoc : TMFndColoc;
    MFndProv  : TMFndProv;
    MFndVenc  : TMFndVenc;
    MrPasivo  : TMrPasivo;
    MFndCLP   : TMFndCLP;    // Reporte de Pasivo Corto Largo Plazo ROIM 2014.06.13

    MContVenc : TMContVenc;
    MrCocamor : TMrCocamor;  // Reporte Comisiones, Castigos y Moras Cobradas.

    CtaChqAcr : TMRepChqAc;
    MRepSdoPr : TMRepSdoPr;
    MSdosProm : TMSdosProm;
    MResSdoPr : TMResSdoPr;
    MCreInscDeu: TMCrInsDeu;
    MComCobPr : TMComCobPr;
    MDetAcred : TMDetAcred;
    MExpPago  : TMExpPago;
    MCliEntFi : TMCliEntFi;
    SdoBqDSbq : TMSdoBloq;
    CompDep   : TMCompDep;
    MMovEntFe : TMMovEntFe;
    MRecRecib : TMRecRecib;
    MRepVenc  : TMRepVenc;
    BitQCQC   : TMBitQCQC;
    MConsAdeu : TMConsAdeu;
    Cnsadto : TCnsadto;

    MPlazoRes : TMPlazoRes;
    MQResumCR : TMQResumCR;
    CrPlazoRe  : TCrPlazoRe;     //Plazo Residual       HEGC 03/11/2009
    Crplaresc : TCrplaresc;

    CrCARTERA : TCRCartera; //MARA4356 OCT2006

    MQLiMaxFi : TMQLiMaxFi;       //L�mite M�ximo de Financiamiento

    RepCre50M : TRepCre50M;       //AACE4754   Reporte Semanal de Creditos con montos autorizados mayores a 50 millones
    CarFinq   : TCrCarFinq;  // CARTA FINIQUITO  RABA 13 JUL 2011
    MBiCarFq  : TCrMBiCarF;   // REPORTE BIT�CORA CARTAS FINIQUITO   RABA 27 JUL 2011
    Mprvea    : TCrmprvea;  //Referencia a la nueva clase de impresion de reporte de consolidado de impagados
    MOpeInt    : TMOpeInt;  // RABA JUN 2012 Reporte Operativo de Interes
    Mcvdaran   : TMcvdaran; // RABA JUL 2012 Reporte Cartera Vencida por Rangos
    MMovCVda   : TMMovCVda; // RABA JUL 2012 Reporte de Movimientos de Cartera Vencida
    CrVarMge   : TCrVarMge;
    CrRepInfr : TCrRepInfr;   //Reporte Mensual de Infraestructura JFOF 13/05/2013
    CrBitTran : TCrBitTran;   //Bitacora de Transacciones JFOF 30/07/2013
    CrDispLiq : TCrDispLiq;   //Reporte de Disposiciones y Liquidaciones JFOF 03/09/2013
    CrContPpo : TCrContPpo;   //Res�men de Movimientos de Provisi�n (PPO) - Reportes JFOF 21/10/2013


    //EDO CUENTA
    MEdoCta   : TMEdoCta;
    MEdoCtaDD : TMEdoCtaDD;       //Estado de Cuenta de Descuento de Documentos
    GenEdoCta : TCrGenEdCt;
    EdoMailAb : TEdoMailAb;       //Env�o x Mail de Estados de Cuenta ABCD  	

    MEdoCtaC  : TMEdoCtaC;        //Estado de Cuenta certificado
    CrEcCoSo  : TCrEcCoSo;        //Estado de Cuenta certificado
    MImpECC   : TMImpECC;         //Impresion de Estado de Cuenta Certificado
    CrCFDIBit : TCrCfdBit;        // CAPM - Bitacora Sellado CFDI


    //CIERRE / APERTURA
    CrCierre   : TCrcierre;
    CrCierCo   : tCrCierCo;    //CIERRE COINCRE 12/11/2013
    CrCieEdc   : TCrCieEdc; 
    CrApertura : TCrApert;
    CrRedigitaDoc : TCrRedigitaDoc; //RUCJ4248:

    //LIQUIDACION
    PerFilLiq : TCrLiqPerf;
    Liquida   : TCrliquida;
    LiqDis     : TCrLiqDis;
    Mliquidac : TMliquidac;

    //AGROPECUARIO
    Prorroga  : TProrroga;
    CrFiCaSe  : TCrFiCaSe;
    CrFiCoIn  : TCrFiCoIn;
    CrFiCaPa  : TCrFiCaPa;
    CrSubPro  : TCrSubPro;
    CrCiProc  : TCrCiProc;        //Cat�logo de Ciclos de PROCAMPO

    CrGaSoApl : TCrGaSoApl;
    CrGaSoLi  : TCrGaSoLi;
    CrVencAnt : TCrVencAnt;   //Vencimientos Anticipados
	CrCancPas : TCrCancPas;   //Cancelacion de Pasivos
    CrGaSoFe  : TCrGaSoFe;
    SolFEGAco : TSolFEGAco;

    MSolFact  : TMSolFact;

    CrApGarFEGA: TCrApGaFe;

    //INSTRUMENTACION
    MCatEncab : TMCatEncab;
    MCatDet   : TMCatDet;
    MCatFirma : TMCatFirma;
    MUsuFirma : TMUsuFirma;
    MTpCto    : TMTpCto;
    MReCto    : TMReCto;
    MProemio  : TMProemio;

    //GRANT�AS
    MTipoGar  : TMTipoGar;
    MGarantia : TMGarantia;
    MProdGar  : TMProdGar;
    MFiraEq   : TMFiraEq;
    MTipoRamo : TMTipoRamo;
    MTipoPol  : TMTipoPol;
    MPerito   : TMPerito;
    MNotario  : TMNotario;
    MFiraOpe  : TMFiraOpe;
    MRegistro : TMRegistro;
    MConAcred : TMConAcred;
    CrHistGar : TCrHistGar;
    CrGaPpReg : TCrGaPpReg;
    // PORTAFOLIO DE CREDITO
    CrTAve    : TCrTAve;
    CrRegion  : TCrRegion;
    CrMercObj : TCrMercObj;
    CrMeObDe  : TCrMeObDe;
    CrGpFiMa  : TCrGpFiMa;
    CrCapBas  : TCrCapBas;
    CrMaxFnEd : TCrMaxFnEd;
    CrCartBnc : TCrCartBnc;
    CrLCbVsCr : TCrLCbVsCr;
    IntCrGpIn : TIntCrGpIn;
	CrCartReg : TCrCartReg;
    CrCartDiv : TCrCartDiv;
    CrPlzVenc : TCrPlzVenc;
    CrAcreMax : TCrAcreMax;
    CrSecPubl : TCrSecPubl;
    CrEdMpios : TCrEdMpios;
    CRCartCon : TCRCartCon;
    CrCrtScPu : TCrCrtScPu;
    CrInfAves : TCrInfAves;
    CrCompBan : TCrCompBan;
    CrCompInf : TCrCompInf;
    CrResCali : TCrResCali;
    CrResEyMC : TCrResEyMC;
    CrCompSeP : TCrCompSeP;
    //MODELOS DINAMICOS
    CrMetMode : TCrMetMode;
    CrMeTaRe  : TCrMeTaRe;
    CrMetVari : TCrMetVari;
    CrMetMeto : TCrMetMeto;
    CrMetPers : TCrMetPers;
    CrAnxMasv : TCrAnxMasv;
    CrMeAsMo  : TCrMeAsMo;
    //DOCUMENTACION
    MTramite  : TMTramite;
    MDoctos   : TMDoctos;
    MRelDocTr : TMRelDocTr;
    MProdTram : TMProdTram;
    MNRiesgo  : TMNRiesgo;
    MDoMedio  : TMDoMedio;
    MPerfUsu  : TMPerfUsu;
    MRecTra   : TMRecTra;
    MCteDoc   : TMCteDoc;
    MExpAcreD : TMExpAcreD;
    MReExcPen : TMReExcPen;
    MReDocCte : TMReDocCte;

    //Mantenimiento de Pagar�s
    CrRelPag  : TCrRelPag;
    CrRnvPag  : TCrRnvPag;
    MRepCau   : TMRepCau;

    //HIPOTECARIO
    GenArcHip : TCrarchsat;

    //TAS
    CrTAS     :  TIntCrTAS;

    Mqrconsta  : TMqrconsta;
    SatCreLay  : TSatCreLay;

    //Calificadoras
    CrTRiesgo : TCrTRiesgo;
    CrCalific : TCrCalific;
    CrCalCali : TCrCalCali;
    CrCalAcre : TCrCalAcre;
    CrReCaAc  : TCrReCaAc;
    CrCalCons : TCrCalCons;
    CrCaArDe  : TCrCaArDe;
    MCalifAcr : TMCalifAcr;

    // Fideicomiso Maestro
    CrFidReg  : TCrFidReg;
    CrFidDele : TCrFidDele;
    CrFidMae  : TCrFidMae;
    CrReFiDi  : TCrReFiDi;
    CrFidCorr : TCrFidCorr;
    CrFiSoPa  : TCrFiSoPa;

    // Capitalizaci�n
    CrCalCapi  : TCrCalCapi;
    MCapGobMp  : TMCapGobMp;

    //
    VDocume    : TVcrdocume;
    GpoTasa    : TCrGpTaIn;
    CrEmail    : TCrEmail;
    CrEmaDat   : TCrEmaDat;
//    CrTasdesc  : TCrTasdesc;
    CrCoArNaf : TCrCoArNaf;
    // Creditos PYME
    MGenArch   : TMGenArch;
    CrCbSoNa   : TCrCbSoNa;
    // Riesgo Mercado
    CrRiesMdo  : TCrRiesMdo;
    MRsgMdoAg  : TMRsgMdoAg;
    //
    CrCRepDig  : TCrCRepDig;
    CrBcClOb   : TCrBcClOb;
    //COINCRE
    CrUpCoCo   : TCrUpCoCo;
    MQrCoCo    : TMQrCoCo;
    MQrCoin    : TMQrCoin;
    CrCoincPb  : TCrCoincPb;
    CrCoincR   : TCrCoincR; //SATV4766 el 25.01.2008
    CrCoInRi   : TCrCoInRi;    //Consulta Integral de Riesgos    ROIM 20/10/2008
    EstResRC   : TEstResRC;
    CrCarRie   : TCrCarRie;    //RABA JUN 2016 ACTUALIZACI�N R04C

    CreConDri  : TCreConDri; //MARA4356 OCT2006
    CrMET        : TCrMETIFY; //MARA4356 OCT2006

    MQrComCta : TMQrComCta; //SATV4766
    CrCoCtCc  : TCrCoCtCc;  //SATV4766

    MQrSHF    : TMQrSHF;    //SATV4766
    Icresap   : TIcresap;   //SATV4766
    CgCueEqu  : TCgCueEqu;  //SATV4766
    CrReAcCt  : TCrReAcCt;  //SATV4766
    CrCoAdHi  : TCrCoAdHi;  //SATV4766

    CrBlqConc : TCrBlqConc; //SATV4766
    CrBlqOper : TCrBlqOper; //SATV4766
    CrTraBlo  : TCrTraBlo;  //SATV4766
    CrTrBlMa  : TCrTrBlMa;  //SATV4766
    MBlqMa    : TMBlqMa;    //SATV4766
    CrCaCoBl  : TCrCaCoBl;   //SATV4766

    {LOLS 26 DIC 2006. CREDITO EN LINEA }
    Crbloqaut : TCrbloqaut;
    CrCobAcc  : TCrCobAcc;
    CrCreMar  : TCrCreMar;
    CrMoOpDia : TCrMoOpDia;
    CrMoPrOp  : TCrMoPrOp;
    MComCobAn : TMComCobAn;
    MIncDecPe : TMIncDecPe;
    MProxVenc : TMProxVenc;
    MMovXInt  : TMMovXInt;
    MAuBlqDes : TMAuBlqDes;
    {ENDS_LOLS}

    //COSTO (CAT)  ROIM Pantalla de c�lculo de Costo Anual Total CAT   15/05/2008
    Cat : TCrCatSol;

    // Regulatorios
    CrCoReCc  : TCrCoReCc;   //SATV4766
    CrCciConc : TCrCciConc;  //SATV4766
    CrCciRepo : TCrCciRepo;  //SATV4766

    //Reportes para cobranza
    CrCoABRep : TCrCoABRep;   //MAGV20091228

    //Conciliador Bur� de Cr�dito
    CrConc    : TCrConc;     //MAGV20091110
	CrRegHist : TCrRegHist;  //AGF20120117

    RepDepRef : TRepDepRef; //MARA4356  10/10/2007
	
    //EDO CUENTA
    MEdoCtaCt  : TMEdoCtaCt; // Menu del reporte de Estado de cuenta cerfificado hegc 13/01/2010
    //AGRONEGOCIOS
    CrAmBitac  : TCrAmBitac;   //Bitacora AgroMasivo         19/03/2010  ROIM
    CrCoBita   : TCrCoBita;    //Consulta Bitacora         19/03/2010  ROIM
    CrDispF    : TCrDispF;      //Disposici�n                  19/04/2010  MAGV
    CrPersF    : TCrPersF;      //Persona                      26/04/2010  MAGV
    MProAdeuF  : TMPrAdeuF;     //Reporte de edo cuenta        03/04/2010  MAGV
    CrAmOtrad  : TCrAmOtrad;	//Otros adeudos
    CrContrF   : TCrContrF;	//Contrato
    CrSeguroF   : TCrSeguroF;	//Seguro
    CrAmMacro : TCrAmMacro;	//Macrobase

    CrPobGar   : TCrPobGar;    //Poblador de garant�as     25/03/2010  MAGV
    CrPobSeg   : TCrPobSeg;    //Poblador de seguros     12/07/2010  MAGV
    CrPobInd   : TCrPobInd;    //Poblador de seguros       19/07/2010  MAGV
    CrSigDirr  : TCrSigDirr;   //Cat�logo de direcciones SIGIA 20110920 MAGV

    //REPORTES
    MDCartVda : TMDCartVda;  //Reporte de d�as de cartera vencida.   // Ana Lilia Escalona Asteci
    CrCreRest  : TCrCreRest;     //Cr�dito restringido          07/06/2010 MAGV
    MQDApIVA  : TMQDApIVA;
    //CONTA-ICRE
    CrCoinSap : TCrCoinSap;       //Configuraci�n Conciliador SAP    AGOSTO 2010
    // FACTORAJE ELECTRONICO
    CrDocFact   : TCrDocFact;    //Acuses factoraje       01/08/2010  MAGV   ROIM
    CRFEReP     : TCRFEReP;      //Reporte de Pagos Factoraje electr�nico BINTER
    CrFeNeCt    : TCrFeNeCt;     //Relaci�n Contrato INET Emisor Proveedor

    // REINICIO DE DOLARES
    CorrecP   : TCorrecP;
 
    //Garantias para el r04	
    CrGaraPer : TCrGaraPer;  //Cat�logo de Avales (Garant�as Personales)
    CrCaTiGa  : TCrCaTiGa;   //Cat�logo de tipos de garant�as
    CrCaTiAv  : TCrCaTiAv; //Cat�logo de tipos de avales

    CrGaraCto : TCrGaraCto; //consolidado de garantias por linea
    CredExcGa :  TCredExcGa;//Cr�ditos Excluidos de las Garant�as L�quidas

    CrTblAmo  : TCrTblAmo;  //Consulta Consoldado de Amortizaci�n RIRA4281 31Dic10
    CrCarPlaz : TCrCarPlaz;  ///Consulta de cartera de cr�ditos Icre e Intercreditos por plazos de vencimiento  //RABA4523 AGO-2016
    CrAcrReCM : TCrAcrReCM;
    MApliRecu : TMApliRecu;
    CrCamblin : TCrCamblin;
    CrCambiaO : TCrCambiaO;
	
    CrRevGar  : TCrRevGar;   //Modulo de Reversa de Garantias

    // MODULO BUR�
    CrBCParm : TCrBCParm ; //FJR 03.12.2012 Pantalla de par�metros para BC_LAYOUT.
    BcLayExc : TBcLayExc ; // FJR 21.12.2012 Carga de excepciones BC_LAYOUT.
    CBCOpn   : TCBCOpn;    //HCF 05Feb2013 Consultas Repositorio Bur�
    CrBCAfec : TCrBCAfec;  //FJR 27.06.2013 Para determinar afectaci�n de claves de operaci�n en generaci�n BCLayout.
    BCLayVC  : TBcLayVC;  // FJR 18.09.2013 Carga de venta de cartera BC_LAYOUT
    BCTBaja   : TBCTBaja;  // FJR 17.02.2014 Pantalla de consulta tipo de baja y clave de observaci�n con l�gica bur�.
    CrCaTiAB  : TCrCaTiAB;  // ROUY4095 OCT2015 Claves Tipo Aval Bur�
    // POSIBLE PREMIO A OTORGAR
    CrPorcPPP : TCrPorcPPP;   // Porcentajes de PPO.
    MIntAplPr : TMIntAplPr;   // Reporte de Integraci�n y Aplicaci�n de Premios por Pagar.
    MCtrlPre  : TMCtrlPre;    // Reporte de control de premios
    CrRegPPP  : TCrRegPPP;    // Registro de Movimientos.
    CrProrPPP : TCrProrPPP;   // Prorrateo de PPO.
    CrMovPPP  : TCrMovPPP;    // Cat�logo de Movimientos de PPO.
    CrPPP     : TCrPPP;       // Posible premio a otorgar.
    CrPPOMen  : TCrPPOMen;    // Calculo de ajustes de provision mensual PPO.
    Consitpre : TConsitpre;   // Consulta Situaci�n de Premio (Contraloria)
    CrConsLin : TCrconslin;

    CrParamTC : tCrParamTC;   // RABA OCT 2014 Actualizaci�n de par�metros para el traspaso entre carteras
    CrR04CatOper: TCRR4CATOP; // ERF  DIC 2015 Cat�logo de operacion para Reportes R04A
    CrR04Cargas: TCrR4Carga;  // ERF  DIC 2015 Cargas de Reportes R04A
    CrR04Config:TCrR4Conf;    // ERF 22/02/2016    Configuraci�n de Reportes regulatorios;


begin
      FindItSQL:= True;
     //carga parametros
     if NomFuncion = 'STARTAPLI' then
     Begin
          if ParamCre <> nil then
             ParamCre.Free;
          //end if
          ParamCre := TParamCre.Create(self);
          ParamCre.Apli := dmMain.apMain;
          ParamCre.LlenaEmpresa(ParamCre.Apli.IdEmpresa);
          ParamCre.LlenaFecha;
          ParamCre.LlenaUsuario;
          ParamCre.LlenaPerfil;
          ParamCre.ObtenEntidad;
     end;

     //carga clases

     //carga clases

     //if NomFuncion='CLASE_TPRUEBAS'   then Showcat(TPruebas.Create(Self),dmMain.apMain)
     if NomFuncion = 'CLASE_TCRACREDIT' then       //Adreditado
     begin
        Acredit:= TCrAcredit.Create(self);
        try
           Acredit.Apli:=dmMain.apMain;     Acredit.ParamCre:=ParamCre;     Acredit.Catalogo;
        finally
               Acredit.Free;
        end;
     end
     //Generaci�n de saldos en excel 20/10/2010 MAGV
	 else if NomFuncion = 'CLASE_TSDOAGRMAS' then
	 begin
	    SdoAgrMas := TSdoAgrMas.Create(self);
		try
		  SdoAgrMas.Apli := dmMain.apMain;
		  SdoAgrMas.ParamCre := ParamCre;
		  SdoAgrMas.Catalogo;
		finally
		  SdoAgrMas.Free;
		end;
	 end
     else if NomFuncion = 'CLASE_TCRANNAF' then
	 begin
	   CrAnNaf := TCrAnNaf.Create(self);
	   try
		 CrAnNaf.Apli := dmMain.apMain;
		 CrAnNaf.ParamCre := ParamCre;
		 CrAnNaf.Catalogo;
	   finally
		 CrAnNaf.Free;
	   end;
	 end
     else if NomFuncion = 'CLASE_TCORRECP' then       
     begin
        CorrecP:= TCorrecP.Create(self);
        try
           CorrecP.Apli:=dmMain.apMain;     CorrecP.ParamCre:=ParamCre;     CorrecP.Catalogo;
        finally
               CorrecP.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRDOCFACT' then           //Acuses factoraje       01/08/2010  MAGV   ROIM
      begin
         CrDocFact := TCrDocFact.Create(self);
         try
            CrDocFact.Apli:=dmMain.apMain;
            CrDocFact.ParamCre:=ParamCre;     CrDocFact.Catalogo;
         finally
                CrDocFact.Free;
         end;
      end
     else if NomFuncion = 'CLASE_TCRFEREP' then           //Reporte de Pagos       01/08/2010  MAGV   ROIM
      begin
         CRFEReP := TCRFEReP.Create(self);
         try
            CRFEReP.Apli:=dmMain.apMain;
            CRFEReP.ParamCre:=ParamCre;     CRFEReP.Catalogo;
         finally
                CRFEReP.Free;
         end;
      end
     else if NomFuncion = 'CLASE_TCRFENECT' then           //Relaci�n Contrato INET Emisor Proveedor
      begin
         CrFeNeCt := TCrFeNeCt.Create(self);
         try
            CrFeNeCt.Apli:=dmMain.apMain;
            CrFeNeCt.Catalogo;
         finally
                CrFeNeCt.Free;
         end;
      end
    else if NomFuncion = 'CLASE_TCRCOINSAP' then      //Configuraci�n Conciliador SAP    AGOSTO 2010
     begin
        CrCoinSap := TCrCoinSap.Create(self);
        try
           CrCoinSap.Apli := dmMain.apMain;           CrCoinSap.ParamCre:=ParamCre;
           CrCoinSap.Catalogo;
        finally
           CrCoinSap.Free;
        end;
     end	 
     else if NomFuncion = 'CLASE_TCRCRECHE' then        //Alta Chequera de acreditado
     begin
        CreChe := TCrCreChe.Create(self);
        try
           CreChe.Apli:=dmMain.apMain;     CreChe.ParamCre:=ParamCre;     CreChe.Catalogo;
        finally
               CreChe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCONINV' then        //Bitacora Masivo   19/03/2010 ROIM
     begin
        CrConInv := TCrConInv.Create(self);
        try
           CrConInv.Apli:=dmMain.apMain;     CrConInv.ParamCre:=ParamCre;     CrConInv.Catalogo;
        finally
               CrConInv.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRROEFOND' then           //Costo de Fondeo ROE   JFOF JUN-2012
     begin
        CrRoeFond :=  TCrRoeFond.Create(self);
        try
           CrRoeFond.Apli := dmMain.apMain;
           CrRoeFond.ParamCre:=ParamCre;
           CrRoeFond.Catalogo;
        finally
           CrRoeFond.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRROEPROD' then           // L�mite por Producto ROE JFOF JUN-2012
     begin
        CrRoeProd :=  TCrRoeProd.Create(self);
        try
           CrRoeProd.Apli := dmMain.apMain;
           CrRoeProd.ParamCre:=ParamCre;
           CrRoeProd.Catalogo;
        finally
           CrRoeProd.Free;
        end;
     end	 
     else If NomFuncion = 'CLASE_TCRROELNEG' then           
     begin
        CrRoeLneg :=  TCrRoeLneg.Create(self);
        try
           CrRoeLneg.Apli := dmMain.apMain;
           CrRoeLneg.ParamCre:=ParamCre;
           CrRoeLneg.Catalogo;
        finally
           CrRoeLneg.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRROEPNEG' then
     begin
        CrRoePneg :=  TCrRoePneg.Create(self);
        try
           CrRoePneg.Apli := dmMain.apMain;
           CrRoePneg.ParamCre:=ParamCre;
           CrRoePneg.Catalogo;
        finally
           CrRoePneg.Free;
        end;
     end	 
     else if NomFuncion = 'CLASE_TCRTRAINT' then       //Cat�logo de Tasas por rangos                      Aar�n Hernandez Asteci Octubre 2009
     begin
        TraInt:= TCrTraInt.Create(self);
        try
           TraInt.Apli:=dmMain.apMain;     TraInt.ParamCre:=ParamCre;     TraInt.Catalogo;
        finally
               TraInt.Free;
        end;
     end
     //AARJ 081009,  Referencia a la nueva clase de catalogo de directores para reporte de Cartera Impagada
     else if NomFuncion = 'CLASE_TCRIMPDIRE' then  // Cat�logo de directores para el reporte de Cartera Impagada
     begin
        CrImpDire  := TCrImpDire.Create(self);
          try
             CrImpDire.Apli :=dmMain.apMain;
             CrImpDire.ParamCre:=ParamCre;
             CrImpDire.Catalogo;
          finally
               CrImpDire.Free;
        end;
     end
     //AARJ 091009,  Referencia a la nueva clase de catalogo de Relaciones de directores con productos para reporte de Cartera Impaga
     else if NomFuncion = 'CLASE_TCRIMDIPR' then  // Cat�logo de Relaci�n de directores con productos para el reporte de Cartera Impagada
     begin
        CrImDiPr  := TCrImDiPr.Create(self);
          try
             CrImDiPr.Apli :=dmMain.apMain;
             CrImDiPr.ParamCre:=ParamCre;
             CrImDiPr.Catalogo;
          finally
               CrImDiPr.Free;
        end;
     end
     //AARJ 231009, Referencia a la nueva clase de impresion de reporte
     else if NomFuncion = 'CLASE_TCRMQSGLI' then  // Reporte de Seguimiento de Garant�a Liquida
     begin
        MQSGLI  := TCrMQSGLI.Create(self);
          try
             MQSGLI.Apli :=dmMain.apMain;
             MQSGLI.ParamCre:=ParamCre;
             MQSGLI.Catalogo;
          finally
               MQSGLI.Free;
        end;
     end
     //AARJ 210909, Referencia a la nueva clase de impresion de reporte
     else if NomFuncion = 'CLASE_TCRMQCOIM' then  // Reporte de Consolidado de Impagados
     begin
        MQCoIm  := TCrMQCoIm.Create(self);
          try
             MQCoIm.Apli :=dmMain.apMain;
             MQCoIm.ParamCre:=ParamCre;
             MQCoIm.Catalogo;
          finally
               MQCoIm.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRBLQDBLQ' then        // Monitor de Bloqueos / Desbloqueos Saldos Chequeras
     begin
        BloqDesblq := TCrBlqDblq.Create(self);
        try
           BloqDesblq.Apli := dmMain.apMain;           BloqDesblq.ParamCre:=ParamCre;
           BloqDesblq.Catalogo;
        finally
           BloqDesblq.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMONDEP' then        // Monitor de Dep�sitos de Chequeras
     begin
        MonitDepos := TCrMonDep.Create(self);
        try
           MonitDepos.Apli := dmMain.apMain;           MonitDepos.ParamCre:=ParamCre;
           MonitDepos.Catalogo;
        finally
           MonitDepos.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCHQDLL' then        // Grupos de Chequeras
     begin
        chqradlls := TCrChqDll.Create(self);
        try
           chqradlls.Apli := dmMain.apMain;           chqradlls.ParamCre:=ParamCre;
           chqradlls.Catalogo;
        finally
           chqradlls.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMACREDREL' then       //Acreditados Relacionado
     begin
        MAcredRel := TMAcredRel.Create(self);
        try
           MAcredRel.Apli := dmMain.apMain;
           MAcredRel.ParamCre:=ParamCre;
           MAcredRel.Catalogo;
        finally
           MAcredRel.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMAUTCRED' then        //Autorizaciones de Cr�ditos Relacionados
     begin
        MAutCred := TMAutCred.Create(self);
        try
           MAutCred.Apli := dmMain.apMain;
           MAutCred.ParamCre:=ParamCre;
           MAutCred.Catalogo;
        finally
           MAutCred.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCAPBASIC' then       //Cat�logo de Capital B�sico
     begin
        MCapBasic := TMCapBasic.Create(self);
        try
           MCapBasic.Apli := dmMain.apMain;
           MCapBasic.ParamCre:=ParamCre;
           MCapBasic.Catalogo;
        finally
           MCapBasic.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMREPCRREL' then       //Proceso y Reporte de Cr�ditos Relacionado
     begin
        MRepCrRel := TMRepCrRel.Create(self);
        try
           MRepCrRel.Apli := dmMain.apMain;
           MRepCrRel.ParamCre:=ParamCre;
           MRepCrRel.Catalogo;
        finally
           MRepCrRel.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCARTRIM' then       //Detalle CArtera Impagada por Acreditado
     begin
        CrCartrIm := TCrCartrIm.Create(self);
        try
           CrCartrIm.Apli := dmMain.apMain;
           CrCartrIm.ParamCre:=ParamCre;
           CrCartrIm.Catalogo;
        finally
           CrCartrIm.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCREDOMUN' then		 //Cat�logo de Estados y Municipios para Bur� de Cr�dito
     begin
        CrEdoMun := TCrEdoMun.Create(self);
        try
          CrEdoMun.Apli     := dmMain.apMain;
          CrEdoMun.ParamCre := ParamCre;
          CrEdoMun.Catalogo;
        finally
          CrEdoMun.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRACREDCM' then      // Acreditado en concurso mercantil   RABA ABR 2013
     begin
       CrAcredCM := TCrAcredCM.Create(self);
        try
          CrAcredCM.Apli     := dmMain.apMain;
          CrAcredCM.ParamCre := ParamCre;
          CrAcredCM.Catalogo;
        finally
          CrAcredCM.Free;
        end;
     end
          else If NomFuncion = 'CLASE_TCRACRDMPS' then       //Evidencia de Capacidad de Pago Acreditado JFOF 01/04/2013
     begin
        CrAcrDmPs := TCrAcrDmPs.Create(self);
        try
           CrAcrDmPs.Apli := dmMain.apMain;
           CrAcrDmPs.ParamCre:=ParamCre;
           CrAcrDmPs.Catalogo;
        finally
           CrAcrDmPs.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCTO' then           //Alta de Autorizaci�n
     begin
        Contrato :=  TCrCto.Create(self);
        try
           Contrato.Apli :=dmMain.apMain;     Contrato.ParamCre:=ParamCre;
           Contrato.Catalogo;
        finally
               Contrato.Free;
        end;
     end
     {/< EASA4011  25/01/2007 }
     else if NomFuncion = 'CLASE_TCRAUTCLIN' then           //Relaci�n autorizaci�n - disposici�n marco
     begin
        AutLinDisp := TCrAutClin.Create(self);
        try
           AutLinDisp.Apli :=dmMain.apMain;     AutLinDisp.ParamCre:=ParamCre;
           AutLinDisp.Catalogo;
        finally
               AutLinDisp.Free;
        end;
     end
     {EASA4011>/ }
{     else if NomFuncion = 'CLASE_TCRCTOBETA' then           //Alta de Autorizaci�n Beta
     begin
        CtoBeta :=  TCrCtoBeta.Create(self);
        try
           CtoBeta.Apli :=dmMain.apMain;     CtoBeta.ParamCre:=ParamCre;
           CtoBeta.Catalogo;
        finally
               CtoBeta.Free;
        end;
     end
 }
     else if NomFuncion = 'CLASE_TCRCREDITO' then       //Alta de solicitudes de Disposici�n
     begin
        Credito := TCrCredito.Create(self);
        try
           Credito.Apli :=dmMain.apMain;     Credito.ParamCre:=ParamCre;
           Credito.Catalogo;
        finally
               Credito.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMDISPFOND' then       //Alta de solicitudes de Redescuento
     begin
        MDispFond := TMDispFond.Create(self);
        try
           MDispFond.Apli :=dmMain.apMain;     MDispFond.ParamCre:=ParamCre;
           MDispFond.Catalogo;
        finally
           MDispFond.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRMONDISP' then       //Monitor de Disposiciones
     begin
        CrMonDisp := TCrMonDisp.Create(self);
        try
           CrMonDisp.Apli := dmMain.apMain;
           CrMonDisp.ParamCre:=ParamCre;           CrMonDisp.Catalogo;
        finally
           CrMonDisp.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCREXCEPCI' then       //Cat�logo de Excepciones
     begin
        Excepci := TCrExcepci.Create(self);
        try
           Excepci.Apli:=dmMain.apMain;     Excepci.ParamCre:=ParamCre;     Excepci.Catalogo;
        finally
               Excepci.Free;
        end;
     end
     else if NomFuncion='CLASE_TEXCEPAPLI'   then       //Excepciones Aplicaci�n
        Showcat(TExcepApli.Create(Self),dmMain.apMain)

     else if NomFuncion = 'CLASE_TCRPERFIUS' then       //Identificaci�n de Perfil de Cr�ditos
     begin
        PerfilUs := TCrPerfiUs.Create(self);
        try
           PerfilUs.Apli:=dmMain.apMain;     PerfilUs.ParamCre:=ParamCre;     PerfilUs.Catalogo;
        finally
               PerfilUs.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPEPRUS' then       //Perfil de Usuario por Producto 
     begin
        PerfUsProd := TCrPePrUs.Create(self);
        try
           PerfUsProd.Apli:=dmMain.apMain;     PerfUsProd.ParamCre:=ParamCre;     PerfUsProd.Catalogo;
        finally
               PerfUsProd.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRPROMASC' then        //Actualiza promotor Asociado
     begin
        PromAsocia := TCrPromAsc.Create(self);
        try
           PromAsocia.Apli :=dmMain.apMain;     PromAsocia.ParamCre:=ParamCre;
           PromAsocia.Catalogo;
        finally
               PromAsocia.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPROMADM' then        //Actualiza promotor Administrador
     begin
            PromAdmon  := TCrPromAdm.Create(self);
        try
           PromAdmon.Apli :=dmMain.apMain;     PromAdmon.ParamCre:=ParamCre;
           PromAdmon.Catalogo;
        finally
               PromAdmon.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCOMISEV' then        //Comisiones por Evento
     begin
        ComEvent := TCrComisEv.Create(self);
        try
           ComEvent.Apli:=dmMain.apMain;     ComEvent.ParamCre:=ParamCre;
           ComEvent.Catalogo;
        finally
               ComEvent.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCAMOCOM' then        //Modificaci�n Cancleacion de Comisiones
     begin
        CaMoCom  := TCrCaMoCom.Create(self);
        try
           CaMoCom.Apli:=dmMain.apMain;     CaMoCom.ParamCre:=ParamCre;
           CaMoCom.Catalogo;
        finally
               CaMoCom.Free;
        end;
     end


     else if NomFuncion = 'CLASE_TCRTACRE' then              //CAT�LOGO DE TIPO DE ACREDITADO
     Begin
        tipacred:= TCrTAcre.Create(self);
        try
           tipacred.Apli:=dmMain.apMain;           tipacred.ParamCre:=ParamCre;           tipacred.Catalogo;
        finally
               tipacred.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGRUPECO' then       //Grupo Econ�mico
     Begin
        gpoeco:= TCrGrupEco.Create(self);
        try
           gpoeco.Apli:=dmMain.apMain;           gpoeco.ParamCre:=ParamCre;           gpoeco.Catalogo;
        finally
               gpoeco.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSECTECO' then       //Sector Econ�mico
     Begin
        SecEco:= TCrSectEco.Create(self);
        try
           SecEco.Apli:=dmMain.apMain;     SecEco.ParamCre:=ParamCre;     SecEco.Catalogo;
        finally
               SecEco.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRTAMACRE' then       //Tama�o de Acreditado
     begin
        tamacred:= TCrTamAcre.Create(self);
        try
           tamacred.Apli:=dmMain.apMain;     tamacred.ParamCre:=ParamCre;     tamacred.Catalogo;
        finally
               tamacred.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCALACR' then        //Calilficaci�n del Acreditado
     begin
        CalAcr := TCrCalAcr.Create(self);
        try
           CalAcr.Apli:=dmMain.apMain;     CalAcr.ParamCre:=ParamCre;     CalAcr.Catalogo;
        finally
               CalAcr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCLALEG' then        //Clasificaci�n Legal en bloques.
     begin
        ClaLegal := TCrClaLeg.Create(self);
        try
           ClaLegal.Apli:=dmMain.apMain;     ClaLegal.ParamCre:=ParamCre;     ClaLegal.Catalogo;
        finally
               ClaLegal.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRORIGREC' then       //Origen de Recursos
     begin
        OrigRec := TCrOrigRec.Create(self);
        try
           OrigRec.Apli:=dmMain.apMain;     OrigRec.ParamCre:=ParamCre;     OrigRec.Catalogo;
        finally
               OrigRec.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRDESTINO' then       //Destino del Cr�dito
     begin
        Destino := TCrDestino.Create(self);
        try
           Destino.Apli:=dmMain.apMain;     Destino.ParamCre:=ParamCre;     Destino.Catalogo;
        finally
               Destino.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCATMINI' then       //Clasificaci�n Contable
     begin
        CatMini := TCrCatMini.Create(self);
        try
           CatMini.Apli:=dmMain.apMain;     CatMini.ParamCre:=ParamCre;     CatMini.Catalogo;
        finally
               CatMini.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRAMORTIZ' then       //Tipos de Amortizaci�n
     begin
        Amortiza := TCrAmortiz.Create(self);
        try
           Amortiza.Apli :=dmMain.apMain;     Amortiza.ParamCre:=ParamCre;
           Amortiza.Catalogo;
        finally
               Amortiza.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPAGINT' then        //Tipos de pagos de Inter�s
     begin
        PagInt := TCrPagInt.Create(self);
        try
           PagInt.Apli :=dmMain.apMain;     PagInt.ParamCre:=ParamCre;
           PagInt.Catalogo;
        finally
               PagInt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPCTCAPI' then       //Porcentaje de Capialziaci�n
     begin
        PctCapital := TCrPctCapi.Create(self);
        try
           PctCapital.Apli :=dmMain.apMain;     PctCapital.ParamCre:=ParamCre;
           PctCapital.Catalogo;
        finally
               PctCapital.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSETAAC' then        //Sector por Tama�o de Acreditado
     begin
        SecTamAcr:= TCrSeTaAc.Create(self);
        try
           SecTamAcr.Apli:=dmMain.apMain;     SecTamAcr.ParamCre:=ParamCre;     SecTamAcr.Catalogo;
        finally
               SecTamAcr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRTIPREL' then        //Cat�logo Tipos de Relaci�n    easa4011        24052005
     begin
        TiposRelac := TCrTipRel.Create(self);
        try
           TiposRelac.Apli:=dmMain.apMain;     TiposRelac.ParamCre:=ParamCre;     TiposRelac.Catalogo;
        finally
               TiposRelac.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPROCOR' then        //Cat�logo de Productos Corporativos
     begin
        ProdCorp   := TCrProCor.Create(self);
        try
           ProdCorp.Apli :=dmMain.apMain;
           ProdCorp.ParamCre:=ParamCre;           ProdCorp.Catalogo;
        finally
               ProdCorp.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREPACNB' then            // Cat�logo de Regi�n o Pa�s
     begin
        CrLocCnb :=  TCrRePaCnb.Create(self);
        try
           CrLocCnb.Apli := dmMain.apMain;
           CrLocCnb.ParamCre:=ParamCre;           CrLocCnb.Catalogo;
        finally
               CrLocCnb.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMUNCNB' then            // RUCJ4248: Catalogo de Claves de Municipio
     begin
        CrMunCnb :=  TCrMunCnb.Create(self);
        try
           CrMunCnb.Apli := dmMain.apMain;
           CrMunCnb.ParamCre:=ParamCre;
           CrMunCnb.Catalogo;
           //CrMunCnb.ShowWindow(ftCaptura);
        finally
               CrMunCnb.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRRELIMN' then        //Relaci�n Medio Liquidaci�n - Moneda
     begin
        LiqMoneda:= TCrReLiMn.Create(self);
        try
           LiqMoneda.Apli :=dmMain.apMain;
           LiqMoneda.ParamCre:=ParamCre;           LiqMoneda.Catalogo;
        finally
           LiqMoneda.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRUNITIE' then        //Cat�logo de Unidades de Tiempo
     begin
        CrUniTie  := TCrUniTie.Create(self);
        try
           CrUniTie.Apli := dmMain.apMain;
           CrUniTie.ParamCre:=ParamCre;           CrUniTie.Catalogo;
        finally
           CrUniTie.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRACRCON' then        //CAt�logo de Puestos
     begin
        CrAcrCon  := TCrAcrCon.Create(self);
        try
           CrAcrCon.Apli := dmMain.apMain;
           CrAcrCon.ParamCre:=ParamCre;           CrAcrCon.Catalogo;
        finally
           CrAcrCon.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRTREDOND' then        //CAt�logo de Tipos de Redondeo
     begin
        CrTRedond  := TCrTRedond.Create(self);
        try
           CrTRedond.Apli := dmMain.apMain;
           CrTRedond.ParamCre:=ParamCre;
           CrTRedond.Catalogo;
        finally
           CrTRedond.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRGPPRSE' then        //Relaci�n Grupo Producto - Sector Contable
     begin
        SectCont  := TCrGpPrSe.Create(self);
        try
           SectCont.Apli := dmMain.apMain;
           SectCont.ParamCre:=ParamCre;           SectCont.Catalogo;
        finally
           SectCont.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRAPLSAL' then        //Cat�logo de Aplica Saldo
     begin
        AplicSaldo := TCrAplSal.Create(self);
        try
           AplicSaldo.Apli :=dmMain.apMain;     AplicSaldo.ParamCre:=ParamCre;
           AplicSaldo.Catalogo;
        finally
               AplicSaldo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRLIQMEDI' then       //Medio de Liquidaci�n
     begin
        MedioLiq := TCrLiqMedi.Create(self);
        try
           MedioLiq.Apli :=dmMain.apMain;
           MedioLiq.ParamCre:=ParamCre;           MedioLiq.Catalogo;
        finally
               MedioLiq.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCALCINT' then       //Tipos de C�lculos de Intereses
     begin
        CalculoInt := TCrCalcInt.Create(self);
        try
           CalculoInt.Apli :=dmMain.apMain;     CalculoInt.ParamCre:=ParamCre;
           CalculoInt.Catalogo;
        finally
               CalculoInt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRAGRCHE' then        // Agrupaci�n de Chequeras
     begin
        CrAgrChe := TCrAgrChe.Create(self);
        try
          CrAgrChe.Apli := dmMain.apMain;          CrAgrChe.ParamCre:=ParamCre;
          CrAgrChe.Catalogo;
        finally
          CrAgrChe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGPCHEQ' then        // Grupos de Chequeras
     begin
        CrGpCheq := TCrGpCheq.Create(self);
        try
          CrGpCheq.Apli := dmMain.apMain;          CrGpCheq.ParamCre:=ParamCre;
          CrGpCheq.Catalogo;
        finally
          CrGpCheq.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCROPERACI' then       //Operaciones
     begin
        Operacion := TCrOperaci.Create(self);
        try
           Operacion.Apli:=dmMain.apMain;     Operacion.ParamCre:=ParamCre;
           Operacion.Catalogo;
        finally
               Operacion.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCONCEPT' then       //Cat�logo de Conceptos
     begin
        Concept := TCrConcept.Create(self);
        try
           Concept.Apli :=dmMain.apMain;     Concept.ParamCre:=ParamCre;
           Concept.Catalogo;
        finally
               Concept.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCATCOMI' then       //Comisines
     begin
        CatComi := TCrCatComi.Create(self);
        try
           CatComi.Apli:=dmMain.apMain;     CatComi.ParamCre:=ParamCre;
           CatComi.Catalogo;
        finally
               CatComi.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRAFECTAC' then       //Cat�logo de Afectaci�n
     begin
        Afectac := TCrAfectac.Create(self);
        try
           Afectac.Apli :=dmMain.apMain;     Afectac.ParamCre:=ParamCre;
           Afectac.Catalogo;
        finally
               Afectac.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPARAMET' then       //Cat�logo de Par�metros
     begin
        CrParametro:= TCrParamet.Create(self);
        try
           CrParametro.Apli :=dmMain.apMain;
           CrParametro.ParamCre:=ParamCre;           CrParametro.Catalogo;
        finally
               CrParametro.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRACCESOR' then       //Cat�logo de Accesorios
     begin
        Accesorio := TCrAccesor.Create(self);
        try
           Accesorio.Apli :=dmMain.apMain;
           Accesorio.ParamCre:=ParamCre;           Accesorio.Catalogo;
        finally
               Accesorio.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRSITUACI' then       //CAt�logo de Situaciones
     begin
        Situacion := TCrSituaci.Create(self);
        try
           Situacion.Apli := dmMain.apMain;
           Situacion.ParamCre:=ParamCre;
           Situacion.Catalogo;
        finally
           Situacion.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TMINSTDESC' then    // Entidad descontadora
     begin
        MInstDesc := TMInstDesc.Create(self);
        try
           MInstDesc.Apli := dmMain.apMain;
           MInstDesc.ParamCre:=ParamCre;
           MInstDesc.Catalogo;
        finally
               MInstDesc.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TMPRGAPOYO' then           //Programa de apoyo
     begin
        MPrgApoyo := TMPrgApoyo.Create(self);
        try
           MPrgApoyo.Apli := dmMain.apMain;     MPrgApoyo.ParamCre:=ParamCre;
           MPrgApoyo.Catalogo;
        finally
           MPrgApoyo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRFRMTNAF' then           //Cat�logos de Formatos de NAFIN
     begin
        CrFrmtoNaf :=  TCrFrmtNaf.Create(self);
        try
           CrFrmtoNaf.Apli := dmMain.apMain;
           CrFrmtoNaf.Catalogo;
        finally
           CrFrmtoNaf.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCFGTASA' then            // Cat�logo de Configuraci�n de Tasa
     begin
        CrCfgTasa := TCrCfgTasa.Create(self);
        try
          CrCfgTasa.Apli := dmMain.apMain;
          CrCfgTasa.ParamCre:=ParamCre;          CrCfgTasa.Catalogo;
        finally
          CrCfgTasa.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPRODUCT' then       //Configuraci�n de productos de Cr�ditos
     begin
        Producto :=  TCrProduct.Create(self);
        try
           Producto.Apli :=dmMain.apMain;     Producto.ParamCre:=ParamCre;
           Producto.Catalogo;
        finally
               Producto.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TPRODGPO' then       //Cat�logo de Grupos de Productos
     begin
        MProdGpo :=  TMProdGpo.Create(self);
        try
            MProdGpo.IsCheckSecu := False;
            MProdGpo.Apli := dmMain.apMain;
            MProdGpo.ParamCre:=ParamCre;
            MProdGpo.Catalogo;
        finally
            MProdGpo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRPRODCOM' then       //Cat�logo de Cmision por Productos
     begin
        ProdComis := TCrProdCom.Create(self);
        try
            ProdComis.IsCheckSecu := False;
            ProdComis.Apli := dmMain.apMain;
            ProdComis.ParamCre:=ParamCre;
            ProdComis.Catalogo;
        finally
            ProdComis.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRPRSECO' then       //Relaci�n Producto - Sector Contable
     begin
        ProdSecCont:= TCrPrSeCo.Create(self);
        try
            ProdSecCont.IsCheckSecu := False;
            ProdSecCont.Apli := dmMain.apMain;
            ProdSecCont.ParamCre:=ParamCre;
            ProdSecCont.Catalogo;
        finally
            ProdSecCont.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRRECOAF' then        //Relaci�n Concepto - Afectaci�n
     begin
        ReCoAf := TCrReCoAf.Create(self);
        try
           ReCoAf.Apli :=dmMain.apMain;     ReCoAf.ParamCre:=ParamCre;
           ReCoAf.Catalogo;
        finally
               ReCoAf.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREOPCO' then        //Relaci�n Operaci�n - Concepto
     begin
        ReOpCo := TCrReOpCo.Create(self);
        try
           ReOpCo.Apli :=dmMain.apMain;     ReOpCo.ParamCre:=ParamCre;
           ReOpCo.Catalogo;
        finally
               ReOpCo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRSTCONFI' then      //Configura Situaciones
     begin
        ConfiSit := TCrStConfi.Create(self);
        try
           ConfiSit.Apli := dmMain.apMain;
           ConfiSit.ParamCre:=ParamCre;
           ConfiSit.Catalogo;
        finally
           ConfiSit.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSTVALID' then       //Cat�logo Cambio de Situaci�n Manual
     begin
        ValiaSit := TCrStValid.Create(self);
        try
           ValiaSit.Apli :=dmMain.apMain;
           ValiaSit.ParamCre:=ParamCre;           ValiaSit.Catalogo;
        finally
               ValiaSit.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCASTMA' then        //Cat�logo de Situaciones Manuales
     begin
        SitManual := TCrCaStMa.Create(self);
        try
           SitManual.Apli := dmMain.apMain;
           SitManual.ParamCre:=ParamCre;
           SitManual.Catalogo;
        finally
           SitManual.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRINTERES' then       //Consulta a Periodos de Intereses
     begin
        Interes := TCrInteres.Create(self);
        try
           Interes.Apli:=dmMain.apMain;     Interes.ParamCre:=ParamCre;     Interes.Catalogo;
        finally
               Interes.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRTRANSAC' then       //Consulta Transacciones
     begin
        Transac := TCrTransac.Create(self);
        try
           Transac.Apli :=dmMain.apMain;     Transac.ParamCre:=ParamCre;
           Transac.Catalogo;
        finally
               Transac.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRDETTRAN' then       //Consulta de detalle de transacciones
     begin
        DetTransac := TCrDetTran.Create(self);
        try
           DetTransac.Apli :=dmMain.apMain;     DetTransac.ParamCre:=ParamCre;
           DetTransac.Catalogo;
        finally
               DetTransac.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOMAIL' then        //Grupo de Emisor de Proveedores
     begin
        CrMailEnv := TCrCoMail.Create(self);
        try
           CrMailEnv.Apli :=dmMain.apMain;
           CrMailEnv.ParamCre:=ParamCre;           CrMailEnv.Catalogo;
        finally
               CrMailEnv.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCAPITAL' then       //Consulta a Periodos de Capital
     begin
        Capital := TCrCapital.Create(self);
        try
           Capital.Apli:=dmMain.apMain;     Capital.ParamCre:=ParamCre;     Capital.Catalogo;
        finally
               Capital.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCONTENTS' then        //Contens
     begin
        CatContens := TContents.Create(self);
        try
           CatContens.Apli :=dmMain.apMain;     CatContens.ParamCre:=ParamCre;
           CatContens.Catalogo;
        finally
               CatContens.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TVCRCAPITA' then       //Consulta de Periodos de Capital
     begin
        PerCap := TVcrcapita.Create(self);
        try
           PerCap.Apli :=dmMain.apMain;     PerCap.ParamCre:=ParamCre;
           PerCap.Catalogo;
        finally
               PerCap.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TVCRCOMISI' then       //Consulta de periodos de Comisi�n
     begin
        PerComis := TVcrcomisi.Create(self);
        try
           PerComis.Apli :=dmMain.apMain;     PerComis.ParamCre:=ParamCre;
           PerComis.Catalogo;
        finally
               PerComis.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TVCRINTERE' then       //Periodos de interes
     begin
        PerInt := TVcrIntere.Create(self);
        try
           PerInt.Apli :=dmMain.apMain;     PerInt.ParamCre:=ParamCre;
           PerInt.Catalogo;
        finally
               PerInt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCAPOP' then         //Captura de Operaciones ( Actualizador )
     begin
        CapOper := TCrcapop.Create(self);
        try
           CapOper.Apli :=dmMain.apMain;     CapOper.ParamCre:=ParamCre;
           CapOper.Catalogo;
        finally
               CapOper.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCREMISOR' then        //Emisor
     begin
        Emisor := TCrEmisor.Create(self);
        try
           Emisor.Apli :=dmMain.apMain;     Emisor.ParamCre:=ParamCre;
           Emisor.Catalogo;
        finally
               Emisor.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREMGPPR' then        //Grupo de Emisor de Proveedores
     begin
        EmisGpoPrv := TCrEmGpPr.Create(self);
        try
           EmisGpoPrv.Apli :=dmMain.apMain;
           EmisGpoPrv.ParamCre:=ParamCre;           EmisGpoPrv.Catalogo;
        finally
               EmisGpoPrv.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRTDOCTO' then        //Tipos de Documentos
     begin
        TipoDocto := TCrTDocto.Create(self);
        try
           TipoDocto.Apli :=dmMain.apMain;     TipoDocto.ParamCre:=ParamCre;
           TipoDocto.Catalogo;
        finally
               TipoDocto.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREMISDOC' then       //Documentos por Emisor
     begin
        EmisDocto := TCrEmisDoc.Create(self);
        try
           EmisDocto.Apli :=dmMain.apMain;     EmisDocto.ParamCre:=ParamCre;
           EmisDocto.Catalogo;
        finally
               EmisDocto.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPROVEED' then       //Proveedor
     begin
        Proveedor := TCrProveed.Create(self);
        try
           Proveedor.Apli :=dmMain.apMain;     Proveedor.ParamCre:=ParamCre;
           Proveedor.Catalogo;
        finally
               Proveedor.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGRUPRO' then        //Grupo de Proveedores
     begin
        GrupoProv  := TCrGruPro.Create(self);
        try
           GrupoProv.Apli :=dmMain.apMain;
           GrupoProv.ParamCre:=ParamCre;           GrupoProv.Catalogo;
        finally
               GrupoProv.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREMIPRO' then        //Relaci�n Emisor - Proveedor
     begin
        EmiPro := TCrEmiPro.Create(self);
        try
           EmiPro.Apli :=dmMain.apMain;     EmiPro.ParamCre:=ParamCre;
           EmiPro.Catalogo;
        finally
               EmiPro.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCESION' then        //Alta de Cesi�n
     begin
        Cesion := TCrCesion.Create(self);
        try
           Cesion.Apli :=dmMain.apMain;     Cesion.ParamCre:=ParamCre;
           Cesion.Catalogo;
        finally
               Cesion.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRDOCTO' then         //Alta Documento
     begin
        Documento := TCrDocto.Create(self);
        try
           Documento.Apli :=dmMain.apMain;     Documento.ParamCre:=ParamCre;
           Documento.Catalogo;
        finally
               Documento.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREMISEG' then        //Relaci�n Emisor - Seguimiento TCrEmiSeg
     begin
        EmiSeguim := TCrEmiSeg.Create(self);
        try
           EmiSeguim.Apli := dmMain.apMain;           EmiSeguim.ParamCre:=ParamCre;
           EmiSeguim.Catalogo;
        finally
           EmiSeguim.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCESCOM' then        //Cat�logo de Comisi�n por cesi�n
     begin
        CrCesComis:= TCrCesCom.Create(self);
        try
           CrCesComis.Apli :=dmMain.apMain;
           CrCesComis.ParamCre:=ParamCre;           CrCesComis.Catalogo;
        finally
               CrCesComis.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPROSEC' then        // Sector por proveedor
     begin
        ProvSector := TCrProSec.Create(self);
        try
          ProvSector.Apli := dmMain.apMain;          ProvSector.ParamCre:=ParamCre;
          ProvSector.Catalogo;
        finally
          ProvSector.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRARCHNAF' then       //Carga de Archivos NAFIN
     begin
        CarArchNaf := TCrArchNaf.Create(self);
        try
           CarArchNaf.Apli :=dmMain.apMain;     CarArchNaf.ParamCre:=ParamCre;
           CarArchNaf.InputFormat := C_CADENA;
           CarArchNaf.Catalogo;
        finally
           CarArchNaf.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRARCPYME' then       //Carga de Archivos PYME
     begin
        CarArchNaf := TCrArchNaf.Create(self);
        try
           CarArchNaf.Apli        := dmMain.apMain;
           CarArchNaf.ParamCre    := ParamCre;
           CarArchNaf.InputFormat := C_CRPYME;
           CarArchNaf.Catalogo;
        finally
               CarArchNaf.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRNOTIFIC' then       //Notificaci�n de Cesiones
     begin
        CrNotific := TCrNotific.Create(self);
        try
           CrNotific.Apli :=dmMain.apMain;     CrNotific.ParamCre:=ParamCre;
           CrNotific.Catalogo;
        finally
               CrNotific.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRVEEMIPR' then       // Env�o de Vencimientos por Correo
     begin
        Crveemipr :=  TCrveemipr.Create(self);
        try
           Crveemipr.Apli := dmMain.apMain;
           Crveemipr.Catalogo;
        finally
               Crveemipr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREMAEMI' then        //Relaci�n Destinatarios (email) con el Emisor
     begin
        CrEmaEmi  := TCrEmaEmi.Create(self);
        try
           CrEmaEmi.Apli :=dmMain.apMain;     CrEmaEmi.ParamCre:=ParamCre;
           CrEmaEmi.Catalogo;
        finally
               CrEmaEmi.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRCOCTDT'  then  //FJR 01.08.2012
     begin
        CrCoCtDt:=  TCrCoCtDt.Create(self);
        try
           CrCoCtDt.Apli := dmMain.apMain;
           CrCoCtDt.ParamCre:=ParamCre;
           CrCoCtDt.Catalogo;
        finally
           CrCoCtDt.Free;
        end;
     end 
     else if NomFuncion = 'CLASE_TCRMANREM' then        //Menejo de Remanentes
     begin
        ManRem := TCrManRem.Create(self);
        try
           ManRem.Apli :=dmMain.apMain;     ManRem.ParamCre:=ParamCre;
           ManRem.Catalogo;
        finally
               ManRem.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREFAELE' then  // Reporte de Documentos de Factoraje Electronico JFOF 16/10/2012
     begin
        CrReFaEle  := TCrReFaEle.Create(self);
          try
             CrReFaEle.Apli :=dmMain.apMain;
             CrReFaEle.ParamCre:=ParamCre;
             CrReFaEle.Catalogo;
          finally
             CrReFaEle.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRREPALER' then       //Reporte de Alertas de Vencimientos "Emisor" JFOF 07/02/2013
     begin
        CrRepAler := TCrRepAler.Create(self);
        try
           CrRepAler.Apli := dmMain.apMain;
           CrRepAler.ParamCre:=ParamCre;
           CrRepAler.Catalogo;
        finally
           CrRepAler.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRAMEFAC' then        //Informaci�n AMEFAC
     begin
        Amefac := TCrAmefac.Create(self);
        try
           Amefac.Apli :=dmMain.apMain;     Amefac.ParamCre:=ParamCre;
           Amefac.Catalogo;
        finally
               Amefac.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRSECOPR' then        //Seguimiento de Cobranza (Promotor)
     begin
        SegCobProm := TCrSeCoPr.Create(self);
        try
           SegCobProm.Apli :=dmMain.apMain;     SegCobProm.ParamCre:=ParamCre;
           SegCobProm.Catalogo;
        finally
               SegCobProm.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSECOTO' then        //Seguimiento de Cobranza (Tesoreria)
     begin
        SegCobTeso := TCrSeCoTo.Create(self);
        try
           SegCobTeso.Apli :=dmMain.apMain;     SegCobTeso.ParamCre:=ParamCre;
           SegCobTeso.Catalogo;
        finally
               SegCobTeso.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOBRANZ' then       //Cobranza de Cr�ditos
     begin
        CobranzaCre := TCrcobranz.Create(self);
        try
           CobranzaCre.Apli :=dmMain.apMain;     CobranzaCre.ParamCre:=ParamCre;
           CobranzaCre.Catalogo;
        finally
               CobranzaCre.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCANCOB' then        //Cancela Cobranza
     begin
        CancelaCob := TCrCanCob.Create(self);
        try
           CancelaCob.Apli :=dmMain.apMain;     CancelaCob.ParamCre:=ParamCre;
           CancelaCob.Catalogo;
        finally
               CancelaCob.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRFINADIC' then        //Cancela Cobranza
     begin
        FinAdic  := TCrFinAdic.Create(self);
        try
           FinAdic.Apli :=dmMain.apMain;     FinAdic.ParamCre:=ParamCre;
           FinAdic.Catalogo;
        finally
               FinAdic.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCDQTQBC' then        // Condonaciones Quitas Quebrantos y Castigos
     begin
        CrCdQtQbC  := TCrCdQtQbC.Create(self);
        try
           CrCdQtQbC.Apli := dmMain.apMain;
           CrCdQtQbC.ParamCre := ParamCre;
           CrCdQtQbC.Catalogo;
        finally
           CrCdQtQbC.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOBPAS' then        // Liquidacion de creditos pasivos
     begin
        CrCobPas   := TCrCobPas.Create(self);
        try
           CrCobPas.Apli := dmMain.apMain;
           CrCobPas.ParamCre := ParamCre;
           CrCobPas.Catalogo;
        finally
           CrCobPas.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPRORRAT' then        // Prorrateo de Capital   ROIM 20/06/2007
     begin
        MProrra   := TMProrrat.Create(self);
        try
           MProrra.Apli := dmMain.apMain;
           MProrra.ParamCre := ParamCre;
           MProrra.Catalogo;
        finally
           MProrra.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRVTACART' then       //Venta de cartera
     begin
        VtaCartera := TCrVtaCart.Create(self);
        try
           VtaCartera.Apli :=dmMain.apMain;     VtaCartera.ParamCre:=ParamCre;
           VtaCartera.Catalogo;
        finally
               VtaCartera.Free;
        end;
     end	 
     else if NomFuncion = 'CLASE_TMREEMIPRO' then       //Reporte Documentos por Emisor/Proveedor
     begin
        MReEmiPro  := TMReEmiPro.Create(self);
        try
           MReEmiPro.Apli :=dmMain.apMain;
           MReEmiPro.ParamCre:=ParamCre;           MReEmiPro.Catalogo;
        finally
               MReEmiPro.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREDOCEMI' then       //Reporte de Documentos por Emisor
     begin
        MReDocEmi  := TMReDocEmi.Create(self);
        try
           MReDocEmi.Apli :=dmMain.apMain;
           MReDocEmi.ParamCre:=ParamCre;           MReDocEmi.Catalogo;
        finally
               MReDocEmi.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMAVCESION' then       //Reporte de Avisos por Cesi�n
     begin
        MAvCesion  := TMAvCesion.Create(self);
        try
           MAvCesion.Apli :=dmMain.apMain;
           MAvCesion.ParamCre:=ParamCre;           MAvCesion.Catalogo;
        finally
               MAvCesion.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMAVDOC' then          //Avisos por Remanentes, Inter por Dev.
     begin
        MAvDoc  := TMAvDoc.Create(self);
        try
           MAvDoc.Apli :=dmMain.apMain;
           MAvDoc.ParamCre:=ParamCre;           MAvDoc.Catalogo;
        finally
               MAvDoc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPROXEMI' then        //Reporte de Proveedores por Emisor
     begin
        MProxEmi  := TMProxEmi.Create(self);
        try
           MProxEmi.Apli :=dmMain.apMain;
           MProxEmi.ParamCre:=ParamCre;           MProxEmi.Catalogo;
        finally
               MProxEmi.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREDEVCOM' then       //Reporte de Devoluciones(Remanente-Intereses Devengados, Comisi�n por pago Oportuno)
     begin
        MReDevCom  := TMReDevCom.Create(self);
        try
           MReDevCom.Apli :=dmMain.apMain;
           MReDevCom.ParamCre:=ParamCre;           MReDevCom.Catalogo;
        finally
               MReDevCom.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREAUCRED' then       //Reporte de Autorizaciones de Dispos.
     begin
        MReAuCred  := TMReAuCred.Create(self);
        try
           MReAuCred.Apli :=dmMain.apMain;
           MReAuCred.ParamCre:=ParamCre;           MReAuCred.Catalogo;
        finally
               MReAuCred.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMINFCOBR' then        //Reporte Informe de la Cobranza
     begin
        MInfCobr  := TMInfCobr.Create(self);
        try
           MInfCobr.Apli :=dmMain.apMain;
           MInfCobr.ParamCre:=ParamCre;           MInfCobr.Catalogo;
        finally
               MInfCobr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMSGCOBR' then         //Reporte de Seguimiento de Cobranza
     begin
        MSgCobr  := TMSgCobr.Create(self);
        try
           MSgCobr.Apli :=dmMain.apMain;
           MSgCobr.ParamCre:=ParamCre;           MSgCobr.Catalogo;
        finally
               MSgCobr.Free;
        end;
     end
     //else if NomFuncion = 'CLASE_TMPROGVEN' then        //Programaci�n de Vencimientos
     else if NomFuncion = 'CLASE_TMCONTVENC' then  //Programaci�n de Vencimientos Contabilidad
     begin
        MContVenc  := TMContVenc.Create(self);
        try
           MContVenc.Apli :=dmMain.apMain;
           MContVenc.ParamCre:=ParamCre;           MContVenc.ShowWindow(ftConsulta);
        finally
               MContVenc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRCOCAMOR' then  // Reporte Comisiones Cobradas, Castigos y Moras Cobradas JFOF
     begin
        MrCocamor  := TMrcocamor.Create(self);
          try
             MrCocamor.Apli :=dmMain.apMain;
             MrCocamor.ParamCre:=ParamCre;
             MrCocamor.Catalogo;
          finally
             MrCocamor.Free;
        end;
     end	 
     else if NomFuncion = 'CLASE_TMPROGVEN' then        //Programaci�n de Vencimientos
     begin
        MProgVen  := TMProgVen.Create(self);
          try
             MProgVen.Apli :=dmMain.apMain;
             MProgVen.ParamCre:=ParamCre;           MProgVen.Catalogo;
          finally
               MProgVen.Free;
        end;
     end


     else if NomFuncion = 'CLASE_TMPROVEMA' then  //ROIM Agosto 2009  Pronostico de Vencimiento Masivo
     begin
        MProVeMa  := TMProVeMa.Create(self);
        try
           MProVeMa.Apli :=dmMain.apMain;
           MProVeMa.ParamCre:=ParamCre;           MProVeMa.ShowWindow(ftConsulta);
        finally
               MProVeMa.Free;
        end;
     end


     else if NomFuncion = 'CLASE_TMCOLOCA' then         //Reporte de Colocaci�n y/o Vencimientos
     begin
        MColoca  := TMColoca.Create(self);
        try
           MColoca.Apli :=dmMain.apMain;
           MColoca.ParamCre:=ParamCre;           MColoca.Catalogo;
        finally
               MColoca.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRECPREMI' then     //Reporte Reconocimiento del Premio
     begin
        MRecPremi := TMRecPremi.Create(self);
        try
           MRecPremi.Apli :=dmMain.apMain;
           MRecPremi.ParamCre:=ParamCre;           MRecPremi.Catalogo;
        finally
               MRecPremi.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCOCHAD' then         //Consulta de Chequeras Adminstrativas
     begin
        MCoChAd := TMCoChAd.Create(self);
        try
          MCoChAd.Apli := dmMain.apMain;
          MCoChAd.ParamCre:=ParamCre;          MCoChAd.Catalogo;
        finally
          MCoChAd.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRMFINADI' then     //Informe Financiamiento Adicional
     begin
        MFinAdi   := TCrMFinAdi.Create(self);
        try
           MFinAdi.Apli := dmMain.apMain;
           MFinAdi.ParamCre:=ParamCre;           MFinAdi.Catalogo;
        finally
                MFinAdi.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMREFONDEO' then     //Fondeo Diario
     begin
        MReFondeo := TMReFondeo.Create(self);
        try
           MReFondeo.Apli := dmMain.apMain;
           MReFondeo.ParamCre:=ParamCre;           MReFondeo.Catalogo;
        finally
                MReFondeo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCRCOBCOM' then     //Reporte de Comisiones Cobradas
     begin
        MCrCobCom := TMCrCobCom.Create(self);
        try
           MCrCobCom.Apli := dmMain.apMain;
           MCrCobCom.ParamCre:=ParamCre;           MCrCobCom.Catalogo;
        finally
                MCrCobCom.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMBIAVMAIL' then     //Bitacora de Envio de Avisos por Mail
     begin
        BiAvMail := TMBiAvMail.Create(self);
        try
           BiAvMail.Apli := dmMain.apMain;
           BiAvMail.ParamCre:=ParamCre;           BiAvMail.Catalogo;
        finally
                BiAvMail.Free;
        end;
     end
	 
     else if NomFuncion = 'CLASE_TMPROVEGL' then  //JFOF Disiembre 2011  Reporte de Adeudos Global
     begin
        MProVeGl  := TMProVeGl.Create(self);
        try
           MProVeGl.Apli :=dmMain.apMain;
           MProVeGl.ParamCre:=ParamCre;           MProVeGl.ShowWindow(ftConsulta);
        finally
               MProVeGl.Free;
        end;
     end	 

     else if NomFuncion = 'CLASE_TMCTRLCOLO' then         //Reporte de Colocaci�n y/o Vencimientos
     begin
        MCtrlColo  := TMCtrlColo.Create(self);
        try
           MCtrlColo.Apli :=dmMain.apMain;
           MCtrlColo.ParamCre:=ParamCre;           MCtrlColo.Catalogo;
        finally
               MCtrlColo.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TRSMCOLO'  then  //RIRA4281 31Dic10
     begin
        RsmColo :=  TRsmColo.Create(self);
        try
           RsmColo.Apli := dmMain.apMain;
           RsmColo.ParamCre:=ParamCre;
           RsmColo.Catalogo;
        finally
           RsmColo.Free;
        end;
     end
   

     else if NomFuncion = 'CLASE_TCRREPFOV' then            //Reporte de eventos Fovis
     begin
        CrRepFov:= TCrRepFov.Create(self);
        try
           CrRepFov.Apli:=dmMain.apMain;
           CrRepFov.ParamCre:=ParamCre;
           CrRepFov.Catalogo;
        finally
               CrRepFov.Free;
        end;
     end

	 
     else If NomFuncion = 'CLASE_TCRESTHIST' then       //Consultas Estad�sticas Hist�ricas
     begin
        EstadHist := TCrEstHist.Create(self);
        try
           EstadHist.Apli := dmMain.apMain;
           EstadHist.ParamCre:=ParamCre;           EstadHist.Catalogo;
        finally
           EstadHist.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMREPCTROL' then       //Reporte de Control de Garant�as
     begin
        MRepCtrol := TMRepCtrol.Create(self);
        try
           MRepCtrol.Apli :=dmMain.apMain;
           MRepCtrol.ParamCre:=ParamCre;           MRepCtrol.Catalogo;
        finally
           MRepCtrol.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREPGARAC' then       //Reporte de Estado Garant�as-Disposici�n
     begin
        MRepGarAc := TMRepGarAc.Create(self);
        try
           MRepGarAc.Apli :=dmMain.apMain;
           MRepGarAc.ParamCre:=ParamCre;           MRepGarAc.Catalogo;
        finally
           MRepGarAc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREPGLBCR' then       //Reporte de Garant�as Global de Cr�ditos al Sector Agropecuario
     begin
        MRepGlbCr := TMRepGlbCr.Create(self);
        try
           MRepGlbCr.Apli :=dmMain.apMain;
           MRepGlbCr.ParamCre:=ParamCre;           MRepGlbCr.Catalogo;
        finally
           MRepGlbCr.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMINCOCOB' then        //Informe de la Cobranza  Contable
     begin
        MInfCoCob  := TMInCoCob.Create(self);
        try
           MInfCoCob.Apli :=dmMain.apMain;
           MInfCoCob.ParamCre:=ParamCre;           MInfCoCob.Catalogo;
        finally
               MInfCoCob.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMSENICREB' then     //Reporte Relaci�n de Responsabilidades para Banco de M�xico
     begin
        Senicreb := TMSenicreb.Create(self);
        try
           Senicreb.Apli := dmMain.apMain;
           Senicreb.ParamCre:=ParamCre;
           Senicreb.Catalogo;
        finally
           Senicreb.Free;
        end;
     end

    //< EASA4011  28/07/2006
     else If NomFuncion = 'CLASE_TMCEDEXPG' then     //C�dula de Experiencia de Pago
     begin
        MCedExPg := TMCedExPg.Create(self);
        try
           MCedExPg.Apli := dmMain.apMain;
           MCedExPg.ParamCre:=ParamCre;
           MCedExPg.Catalogo;
        finally
           MCedExPg.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMEDOMOVTO' then     //Estado de Movimientos
     begin
        MEdoMovto := TMEdoMovto.Create(self);
        try
           MEdoMovto.Apli := dmMain.apMain;
           MEdoMovto.ParamCre:=ParamCre;
           MEdoMovto.Catalogo;
        finally
           MEdoMovto.Free;
        end;
     end
    //EASA4011 >/

     else if NomFuncion = 'CLASE_TMPRADEUDO' then       //Pron�stico de Adeudo
     begin
        MPrAdeudo := TMPrAdeudo.Create(self);
        try
           MPrAdeudo.Apli :=dmMain.apMain;
           MPrAdeudo.ParamCre:=ParamCre;           MPrAdeudo.Catalogo;
        finally
               MPrAdeudo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMDISPDET' then        //Orden de Disposici�n/Detalle de Cr�dito
     begin
        MDispDet := TMDispDet.Create(self);
        try
           MDispDet.Apli :=dmMain.apMain;
           MDispDet.ParamCre:=ParamCre;           MDispDet.Catalogo;
        finally
               MDispDet.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCATMIN' then         //Reporte de Cat�logo M�nimo
     begin
        MCatMin := TMCatMin.Create(self);
        try
           MCatMin.Apli :=dmMain.apMain;
           MCatMin.ParamCre:=ParamCre;           MCatMin.Catalogo;
        finally
               MCatMin.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMINGPROM' then        //Reporte Ingresos por Promotor
     begin
        MIngProm := TMIngProm.Create(self);
        try
           MIngProm.Apli :=dmMain.apMain;
           MIngProm.ParamCre:=ParamCre;           MIngProm.Catalogo;
        finally
               MIngProm.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCARTVENC' then       //Reporte Cartera Vencida por Promotor
     begin
        MCartVenc := TMCartVenc.Create(self);
        try
           MCartVenc.Apli :=dmMain.apMain;
           MCartVenc.ParamCre:=ParamCre;           MCartVenc.Catalogo;
        finally
               MCartVenc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMGARFEG' then       //Reporte de Garant�as FEGA
     begin
        MGarFeg  := TMGarFeg.Create(self);
        try
           MGarFeg.Apli :=dmMain.apMain;
           MGarFeg.ParamCre:=ParamCre;           MGarFeg.Catalogo;
        finally
               MGarFeg.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMACCION' then         //Reporte Integraci�n Accionaria
     begin
        MAccion := TMAccion.Create(self);
        try
           MAccion.Apli :=dmMain.apMain;
           MAccion.ParamCre:=ParamCre;           MAccion.Catalogo;
        finally
               MAccion.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMAAFEGA' then        //Reporte de antiguedad de Aplicaci�n de Garant�as FEGA
     begin
        MAAFega := TMAAFega.Create(self);
        try
           MAAFega.Apli :=dmMain.apMain;
           MAAFega.ParamCre:=ParamCre;           MAAFega.Catalogo;
        finally
               MAAFega.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMSEGGAR' then        //Reporte de Situaci�n de P�lizas de Seguro por Garant�a
     begin
        MSegGar := TMSegGar.Create(self);
        try
           MSegGar.Apli :=dmMain.apMain;
           MSegGar.ParamCre:=ParamCre;           MSegGar.Catalogo;
        finally
               MSegGar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCRCOSTFE' then        //Reporte de Costo Fega
     begin
        MCrCostFe := TMCrCostFe.Create(self);
        try
           MCrCostFe.Apli :=dmMain.apMain;
           MCrCostFe.ParamCre:=ParamCre;           MCrCostFe.Catalogo;
        finally
               MCrCostFe.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMEDOCTA' then        //Estado de Cuenta
     begin
        MEdoCta := TMEdoCta.Create(self);
        try
           MEdoCta.Apli :=dmMain.apMain;
           MEdoCta.ParamCre:=ParamCre;           MEdoCta.Catalogo;
        finally
               MEdoCta.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMEDOCTADD' then        //Estado de Cuenta de Descuento de Documentos
     begin
        MEdoCtaDD := TMEdoCtaDD.Create(self);
        try
           MEdoCtaDD.Apli :=dmMain.apMain;
           MEdoCtaDD.ParamCre:=ParamCre;           MEdoCtaDD.Catalogo;
        finally
               MEdoCtaDD.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMEDOCTAC' then        //Estado de Cuenta certificado
     begin
        MEdoCtaC := TMEdoCtaC.Create(self);
        try
           MEdoCtaC.Apli :=dmMain.apMain;
           MEdoCtaC.ParamCre:=ParamCre;           MEdoCtaC.Catalogo;
        finally
               MEdoCtaC.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRECCOSO' then        //Estado de Cuenta certificado
     begin
        CrEcCoSo := TCrEcCoSo.Create(self);
        try
           CrEcCoSo.Apli :=dmMain.apMain;
           CrEcCoSo.ParamCre:=ParamCre;           CrEcCoSo.Catalogo;
        finally
               CrEcCoSo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMIMPECC' then        //Impresion de Estado de Cuenta Certificado
     begin
        MImpECC := TMImpECC.Create(self);
        try
           MImpECC.Apli :=dmMain.apMain;
           MImpECC.ParamCre:=ParamCre;           MImpECC.Catalogo;
        finally
               MImpECC.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREPSIEB' then        //Reporte de Siebam
     begin
        MRepSieb := TMRepSieb.Create(self);
        try
           MRepSieb.Apli :=dmMain.apMain;
           MRepSieb.ParamCre:=ParamCre;           MRepSieb.Catalogo;
        finally
               MRepSieb.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPROVDIAR' then        //Reporte de Provisi�n Diaria
     begin
        MProvDiar := TMProvDiar.Create(self);
        try
           MProvDiar.Apli :=dmMain.apMain;
           MProvDiar.ParamCre:=ParamCre;
           MProvDiar.Catalogo;
        finally
               MProvDiar.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMFNDCOLOC' then       //Colocaci�n pasiva
     begin
        MFndColoc := TMFndColoc.Create(self);
        try
           MFndColoc.Apli := dmMain.apMain;
           MFndColoc.ParamCre:=ParamCre;
           MFndColoc.Catalogo;
        finally
           MFndColoc.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMFNDPROV' then        //Provisi�n pasiva
     begin
        MFndProv := TMFndProv.Create(self);
        try
           MFndProv.Apli     := dmMain.apMain;
           MFndProv.ParamCre := ParamCre;
           MFndProv.Catalogo;
        finally
           MFndProv.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMFNDCLP' then        //Reporte de Pasivo Corto Largo Plazo ROIM 2014.06.13
     begin
        MFndCLP := TMFndCLP.Create(self);
        try
           MFndCLP.Apli     := dmMain.apMain;
           MFndCLP.ParamCre := ParamCre;
           MFndCLP.Catalogo;
        finally
           MFndCLP.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMFNDVENC' then        //Vencimientos pasivos
     begin
        MFndVenc := TMFndVenc.Create(self);
        try
           MFndVenc.Apli     := dmMain.apMain;
           MFndVenc.ParamCre := ParamCre;
           MFndVenc.Catalogo;
        finally
           MFndVenc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRPASIVO' then  // Reporte de Cartera Pasiva JFOF
     begin
        MrPasivo  := TMrPasivo.Create(self);
          try
             MrPasivo.Apli :=dmMain.apMain;
             MrPasivo.ParamCre:=ParamCre;
             MrPasivo.Catalogo;
          finally
             MrPasivo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREPCHQAC' then        //Relaci�n de Saldos Bloqueados/Desbloqueados
     begin
        CtaChqAcr := TMRepChqAc.Create(self);
        try
           CtaChqAcr.Apli     := dmMain.apMain;
           CtaChqAcr.ParamCre := ParamCre;
           CtaChqAcr.Catalogo;
        finally
           CtaChqAcr.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMREPSDOPR' then       //Reporte Saldo Proyectado Mes Siguiente
     begin
        MRepSdoPr :=  TMRepSdoPr.Create(self);
        try
           MRepSdoPr.Apli := dmMain.apMain;
           MRepSdoPr.ParamCre:=ParamCre;
           MRepSdoPr.Catalogo;
        finally
           MRepSdoPr.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMSDOSPROM' then       //Saldos por Promotor
     begin
        MSdosProm :=  TMSdosProm.Create(self);
        try
           MSdosProm.Apli := dmMain.apMain;
           MSdosProm.ParamCre:=ParamCre;
           MSdosProm.Catalogo;
        finally
           MSdosProm.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMRESSDOPR' then       //Resumen de Saldos por Promotor
     begin
        MResSdoPr :=  TMResSdoPr.Create(self);
        try
           MResSdoPr.Apli := dmMain.apMain;
           MResSdoPr.ParamCre:=ParamCre;
           MResSdoPr.Catalogo;
        finally
           MResSdoPr.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCRINSDEU' then      //Reporte de Cr�ditos por Inscripci�n de Deuda
     begin
        MCreInscDeu :=  TMCrInsDeu.Create(self);
        try
           MCreInscDeu.Apli := dmMain.apMain;
           MCreInscDeu.ParamCre:=ParamCre;
           MCreInscDeu.Catalogo;
        finally
           MCreInscDeu.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCOMCOBPR' then       //Comisiones Cobradas por Promotor
     begin
        MComCobPr :=  TMComCobPr.Create(self);
        try
           MComCobPr.Apli := dmMain.apMain;
           MComCobPr.ParamCre:=ParamCre;
           MComCobPr.Catalogo;
        finally
           MComCobPr.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMDETACRED' then     //Resumen Detalle por Acreditado
     begin
        MDetAcred :=  TMDetAcred.Create(self);
        try
           MDetAcred.Apli := dmMain.apMain;
           MDetAcred.ParamCre:=ParamCre;
           MDetAcred.Catalogo;
        finally
           MDetAcred.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMEXPPAGO' then      //Experiencia de Pago
     begin
        MExpPago :=  TMExpPago.Create(self);
        try
           MExpPago.Apli := dmMain.apMain;
           MExpPago.ParamCre:=ParamCre;
           MExpPago.Catalogo;
        finally
           MExpPago.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCLIENTFI' then     //Reporte de Clientes de Entidades Finacieras, Municipios y sus Organismos Descentralizados
     begin
        MCliEntFi :=  TMCliEntFi.Create(self);
        try
           MCliEntFi.Apli := dmMain.apMain;
           MCliEntFi.ParamCre:=ParamCre;
           MCliEntFi.Catalogo;
        finally
           MCliEntFi.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMSDOBLOQ' then        //Relaci�n de Saldos Bloqueados/Desbloqueados
     begin
        SdoBqDSbq := TMSdoBloq.Create(self);
        try
           SdoBqDSbq.Apli     := dmMain.apMain;
           SdoBqDSbq.ParamCre := ParamCre;
           SdoBqDSbq.Catalogo;
        finally
           SdoBqDSbq.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCOMPDEP' then        //Comparativo de Dep�sitos esperados contra Dep�sitos recibidos por Concepto de Fuente de Pago
     begin
        CompDep := TMCompDep.Create(self);
        try
           CompDep.Apli     := dmMain.apMain;
           CompDep.ParamCre := ParamCre;
           CompDep.Catalogo;
        finally
           CompDep.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMBITQCQC' then        //Bit�cora de Quitas, Condonaciones, Quebrantos y Castigos
     begin
        BitQCQC := TMBitQCQC.Create(self);
        try
           BitQCQC.Apli     := dmMain.apMain;
           BitQCQC.ParamCre := ParamCre;
           BitQCQC.Catalogo;
        finally
           BitQCQC.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMMOVENTFE' then     //Mensual Movimientos Creditos a Entidades Federativas, Municipios y sus Organismos Descentralizados
     begin
        MMovEntFe :=  TMMovEntFe.Create(self);
        try
           MMovEntFe.Apli := dmMain.apMain;
           MMovEntFe.ParamCre:=ParamCre;
           MMovEntFe.Catalogo;
        finally
           MMovEntFe.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCONSADEU' then       //Consolidado de Adeudos
     begin
        MConsAdeu :=  TMConsAdeu.Create(self);
        try
           MConsAdeu.Apli := dmMain.apMain;
           MConsAdeu.ParamCre:=ParamCre;
           MConsAdeu.Catalogo;
        finally
           MConsAdeu.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCNSADTO' then       //Consolidado de Adeudos Total c/cartar de credito
     begin
        Cnsadto :=  TCnsadto.Create(self);
        try
           Cnsadto.Apli := dmMain.apMain;
           Cnsadto.ParamCre:=ParamCre;
           Cnsadto.Catalogo;
        finally
           Cnsadto.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMRECRECIB' then     //Reporte Recursos Recibidos
     begin
        MRecRecib :=  TMRecRecib.Create(self);
        try
           MRecRecib.Apli := dmMain.apMain;
           MRecRecib.ParamCre:=ParamCre;
           MRecRecib.Catalogo;
        finally
           MRecRecib.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMREPVENC' then     //Reporte de Vencimientos
     begin
        MRepVenc := TMRepVenc.Create(self);
        try
           MRepVenc.Apli := dmMain.apMain;
           MRepVenc.ParamCre:=ParamCre;
           MRepVenc.Catalogo;
        finally
           MRepVenc.Free;
        end;
     end

     else if NomFuncion='CLASE_TCRCIERRE'   then        //cierre
     begin
        CrCierre := TCrCierre.Create(self);
        try
           CrCierre.Apli :=dmMain.apMain;
           CrCierre.ParamCre:=ParamCre;
           //CrCierre.Catalogo;
           CrCierre.ShowWindow(ftConsulta);
        finally
               CrCierre.Free;
        end;
     end
     else if NomFuncion='CLASE_TCRCIERCO'   then        //CIERRE COINCRE 12/11/2013 JFOF
     begin
        CrCierCo := TCrCierCo.Create(self);
        try
           CrCierCo.Apli :=dmMain.apMain;
           CrCierCo.ParamCre:=ParamCre;
           //CrCierre.Catalogo;
           CrCierCo.ShowWindow(ftConsulta);
        finally
           CrCierCo.Free;
        end;
     end
     else if NomFuncion='CLASE_TCRCIEEDC'   then        //CIERRE EDOCTA 25/02/2014 JFOF
     begin
        CrCieEdc := TCrCieEdc.Create(self);
        try
           CrCieEdc.Apli :=dmMain.apMain;
           CrCieEdc.ParamCre:=ParamCre;
           //CrCierre.Catalogo;
           CrCieEdc.ShowWindow(ftConsulta);
        finally
           CrCieEdc.Free;
        end;
     end
     else if NomFuncion='CLASE_TCRAPERT'   then         //APERTURA
     begin
        CrApertura := TCrApert.Create(self);
        try
           CrApertura.Apli :=dmMain.apMain;
           CrApertura.ParamCre:=ParamCre;           CrApertura.Catalogo;
        finally
               CrApertura.Free;
        end;
     end

     else if NomFuncion='CLASE_TCRREDIGIT'   then        //RUCJ4248: Acceso a la redigitalizaci�n
     begin
        CrRedigitaDoc := TCrRedigitaDoc.Create(self);
        try
           CrRedigitaDoc.Apli :=dmMain.apMain;
           CrRedigitaDoc.ParamCre:=ParamCre;
           //CrCierre.Catalogo;
           CrRedigitaDoc.ShowWindow(ftConsulta);
        finally
               CrRedigitaDoc.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRLIQPERF' then       //Grupo Perfil de liquidaci�n
     begin
        PerFilLiq := TCrLiqPerf.Create(self);
        try
           PerFilLiq.Apli :=dmMain.apMain;
           PerFilLiq.ParamCre:=ParamCre;           PerFilLiq.Catalogo;
        finally
               PerFilLiq.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRLIQUIDA' then       //Liquidaciones
     begin
        Liquida := TCrliquida.Create(self);
        try
           Liquida.Apli :=dmMain.apMain;
           Liquida.ParamCre:=ParamCre;           Liquida.Catalogo;
        finally
               Liquida.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRLIQDIS' then        //M�dios de Liquidaci�n para Disposiciones
     begin
        LiqDis := TCrLiqDis.Create(self);
        try
           LiqDis.Apli :=dmMain.apMain;     LiqDis.ParamCre:=ParamCre;
           LiqDis.Catalogo;
        finally
               LiqDis.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMLIQUIDAC' then            // Reporte de Liquidaciones
     begin
        Mliquidac := TMliquidac.Create(self);
        try
           Mliquidac.Apli := dmMain.apMain;
           Mliquidac.ParamCre:=ParamCre;           Mliquidac.Catalogo;
        finally
               Mliquidac.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TPRORROGA' then
     begin
        Prorroga := TProrroga.Create(self);
        try
          Prorroga.Apli := dmMain.apMain;
          Prorroga.ParamCre:=ParamCre;          Prorroga.Catalogo;
        finally
          Prorroga.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRFICASE' then             // Cat�logo FIRA Seguros
     begin
        CrFiCaSe := TCrFiCaSe.Create(self);
        try
          CrFiCaSe.Apli := dmMain.apMain;
          CrFiCaSe.ParamCre:=ParamCre;          CrFiCaSe.Catalogo;
        finally
          CrFiCaSe.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRFICOIN' then             // Cat�logo FIRA Concepto Inversi�n
     begin
        CrFiCoIn := TCrFiCoIn.Create(self);
        try
          CrFiCoIn.Apli := dmMain.apMain;
          CrFiCoIn.ParamCre:=ParamCre;          CrFiCoIn.Catalogo;
        finally
          CrFiCoIn.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRFICAPA' then             // Cat�logo de FIRA Causa de Pago
     begin
        CrFiCaPa := TCrFiCaPa.Create(self);
        try
          CrFiCaPa.Apli := dmMain.apMain;
          CrFiCaPa.ParamCre := ParamCre;          CrFiCaPa.Catalogo;
        finally
          CrFiCaPa.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRSUBPRO' then        //Cat�logo de Subdivisiones de PROCAMPO
     begin
        CrSubPro := TCrSubPro.Create(self);
        try
           CrSubPro.Apli := dmMain.apMain;
           CrSubPro.ParamCre:=ParamCre;           CrSubPro.Catalogo;
        finally
           CrSubPro.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCIPROC' then        //Cat�logo de Ciclos de PROCAMPO
     begin
        CrCiProc  := TCrCiProc.Create(self);
        try
           CrCiProc.Apli := dmMain.apMain;
           CrCiProc.ParamCre:=ParamCre;           CrCiProc.Catalogo;
        finally
           CrCiProc.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRGASOAPL' then            // Solicitud de Aplicaci�n de Garant�as
     begin
        CrGaSoApl := TCrGaSoApl.Create(self);
        try
          CrGaSoApl.Apli := dmMain.apMain;
          CrGaSoApl.ParamCre:=ParamCre;          CrGaSoApl.Catalogo;
        finally
          CrGaSoApl.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRGASOLI' then             // Solicitud de Garant�a Liquida
     begin
        CrGaSoLi := TCrGaSoLi.Create(self);
        try
          CrGaSoLi.Apli := dmMain.apMain;
          CrGaSoLi.ParamCre:=ParamCre;          CrGaSoLi.Catalogo;
        finally
          CrGaSoLi.Free;
        end;
      end
     else if NomFuncion = 'CLASE_TCRVENCANT' then       //Modulo de Vencimientos Anticipados
     begin
        CrVencAnt := TCrVencAnt.Create(self);
        try
           CrVencAnt.Apli:=dmMain.apMain;     CrVencAnt.ParamCre:=ParamCre;     CrVencAnt.Catalogo;
        finally
               CrVencAnt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCANCPAS' then       //Modulo de Cancelacion de Pasivos
     begin
        CrCancPas := TCrCancPas.Create(self);
        try
           CrCancPas.Apli:=dmMain.apMain;     CrCancPas.ParamCre:=ParamCre;     CrCancPas.Catalogo;
        finally
               CrCancPas.Free;
        end;
     end
      else If NomFuncion = 'CLASE_TCRGASOFE' then            // Solicitud de Garant�a FEGA
      begin
        CrGaSoFe := TCrGaSoFe.Create(self);
        try
          CrGaSoFe.Apli := dmMain.apMain;
          CrGaSoFe.ParamCre:=ParamCre;          CrGaSoFe.Catalogo;
        finally
          CrGaSoFe.Free;
        end;
     end

      else If NomFuncion = 'CLASE_TSOLFEGACO' then            // Solicitud Garant�a FEGA (Gtia. Liq Cero)
      begin
        SolFEGAco := TSolFEGAco.Create(self);
        try
          SolFEGAco.Apli := dmMain.apMain;
          SolFEGAco.ParamCre:=ParamCre; SolFEGAco.Catalogo;
        finally
          SolFEGAco.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMSOLFACT' then        //Facturaci�n de SIEBAN
     begin
        MSolFact := TMSolFact.Create(self);
        try
           MSolFact.Apli :=dmMain.apMain;
           MSolFact.ParamCre:=ParamCre;           MSolFact.Catalogo;
        finally
           MSolFact.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRAPGAFE' then        //Aplicaci�n de Garant�a FEGA.
     begin
        CrApGarFEGA := TCrApGaFe.Create(self);
        try
           CrApGarFEGA.Apli :=dmMain.apMain;
           CrApGarFEGA.ParamCre:=ParamCre;      CrApGarFEGA.Catalogo;
        finally
               CrApGarFEGA.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMCATENCAB' then       //Cat�logo de Encabezados
     begin
        MCatEncab := TMCatEncab.Create(self);
        try
           MCatEncab.Apli :=dmMain.apMain;
           MCatEncab.ParamCre:=ParamCre;           MCatEncab.Catalogo;
        finally
           MCatEncab.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCATDET' then         //Cat�logo de Detalle
     begin
        MCatDet   := TMCatDet.Create(self);
        try
           MCatDet.Apli :=dmMain.apMain;
           MCatDet.ParamCre:=ParamCre;           MCatDet.Catalogo;
        finally
           MCatDet.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCATFIRMA' then       //Cat�logo de Grupo de Firmas
     begin
        MCatFirma := TMCatFirma.Create(self);
        try
           MCatFirma.Apli :=dmMain.apMain;
           MCatFirma.ParamCre:=ParamCre;           MCatFirma.Catalogo;
        finally
           MCatFirma.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMUSUFIRMA' then       //Cat�logo de Usuarios por grupo de Firmas
     begin
        MUsuFirma := TMUsuFirma.Create(self);
        try
           MUsuFirma.Apli :=dmMain.apMain;
           MUsuFirma.ParamCre:=ParamCre;           MUsuFirma.Catalogo;
        finally
           MUsuFirma.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMTPCTO' then          //Tipo de Contrato
     begin
        MTpCto    := TMTpCto.Create(self);
        try
           MTpCto.Apli :=dmMain.apMain;
           MTpCto.ParamCre:=ParamCre;           MTpCto.Catalogo;
        finally
           MTpCto.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRECTO' then          //Impresiones por Solicitud
     begin
        MReCto    := TMReCto.Create(self);
        try
           MReCto.Apli :=dmMain.apMain;
           MReCto.ParamCre:=ParamCre;           MReCto.Catalogo;
        finally
           MReCto.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPROEMIO' then        //Proemio
     begin
        MProemio  := TMProemio.Create(self);
        try
           MProemio.Apli :=dmMain.apMain;
           MProemio.ParamCre:=ParamCre;           MProemio.Catalogo;
        finally
           MProemio.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMTIPOGAR' then        //Tipo de Garant�a
     begin
        MTipoGar := TMTipoGar.Create(self);
        try
           MTipoGar.Apli :=dmMain.apMain;
           MTipoGar.ParamCre:=ParamCre;           MTipoGar.Catalogo;
        finally
           MTipoGar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMGARANTIA' then       //Cat�logo de Garant�as
     begin
        MGarantia := TMGarantia.Create(self);
        try
           MGarantia.Apli :=dmMain.apMain;
           MGarantia.ParamCre:=ParamCre;           MGarantia.Catalogo;
        finally
           MGarantia.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRHISTGAR'  then       //Cat�logo de Historico de Garant�as Edos Mpios
     begin
        CrHistGar := TCrHistGar.Create(self);
        try
           CrHistGar.Apli :=dmMain.apMain;
           CrHistGar.ParamCre:=ParamCre;           CrHistGar.Catalogo;
        finally
           CrHistGar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGAPPREG'  then       //Registro Garant�as Primeras P�rdidas      ROUY4095 032015
     begin
        CrGaPpReg := TCrGaPpReg.Create(self);
        try
           CrGaPpReg.Apli :=dmMain.apMain;
           CrGaPpReg.ParamCre:=ParamCre;           CrGaPpReg.Catalogo;
        finally
           CrGaPpReg.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREVGAR' then       //Modulo de Reversa de Garantias
     begin
        CrRevGar := TCrRevGar.Create(self);
        try
           CrRevGar.Apli:=dmMain.apMain;     CrRevGar.ParamCre:=ParamCre;     CrRevGar.Catalogo;
        finally
               CrRevGar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPRODGAR' then        //Producto - Garant�a
     begin
        MProdGar := TMProdGar.Create(self);
        try
           MProdGar.Apli :=dmMain.apMain;
           MProdGar.ParamCre:=ParamCre;           MProdGar.Catalogo;
        finally
           MProdGar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMFIRAEQ' then         //Equivalencia de Cobertura Porcentual
     begin
        MFiraEq := TMFiraEq.Create(self);
        try
           MFiraEq.Apli :=dmMain.apMain;
           MFiraEq.ParamCre:=ParamCre;           MFiraEq.Catalogo;
        finally
           MFiraEq.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMTIPORAMO' then       //Tipo de Ramo
     begin
        MTipoRamo := TMTipoRamo.Create(self);
        try
           MTipoRamo.Apli :=dmMain.apMain;
           MTipoRamo.ParamCre:=ParamCre;           MTipoRamo.Catalogo;
        finally
           MTipoRamo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMTIPOPOL' then        //Tipo de P�liza
     begin
        MTipoPol := TMTipoPol.Create(self);
        try
           MTipoPol.Apli :=dmMain.apMain;
           MTipoPol.ParamCre:=ParamCre;           MTipoPol.Catalogo;
        finally
           MTipoPol.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPERITO' then     //Cat�logo de Peritos
     begin
        MPerito  := TMPerito.Create(self);
        try
           MPerito.Apli :=dmMain.apMain;
           MPerito.ParamCre:=ParamCre;           MPerito.Catalogo;
        finally
           MPerito.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMNOTARIO' then        //Cat�logo de Notario / Corredor
     begin
        MNotario  := TMNotario.Create(self);
        try
           MNotario.Apli :=dmMain.apMain;
           MNotario.ParamCre:=ParamCre;           MNotario.Catalogo;
        finally
           MNotario.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMFIRAOPE' then        //Cat�logp de Operativa
     begin
        MFiraOpe := TMFiraOpe.Create(self);
        try
           MFiraOpe.Apli :=dmMain.apMain;
           MFiraOpe.ParamCre:=ParamCre;
           MFiraOpe.Catalogo;
        finally
           MFiraOpe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREGISTRO' then       //Registro de Garant�as
     begin
        MRegistro := TMRegistro.Create(self);
        try
           MRegistro.Apli :=dmMain.apMain;
           MRegistro.ParamCre:=ParamCre;           MRegistro.Catalogo;
        finally
           MRegistro.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCONACRED' then       //Garant�as por Acreditado
     begin
        MConAcred := TMConAcred.Create(self);
        try
           MConAcred.Apli :=dmMain.apMain;
           MConAcred.ParamCre:=ParamCre;           MConAcred.Catalogo;
        finally
           MConAcred.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMTRAMITE' then        //Cat�logo de Tr�mites
     begin
        MTramite  := TMTramite.Create(self);
        try
           MTramite.Apli :=dmMain.apMain;
           MTramite.ParamCre:=ParamCre;           MTramite.Catalogo;
        finally
           MTramite.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRTAVE' then       //Portafolio de Cr�dito
     begin
        CrTAve := TCrTAve.Create(self);
        try
           CrTAve.Apli :=dmMain.apMain;
           CrTAve.ParamCre:=ParamCre;
           CrTAve.Catalogo;
        finally
           CrTAve.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREGION' then       //Portafolio de Cr�dito
     begin
        CrRegion := TCrRegion.Create(self);
        try
           CrRegion.Apli :=dmMain.apMain;
           CrRegion.ParamCre:=ParamCre;
           CrRegion.Catalogo;
        finally
           CrRegion.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMERCOBJ' then       //Portafolio de Cr�dito
     begin
        CrMercObj := TCrMercObj.Create(self);
        try
           CrMercObj.Apli :=dmMain.apMain;
           CrMercObj.ParamCre:=ParamCre;
           CrMercObj.Catalogo;
        finally
           CrMercObj.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMEOBDE' then       //Portafolio de Cr�dito
     begin
        CrMeObDe := TCrMeObDe.Create(self);
        try
           CrMeObDe.Apli :=dmMain.apMain;
           CrMeObDe.ParamCre:=ParamCre;
           CrMeObDe.Catalogo;
        finally
           CrMeObDe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGPFIMA' then       //Portafolio de Cr�dito
     begin
        CrGpFiMa := TCrGpFiMa.Create(self);
        try
           CrGpFiMa.Apli :=dmMain.apMain;
           CrGpFiMa.ParamCre:=ParamCre;
           CrGpFiMa.Catalogo;
        finally
           CrGpFiMa.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCAPBAS' then       //Portafolio de Cr�dito
     begin
        CrCapBas := TCrCapBas.Create(self);
        try
           CrCapBas.Apli :=dmMain.apMain;
           CrCapBas.ParamCre:=ParamCre;
           CrCapBas.Catalogo;
        finally
           CrCapBas.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMAXFNED'  then       //Portafolio de Cr�dito
     begin
        CrMaxFnEd := TCrMaxFnEd.Create(self);
        try
           CrMaxFnEd.Apli :=dmMain.apMain;
           CrMaxFnEd.Catalogo;
        finally
           CrMaxFnEd.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCARTBNC'  then       //Portafolio de Cr�dito
     begin
        CrCartBnc := TCrCartBnc.Create(self);
        try
           CrCartBnc.Apli :=dmMain.apMain;
           CrCartBnc.ParamCre:=ParamCre;
           CrCartBnc.Catalogo;
        finally
           CrCartBnc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRLCBVSCR' then       //Portafolio de Cr�dito
     begin
        CrLCbVsCr := TCrLCbVsCr.Create(self);
        try
           CrLCbVsCr.Apli:=dmMain.apMain;
           CrLCbVsCr.Catalogo;
        finally
               CrLCbVsCr.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TINTCRGPIN' then     //Portafolio de Cr�dito
     begin
        IntCrGpIn := TIntCrGpIn.Create(self);
        try
           IntCrGpIn.Apli := dmMain.apMain;
           IntCrGpIn.Catalogo;
        finally
           IntCrGpIn.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCARTREG' then     //Portafolio de Cr�dito
     begin
        CrCartReg := TCrCartReg.Create(self);
        try
           CrCartReg.Apli := dmMain.apMain;
           CrCartReg.Catalogo;
        finally
           CrCartReg.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPLZVENC'  then       //Portafolio de Cr�dito
     begin
        CrPlzVenc := TCrPlzVenc.Create(self);
        try
           CrPlzVenc.Apli :=dmMain.apMain;
           CrPlzVenc.ParamCre:=ParamCre;
           CrPlzVenc.Catalogo;
        finally
           CrPlzVenc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCARTDIV' then       //Portafolio de Cr�dito
     begin
        CrCartDiv := TCrCartDiv.Create(self);
        try
           CrCartDiv.Apli:=dmMain.apMain;
           CrCartDiv.Catalogo;
        finally
               CrCartDiv.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSECPUBL'  then       //Portafolio de Cr�dito
     begin
        CrSecPubl := TCrSecPubl.Create(self);
        try
           CrSecPubl.Apli :=dmMain.apMain;
           CrSecPubl.ParamCre:=ParamCre;
           CrSecPubl.Catalogo;
        finally
           CrSecPubl.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCREDMPIOS'  then       //Portafolio de Cr�dito
     begin
        CrEdMpios := TCrEdMpios.Create(self);
        try
           CrEdMpios.Apli :=dmMain.apMain;
           CrEdMpios.ParamCre:=ParamCre;
           CrEdMpios.Catalogo;
        finally
           CrEdMpios.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRACREMAX'  then       //Portafolio de Cr�dito
     begin
        CrAcreMax := TCrAcreMax.Create(self);
        try
           CrAcreMax.Apli :=dmMain.apMain;
           CrAcreMax.ParamCre:=ParamCre;
           CrAcreMax.Catalogo;
        finally
           CrAcreMax.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCARTCON' then       //Portafolio de Cr�dito
     begin
        CrCartCon := TCrCartCon.Create(self);
        try
           CrCartCon.Apli:=dmMain.apMain;
           CrCartCon.Catalogo;
        finally
               CrCartCon.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCRTSCPU' then     //Portafolio de Cr�dito
     begin
        CrCrtScPu := TCrCrtScPu.Create(self);
        try
           CrCrtScPu.Apli := dmMain.apMain;
           CrCrtScPu.Catalogo;
        finally
           CrCrtScPu.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRINFAVES' then       //Portafolio de Cr�dito
     begin
        CrInfAves := TCrInfAves.Create(self);
        try
           CrInfAves.Apli:=dmMain.apMain;
           CrInfAves.Catalogo;
        finally
               CrInfAves.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOMPBAN' then       //Portafolio de Cr�dito
     begin
        CrCompBan := TCrCompBan.Create(self);
        try
           CrCompBan.Apli:=dmMain.apMain;
           CrCompBan.Catalogo;
        finally
               CrCompBan.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOMPINF' then       //Portafolio de Cr�dito
     begin
        CrCompInf := TCrCompInf.Create(self);
        try
           CrCompInf.Apli:=dmMain.apMain;
           CrCompInf.Catalogo;
        finally
               CrCompInf.Free;
        end;
     end	 
     else if NomFuncion = 'CLASE_TCRRESCALI' then     //Portafolio de Cr�dito
     begin
        CrResCali := TCrResCali.Create(self);
        try
           CrResCali.Apli:=dmMain.apMain;
           CrResCali.Catalogo;
        finally
               CrResCali.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRRESEYMC' then     //Portafolio de Cr�dito
     begin
        CrResEyMC := TCrResEyMC.Create(self);
        try
           CrResEyMC.Apli:=dmMain.apMain;
           CrResEyMC.Catalogo;
        finally
               CrResEyMC.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOMPSEP' then    //Portafolio de Cr�dito
     begin
        CrCompSeP := TCrCompSeP.Create(self);
        try
           CrCompSeP.Apli:=dmMain.apMain;
           CrCompSeP.Catalogo;
        finally
               CrCompSeP.Free;
        end;
     end	 
	 
     else if NomFuncion = 'CLASE_TCRMETMODE' then    //Modelos Din�micos
     begin
        CrMetMode := TCrMetMode.Create(Self);
        try
          CrMetMode.Apli     := dmMain.apMain;
          CrMetMode.Catalogo;
        finally
          CrMetMode.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMETARE' then    //Modelos Din�micos
     begin
        CrMeTaRe := TCrMeTaRe.Create(Self);
        try
          CrMeTaRe.Apli     := dmMain.apMain;
          CrMeTaRe.ParamCre := ParamCre;
          CrMeTaRe.Catalogo;
        finally
          CrMeTaRe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMETVARI' then    //Modelos Din�micos
     begin
        CrMetVari := TCrMetVari.Create (Self);
        try
          CrMetVari.Apli     := dmMain.apMain;
          CrMetVari.ParamCre := ParamCre;
          CrMetVari.Catalogo;
        finally
          CrMetVari.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMETMETO' then    //Modelos Din�micos
     begin
        CrMetMeto := TCrMetMeto.Create (Self);
        try
          CrMetMeto.Apli     := dmMain.apMain;
          CrMetMeto.ParamCre := ParamCre;
          CrMetMeto.Catalogo;
        finally
          CrMetMeto.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMETPERS' then    //Modelos Din�micos
     begin
        CrMetPers := TCrMetPers.Create (Self);
        try
          CrMetPers.Apli     := dmMain.apMain;
          CrMetPers.ParamCre := ParamCre;
          CrMetPers.Catalogo;
        finally
          CrMetPers.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMEASMO' then    //Modelos Din�micos
     begin
        CrMeAsMo := TCrMeAsMo.Create (Self);
        try
          CrMeAsMo.Apli     := dmMain.apMain;
          CrMeAsMo.ParamCre := ParamCre;
          CrMeAsMo.Catalogo;
        finally
          CrMeAsMo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRANXMASV' then    //Modelos Din�micos
     begin
        CrAnxMasv := TCrAnxMasv.Create (Self);
        try
          CrAnxMasv.Apli     := dmMain.apMain;
          CrAnxMasv.Catalogo;
        finally
          CrAnxMasv.Free;
        end;
     end
	 
     else if NomFuncion = 'CLASE_TMDOCTOS' then         //Cat�logo de Documentos
     begin
        MDoctos  := TMDoctos.Create(self);
        try
           MDoctos.Apli :=dmMain.apMain;
           MDoctos.ParamCre:=ParamCre;           MDoctos.Catalogo;
        finally
           MDoctos.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRELDOCTR' then       //Cat�logo de Relaci�n Tr�mite - Documento
     begin
        MRelDocTr  := TMRelDocTr.Create(self);
        try
           MRelDocTr.Apli :=dmMain.apMain;
           MRelDocTr.ParamCre:=ParamCre;           MRelDocTr.Catalogo;
        finally
           MRelDocTr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPRODTRAM' then       //Cat�logo de Relaci�n Producto -Tr�mite
     begin
        MProdTram  := TMProdTram.Create(self);
        try
           MProdTram.Apli :=dmMain.apMain;
           MProdTram.ParamCre:=ParamCre;           MProdTram.Catalogo;
        finally
           MProdTram.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMNRIESGO' then        //Cat�logo de Niveles de Riesgo
     begin
        MNRiesgo  := TMNRiesgo.Create(self);
        try
           MNRiesgo.Apli :=dmMain.apMain;
           MNRiesgo.ParamCre:=ParamCre;           MNRiesgo.Catalogo;
        finally
           MNRiesgo.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMDOMEDIO' then        //Cat�logo de Medio
     begin
        MDoMedio  := TMDoMedio.Create(self);
        try
           MDoMedio.Apli :=dmMain.apMain;
           MDoMedio.ParamCre:=ParamCre;           MDoMedio.Catalogo;
        finally
           MDoMedio.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPERFUSU' then        //Alta de Acceso
     begin
        MPerfUsu := TMPerfUsu.Create(self);
        try
           MPerfUsu.Apli :=dmMain.apMain;
           MPerfUsu.ParamCre:=ParamCre;           MPerfUsu.Catalogo;
        finally
           MPerfUsu.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMRECTRA' then         //Alta de Tr�mite
     begin
        MRecTra  := TMRecTra.Create(self);
        try
           MRecTra.Apli :=dmMain.apMain;
           MRecTra.ParamCre:=ParamCre;           MRecTra.Catalogo;
        finally
           MRecTra.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCTEDOC' then         //Alta de Documento por Acreditado...
     begin
        MCteDoc := TMCteDoc.Create(self);
        try
           MCteDoc.Apli :=dmMain.apMain;
           MCteDoc.ParamCre:=ParamCre;           MCteDoc.Catalogo;
        finally
           MCteDoc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMEXPACRED' then         //Documentos entregados por Acreditado
     begin
        MExpAcreD := TMExpAcreD.Create(self);
        try
           MExpAcreD.Apli :=dmMain.apMain;
           MExpAcreD.ParamCre:=ParamCre;           MExpAcreD.Catalogo;
        finally
           MExpAcreD.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREEXCPEN' then       //Reporte de Excepciones
     begin
        MReExcPen := TMReExcPen.Create(self);
        try
           MReExcPen.Apli :=dmMain.apMain;
           MReExcPen.ParamCre:=ParamCre;           MReExcPen.Catalogo;
        finally
           MReExcPen.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMREDOCCTE' then       //Reporte de Seguimiento del Cliente
     begin
        MReDocCte := TMReDocCte.Create(self);
        try
           MReDocCte.Apli :=dmMain.apMain;
           MReDocCte.ParamCre:=ParamCre;           MReDocCte.Catalogo;
        finally
           MReDocCte.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCOLPROM' then       //Reporte de Colocaci�n por Promotor
     begin
        MColProm := TMColProm.Create(self);
        try
           MColProm.Apli :=dmMain.apMain;
           MColProm.ParamCre:=ParamCre;           MColProm.Catalogo;
        finally
           MColProm.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TVCRDOCUME' then       //Consulta Documentos
     begin
        VDocume := TVcrdocume.Create(self);
        try
           VDocume.Apli :=dmMain.apMain;     VDocume.ParamCre:=ParamCre;
           VDocume.Catalogo;
        finally
               VDocume.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRGPTAIN' then        //Grupo Tasas
     begin
        GpoTasa := TCrGpTaIn.Create(self);
        try
           GpoTasa.Apli :=dmMain.apMain;     GpoTasa.ParamCre:=ParamCre;
           GpoTasa.Catalogo;
        finally
               GpoTasa.Free;
        end;
     end
//     else if NomFuncion='CLASE_TCREMAIL' then Showcat(TExcepApli.Create(Self),dmMain.apMain)    //email
     else if NomFuncion = 'CLASE_TCREMAIL' then
     begin
       CrEmail := TCrEmail.Create(self);
       try
          CrEmail.Apli :=dmMain.apMain;     CrEmail.ParamCre:=ParamCre;
          CrEmail.Catalogo;
       finally
              CrEmail.Free;
       end;
     end

     else if NomFuncion = 'CLASE_TCREMADAT' then        //Cat�logo de Cr Email Datos
     begin
        CrEmaDat  := TCrEmaDat.Create(self);
        try
           CrEmaDat.Apli :=dmMain.apMain;     CrEmaDat.ParamCre:=ParamCre;
           CrEmaDat.Catalogo;
        finally
               CrEmaDat.Free;
        end;
     end
{     else if NomFuncion='CLASE_TCRTASDESC'   then
          Showcat(TCrTasdesc.Create(Self),dmMain.apMain)        //Consulta de Tasas Equivalentes
     else If NomFuncion = 'CLASE_TCRCOARNAF' then            // Configuraci�n del Archivo de NAFIN
     begin
        CrCoArNaf :=  TCrCoArNaf.Create(self);
        try
           CrCoArNaf.Apli := dmMain.apMain;
           CrCoArNaf.ParamCre:=ParamCre;           CrCoArNaf.Catalogo;
        finally
               CrCoArNaf.Free;
        end;
     end
     }
     else If NomFuncion = 'CLASE_TCRRELPAG' then            // Relaci�n de Pagar� - Disposici�n
     begin
        CrRelPag :=  TCrRelPag.Create(self);
        try
           CrRelPag.Apli := dmMain.apMain;
           CrRelPag.ParamCre:=ParamCre;           CrRelPag.Catalogo;
        finally
           CrRelPag.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRRNVPAG' then            // Renovaci�n en Bloque de Pagar�s
     begin
        CrRnvPag :=  TCrRnvPag.Create(self);
        try
           CrRnvPag.Apli := dmMain.apMain;
           CrRnvPag.ParamCre:=ParamCre;           CrRnvPag.Catalogo;
        finally
           CrRnvPag.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMREPCAU' then            // Reporte de Garant�as
     begin
        MRepCau :=  TMRepCau.Create(self);
        try
           MRepCau.Apli := dmMain.apMain;
           MRepCau.ParamCre:=ParamCre;           MRepCau.Catalogo;
        finally
           MRepCau.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRGENEDCT' then            // Carga de Estados de Cuenta
     begin
        GenEdoCta :=  TCrGenEdCt.Create(self);
        try
           GenEdoCta.Apli := dmMain.apMain;
           GenEdoCta.ParamCre:=ParamCre;           GenEdoCta.Catalogo;
        finally
           GenEdoCta.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TEDOMAILAB' then        //Env�o x Mail de Estados de Cuenta ABCD
     begin
        EdoMailAb := TEdoMailAb.Create(self);
        try
           EdoMailAb.Apli := dmMain.apMain;     EdoMailAb.ParamCre:=ParamCre;
           EdoMailAb.Catalogo;
        finally
           EdoMailAb.Free;
        end;
     end   	  
     else If NomFuncion = 'CLASE_TINTCRTAS' then            // Carga de Archivo TAS
     begin
        CrTAS     :=  TIntCrTAS.Create(self);
        try
           CrTAS.Apli := dmMain.apMain;
           CrTAS.ParamCre:=ParamCre;           CrTAS.Catalogo;
        finally
           CrTAS.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRARCHSAT' then            // Carga de Estados de Cuenta
     begin
        GenArcHip :=  TCrarchsat.Create(self);
        try
           GenArcHip.Apli := dmMain.apMain;
           GenArcHip.ParamCre:=ParamCre;
           GenArcHip.Catalogo;
        finally
           GenArcHip.Free;
        end;
     end
    {----------------------------- Constancias -----------------------------}
    else If NomFuncion = 'CLASE_TMQRCONSTA' then            // Control Impresi�n Constancias Hipo
     begin
        Mqrconsta :=  TMqrconsta.Create(self);
        try
           Mqrconsta.Apli := dmMain.apMain;
           Mqrconsta.Catalogo;
        finally
           Mqrconsta.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TSATCRELAY' then           // Constancias Hipotecarias
     begin
        SatCreLay :=  TSatCreLay.Create(self);
        try
           SatCreLay.Apli := dmMain.apMain;
           SatCreLay.Catalogo;
        finally
           SatCreLay.Free;
        end;
     end
    {----------------------------- Calificadoras -----------------------------}
     else If NomFuncion = 'CLASE_TCRTRIESGO' then       // Cat�logo Tipo de Riesgo
     begin
        CrTRiesgo := TCrTRiesgo.Create(self);
        try
           CrTRiesgo.Apli := dmMain.apMain;
           CrTRiesgo.ParamCre:=ParamCre;
           CrTRiesgo.Catalogo;
        finally
           CrTRiesgo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCALIFIC' then       // Cat�logo de Calificadoras
     begin
        CrCalific := TCrCalific.Create(self);
        try
           CrCalific.Apli := dmMain.apMain;
           CrCalific.ParamCre:=ParamCre;
           CrCalific.Catalogo;
        finally
           CrCalific.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCALCALI' then       // Cat�logo Calificaciones de Calificadoras
     begin
        CrCalCali := TCrCalCali.Create(self);
        try
           CrCalCali.Apli := dmMain.apMain;
           CrCalCali.ParamCre:=ParamCre;
           CrCalCali.Catalogo;
        finally
           CrCalCali.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCALACRE' then       // Calificaci�n Acreditado por Calificadora
     begin
        CrCalAcre := TCrCalAcre.Create(self);
        try
           CrCalAcre.Apli := dmMain.apMain;
           CrCalAcre.ParamCre:=ParamCre;
           CrCalAcre.Catalogo;
        finally
           CrCalAcre.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRRECAAC' then       // Relaci�n Calificadora - Acreditado
     begin
        CrReCaAc := TCrReCaAc.Create(self);
        try
           CrReCaAc.Apli := dmMain.apMain;
           CrReCaAc.ParamCre:=ParamCre;
           CrReCaAc.Catalogo;
        finally
           CrReCaAc.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCAARDE' then       // Administraci�n Archivos de Calificaci�n
     begin
        CrCaArDe := TCrCaArDe.Create(self);
        try
           CrCaArDe.Apli := dmMain.apMain;
           CrCaArDe.ParamCre:=ParamCre;
           CrCaArDe.Catalogo;
        finally
           CrCaArDe.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCALCONS' then       // Consulta Calificaciones por Acreditado
     begin
        CrCalCons := TCrCalCons.Create(self);
        try
           CrCalCons.Apli := dmMain.apMain;
           CrCalCons.ParamCre:=ParamCre;
           CrCalCons.Catalogo;
        finally
           CrCalCons.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCALIFACR' then       // Reporte de Calificaci�n por Acreditado
     begin
        MCalifAcr := TMCalifAcr.Create(self);
        try
           MCalifAcr.Apli := dmMain.apMain;
           MCalifAcr.ParamCre:=ParamCre;
           MCalifAcr.Catalogo;
        finally
           MCalifAcr.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRFIDREG' then       // Reglas para Emisi�n Solicitudes Fideicomisos
     begin
        CrFidReg := TCrFidReg.Create(self);
        try
           CrFidReg.Apli := dmMain.apMain;
           CrFidReg.ParamCre:=ParamCre;
           CrFidReg.Catalogo;
        finally
           CrFidReg.Free;
        end;
     end


     else If NomFuncion = 'CLASE_TCRFIDDELE' then       // Cat�logo Delegados Fiduciarios
     begin
        CrFidDele := TCrFidDele.Create(self);
        try
           CrFidDele.Apli := dmMain.apMain;
           CrFidDele.ParamCre:=ParamCre;
           CrFidDele.Catalogo;
        finally
           CrFidDele.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRFIDMAE' then       // Alta FIDEICOMISO Maestro
     begin
        CrFidMae := TCrFidMae.Create(self);
        try
           CrFidMae.Apli := dmMain.apMain;
           CrFidMae.ParamCre:=ParamCre;
           CrFidMae.Catalogo;
        finally
           CrFidMae.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRREFIDI' then       // Relaci�n FIDEICOMISO Maestro-Disposici�n
     begin
        CrReFiDi := TCrReFiDi.Create(self);
        try
           CrReFiDi.Apli := dmMain.apMain;
           CrReFiDi.ParamCre:=ParamCre;
           CrReFiDi.Catalogo;
        finally
           CrReFiDi.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRFIDCORR' then       // Destinatarios de Avisos FIDEICOMISOS
     begin
        CrFidCorr := TCrFidCorr.Create(self);
        try
           CrFidCorr.Apli := dmMain.apMain;
           CrFidCorr.ParamCre:=ParamCre;
           CrFidCorr.Catalogo;
        finally
           CrFidCorr.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRFISOPA' then       // Solicitudes Pago FIDEICOMISO
     begin
        CrFiSoPa := TCrFiSoPa.Create(self);
        try
           CrFiSoPa.Apli := dmMain.apMain;
           CrFiSoPa.ParamCre:=ParamCre;
           CrFiSoPa.Catalogo;
        finally
           CrFiSoPa.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCALCAPI' then       // Par�metros de Capitalizaci�n
     begin
        CrCalCapi := TCrCalCapi.Create(self);
        try
           CrCalCapi.Apli := dmMain.apMain;
           CrCalCapi.ParamCre:=ParamCre;
           CrCalCapi.Catalogo;
        finally
           CrCalCapi.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMCAPGOBMP' then       // Capitalizaci�n Gobiernos y Municipios
     begin
        MCapGobMp := TMCapGobMp.Create(self);
        try
           MCapGobMp.Apli := dmMain.apMain;
           MCapGobMp.ParamCre:=ParamCre;
           MCapGobMp.Catalogo;
        finally
           MCapGobMp.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMGENARCH' then       // Generacion de archivos y envio a NAFIN
     begin
        MGenArch := TMGenArch.Create(self);
        try
           MGenArch.Apli := dmMain.apMain;
           MGenArch.ParamCre:=ParamCre;
           MGenArch.Catalogo;
        finally
           MGenArch.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCBSONA' then       // Solicitud de Garantia NAFIN
     begin
        CrCbSoNa := TCrCbSoNa.Create(self);
        try
           CrCbSoNa.Apli := dmMain.apMain;
           CrCbSoNa.ParamCre:=ParamCre;
           CrCbSoNa.Catalogo;
        finally
           CrCbSoNa.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRRIESMDO' then       // Pct. para Criterios Capit. Agropecuario
     begin
        CrRiesMdo := TCrRiesMdo.Create(self);
        try
           CrRiesMdo.Apli := dmMain.apMain;
           CrRiesMdo.ParamCre:=ParamCre;
           CrRiesMdo.Catalogo;
        finally
           CrRiesMdo.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TMRSGMDOAG' then       // Req. Capitalizaci�n de Agropecuario
     begin
        MRsgMdoAg := TMRsgMdoAg.Create(self);
        try
           MRsgMdoAg.Apli := dmMain.apMain;
           MRsgMdoAg.ParamCre:=ParamCre;
           MRsgMdoAg.Catalogo;
        finally
           MRsgMdoAg.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCREPDIG' then       // Digitalizacion de reportes
     begin
        CrCRepDig := TCrCRepDig.Create(self);
        try
           CrCRepDig.Apli := dmMain.apMain;
           CrCRepDig.ParamCre:=ParamCre;
           CrCRepDig.Catalogo;
        finally
           CrCRepDig.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TMQRCOCO' then       // Reporte comparativo Contable COINCRE
     begin
        MQrCoCo := TMQrCoCo.Create(self);
        try
           MQrCoCo.Apli := dmMain.apMain;
           MQrCoCo.ParamCre:=ParamCre;
           MQrCoCo.Catalogo;
        finally
           MQrCoCo.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCOINCPB' then       // Cat�logo promotor Bono
     begin
         CrCoincPb  := TCrCoincPb.Create(self);
        try
           CrCoincPb.Apli := dmMain.apMain;
           CrCoincPb.ParamCre:=ParamCre;
           CrCoincPb.Catalogo;
        finally
           CrCoincPb.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCOINCR' then       // Consulta R�pida de COINCRE //SATV4766 el 25.01.2008
     begin
         CrCoincR  := TCrCoincR.Create(self);
        try
           CrCoincR.Apli := dmMain.apMain;
           CrCoincR.ParamCre:=ParamCre;
           CrCoincR.Catalogo;
        finally
           CrCoincR.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCOINRI' then       // Consulta R�pida de COINCRE
     begin
        CrCoInRi  := TCrCoInRi.Create(self);
        try
           CrCoInRi.Apli := dmMain.apMain;
           CrCoInRi.ParamCre:=ParamCre;
           CrCoInRi.Catalogo;
        finally
           CrCoInRi.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCARRIE' then    //Carga Manual de Riesgos ICAP 
     begin
        CrCarRie := TCrCarRie.Create(Self);
        try
          CrCarRie.Apli     := dmMain.apMain;
          CrCarRie.Catalogo;
        finally
          CrCarRie.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TESTRESRC' then       // Estimaci�n Preventiva de Riesgos Crediticios
     begin
         EstResRC  := TEstResRC.Create(self);
        try
           EstResRC.Apli := dmMain.apMain;
           EstResRC.ParamCre:=ParamCre;
           EstResRC.Catalogo;
        finally
           EstResRC.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TMQRCOIN' then       // Reporte  COINCRE  SALDOS PROMOCION
     begin
        MQrCoin := TMQrCoin.Create(self);
        try
           MQrCoin.Apli := dmMain.apMain;
           MQrCoin.ParamCre:=ParamCre;
           MQrCoin.Catalogo;
        finally
           MQrCoin.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPLAZORES' then        //Plazo residual
     begin
        MPlazoRes := TMPlazoRes.Create(self);
        try
           MPlazoRes.Apli     := dmMain.apMain;
           MPlazoRes.ParamCre := ParamCre;
           MPlazoRes.Catalogo;
        finally
           MPlazoRes.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMQRESUMCR' then        //Resumen de la Cartera
     begin
        MQResumCR := TMQResumCR.Create(self);
        try
           MQResumCR.Apli     := dmMain.apMain;
           MQResumCR.ParamCre := ParamCre;
           MQResumCR.Catalogo;
        finally
           MQResumCR.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRCARTERA'  then          //MARA4356 OCT2006 reporte cartera crediticia institucional F1001
     begin
        CrCARTERA :=  TCrCartera.Create(self);
        try
           CrCARTERA.Apli := dmMain.apMain;
           CrCARTERA.ParamCre:=ParamCre;
           CrCARTERA.Catalogo;
        finally
           CrCARTERA.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMQLIMAXFI' then        //L�mite M�ximo de Financiamiento
     begin
        MQLiMaxFi := TMQLiMaxFi.Create(self);
        try
           MQLiMaxFi.Apli     := dmMain.apMain;
           MQLiMaxFi.ParamCre := ParamCre;
           MQLiMaxFi.Catalogo;
        finally
           MQLiMaxFi.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCOICON' then       // Alta de relaci�n productos Cuentas Contables COINCRE
     begin
        CrCoiCon := TCrCoiCon.Create(self);
        try
           CrCoiCon.Apli := dmMain.apMain;
           CrCoiCon.ParamCre:=ParamCre;
           CrCoiCon.Catalogo;
        finally
           CrCoiCon.Free;
        end;
     end
     else if (NomFuncion = 'CLASE_TCRBCCLOB') then      // Claves de observacion buro de credito
     begin
       CrBcClOb  := TCrBcClOb.Create(Self);
       try
         CrBcClOb.Apli := dmMain.apMain;
         CrBcClOb.ParamCre:=ParamCre;
         CrBcClOb.Catalogo;
       finally
         if CrBcClOb <> nil then
           CrBcClOb.Free;
         //
         CrBcClOb := nil;
       end;
     end


     else if NomFuncion = 'CLASE_TCRUPCOCO' then        //Pantalla de Cambios Contables
     begin
        CrUpCoCo := TCrUpCoCo.Create(self);
        try
           CrUpCoCo.Apli:=dmMain.apMain;     CrUpCoCo.ParamCre:=ParamCre;
           CrUpCoCo.Catalogo;
        finally
               CrUpCoCo.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRECONDRI'  then //MARA4356 OCT 2006
     begin
        CreConDri :=  TCreConDri.Create(self);
        try
           CreConDri.Apli := dmMain.apMain;
           CreConDri.ParamCre:=ParamCre;           
           CreConDri.Catalogo;
        finally
           CreConDri.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRMETIFY'  then  //MARA4356 OCT 2006
     begin
        CrMET     :=  TCrMETIFY.Create(self);
        try
           CrMET.Apli := dmMain.apMain;
           CrMET.ParamCre:=ParamCre;           
           CrMET.Catalogo;
        finally
           CrMET.Free;
        end;
     end
    {LOLS 26 DIC 2006. CREDITO EN LINEA }
     else if NomFuncion = 'CLASE_TCRBLOQAUT' then
     begin
        CrBloqAut := TCrBloqAut.Create(self);
        try
           CrBloqAut.Apli     := dmMain.apMain;
           CrBloqAut.ParamCre := ParamCre;
           CrBloqAut.Catalogo;
        finally
           CrBloqAut.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOBACC' then
     begin
        CrCobAcc := TCrCobAcc.Create(self);
        try
           CrCobAcc.Apli     := dmMain.apMain;
           CrCobAcc.ParamCre := ParamCre;
           CrCobAcc.Catalogo;
        finally
           CrCobAcc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCREMAR' then
     begin
        CrCreMar := TCrCreMar.Create(self);
        try
           CrCreMar.Apli     := dmMain.apMain;
           CrCreMar.ParamCre := ParamCre;
           CrCreMar.Catalogo;
        finally
           CrCreMar.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMOOPDIA' then
     begin
        CrMoOpDia := TCrMoOpDia.Create(self);
        try
           CrMoOpDia.Apli     := dmMain.apMain;
           CrMoOpDia.ParamCre := ParamCre;
           CrMoOpDia.Catalogo;
        finally
           CrMoOpDia.Free;
        end;
     end
    else if NomFuncion = 'CLASE_TCRPLARESC' then        //Reporte Plazo Residual Contabilidad  06 Nov 2009
     begin
        //Crplazoresi := TCrplaresc.Create(self);
        Crplaresc := TCrplaresc.Create(self);

        try
           Crplaresc.Apli     := dmMain.apMain;
           Crplaresc.Catalogo;
        finally
           Crplazore.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRMOPROP' then
     begin
        CrMoPrOp := TCrMoPrOp.Create(self);
        try
           CrMoPrOp.Apli     := dmMain.apMain;
           CrMoPrOp.ParamCre := ParamCre;
           CrMoPrOp.Catalogo;
        finally
           CrMoPrOp.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCOMCOBAN' then
     begin
        MComCobAn := TMComCobAn.Create(self);
        try
           MComCobAn.Apli     := dmMain.apMain;
           MComCobAn.ParamCre := ParamCre;
           MComCobAn.Catalogo;
        finally
           MComCobAn.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMINCDECPE' then
     begin
        MIncDecPe := TMIncDecPe.Create(self);
        try
           MIncDecPe.Apli     := dmMain.apMain;
           MIncDecPe.ParamCre := ParamCre;
           MIncDecPe.Catalogo;
        finally
           MIncDecPe.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMPROXVENC' then
     begin
        MProxVenc := TMProxVenc.Create(self);
        try
           MProxVenc.Apli     := dmMain.apMain;
           MProxVenc.ParamCre := ParamCre;
           MProxVenc.Catalogo;
        finally
           MProxVenc.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMMOVXINT' then
     begin
        MMovXInt := TMMovXInt.Create(self);
        try
           MMovXInt.Apli     := dmMain.apMain;
           MMovXInt.ParamCre := ParamCre;
           MMovXInt.Catalogo;
        finally
           MMovXInt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMAUBLQDES' then        //Reporte de Autorizaciones Bloqueadas / Desbloqueadas
     begin
        MAuBlqDes := TMAuBlqDes.Create(self);
        try
           MAuBlqDes.Apli     := dmMain.apMain;
           MAuBlqDes.ParamCre := ParamCre;
           MAuBlqDes.Catalogo;
        finally
           MAuBlqDes.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TMQRCOMCTA'  then  //SATV4766 MAY 2007
     begin
        MQrComCta :=  TMQrComCta.Create(self);
        try
           MQrComCta.Apli := dmMain.apMain;
           MQrComCta.ParamCre:=ParamCre;
           MQrComCta.Catalogo;
        finally
           MQrComCta.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRCOCTCC'  then  //SATV4766 MAY 2007
     begin
        CrCoCtCc :=  TCrCoCtCc.Create(self);
        try
           CrCoCtCc.Apli := dmMain.apMain;
           CrCoCtCc.ParamCre:=ParamCre;
           CrCoCtCc.Catalogo;
        finally
           CrCoCtCc.Free;
        end;
     end
    {ENDS_LOLS}
     else if NomFuncion= 'CLASE_TREPDEPREF'  then  //MARA4356 10/10/2007
     begin
        RepDepRef :=  TRepDepRef.Create(self);
        try
           RepDepRef.Apli := dmMain.apMain;
           RepDepRef.Catalogo;
        finally
           RepDepRef.Free;
        end;
     end

     {START_SATV}
     else if NomFuncion= 'CLASE_TMQRSHF'  then  //SATV4766 ABR 2008
     begin
        MQrSHF :=  TMQrSHF.Create(self);
        try
           MQrSHF.Apli := dmMain.apMain;
           MQrSHF.ParamCre:=ParamCre;
           MQrSHF.Catalogo;
        finally
           MQrSHF.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TICRESAP'  then  //SATV4766 ABR 2008
     begin
        Icresap :=  TIcresap.Create(self);
        try
           Icresap.Apli := dmMain.apMain;
           Icresap.ParamCre:=ParamCre;
           Icresap.Catalogo;
        finally
           Icresap.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCGCUEEQU'  then  //SATV4766 ABR 2008
     begin
        CgCueEqu :=  TCgCueEqu.Create(self);
        try
           CgCueEqu.Apli := dmMain.apMain;
           CgCueEqu.ParamCre:=ParamCre;
           CgCueEqu.Catalogo;
        finally
           CgCueEqu.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRREACCT'  then  //SATV4766 ABR 2008
     begin
        CrReAcCt :=  TCrReAcCt.Create(self);
        try
           CrReAcCt.Apli := dmMain.apMain;
           CrReAcCt.ParamCre:=ParamCre;
           CrReAcCt.Catalogo;
        finally
           CrReAcCt.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TQMCOLCOB' then       //Reporte resumen colocaci�n/cobranza  ROIM 27112008
     begin
         QMColCob  := TQMColCob.Create(self);
        try
           QMColCob.Apli := dmMain.apMain;
           QMColCob.ParamCre:=ParamCre;
           QMColCob.Catalogo;
        finally
           QMColCob.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRCOADHI'  then  //SATV4766 NOV 2008
     begin
        CrCoAdHi :=  TCrCoAdHi.Create(self);
        try
           CrCoAdHi.Apli := dmMain.apMain;
           CrCoAdHi.ParamCre:=ParamCre;
           CrCoAdHi.Catalogo;
        finally
           CrCoAdHi.Free;
        end;
     end
     {ENDS_SATV}


     else If NomFuncion = 'CLASE_TCRCATSOL' then       // ROIM Pantalla de COSTO ANUAL TOTAL CAT 15/05/2008
     begin
        Cat := TCrCatSol.Create(self);
        try
           Cat.Apli := dmMain.apMain;
           Cat.ParamCre:=ParamCre;
           Cat.Catalogo;
        finally
           Cat.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRBLQCONC'  then  //SATV4766 NOV 2008
     begin
        CrBlqConc :=  TCrBlqConc.Create(self);
        try
           CrBlqConc.Apli := dmMain.apMain;
           CrBlqConc.ParamCre:=ParamCre;
           CrBlqConc.Catalogo;
        finally
           CrBlqConc.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRBLQOPER'  then  //SATV4766 NOV 2008
     begin
        CrBlqOper :=  TCrBlqOper.Create(self);
        try
           CrBlqOper.Apli := dmMain.apMain;
           CrBlqOper.ParamCre:=ParamCre;
           CrBlqOper.Catalogo;
        finally
           CrBlqOper.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRTRABLO'  then  //SATV4766 NOV 2008
     begin
        CrTraBlo :=  TCrTraBlo.Create(self);
        try
           CrTraBlo.Apli := dmMain.apMain;
           CrTraBlo.ParamCre:=ParamCre;
           CrTraBlo.Catalogo;
        finally
           CrTraBlo.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRTRBLMA'  then  //SATV4766 NOV 2008
     begin
        CrTrBlMa :=  TCrTrBlMa.Create(self);
        try
           CrTrBlMa.Apli := dmMain.apMain;
           CrTrBlMa.ParamCre:=ParamCre;
           CrTrBlMa.Catalogo;
        finally
           CrTrBlMa.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TMBLQMA'  then  //SATV4766 NOV 2008
     begin
        MBlqMa :=  TMBlqMa.Create(self);
        try
           MBlqMa.Apli := dmMain.apMain;
           MBlqMa.ParamCre:=ParamCre;
           MBlqMa.Catalogo;
        finally
           MBlqMa.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRCACOBL'  then  //SATV4766 DIC 2008
     begin
        CrCaCoBl := TCrCaCoBl.Create(self);
        Try
          CrCaCoBl.Apli := dmMain.apMain;
          CrCaCoBl.ParamCre := ParamCre;
          CrCaCoBl.Catalogo;
        Finally
          CrCaCoBl.Free;
        End;
     end

     else if NomFuncion = 'CLASE_TREPCRE50M'   then       //Reporte de Cr�ditos con Monto autorizado mayor a 50 Nillones
     begin
        RepCre50M := TRepCre50M.Create(self);
        try
           RepCre50M.Apli:=dmMain.apMain;
           RepCre50M.ParamCre:=ParamCre;
           RepCre50M.Catalogo;
        finally
           RepCre50M.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRCORECC'  then
     begin
        CrCoReCc := TCrCoReCc.Create(self);
        Try
          CrCoReCc.Apli := dmMain.apMain;
          CrCoReCc.ParamCre := ParamCre;
          CrCoReCc.Catalogo;
        Finally
          CrCoReCc.Free;
        End;
     end

     else if NomFuncion= 'CLASE_TCRCCICONC'  then
     begin
        CrCciConc := TCrCciConc.Create(self);
        Try
          CrCciConc.Apli := dmMain.apMain;
          CrCciConc.ParamCre := ParamCre;
          CrCciConc.Catalogo;
        Finally
          CrCciConc.Free;
        End;
     end

     else If NomFuncion = 'CLASE_TSFERECEPT' then       //Consulta Factura Electr�nica
     begin
        SfeRecept := TSfeRecept.Create(self);
        try
           SfeRecept.Apli := dmMain.apMain;
           SfeRecept.ParamCre:=ParamCre;           SfeRecept.Catalogo;
        finally
           SfeRecept.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPLAZORE' then       //Plazo Residual         HEGC 03/11/2009
     begin
        CrPlazoRe := TCrPlazoRe.Create(self);
        try
           CrPlazoRe.Apli :=dmMain.apMain;
           CrPlazoRe.ParamCre:=ParamCre;
           CrPlazoRe.Catalogo;
        finally
           CrPlazoRe.Free;
        end;
     end

     else if NomFuncion= 'CLASE_TCRCCIREPO'  then
     begin
        CrCciRepo := TCrCciRepo.Create(self);
        Try
          CrCciRepo.Apli := dmMain.apMain;
          CrCciRepo.ParamCre := ParamCre;
          CrCciRepo.Catalogo;
        Finally
          CrCciRepo.Free;
        End;
     end

     else if NomFuncion= 'CLASE_TCRCONC'  then       //Conciliador Bur� de Cr�dito
     begin
        CrConc := TCrConc.Create(self);
        Try
          CrConc.Apli := dmMain.apMain;
          CrConc.ParamCre := ParamCre;
          CrConc.Catalogo;
        Finally
          CrConc.Free;
        End;
     end
     else if NomFuncion= 'CLASE_TCRREGHIST'  then       //Regeneraci�n de Bur� de Cr�dito
     begin
        CrRegHist := TCrRegHist.Create(self);
        Try
          CrRegHist.Apli := dmMain.apMain;
//          CrRegHist.ParamCre := ParamCre;
          CrRegHist.Catalogo;
        Finally
          CrRegHist.Free;
        End;
     end
     else if NomFuncion= 'CLASE_TCRCOABREP'  then 
     begin
        CrCoABRep := TCrCoABRep.Create(self);
        Try
          CrCoABRep.Apli := dmMain.apMain;
          CrCoABRep.ParamCre := ParamCre;
          CrCoABRep.Catalogo;
        Finally
          CrCoABRep.Free;
        End;
     end
//--------------------------------------------------------------------
// MANUEL ROMERO IBARRA
     else if NomFuncion = 'CLASE_TMEDOCTACT' then       //Menu del reporte de Estadod de cuenta certificado HEGC 13/01/2010
     begin
        MEdoCtaCt := TMEdoCtaCt.Create(self);
        try
           MEdoCtaCt.Apli :=dmMain.apMain;
           MEdoCtaCt.ParamCre:=ParamCre;
           MEdoCtaCt.Catalogo;
        finally
           MEdoCtaCt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRAMBITAC' then        //Bitacora Masivo   19/03/2010 ROIM
     begin
        CrAmBitac := TCrAmBitac.Create(self);
        try
           CrAmBitac.Apli:=dmMain.apMain;     CrAmBitac.ParamCre:=ParamCre;     CrAmBitac.Catalogo;
        finally
               CrAmBitac.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCOBITA' then        //Consulta Bitacora    19/03/2010 ROIM
     begin
        CrCoBita := TCrCoBita.Create(self);
        try
           CrCoBita.Apli:=dmMain.apMain;     CrCoBita.ParamCre:=ParamCre;     CrCoBita.Catalogo;
        finally
               CrCoBita.Free;
        end;
     end
     //Agronegocios
          else if NomFuncion = 'CLASE_TCRDISPF' then        //Disposici�n              19/04/2010  MAGV
     begin
        CrDispF := TCrDispF.Create(self);
        try
           CrDispF.Apli:=dmMain.apMain;     CrDispF.ParamCre:=ParamCre;     CrDispF.Catalogo;
        finally
               CrDispF.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRPERSF' then        //Persona              26/04/2010  MAGV
     begin
        CrPersF := TCrPersF.Create(self);
        try
           CrPersF.Apli:=dmMain.apMain;     CrPersF.ParamCre:=ParamCre;     CrPersF.Catalogo;
        finally
               CrPersF.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TMPRADEUF' then        //Reporte              03/05/2010  MAGV
     begin
        MProAdeuF := TMPrAdeuF.Create(self);
        try
           MProAdeuF.Apli:=dmMain.apMain;     MProAdeuF.ParamCre:=ParamCre;     MProAdeuF.Catalogo;
        finally
               MProAdeuF.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRAMOTRAD' then        //Otros adeudos
     begin
        CrAmOtrad := TCrAmOtrad.Create(self);
        try
           CrAmOtrad.Apli:=dmMain.apMain;     
           CrAmOtrad.Catalogo;
        finally
               CrAmOtrad.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCONTRF' then        //Contrato
     begin
        CrContrF := TCrContrF.Create(self);
        try
           CrContrF.Apli:=dmMain.apMain;     CrContrF.ParamCre:=ParamCre;     CrContrF.Catalogo;
        finally
               CrContrF.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRSEGUROF' then        //Seguro              
     begin
        CrSeguroF := TCrSeguroF.Create(self);
        try
           CrSeguroF.Apli:=dmMain.apMain;     CrSeguroF.ParamCre:=ParamCre;     CrSeguroF.Catalogo;
        finally
               CrSeguroF.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRAMMACRO' then        //Macrobase             
     begin
        CrAmMacro := TCrAmMacro.Create(self);
        try
           CrAmMacro.Apli:=dmMain.apMain;          CrAmMacro.Catalogo;
        finally
               CrAmMacro.Free;
        end;
     end
	 
     else if NomFuncion = 'CLASE_TCRGENBCL' then        //Genera BC_LAYOUT    13/05/2010 MAGV
     begin
        CrGenBCL := TCrGenBCL.Create(self);
        try
           CrGenBCL.Apli:=dmMain.apMain;     CrGenBCL.ParamCre:=ParamCre;     CrGenBCL.Catalogo;
        finally
               CrGenBCL.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRPOBGAR' then        //Poblador de garant�as     25/03/2010  MAGV
     begin
        CrPobGar := TCrPobGar.Create(self);
        try
           CrPobGar.Apli:=dmMain.apMain;     CrPobGar.ParamCre:=ParamCre;     CrPobGar.Catalogo;
        finally
               CrPobGar.Free;
        end;
     end

     
     else if NomFuncion = 'CLASE_TCRPOBSEG' then        //Poblador de seguros     12/07/2010  MAGV
      begin
         CrPobSeg := TCrPobSeg.Create(self);
         try
            CrPobSeg.Apli:=dmMain.apMain;     
			CrPobSeg.ParamCre:=ParamCre;     CrPobSeg.Catalogo;
         finally
            CrPobSeg.Free;
         end;
      end

     else if NomFuncion = 'CLASE_TCRPOBIND' then        //Poblador de indemnizaciones     19/07/2010  MAGV
     begin
        CrPobInd := TCrPobInd.Create(self);
        try
           CrPobInd.Apli:=dmMain.apMain;     CrPobInd.ParamCre:=ParamCre;     CrPobInd.Catalogo;
        finally
               CrPobInd.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRSIGDIRR' then        //Cat�logo de direcciones SIGIA 20110920 MAGV
     begin
        CrSigDirr := TCrSigDirr.Create(self);
        try
           CrSigDirr.Apli:=dmMain.apMain;     CrSigDirr.Catalogo;
        finally
               CrSigDirr.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCREREST' then       //Cr�ditos Restringidos
     begin
        CrCreRest := TCrCreRest.Create(self);
        try
           CrCreRest.Apli :=dmMain.apMain;
           CrCreRest.ParamCre:=ParamCre;           CrCreRest.Catalogo;
        finally
               CrCreRest.Free;
        end;
     end
     
     else if NomFuncion = 'CLASE_TMQDAPIVA' then  
     begin
        MQDApIVA  := TMQDApIva.Create(self);
          try
             MQDApIVA.Apli :=dmMain.apMain;
             MQDApIVA.ParamCre:=ParamCre;
             MQDApIVA.Catalogo;
          finally
               MQDApIVA.Free;
        end;
     end

     //termina agronegocios
     else If NomFuncion = 'CLASE_TMDCARTVDA' then     //Reporte de d�as de cartera vencida.   // Ana Lilia Escalona Asteci
     begin
        MDCartVda := TMDCartVda.Create(self);
        try
           MDCartVda.Apli := dmMain.apMain;
           MDCartVda.ParamCre:=ParamCre;           MDCartVda.Catalogo;
        finally
           MDCartVda.Free;
        end;
     end
     //IntCrGaraPer
     //else If NomFuncion = 'CLASE_TCRGARAPER' then     //Cat�logo de Avales (Garant�as Personales).   // Oscar Rubio Gordoa
     else If NomFuncion = 'CLASE_TMPERSONAL' then     //Cat�logo de Avales (Garant�as Personales).   // Oscar Rubio Gordoa
     begin
        CrGaraPer := TCrGaraPer.Create(self);
        try
           CrGaraPer.Apli := dmMain.apMain;
           CrGaraPer.ParamCre:=ParamCre;
           CrGaraPer.Catalogo;
        finally
           CrGaraPer.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCATIGA' then     //Cat�logo de Tipos de Garant�as    // Oscar Rubio Gordoa
     begin
        CrCaTiGa := TCrCaTiGa.Create(self);
        try
           CrCaTiGa.Apli := dmMain.apMain;
           CrCaTiGa.ParamCre:=ParamCre;
           CrCaTiGa.Catalogo;
        finally
           CrCaTiGa.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCATIAV' then     //Cat�logo de Tipos de Garant�as    // Oscar Rubio Gordoa
     begin
        CrCaTiAv := TCrCaTiAv.Create(self);
        try
           CrCaTiAv.Apli := dmMain.apMain;
           CrCaTiAv.ParamCre:=ParamCre;
           CrCaTiAv.Catalogo;
        finally
           CrCaTiAv.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRGARACTO' then     //Consolidado de garantias por linea //RIRA4281 1Oct10
     begin
        CrGaraCto := TCrGaraCto.Create(self);
        try
           CrGaraCto.Apli := dmMain.apMain;
           CrGaraCto.ParamCre:=ParamCre;
           CrGaraCto.Catalogo;
        finally
           CrGaraCto.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCREDEXCGA' then     //Consolidado de garantias por linea //RIRA4281 1Oct10
     begin
        CredExcGa := TCredExcGa.Create(self);
        try
           CredExcGa.Apli := dmMain.apMain;
           CredExcGa.ParamCre:=ParamCre;
           CredExcGa.Catalogo;
        finally
           CredExcGa.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRSALMIN' then       //CLASE ACTUALIZACION DE SALARIO MINIMO
     begin
        CrSalMin:= TCrSalMin.Create(self);
        try
           CrSalMin.Apli:=dmMain.apMain;
           CrSalMin.ParamCre:=ParamCre;
           CrSalMin.Catalogo;
        finally
               CrSalMin.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRGRUCLA' then           //Cat�logos de Grupos de Claves
     begin
        GruClaves :=  TCrGruCla.Create(self);
        try
           GruClaves.Apli := dmMain.apMain;
           GruClaves.ParamCre:=ParamCre;
           GruClaves.Catalogo;
        finally
           GruClaves.Free;
        end;
     end
// FJR CATALOGO DE TIPO DE TELEFONO
     else If NomFuncion = 'CLASE_TCRTPOTEL' then           //Cat�logos de Grupos de Claves
     begin
        CrTpoTel :=  TCrTpoTel.Create(self);
        try
           CrTpoTel.Apli := dmMain.apMain;
           CrTpoTel.ParamCre:=ParamCre;
           CrTpoTel.Catalogo;
        finally
           CrTpoTel.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCATHRFE' then  // Cat�logo de Horario Descuento de Documentos JFOF
     begin
        CrCatHrFe  := TCrCatHrFe.Create(self);
          try
             CrCatHrFe.Apli :=dmMain.apMain;
             CrCatHrFe.ParamCre:=ParamCre;
             CrCatHrFe.Catalogo;
          finally
             CrCatHrFe.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCTACONT' then   //Cat�logo de Cuentas Contables JFOF OCT-2013
     begin
        CrCtaCont :=  TCrCtaCont.Create(self);
        try
           CrCtaCont.Apli := dmMain.apMain;
           CrCtaCont.ParamCre:=ParamCre;
           CrCtaCont.Catalogo;
        finally
           CrCtaCont.Free;
        end;
     end

     else If NomFuncion = 'CLASE_TCRCACAMI' then   //Cat�logo para Clasificaci�n Contable RABA FEB-2016
     begin
        CrCaCaMi :=  TCrCaCaMi.Create(self);
        try
           CrCaCaMi.Apli := dmMain.apMain;
           CrCaCaMi.ParamCre:=ParamCre;
           CrCaCaMi.Catalogo;
        finally
           CrCaCaMi.Free;
        end;
     end

// FJR CATALOGO DE TIPOS DE TELEFONO
     else if NomFuncion = 'CLASE_TCRACRRECM' then       //
     begin
        CrAcrReCM := TCrAcrReCM.Create(self);
        try
           CrAcrReCM.Apli:=dmMain.apMain;     CrAcrReCM.ParamCre:=ParamCre;     CrAcrReCM.Catalogo;
        finally
               CrAcrReCM.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCAMBIAO' then       //
     begin

        CrCambiaO := TCrCambiaO.Create(self);
        try
           CrCambiaO.Apli:=dmMain.apMain;     CrCambiaO.ParamCre:=ParamCre;     CrCambiaO.Catalogo;
        finally
               CrCambiaO.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMAPLIRECU' then       //Modulo de Reporte de Aplicaciones y Recuperaciones de Garantias
     begin
        MApliRecu := TMApliRecu.Create(self);
        try
           MApliRecu.Apli:=dmMain.apMain;     MApliRecu.ParamCre:=ParamCre;     MApliRecu.Catalogo;
        finally
               MApliRecu.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRCAMBLIN' then       //
     begin

        CrCamblin:= TCrCamblin.Create(self);
        try
           CrCamblin.Apli:=dmMain.apMain;     CrCamblin.ParamCre:=ParamCre;     CrCamblin.Catalogo;
        finally
               CrCamblin.Free;
        end;
     end
     //RABA  13 JUL 2011, Referencia a la nueva clase de CARTA FINIQUITO
     else if NomFuncion = 'CLASE_TCRCARFINQ' then  // Reporte de Consolidado de Impagados
     begin
        CarFinq  := TCrCarFinq.Create(self);
          try
             CarFinq.Apli :=dmMain.apMain;
             CarFinq.ParamCre:=ParamCre;
             CarFinq.Catalogo;
          finally
             CarFinq.Free;
        end;
     end
     //RABA  27 JUL 2011, Referencia a la nueva clase de BITACORA DE CARTAS FINIQUITO
     else if NomFuncion = 'CLASE_TCRMBICARF' then  // Reporte de Consolidado de Impagados
     begin
        MBiCarFq  := TCrMBiCarF.Create(self);
          try
             MBiCarFq.Apli :=dmMain.apMain;
             MBiCarFq.ParamCre:=ParamCre;
             MBiCarFq.Catalogo;
          finally
             MBiCarFq.Free;
        end;
     end

     else if NomFuncion = 'CLASE_TCRMPRVEA' then  // Reporte 2 Vencimientos
     begin
        Mprvea  := TCrmprvea.Create(self);
          try
             Mprvea.Apli :=dmMain.apMain;
             Mprvea.ParamCre:=ParamCre;
             Mprvea.Catalogo;
          finally
               Mprvea.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMOPEINT' then        // RABA JUN 2012 REPORTE OPERATIVO DE INTERES
     begin
        MOpeInt  := TMOpeInt.Create(self);
        try
           MOpeInt.Apli := dmMain.apMain;
           MOpeInt.ParamCre:=ParamCre;
           MOpeInt.Catalogo;
        finally
           MOpeInt.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMCVDARAN' then        // RABA JUN 2012 REPORTE CARTERA VENCIDA POR RANGOS
     begin
        Mcvdaran  := TMcvdaran.Create(self);
        try
           Mcvdaran.Apli := dmMain.apMain;
           Mcvdaran.ParamCre:=ParamCre;
           Mcvdaran.Catalogo;
        finally
           Mcvdaran.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TMMOVCVDA' then        // RABA JUN 2012 REPORTE DE MOVIMIENTOS DE CARTERA VENCIDA
     begin
        MMovCVda  := TMMovCVda.Create(self);
        try
           MMovCVda.Apli := dmMain.apMain;
           MMovCVda.ParamCre:=ParamCre;
           MMovCVda.Catalogo;
        finally
           MMovCVda.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREPINFR' then  // Reporte Mensual de Infraestructura JFOF 13/05/2013
     begin
        CrRepInfr  := TCrRepInfr.Create(self);
          try
             CrRepInfr.Apli :=dmMain.apMain;
             CrRepInfr.ParamCre:=ParamCre;
             CrRepInfr.Catalogo;
          finally
             CrRepInfr.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRBITTRAN' then  // Bit�cora de Transacciones JFOF 30/07/2013
     begin
        CrBitTran  := TCrBitTran.Create(self);
          try
             CrBitTran.Apli :=dmMain.apMain;
             CrBitTran.ParamCre:=ParamCre;
             CrBitTran.Catalogo;
          finally
             CrBitTran.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRDISPLIQ' then  // Reporte de Disposiciones y Liquidaciones JFOF 03/09/2013
     begin
        CrDispLiq  := TCrDispLiq.Create(self);
          try
             CrDispLiq.Apli :=dmMain.apMain;
             CrDispLiq.ParamCre:=ParamCre;
             CrDispLiq.Catalogo;
          finally
             CrDispLiq.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCONTPPO' then  //Contabilidad de Premios Posibles por Otorgar (PPO) - Reportes JFOF 21/10/2013
     begin
        CrContPpo  := TCrContPpo.Create(self);
          try
             CrContPpo.Apli :=dmMain.apMain;
             CrContPpo.ParamCre:=ParamCre;
             CrContPpo.Catalogo;
          finally
             CrContPpo.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRVARMGE'  then  //GAHA4823
     begin
        CrVarMge :=  TCrVarMge.Create(self);
        try
           CrVarMge.Apli := dmMain.apMain;
           CrVarMge.ParamCre:=ParamCre;
           CrVarMge.Catalogo;
        finally
           CrVarMge.Free;
        end;
     end	 	 
     else if NomFuncion= 'CLASE_TCRTBLAMO'  then  //RIRA4281 31Dic10
     begin
        CrTblAmo :=  TCrTblAmo.Create(self);
        try
           CrTblAmo.Apli := dmMain.apMain;
           CrTblAmo.ParamCre:=ParamCre;
           CrTblAmo.Catalogo;
        finally
           CrTblAmo.Free;
        end;
     end
     //Consulta de cartera de cr�ditos Icre e Intercreditos por plazos de vencimiento  //RABA4523 AGO-2016
     else if NomFuncion= 'CLASE_TCRCARPLAZ'  then
     begin
        CrCarPlaz :=  TCrCarPlaz.Create(self);
        try
           CrCarPlaz.Apli := dmMain.apMain;
           CrCarPlaz.ParamCre:=ParamCre;
           CrCarPlaz.Catalogo;
        finally
           CrCarPlaz.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRBCPARM'  then  //FJR 03.12.2012
     begin
        CrBCParm:=  TCrBCParm.Create(self);
        try
           CrBCParm.Apli := dmMain.apMain;
          CrBCParm.ParamCre:=ParamCre;
           CrBCParm.Catalogo;
        finally
           CrBCParm.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TBCLAYEXC'  then  //FJR 21.12.2012
     begin
        BcLayExc:=  TBcLayExc.Create(self);
        try
           BcLayExc.Apli := dmMain.apMain;
           BcLayExc.ParamCre:=ParamCre;
           BcLayExc.Catalogo;
        finally
           BcLayExc.Free;
        end;

     end
     else if NomFuncion= 'CLASE_TCBCOPN'  then  //HCF 05Feb2013 Consultas Repositorio Bur�
     begin
        CBCOpn :=  TCBCOpn.Create(self);
        try
           CBCOpn.Apli := dmMain.apMain;
           CBCOpn.ParamCre:=ParamCre;
           CBCOpn.Catalogo;
        finally
           CBCOpn.Free;
        end;
     end
	else if NomFuncion= 'CLASE_TBCLAYVC'  then  //FJR 26.09.2013
     begin
        BcLayVC:=  TBcLayVC.Create(self);
        try
           BcLayVC.Apli := dmMain.apMain;
           BcLayVC.ParamCre:=ParamCre;
           BcLayVC.Catalogo;
        finally
           BcLayVC.Free;
        end;                        
     end
     else if NomFuncion= 'CLASE_TBCTBAJA'  then  //FJR 17.02.2014
     begin
        BcTBaja:=  TBcTBaja.Create(self);
        try
           BcTBaja.Apli := dmMain.apMain;
           BcTBaja.ParamCre:=ParamCre;  
           BcTBaja.Catalogo;
        finally
           BcTBaja.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRCATIAB'  then       // ROUY4095 OCT2015 Claves Tipo Aval Bur�
     begin
        CrCaTiAB := TCrCaTiAB.Create(self);
        try
           CrCaTiAB.Apli :=dmMain.apMain;
           CrCaTiAB.ParamCre:=ParamCre;
           CrCaTiAB.Catalogo;
        finally
           CrCaTiAB.Free;
        end;
     end
     //
     // POSIBLE PREMIO A OTORGAR
     //
     else if NomFuncion = 'CLASE_TCRPORCPPP' then
     begin
        CrPorcPPP :=  TCrPorcPPP.Create(self);
        CrPorcPPP.CVE_TIPO_PORCENTAJE.AsString:='DI';
        try
           CrPorcPPP.Apli := dmMain.apMain;
           CrPorcPPP.ParamCre:=ParamCre;
           CrPorcPPP.Catalogo;
        finally
           CrPorcPPP.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPORCMEN' then
     begin
        CrPorcPPP :=  TCrPorcPPP.Create(self);
        CrPorcPPP.CVE_TIPO_PORCENTAJE.AsString:='ME';
        try
           CrPorcPPP.Apli := dmMain.apMain;
           CrPorcPPP.ParamCre:=ParamCre;
           CrPorcPPP.Catalogo;
        finally
           CrPorcPPP.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TMINTAPLCL'  then  //JFOF
     begin
        MIntAplPr :=  TMIntAplPr.Create(self);
        MIntAplPr.CVE_TIPO_REP.AsString := 'SC';   // PARAMETRO PARA ELIMINAR COLUMNA DE FALTANTE DE COMISION
        try
           MIntAplPr.Apli := dmMain.apMain;
           MIntAplPr.ParamCre:=ParamCre;
           MIntAplPr.Catalogo;
        finally
           MIntAplPr.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TMINTAPLPR'  then   //JFOF
     begin
        MIntAplPr :=  TMIntAplPr.Create(self);
        MIntAplPr.CVE_TIPO_REP.AsString := 'CC';  // PARAMETRO PARA INCLUIR COLUMNA DE FALTANTE DE COMISION
        try
           MIntAplPr.Apli := dmMain.apMain;
           MIntAplPr.ParamCre:=ParamCre;
           MIntAplPr.Catalogo;
        finally
           MIntAplPr.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TMCTRLPRE'  then
     begin
        MCtrlPre :=  TMCtrlPre.Create(self);
        try
           MCtrlPre.Apli := dmMain.apMain;
           MCtrlPre.ParamCre:=ParamCre;
           MCtrlPre.Catalogo;
        finally
           MCtrlPre.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRREGPPP' then
     begin
        CrRegPPP := TCrRegPPP.Create(self);
        try
           CrRegPPP.Apli := dmMain.apMain;
           CrRegPPP.ParamCre:=ParamCre;
           CrRegPPP.Catalogo;
        finally
           CrRegPPP.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRPRORPPP'  then
     begin
        CrProrPPP :=  TCrProrPPP.Create(self);
        try
           CrProrPPP.Apli := dmMain.apMain;
           CrProrPPP.ParamCre:=ParamCre;
           CrProrPPP.Catalogo;
        finally
           CrProrPPP.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRMOVPPP'  then
     begin
        CrMovPPP :=  TCrMovPPP.Create(self);
        try
           CrMovPPP.Apli := dmMain.apMain;
           CrMovPPP.ParamCre:=ParamCre;
           CrMovPPP.Catalogo;
        finally
           CrMovPPP.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRPPP' then
     begin
        CrPPP := TCrPPP.Create(self);
        try
          CrPPP.Apli := dmMain.apMain;
          CrPPP.ParamCre:=ParamCre;
          CrPPP.Catalogo;
        finally
          CrPPP.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRPPOMEN'  then
     begin
        CrPPOMen :=  TCrPPOMen.Create(Self);
        try
           CrPPOMen.Apli := dmMain.apMain;
           CrPPOMen.ParamCre:=ParamCre;
           CrPPOMen.Catalogo;
        finally
           CrPPOMen.Free;
        end;
     end
     // RABA OCT 2014. Actualizaci�n de par�metros para el traspaso entre carteras
     else if NomFuncion= 'CLASE_TCRPARAMTC'  then
     begin
        CrParamTC :=  TCrParamTC.Create(Self);
        try
           CrParamTC.Apli := dmMain.apMain;
           CrParamTC.ParamCre:=ParamCre;
           CrParamTC.Catalogo;
        finally
           CrParamTC.Free;
        end;
     end
     // FIN RABA

     else if NomFuncion= 'CLASE_TCRBCAFEC'  then  //FJR 27.06.2013 Para determinar afectaci�n de claves de operaci�n en generaci�n BCLayout.
     begin
        CrBCAfec :=  TCrBCAfec.Create(Self);
        try
           CrBCAfec.Apli := dmMain.apMain;
           CrBCAfec.ParamCre:=ParamCre;
           CrBCAfec.Catalogo;
        finally
           CrBCAfec.Free;
        end ;
     end
     // CAT�LOGOS PARA O17
     else If NomFuncion = 'CLASE_TCRPRODBCA' then  //Cat�logo de Productos de Banca JFOF JUL-2013
     begin
        CrProdBca :=  TCrProdBca.Create(self);
        try
           CrProdBca.Apli := dmMain.apMain;
           CrProdBca.ParamCre:=ParamCre;
           CrProdBca.Catalogo;
        finally
           CrProdBca.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRGPOPBCA' then  //Cat�logo de Grupo Producto de Banca JFOF AGO-2013
     begin
        CrGpoPBca :=  TCrGpoPBca.Create(self);
        try
           CrGpoPBca.Apli := dmMain.apMain;
           CrGpoPBca.ParamCre:=ParamCre;
           CrGpoPBca.Catalogo;
        finally
           CrGpoPBca.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRCATARNE' then   //Cat�logo de �rea de Negocio JFOF JUL-2013
     begin
        CrCatArNe :=  TCrCatArNe.Create(self);
        try
           CrCatArNe.Apli := dmMain.apMain;
           CrCatArNe.ParamCre:=ParamCre;
           CrCatArNe.Catalogo;
        finally
           CrCatArNe.Free;
        end;
     end
     else If NomFuncion = 'CLASE_TCRRELTCRE' then   //Cat�logo Tipo de Credito
     begin
        CrRelTCre :=  TCrRelTCre.Create(self);
        try
           CrRelTCre.Apli := dmMain.apMain;
           CrRelTCre.ParamCre:=ParamCre;
           CrRelTCre.Catalogo;
        finally
           CrRelTCre.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRCFDBIT'  then   // CAPM - Bitacora Sellado CFDI
     begin
        CrCFDIBit :=  TCrCfdBit.Create(Self);
        try
           CrCFDIBit.Apli := dmMain.apMain;
           CrCFDIBit.ParamCre:=ParamCre;
           CrCFDIBit.Catalogo;
        finally
           CrCFDIBit.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCONSITPRE'  then  //ROUY4095 Consulta Sit Premio 12052014
     begin
        Consitpre:=  TConsitpre.Create(self);
        try
           Consitpre.Apli := dmMain.apMain;
           Consitpre.ParamCre:=ParamCre;
           Consitpre.Catalogo;
        finally
           Consitpre.Free;
        end;
     end
     else if NomFuncion= 'CLASE_TCRCONSLIN'  then  //ROUY4095 Consulta Lineas 13082014
     begin
        Crconslin:=  TCrconslin.Create(self);
        try
           Crconslin.Apli := dmMain.apMain;
           Crconslin.ParamCre:=ParamCre;
           Crconslin.Catalogo;
        finally
           Crconslin.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRR4CATOP' then
     begin
        CrR04CatOper:=  TCRR4CATOP.Create(self);
        try
           CrR04CatOper.Apli := dmMain.apMain;
           CrR04CatOper.ParamCre:=ParamCre;
           CrR04CatOper.Catalogo;
        finally
           CrR04CatOper.Free;
        end;
     end
     else if NomFuncion = 'CLASE_TCRR4CARGA' then
     begin
        CrR04Cargas:=  TCRR4CARGA.Create(self);
        try
           CrR04Cargas.Apli     := dmMain.apMain;
           CrR04Cargas.ParamCre := ParamCre;
           CrR04Cargas.Catalogo;
        finally
           CrR04Cargas.Free;
        end;
     end
     //
     else if NomFuncion = 'CLASE_TCRR4CONF' then
     begin
        CrR04Config:=  TCrR4Conf.Create(self);
        try
           CrR04Config.Apli := dmMain.apMain;
           CrR04Config.ParamCre := ParamCre;
           CrR04Config.Catalogo;
        finally
           CrR04Config.Free;
        end;
     end;

end;

procedure TwPrincipal.FormShow(Sender: TObject);
begin
 DBConecta(dmMain.dbMain, 'CORP' );
 DBConecta(dmMain.dbMainDWHC, 'DWHC' );
 dmMain.ApMain.OnMenuClick := InterApliMenuClick;
 dmMain.ApMain.START(SELF);
 FindItSQL := True;
end;

procedure TwPrincipal.FormDestroy(Sender: TObject);
begin
   if ParamCre <> nil then
      ParamCre.Free;
   //end if

end;

end.

