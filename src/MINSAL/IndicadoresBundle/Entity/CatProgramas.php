<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatProgramas
 *
 * @ORM\Table(name="cat_programas")
 * @ORM\Entity
 */
class CatProgramas
{
    /**
     * @var integer $idPrograma
     *
     * @ORM\Column(name="id_programa", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_programas_id_programa_seq", allocationSize=1, initialValue=1)
     */
    private $idPrograma;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;



    /**
     * Get idPrograma
     *
     * @return integer 
     */
    public function getIdPrograma()
    {
        return $this->idPrograma;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatProgramas
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