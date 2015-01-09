<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Campo
 *
 * @ORM\Table(name="costos.campo")
 * @ORM\Entity(repositoryClass="MINSAL\CostosBundle\Entity\CampoRepository")
 */
class Campo
{   
    private $esCalculado;
    
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;    

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;

    /**
     * @var string $formula
     *
     * @ORM\Column(name="formula", type="text", nullable=true)
     */
    private $formula;
    
    /**
     * @var string $regla_validacion
     *
     * @ORM\Column(name="regla_validacion", type="text", nullable=true)
     */
    private $reglaValidacion;
    
    /**
     * @var string $msj_validacion
     *
     * @ORM\Column(name="msj_validacion", type="text", nullable=true)
     */
    private $msjValidacion;
    
    /**
     * @var string $origen_fila
     *
     * @ORM\Column(name="origen", type="text", nullable=true)
     */
    private $origen;
    
    /**
     * @var string $posicion
     *
     * @ORM\Column(name="posicion", type="float", nullable=false)
     */
    private $posicion;
    
    /**
     * @var string $ancho
     *
     * @ORM\Column(name="ancho", type="float", nullable=true)
     */
    private $ancho;
    
    /**
     * @var string $esEditable
     *
     * @ORM\Column(name="es_editable", type="boolean", nullable=true)
     */
    private $esEditable;
    
    /**
     * @var string $oculto
     *
     * @ORM\Column(name="es_oculto", type="boolean", nullable=true)
     */
    private $oculto;
    
    /**
     * @var string $origen_pivote
     *
     * @ORM\Column(name="origen_pivote", type="text", nullable=true)
     */
    private $origenPivote;

    /**
     * @ORM\ManyToOne(targetEntity="TipoControl")
     * @ORM\JoinColumn(name="id_tipo_control", referencedColumnName="id")
     * */
    private $tipoControl;

    /**
     * @ORM\ManyToOne(targetEntity="TipoDato")
     * @ORM\JoinColumn(name="id_tipo_dato", referencedColumnName="id")
     * */
    private $tipoDato;

    /**
     * @ORM\ManyToOne(targetEntity="Formato")
     * @ORM\JoinColumn(name="id_formato", referencedColumnName="id")
     * */
    private $formato;
    
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * 
     * @ORM\ManyToMany(targetEntity="Formulario", mappedBy="campos")     
     * */
    private $formularios;
    
    /**
     * @ORM\ManyToOne(targetEntity="Alineacion")
     * @ORM\JoinColumn(name="id_alineacion", referencedColumnName="id")
     * */
    private $alineacion;
    
    /**
     * @ORM\ManyToOne(targetEntity="GrupoColumnas")
     * @ORM\JoinColumn(name="id_grupo_columnas", referencedColumnName="id")
     * */
    private $grupoColumnas;
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\IndicadoresBundle\Entity\SignificadoCampo")
     * @ORM\OrderBy({"descripcion" = "ASC"})
     * */
    private $significadoCampo;
    
    public function __toString()
    {
        return $this->getSignificadoCampo()->getDescripcion() ? : '';
    }


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return Campo
     */
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get codigo
     *
     * @return string 
     */
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return Campo
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string 
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set formula
     *
     * @param string $formula
     * @return Campo
     */
    public function setFormula($formula)
    {
        $this->formula = $formula;

        return $this;
    }

    /**
     * Get formula
     *
     * @return string 
     */
    public function getFormula()
    {
        return $this->formula;
    }

    /**
     * Set reglaValidacion
     *
     * @param string $reglaValidacion
     * @return Campo
     */
    public function setReglaValidacion($reglaValidacion)
    {
        $this->reglaValidacion = $reglaValidacion;

        return $this;
    }

    /**
     * Get reglaValidacion
     *
     * @return string 
     */
    public function getReglaValidacion()
    {
        return $this->reglaValidacion;
    }

    /**
     * Set msjValidacion
     *
     * @param string $msjValidacion
     * @return Campo
     */
    public function setMsjValidacion($msjValidacion)
    {
        $this->msjValidacion = $msjValidacion;

        return $this;
    }

    /**
     * Get msjValidacion
     *
     * @return string 
     */
    public function getMsjValidacion()
    {
        return $this->msjValidacion;
    }

    /**
     * Set posicion
     *
     * @param integer $posicion
     * @return Campo
     */
    public function setPosicion($posicion)
    {
        $this->posicion = $posicion;

        return $this;
    }

    /**
     * Get posicion
     *
     * @return integer 
     */
    public function getPosicion()
    {
        return $this->posicion;
    }

    /**
     * Set ancho
     *
     * @param float $ancho
     * @return Campo
     */
    public function setAncho($ancho)
    {
        $this->ancho = $ancho;

        return $this;
    }

    /**
     * Get ancho
     *
     * @return float 
     */
    public function getAncho()
    {
        return $this->ancho;
    }

    /**
     * Set esEditable
     *
     * @param boolean $esEditable
     * @return Campo
     */
    public function setEsEditable($esEditable)
    {
        $this->esEditable = $esEditable;

        return $this;
    }

    /**
     * Get esEditable
     *
     * @return boolean 
     */
    public function getEsEditable()
    {
        return $this->esEditable;
    }

    /**
     * Set tipoControl
     *
     * @param \MINSAL\CostosBundle\Entity\TipoControl $tipoControl
     * @return Campo
     */
    public function setTipoControl(\MINSAL\CostosBundle\Entity\TipoControl $tipoControl = null)
    {
        $this->tipoControl = $tipoControl;

        return $this;
    }

    /**
     * Get tipoControl
     *
     * @return \MINSAL\CostosBundle\Entity\TipoControl 
     */
    public function getTipoControl()
    {
        return $this->tipoControl;
    }

    /**
     * Set tipoDato
     *
     * @param \MINSAL\CostosBundle\Entity\TipoDato $tipoDato
     * @return Campo
     */
    public function setTipoDato(\MINSAL\CostosBundle\Entity\TipoDato $tipoDato = null)
    {
        $this->tipoDato = $tipoDato;

        return $this;
    }

    /**
     * Get tipoDato
     *
     * @return \MINSAL\CostosBundle\Entity\TipoDato 
     */
    public function getTipoDato()
    {
        return $this->tipoDato;
    }

    /**
     * Set formato
     *
     * @param \MINSAL\CostosBundle\Entity\Formato $formato
     * @return Campo
     */
    public function setFormato(\MINSAL\CostosBundle\Entity\Formato $formato = null)
    {
        $this->formato = $formato;

        return $this;
    }

    /**
     * Get formato
     *
     * @return \MINSAL\CostosBundle\Entity\Formato 
     */
    public function getFormato()
    {
        return $this->formato;
    }

    /**
     * Set alineacion
     *
     * @param \MINSAL\CostosBundle\Entity\Alineacion $alineacion
     * @return Campo
     */
    public function setAlineacion(\MINSAL\CostosBundle\Entity\Alineacion $alineacion = null)
    {
        $this->alineacion = $alineacion;

        return $this;
    }

    /**
     * Get alineacion
     *
     * @return \MINSAL\CostosBundle\Entity\Alineacion 
     */
    public function getAlineacion()
    {
        return $this->alineacion;
    }

    /**
     * Set grupoColumnas
     *
     * @param \MINSAL\CostosBundle\Entity\GrupoColumnas $grupoColumnas
     * @return Campo
     */
    public function setGrupoColumnas(\MINSAL\CostosBundle\Entity\GrupoColumnas $grupoColumnas = null)
    {
        $this->grupoColumnas = $grupoColumnas;

        return $this;
    }

    /**
     * Get grupoColumnas
     *
     * @return \MINSAL\CostosBundle\Entity\GrupoColumnas 
     */
    public function getGrupoColumnas()
    {
        return $this->grupoColumnas;
    }

    /**
     * Set origenFila
     *
     * @param string $origen
     * @return Campo
     */
    public function setOrigen($origen)
    {
        $this->origen = $origen;

        return $this;
    }

    /**
     * Get origenFila
     *
     * @return string 
     */
    public function getOrigen()
    {
        return $this->origen;
    }    
    
    
    /**
     * Set origen_pivote
     *
     * @param string $origenPivote
     * @return Campo
     */
    public function setOrigenPivote($origenPivote)
    {
        $this->origenPivote = $origenPivote;

        return $this;
    }

    /**
     * Get origen_pivote
     *
     * @return string 
     */
    public function getOrigenPivote()
    {
        return $this->origenPivote;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->formularios = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add formularios
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formularios
     * @return Campo
     */
    public function addFormulario(\MINSAL\CostosBundle\Entity\Formulario $formularios)
    {
        $this->formularios[] = $formularios;

        return $this;
    }

    /**
     * Remove formularios
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formularios
     */
    public function removeFormulario(\MINSAL\CostosBundle\Entity\Formulario $formularios)
    {
        $this->formularios->removeElement($formularios);
    }

    /**
     * Get formularios
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFormularios()
    {
        return $this->formularios;
    }

    /**
     * Set significadoCampo
     *
     * @param \MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significadoCampo
     * @return Campo
     */
    public function setSignificadoCampo(\MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significadoCampo = null)
    {
        $this->significadoCampo = $significadoCampo;

        return $this;
    }

    /**
     * Get significadoCampo
     *
     * @return \MINSAL\IndicadoresBundle\Entity\SignificadoCampo 
     */
    public function getSignificadoCampo()
    {
        return $this->significadoCampo;
    }
    
    public function getEsCalculado()
    {
        return ($this->esCalculado == true) ? true: false;
    }
    
    public function setEsCalculado($estado)
    {
        return $this->esCalculado = $estado;
    }
    

    /**
     * Set oculto
     *
     * @param boolean $oculto
     * @return Campo
     */
    public function setOculto($oculto)
    {
        $this->oculto = $oculto;

        return $this;
    }

    /**
     * Get oculto
     *
     * @return boolean 
     */
    public function getOculto()
    {
        return $this->oculto;
    }
}
