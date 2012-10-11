<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatArea
 *
 * @ORM\Table(name="cat_area")
 * @ORM\Entity
 */
class CatArea
{
    /**
     * @var integer $idArea
     *
     * @ORM\Column(name="id_area", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_area_id_area_seq", allocationSize=1, initialValue=1)
     */
    private $idArea;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $inicial
     *
     * @ORM\Column(name="inicial", type="string", length=5, nullable=false)
     */
    private $inicial;



    /**
     * Get idArea
     *
     * @return integer 
     */
    public function getIdArea()
    {
        return $this->idArea;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatArea
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
     * Set inicial
     *
     * @param string $inicial
     * @return CatArea
     */
    public function setInicial($inicial)
    {
        $this->inicial = $inicial;
    
        return $this;
    }

    /**
     * Get inicial
     *
     * @return string 
     */
    public function getInicial()
    {
        return $this->inicial;
    }
}