unit RepSgCtrl;
//-------------------------------------------------------------
// Sistema         :   RegSgCtrl
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Funci�n forma   :   Forma Creada Internamente
// Desarrollo por  :   V�ctor Mart�nez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead;

type
  TRepSGControl = class(TQuickRep)
    BandDet: TQRBand;
    QrTitulo: TQRBand;
    QRBand2: TQRBand;
  private

  public

  end;

var
  RepSGControl: TRepSGControl;

implementation
{$R *.DFM}






end.
