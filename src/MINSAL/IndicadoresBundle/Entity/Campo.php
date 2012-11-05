<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\TablaDatos
 *
 * @ORM\Table(name="campo")
 * @ORM\Entity
 */
class Campo
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="campo_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;
    
    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;
    
    /**
     * @ORM\ManyToOne(targetEntity="OrigenDatos", inversedBy="campos")
     * @ORM\JoinColumn(name="id_origen_datos", referencedColumnName="id")
     **/
    private $origenDato;
    
    /**
     * @ORM\ManyToOne(targetEntity="TipoCampo")
     * @ORM\JoinColumn(name="id_tipo_campo", referencedColumnName="id")
     **/
    private $tipoCampo;
    
    /**
     * @ORM\ManyToOne(targetEntity="SignificadoCampo")
     * @ORM\JoinColumn(name="id_significado_campo", referencedColumnName="id")
     **/
    private $significado;
    

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
     * @return Campo
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
     * Set tipoCampo
     *
     * @param MINSAL\IndicadoresBundle\Entity\TipoCampo $tipoCampo
     * @return Campo
     */
    public function setTipoCampo(\MINSAL\IndicadoresBundle\Entity\TipoCampo $tipoCampo = null)
    {
        $this->tipoCampo = $tipoCampo;
    
        return $this;
    }

    /**
     * Get tipoCampo
     *
     * @return MINSAL\IndicadoresBundle\Entity\TipoCampo 
     */
    public function getTipoCampo()
    {
        return $this->tipoCampo;
    }


    /**
     * Set origenDato
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDato
     * @return Campo
     */
    public function setOrigenDato(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDato = null)
    {
        $this->origenDato = $origenDato;
    
        return $this;
    }

    /**
     * Get origenDato
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos 
     */
    public function getOrigenDato()
    {
        return $this->origenDato;
    }

    /**
     * Set significado
     *
     * @param MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significado
     * @return Campo
     */
    public function setSignificado(\MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significado = null)
    {
        $this->significado = $significado;
    
        return $this;
    }

    /**
     * Get significado
     *
     * @return MINSAL\IndicadoresBundle\Entity\SignificadoCampo
     */
    public function getSignificado()
    {
        return $this->significado;
    }
}