<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\CostosBundle\Entity\PeriodoIngreso
 *
 * @ORM\Table(name="costos.periodo_ingreso")
 * @ORM\Entity
 */
class PeriodoIngreso
{   
    /**
     * @var string $anio
     *
     * @ORM\Id
     * @ORM\Column(name="anio", type="integer", nullable=false)
     */
    private $anio;

    /**
     * @var string $mes
     * @ORM\Id
     * @ORM\Column(name="mes", type="string", length=20, nullable=false)
     */
    private $mes;

    /**
     * Set anio
     *
     * @param integer $anio
     * @return FormularioPeriodoIngreso
     */
    public function setAnio($anio)
    {
        $this->anio = $anio;

        return $this;
    }

    /**
     * Get anio
     *
     * @return integer 
     */
    public function getAnio()
    {
        return $this->anio;
    }

    /**
     * Set mes
     *
     * @param integer $mes
     * @return FormularioPeriodoIngreso
     */
    public function setMes($mes)
    {
        $this->mes = $mes;

        return $this;
    }

    /**
     * Get mes
     *
     * @return integer 
     */
    public function getMes()
    {
        return $this->mes;
    }
    
    public function __toString() {
        return $this->mes.'/'.$this->anio;
    }
}
