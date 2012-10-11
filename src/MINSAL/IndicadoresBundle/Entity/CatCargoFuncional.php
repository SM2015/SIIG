<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatCargoFuncional
 *
 * @ORM\Table(name="cat_cargo_funcional")
 * @ORM\Entity
 */
class CatCargoFuncional
{
    /**
     * @var integer $idCargofuncional
     *
     * @ORM\Column(name="id_cargofuncional", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_cargo_funcional_id_cargofuncional_seq", allocationSize=1, initialValue=1)
     */
    private $idCargofuncional;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;



    /**
     * Get idCargofuncional
     *
     * @return integer 
     */
    public function getIdCargofuncional()
    {
        return $this->idCargofuncional;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatCargoFuncional
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