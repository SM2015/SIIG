<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\VariableDato
 *
 * @ORM\Table(name="variable_dato")
 * @ORM\Entity
 */
class VariableDato
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="variable_dato_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=200, nullable=false)
     */
    private $nombre;

    /**
     * @var integer $confiabilidad
     *
     * @ORM\Column(name="confiabilidad", type="integer", nullable=false)
     */
    private $confiabilidad;

    /**
     * @var string $iniciales
     *
     * @ORM\Column(name="iniciales", type="string", nullable=false)
     */
    private $iniciales;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=true)
     */
    private $comentario;

    /**
     * @var boolean $esPoblacion
     *
     * @ORM\Column(name="es_poblacion", type="boolean", nullable=true)
     */
    private $esPoblacion;

    /**
     * @var FuenteDato
     *
     * @ORM\ManyToOne(targetEntity="FuenteDato")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_fuente_dato", referencedColumnName="id")
     * })
     */
    private $idFuenteDato;

    /**
     * @var ResponsableDato
     *
     * @ORM\ManyToOne(targetEntity="ResponsableDato")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_responsable_dato", referencedColumnName="id")
     * })
     */
    private $idResponsableDato;

    /**
     * @var Sentencia
     *
     * @ORM\ManyToOne(targetEntity="Sentencia")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_sentencia", referencedColumnName="id")
     * })
     */
    private $idSentencia;

    /**
     * @var WebService
     *
     * @ORM\ManyToOne(targetEntity="WebService")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_web_service", referencedColumnName="id_web_service")
     * })
     */
    private $idWebService;

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
     * Set nombre
     *
     * @param string $nombre
     * @return VariableDato
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    
        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set confiabilidad
     *
     * @param integer $confiabilidad
     * @return VariableDato
     */
    public function setConfiabilidad($confiabilidad)
    {
        $this->confiabilidad = $confiabilidad;
    
        return $this;
    }

    /**
     * Get confiabilidad
     *
     * @return integer 
     */
    public function getConfiabilidad()
    {
        return $this->confiabilidad;
    }

    /**
     * Set iniciales
     *
     * @param string $iniciales
     * @return VariableDato
     */
    public function setIniciales($iniciales)
    {
        $this->iniciales = $iniciales;
    
        return $this;
    }

    /**
     * Get iniciales
     *
     * @return string 
     */
    public function getIniciales()
    {
        return $this->iniciales;
    }

    /**
     * Set comentario
     *
     * @param string $comentario
     * @return VariableDato
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;
    
        return $this;
    }

    /**
     * Get comentario
     *
     * @return string 
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    /**
     * Set esPoblacion
     *
     * @param boolean $esPoblacion
     * @return VariableDato
     */
    public function setEsPoblacion($esPoblacion)
    {
        $this->esPoblacion = $esPoblacion;
    
        return $this;
    }

    /**
     * Get esPoblacion
     *
     * @return boolean 
     */
    public function getEsPoblacion()
    {
        return $this->esPoblacion;
    }

    /**
     * Set idFuenteDato
     *
     * @param MINSAL\IndicadoresBundle\Entity\FuenteDato $idFuenteDato
     * @return VariableDato
     */
    public function setIdFuenteDato(\MINSAL\IndicadoresBundle\Entity\FuenteDato $idFuenteDato = null)
    {
        $this->idFuenteDato = $idFuenteDato;
    
        return $this;
    }

    /**
     * Get idFuenteDato
     *
     * @return MINSAL\IndicadoresBundle\Entity\FuenteDato 
     */
    public function getIdFuenteDato()
    {
        return $this->idFuenteDato;
    }

    /**
     * Set idResponsableDato
     *
     * @param MINSAL\IndicadoresBundle\Entity\ResponsableDato $idResponsableDato
     * @return VariableDato
     */
    public function setIdResponsableDato(\MINSAL\IndicadoresBundle\Entity\ResponsableDato $idResponsableDato = null)
    {
        $this->idResponsableDato = $idResponsableDato;
    
        return $this;
    }

    /**
     * Get idResponsableDato
     *
     * @return MINSAL\IndicadoresBundle\Entity\ResponsableDato 
     */
    public function getIdResponsableDato()
    {
        return $this->idResponsableDato;
    }

    /**
     * Set idSentencia
     *
     * @param MINSAL\IndicadoresBundle\Entity\Sentencia $idSentencia
     * @return VariableDato
     */
    public function setIdSentencia(\MINSAL\IndicadoresBundle\Entity\Sentencia $idSentencia = null)
    {
        $this->idSentencia = $idSentencia;
    
        return $this;
    }

    /**
     * Get idSentencia
     *
     * @return MINSAL\IndicadoresBundle\Entity\Sentencia 
     */
    public function getIdSentencia()
    {
        return $this->idSentencia;
    }

    /**
     * Set idWebService
     *
     * @param MINSAL\IndicadoresBundle\Entity\WebService $idWebService
     * @return VariableDato
     */
    public function setIdWebService(\MINSAL\IndicadoresBundle\Entity\WebService $idWebService = null)
    {
        $this->idWebService = $idWebService;
    
        return $this;
    }

    /**
     * Get idWebService
     *
     * @return MINSAL\IndicadoresBundle\Entity\WebService 
     */
    public function getIdWebService()
    {
        return $this->idWebService;
    }
    
    public function __toString() {
        return $this->nombre;
    }
    
}