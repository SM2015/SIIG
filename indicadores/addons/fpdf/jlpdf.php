<?PHP
/*************************************************************************
* Software: JLPDF, based on FPDF                                         *
* Version:  1.00                                                         *
* Date:     2007-06-23                                                   *
* Author:   elticus & JL group                                           *
* License:  Freeware                                                     *
* Web Page: http://elticus.com/jlpdf/                                           *
*                                                                        *
* You may use and modify this code freely.                               *
**************************************************************************/
require('fpdf.php');

class JLPDF extends FPDF
{
 //----------------------- comandos disponibles ----------------------
 var $comm=array("[b]","[/b]","[i]","[/i]","[u]","[/u]","[blue]","[red]","[black]","[green]","[arial]","[courier]","[times]","[helvetica]","[BIG]","[small]","[normal]");
 var $Style=''; 
 var $Color=array('r'=>0,'g'=>0,'b'=>0); 
 var $PosX=0; //<- para mantener el margen izquierdo
 var $FontSizeInicial=12;
 var $align='j';
 //------- Cambiar los estilos de la fuente (negritas, itálica y subrayado)
 function Estilo($caracter, $valor)
 {
  $this->Style=str_replace("$caracter",'',$this->Style); 
  if($valor) $this->Style.="$caracter";
  $this->SetFont('',$this->Style);
 }
 //------- Cambiar los estilos de la fuente (negritas, itálica y subrayado)
 function TextColor($r,$g,$b)
 {
  $this->Color['r']=$r;
  $this->Color['g']=$g;
  $this->Color['b']=$b;
  $this->SetTextColor($this->Color['r'],$this->Color['g'],$this->Color['b']);
 } 
 //-------- Ejecutar alguno de los comandos--------------
 function SetComando($comando)
 {
  if(in_array($comando,$this->comm))
  {
   if($comando=='[b]')  $this->Estilo('b',TRUE);
   if($comando=='[/b]') $this->Estilo('b',FALSE);
   if($comando=='[i]')  $this->Estilo('i',TRUE);
   if($comando=='[/i]') $this->Estilo('i',FALSE);
   if($comando=='[u]')  $this->Estilo('u',TRUE);
   if($comando=='[/u]') $this->Estilo('u',FALSE);
   if($comando=='[blue]') $this->TextColor(0,0,255);
   if($comando=='[black]') $this->TextColor(0,0,0);
   if($comando=='[red]') $this->TextColor(200,0,0);
   if($comando=='[green]') $this->TextColor(0,200,0);
   if($comando=='[arial]') $this->SetFont('arial');
   if($comando=='[courier]') $this->SetFont('courier');
   if($comando=='[times]') $this->SetFont('times');
   if($comando=='[helvetica]') $this->SetFont('helvetica');
   if($comando=='[BIG]') $this->SetFontSize($this->FontSizeInicial+3);
   if($comando=='[normal]') $this->SetFontSize($this->FontSizeInicial);
   if($comando=='[small]') $this->SetFontSize($this->FontSizeInicial-3);
  }
 }

 //---------- separar en palabras y comandos-----
 function JLsplit($cadena)
 {
  $palabra='';
  $res=array();
  while(strlen($cadena)>0)
  {
	if(substr($cadena,0,1)!=' ')
	{
	  while(substr($cadena,0,1)!=' '&& strlen($cadena)>0)
	  {
	   $escomando=FALSE;	   
	   foreach($this->comm as $un) // es comando
	   {
		if($un==substr($cadena,0,strlen($un)))
		{
		 if($palabra!='') $res[]=$palabra;
		 $palabra='';
		 $res[]=$un;
		 $cadena=substr($cadena,strlen($un));
		 $escomando=TRUE;
		 break;
		}
	   }
	   if($escomando) break;
	   $letra=substr($cadena,0,1);
	   $cadena=substr($cadena,1);
	   $palabra.=$letra;        
	  }
	}
	if(substr($cadena,0,1)==' ')
	{
	  while(substr($cadena,0,1)==' '&& strlen($cadena)>0)
	  {
	   $letra=substr($cadena,0,1);
	   $cadena=substr($cadena,1);
	   $palabra.=$letra;
	  }
	 }
	 //----agregamos la palabra     
	 if($palabra!='') $res[]=$palabra;
	   $palabra='';
  }
  return($res);
 }

 //---------------------- Devuelve el ancho de una palabra sencilla o compuesta (con comandos) ----
 function AnchoPalabra($arreglo) 
 {
  $medidalinea=0;
  for($i=0; $i<count($arreglo) ;$i++) // ciclo sobre todos los elementos de la palabra
  {  
   $palabra=$arreglo[$i];
   if(in_array($palabra,$this->comm)) // Es comando? 
   {
	$this->SetComando($palabra);
   }
   else // es palabra
   { 
	 $medidalinea += $this->GetStringWidth($palabra);
   }
  } //fin for
  return($medidalinea);
 }
	
 //---------------------- Extraer una palabra sencilla o compuesta (con comandos) del array de palabras ----
 function ExtraerPalabra(&$arreglo)
 {
  $res=array();
  while(count($arreglo)>0) // ciclo sobre todos los elementos del array de la palabra
  {  
   $palabra=array_shift($arreglo);
   $res[]=$palabra;
   if(!in_array($palabra,$this->comm)) // No es comando? 
   {
	if(strpos("*$palabra"," ")>0) break; //<-  si tiene un espacio es fin de palabra
   }
  } //fin for
  return($res);
 }
	
 //---------------------- Devuelve cuantas palabras caben en la linea de $ancho pixeles ----
 function ExtraerCadena_qcabe($arreglo, $ancho) 
 {
  $cadenas=array();
  $palabra=array();
  $medidalinea=0;
  $contadorpalabras=0;
  while(count($arreglo)>0) // ciclo sobre todos los elementos del array de palabras
  {
   $palabra=$this->ExtraerPalabra($arreglo);
   $anchura=$this->AnchoPalabra($palabra);
   
   if($medidalinea + $anchura < $ancho ) // la palabra si cabe en la linea?
   {
	  $medidalinea += $anchura;
	  $contadorpalabras++;
   }
   else // no cabe
   {
	 if($medidalinea==0) // la palabra es mas ancha que toda la línea (se obliga a imprimirla)
	 {
		$cadenas[] = 1;
		$medidalinea = 0;
		$contadorpalabras=0;
	 }
	 else //No cabe la siguiente palabra, grabamos la linea anterior
	 {
		$cadenas[] = $contadorpalabras;
		$medidalinea = $anchura;
		$contadorpalabras=1;
	 }
   }
  } //fin while
  $cadenas[] = $contadorpalabras;
  return($cadenas);
 }
	
 //--------------- Imprimir un parrafo-----------
 function JLprint($cad, $ANCHO)
 {  
  $palabras=$this->JLsplit($cad);  
  
  $Auxfont=$this->FontFamily;     // save settings
  $Auxfontsize=$this->FontSizePt; // save settings
  $AuxStyle=$this->Style; // save settings
  $AuxColor=$this->Color; // save settings
    
  $lineasN=$this->ExtraerCadena_qcabe($palabras, $ANCHO);
  
  $this->SetFont($Auxfont,$AuxStyle); // restore settings
  $this->SetFontSize($Auxfontsize);   // restore settings  
  $this->TextColor($AuxColor['r'],$AuxColor['g'],$AuxColor['b']); // restore settings  
    
  $palabrasAux=$palabras;
  $icount=0;
  $lineasNew=array();
  for($i=0; $i<count($lineasN); $i++)
  { 
   //---- averiguar la longitud total de la linea
   $longitud=0;
   for($j=0; $j<$lineasN[$i]; $j++)
   {
    $palabra=$this->ExtraerPalabra($palabras);
    $anchura=$this->AnchoPalabra($palabra);
    $longitud += $anchura;
   } 
   $npalabras=$lineasN[$i];
   //----- calcular el tamaño del espaciado
   $espaciado=0;
   if($npalabras>1) $espaciado=($ANCHO-$longitud) / ($npalabras-1);
   $lineasNew[]=array($lineasN[$i], $espaciado, $longitud, $npalabras);
  }

  $this->SetFont($Auxfont,$AuxStyle); // restore settings
  $this->SetFontSize($Auxfontsize); // restore settings  
  $this->TextColor($AuxColor['r'],$AuxColor['g'],$AuxColor['b']); // restore settings  
  //----- imprimir todas las lineas del parrafo
  $palabras=$palabrasAux;	  
  for($i=0; $i<count($lineasN); $i++)
  {
   //Texto justificado  
   if($this->align=='l')
   {
    $espaciado=0;
    $leftmargin=0;
   }
   elseif($this->align=='r')
   {
    $espaciado=0;
    $leftmargin=($ANCHO-$lineasNew[$i][2]);
   }
   elseif($this->align=='c')
   {
    $espaciado=0;
    $leftmargin=($ANCHO-$lineasNew[$i][2])/2;
   }
   else
   {   
    $espaciado=$lineasNew[$i][1];
    $leftmargin=0;
    if($i==count($lineasN)-1) $espaciado=0; // <- para la ultima línea
   }   
   
   //-----imprimir una linea   
   $posicionX=$this->PosX + $leftmargin;
   for($j=0; $j<$lineasN[$i]; $j++)
   {
    $palabra=$this->ExtraerPalabra($palabras);
    for($ii=0; $ii<count($palabra);$ii++)
    {
     $subpalabra=$palabra[$ii];
     if(in_array($subpalabra,$this->comm)) // Es comando?
     {
  	  $this->SetComando($subpalabra);
     }
     else // es palabra
     {
      $this->SetX($posicionX);
	  $this->write(5,"$subpalabra");
 	  $posicionX+=$this->GetStringWidth($subpalabra);
	 }
    }
    $posicionX+=$espaciado;
   }
   $this->Ln();
  }  
 }
 //--------------- Imprimir un texto-----------
 function JLCell($txt, $ANCHO, $alineacion='j' )
 {
   $this->align=$alineacion;
  
  $Auxfont=$this->FontFamily;     // save settings
  $Auxfontsize=$this->FontSizePt; // save settings
  $AuxStyle=$this->Style; // save settings  
  $AuxColor=$this->Color; // save settings
  
  $FontSizeInicial=$this->FontFamily;
  $this->PosX = $this->GetX();
  $txt=str_replace("\r","",$txt); //<- Validate text on windows style
  //--- se divide en parrafos y se imprime cada parrafo
  $parrafos=explode("\n",$txt);
  $posX=$this->GetX();
  for($i=0; $i<count($parrafos); $i++)
  {
    $this->SetX($posX);
    $this->SetFont($Auxfont,$AuxStyle);     // restore settings
    $this->SetFontSize($Auxfontsize); // restore settings  
    $this->TextColor($AuxColor['r'],$AuxColor['g'],$AuxColor['b']); // restore settings  
    
    $this->JLprint($parrafos[$i], $ANCHO);
    
    $Auxfont=$this->FontFamily;     // save settings
    $Auxfontsize=$this->FontSizePt; // save settings
    $AuxStyle=$this->Style; // save settings  
    $AuxColor=$this->Color; // save settings
    
  }
 } 
}
?>
