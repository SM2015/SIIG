<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\ReporteActualizacion
 *
 * @ORM\Table(name="reporte_actualizacion")
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\ReporteActualizacionRepository")
 */
class ReporteActualizacion
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="datetime", nullable=false)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="reporte", type="text", nullable=true)
     */
    private $reporte;

    /**
     * @var \OrigenDatos
     *
     * @ORM\ManyToOne(targetEntity="OrigenDatos", inversedBy="reporteActualizaciones")
     * @ORM\JoinColumn(name="id_origen_datos", referencedColumnName="id", onDelete="CASCADE")
     * */
    private $origenDatos;

    /**
     * @var \EstatusActualizacion
     *
     * @ORM\ManyToOne(targetEntity="EstatusActualizacion")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_estatus_act", referencedColumnName="id")
     * })
     */
    private $estatusAct;



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
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return ReporteActualizacion
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;
    
        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime 
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set reporte
     *
     * @param string $reporte
     * @return ReporteActualizacion
     */
    public function setReporte($reporte)
    {
        $this->reporte = $reporte;
    
        return $this;
    }

    /**
     * Get reporte
     *
     * @return string 
     */
    public function getReporte()
    {
        return $this->reporte;
    }

    /**
     * Set origenDatos
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos
     * @return ReporteActualizacion
     */
    public function setOrigenDatos(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos = null) {
        $this->origenDatos = $origenDatos;

        return $this;
    }

    /**
     * Get origenDatos
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos
     */
    public function getOrigenDatos() {
        return $this->origenDatos;
    }

    /**
     * Set estatusAct
     *
     * @param \MINSAL\IndicadoresBundle\Entity\EstatusActualizacion $estatusAct
     * @return ReporteActualizacion
     */
    public function setEstatusAct(\MINSAL\IndicadoresBundle\Entity\EstatusActualizacion $estatusAct = null)
    {
        $this->estatusAct = $estatusAct;
    
        return $this;
    }

    /**
     * Get estatusAct
     *
     * @return \MINSAL\IndicadoresBundle\Entity\EstatusActualizacion 
     */
    public function getEstatusAct()
    {
        return $this->estatusAct;
    }
}