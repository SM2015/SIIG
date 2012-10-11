<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatCargoNominal
 *
 * @ORM\Table(name="cat_cargo_nominal")
 * @ORM\Entity
 */
class CatCargoNominal
{
    /**
     * @var integer $idCargonominal
     *
     * @ORM\Column(name="id_cargonominal", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_cargo_nominal_id_cargonominal_seq", allocationSize=1, initialValue=1)
     */
    private $idCargonominal;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;



    /**
     * Get idCargonominal
     *
     * @return integer 
     */
    public function getIdCargonominal()
    {
        return $this->idCargonominal;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatCargoNominal
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