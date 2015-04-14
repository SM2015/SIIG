<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\CostosBundle\Entity\Campo
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
     * @var \Doctrine\Common\Collections\ArrayCollection
     * 
     * @ORM\ManyToMany(targetEntity="Formulario", inversedBy="periodosIngreso")
     * @ORM\JoinTable(name="costos.formulario_periodo_ingreso",
     *      joinColumns={@ORM\JoinColumn(name="anio_periodo", referencedColumnName="anio"), 
     *                   @ORM\JoinColumn(name="mes_periodo", referencedColumnName="mes")
     *                  },
     *      inverseJoinColumns={@ORM\JoinColumn(name="formulario_id", referencedColumnName="id")}
     *      
     * )
     *
     **/   
    private $formularios;
        

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

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->formularios = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add formularios
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formularios
     * @return PeriodoIngreso
     */
    public function addFormulario(\MINSAL\CostosBundle\Entity\Formulario $formularios)
    {
        $this->formularios[] = $formularios;

        return $this;
    }

    /**
     * Remove formularios
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formularios
     */
    public function removeFormulario(\MINSAL\CostosBundle\Entity\Formulario $formularios)
    {
        $this->formularios->removeElement($formularios);
    }

    /**
     * Get formularios
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFormularios()
    {
        return $this->formularios;
    }
}
