<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Periodos
 *
 * @ORM\Table(name="periodos")
 * @ORM\Entity
 */
class Periodos
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="periodos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=25, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $sentencia
     *
     * @ORM\Column(name="sentencia", type="text", nullable=true)
     */
    private $sentencia;



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
     * Set descripcion
     *
     * @param string $descripcion
     * @return Periodos
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
     * Set sentencia
     *
     * @param string $sentencia
     * @return Periodos
     */
    public function setSentencia($sentencia)
    {
        $this->sentencia = $sentencia;
    
        return $this;
    }

    /**
     * Get sentencia
     *
     * @return string 
     */
    public function getSentencia()
    {
        return $this->sentencia;
    }
    
    public function __toString() {
        return $this->descripcion;
    }
}