<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use MINSAL\IndicadoresBundle\Validator as CustomAssert;

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
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=200, nullable=false)
     * @Assert\Length(
     *      min = "3",
     *      max = "200"
     * )
	 * @CustomAssert\AlphanumericPlus()
     */
    private $nombre;

    /**
     * @var integer $confiabilidad
     *
     * @ORM\Column(name="confiabilidad", type="integer", nullable=true)
     *
     * @Assert\Range(
     *      min = "0",
     *      max = "100"
     * )
     */
    private $confiabilidad;

    /**
     * @var string $iniciales
     *
     * @ORM\Column(name="iniciales", type="string", nullable=false)
     * @Assert\Length(
     *      min = "3",
     *      max = "200"
     * )
	 * @CustomAssert\AlphanumericPlus()
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
     * @var OrigenDatos
     *
     * @ORM\ManyToOne(targetEntity="OrigenDatos", inversedBy="variables")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_origen_datos", referencedColumnName="id")
     * })
     */
    private $origenDatos;

    /**
     * @ORM\ManyToMany(targetEntity="FichaTecnica", mappedBy="variables")
     **/
    private $indicadores;

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
     * @param  string       $nombre
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
     * @param  integer      $confiabilidad
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
     * @param  string       $iniciales
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
     * @param  string       $comentario
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
     * @param  boolean      $esPoblacion
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
     * @param  MINSAL\IndicadoresBundle\Entity\FuenteDato $idFuenteDato
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
     * @param  MINSAL\IndicadoresBundle\Entity\ResponsableDato $idResponsableDato
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

    public function __toString()
    {
        return $this->nombre. ' (' . $this->iniciales . ')';
    }

    /**
     * Set origenDatos
     *
     * @param  MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos
     * @return VariableDato
     */
    public function setOrigenDatos(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos = null)
    {
        $this->origenDatos = $origenDatos;

        return $this;
    }

    /**
     * Get origenDatos
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos
     */
    public function getOrigenDatos()
    {
        return $this->origenDatos;
    }

    /**
     * Set id
     *
     * @param  integer      $id
     * @return VariableDato
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->indicadores = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add indicadores
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     * @return VariableDato
     */
    public function addIndicador(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores[] = $indicadores;

        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     */
    public function removeIndicador(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores->removeElement($indicadores);
    }

    /**
     * Get indicadores
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIndicadores()
    {
        return $this->indicadores;
    }

    /**
     * Add indicadores
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     * @return VariableDato
     */
    public function addIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores[] = $indicadores;

        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     */
    public function removeIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores->removeElement($indicadores);
    }
}