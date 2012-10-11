<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatRegionesSinab
 *
 * @ORM\Table(name="cat_regiones_sinab")
 * @ORM\Entity
 */
class CatRegionesSinab
{
    /**
     * @var integer $idRegionSinab
     *
     * @ORM\Column(name="id_region_sinab", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_regiones_sinab_id_region_sinab_seq", allocationSize=1, initialValue=1)
     */
    private $idRegionSinab;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=false)
     */
    private $descripcion;



    /**
     * Get idRegionSinab
     *
     * @return integer 
     */
    public function getIdRegionSinab()
    {
        return $this->idRegionSinab;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatRegionesSinab
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