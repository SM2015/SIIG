<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\CostosBundle\Entity\PeriodoIngresoDatosFormulario
 *
 * @ORM\Table(name="costos.periodo_ingreso_datos_formulario")
 * @ORM\Entity
 */
class PeriodoIngresoDatosFormulario
{   
     /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="costos.ingreso_datos_formulario_seq")
     */
    private $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\IndicadoresBundle\Entity\User")
     * */
    private $usuario;
    
    /**
     * @ORM\ManyToOne(targetEntity="Formulario")
     * */
    private $formulario;
    
    /**
     * @ORM\ManyToOne(targetEntity="Estructura")
     * */
    private $unidad;
    
    /**
     * @ORM\ManyToOne(targetEntity="PeriodoIngreso")
     * @ORM\JoinColumns({
     *                   @ORM\JoinColumn(name="anio_periodo", referencedColumnName="anio"), 
     *                   @ORM\JoinColumn(name="mes_periodo", referencedColumnName="mes")
     *                  })     
     **/
    private $periodo;
    
    

   

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set usuario
     *
     * @param \MINSAL\IndicadoresBundle\Entity\User $usuario
     * @return PeriodoIngresoDatosFormulario
     */
    public function setUsuario(\MINSAL\IndicadoresBundle\Entity\User $usuario = null)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario
     *
     * @return \MINSAL\IndicadoresBundle\Entity\User 
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set formulario
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formulario
     * @return PeriodoIngresoDatosFormulario
     */
    public function setFormulario(\MINSAL\CostosBundle\Entity\Formulario $formulario = null)
    {
        $this->formulario = $formulario;

        return $this;
    }

    /**
     * Get formulario
     *
     * @return \MINSAL\CostosBundle\Entity\Formulario 
     */
    public function getFormulario()
    {
        return $this->formulario;
    }

    /**
     * Set unidad
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $unidad
     * @return PeriodoIngresoDatosFormulario
     */
    public function setUnidad(\MINSAL\CostosBundle\Entity\Estructura $unidad = null)
    {
        $this->unidad = $unidad;

        return $this;
    }

    /**
     * Get unidad
     *
     * @return \MINSAL\CostosBundle\Entity\Estructura 
     */
    public function getUnidad()
    {
        return $this->unidad;
    }

    /**
     * Set periodo
     *
     * @param \MINSAL\CostosBundle\Entity\PeriodoIngreso $periodo
     * @return PeriodoIngresoDatosFormulario
     */
    public function setPeriodo(\MINSAL\CostosBundle\Entity\PeriodoIngreso $periodo = null)
    {
        $this->periodo = $periodo;

        return $this;
    }

    /**
     * Get periodo
     *
     * @return \MINSAL\CostosBundle\Entity\PeriodoIngreso 
     */
    public function getPeriodo()
    {
        return $this->periodo;
    }
}
