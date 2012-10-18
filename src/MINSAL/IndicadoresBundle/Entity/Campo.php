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
     * @ORM\ManyToOne(targetEntity="OrigenDatos")
     * @ORM\JoinColumn(name="id_origen_datos", referencedColumnName="id")
     **/
    private $tablaDato;
    
    /**
     * @ORM\ManyToOne(targetEntity="TipoCampo")
     * @ORM\JoinColumn(name="id_tipo_campo", referencedColumnName="id")
     **/
    private $tipoCampo;
    

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
     * Set tablaDato
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $tablaDato
     * @return Campo
     */
    public function setTablaDato(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $tablaDato = null)
    {
        $this->tablaDato = $tablaDato;
    
        return $this;
    }

    /**
     * Get tablaDato
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos 
     */
    public function getTablaDato()
    {
        return $this->tablaDato;
    }
}