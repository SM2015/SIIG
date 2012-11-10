<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Presentacion
 *
 * @ORM\Table(name="presentacion")
 * @ORM\Entity
 */
class Presentacion
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
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=20, nullable=false)
     */
    private $codigo;
    
    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=40, nullable=false)
     */
    private $descripcion;



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
     * @return Presentacion
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
    
    public function __toString() {
        return $this->descripcion;
    }

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return Presentacion
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
     * Set id
     *
     * @param integer $id
     * @return Presentacion
     */
    public function setId($id)
    {
        $this->id = $id;
    
        return $this;
    }
}