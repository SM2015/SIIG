<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatGenero
 *
 * @ORM\Table(name="cat_genero")
 * @ORM\Entity
 */
class CatGenero
{
    /**
     * @var integer $idGenero
     *
     * @ORM\Column(name="id_genero", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_genero_id_genero_seq", allocationSize=1, initialValue=1)
     */
    private $idGenero;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;



    /**
     * Get idGenero
     *
     * @return integer 
     */
    public function getIdGenero()
    {
        return $this->idGenero;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatGenero
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
}