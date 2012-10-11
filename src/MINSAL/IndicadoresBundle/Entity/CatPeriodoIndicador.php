<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatPeriodoIndicador
 *
 * @ORM\Table(name="cat_periodo_indicador")
 * @ORM\Entity
 */
class CatPeriodoIndicador
{
    /**
     * @var integer $idPeriodoIndicador
     *
     * @ORM\Column(name="id_periodo_indicador", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_periodo_indicador_id_periodo_indicador_seq", allocationSize=1, initialValue=1)
     */
    private $idPeriodoIndicador;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", nullable=false)
     */
    private $descripcion;



    /**
     * Get idPeriodoIndicador
     *
     * @return integer 
     */
    public function getIdPeriodoIndicador()
    {
        return $this->idPeriodoIndicador;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatPeriodoIndicador
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