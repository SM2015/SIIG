<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatFuentefinanciamiento
 *
 * @ORM\Table(name="cat_fuentefinanciamiento")
 * @ORM\Entity
 */
class CatFuentefinanciamiento
{
    /**
     * @var integer $idFuentefinanciamiento
     *
     * @ORM\Column(name="id_fuentefinanciamiento", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_fuentefinanciamiento_id_fuentefinanciamiento_seq", allocationSize=1, initialValue=1)
     */
    private $idFuentefinanciamiento;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;



    /**
     * Get idFuentefinanciamiento
     *
     * @return integer 
     */
    public function getIdFuentefinanciamiento()
    {
        return $this->idFuentefinanciamiento;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatFuentefinanciamiento
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