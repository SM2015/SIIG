<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * MINSAL\CostosBundle\Entity\VariablesGastosAdministrativos
 *
 * @ORM\Table(name="costos.variables_ga")
 * @ORM\Entity
 */
class VariablesGastosAdministrativos
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
    public $mes_anio;

    /**
     * @var string $mes
     *
     * @ORM\Column(name="mes", type="string", length=4, nullable=false)
     */
    private $mes;
        

    /**
     * @var string $anio
     *
     * @ORM\Column(name="anio", type="integer", nullable=false)
     */
    private $anio;
    
    /**
     * @var string $total_personal
     *
     * @ORM\Column(name="total_personal", type="integer", nullable=false)
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $totalPersonal;
    
    /**
     * @var string $promedio_usuarios_x_dia
     *
     * @ORM\Column(name="promedio_usuarios_x_dia", type="float", nullable=false)
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $promedioUsuariosDia;
    
    /**
     * @var string $cantCamas
     *
     * @ORM\Column(name="cant_camas", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantCamas;
    
    /**
     * @var string $cantCelulares
     *
     * @ORM\Column(name="cant_celulares", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantCelulares;
    
    /**
     * @var string $cantAiresMantoExterno
     *
     * @ORM\Column(name="cant_aires_con_manto_externo", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantAiresMantoExterno;
    
    /**
     * @var string $areaFisica
     *
     * @ORM\Column(name="area", type="float", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $areaFisica;
    
    /**
     * @var string $tomasConPlantaEmergencia
     *
     * @ORM\Column(name="tomas_con_planta", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $tomasConPlantaEmergencia;
    
    
    /**
     * @var string $cantidadLuminarias
     *
     * @ORM\Column(name="cantidad_luminarias", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantidadLuminarias;
    
    /**
     * @var string $cantidadTelFijos
     *
     * @ORM\Column(name="cantidad_tel_fijos", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantidadTelFijos;
    
    
    /**
     * @var string $cantidadTelSalida0
     *
     * @ORM\Column(name="cantidad_tel_salida_0", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantidadTelSalida0;
    
    
    /**
     * @var string $cantidadRadios
     *
     * @ORM\Column(name="cantidad_radios", type="integer", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $cantidadRadios;
    
    
    /**
     * @var string $areaConClimatizacionChiller
     *
     * @ORM\Column(name="area_con_climatizacion_chiller", type="float", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $areaConClimatizacionChiller;
    
    
    /**
     * @var string $tiempoUtilizacionLuminarias
     *
     * @ORM\Column(name="tiempo_utilizacion_luminarias", type="float", nullable=false)
     * 
     * @Assert\GreaterThanOrEqual(
     *     value = 0
     * )
     */
    private $tiempoUtilizacionLuminarias;
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\CostosBundle\Entity\Estructura")
     * */
    private $estructura;
    

    public function __toString()
    {
        return '';
    }



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
     * Set mes
     *
     * @param string $mes
     * @return VariablesGastosAdministrativos
     */
    public function setMes($mes)
    {
        $this->mes = $mes;

        return $this;
    }

    /**
     * Get mes
     *
     * @return string 
     */
    public function getMes()
    {
        return $this->mes;
    }
    
    /**
     * Get mes
     *
     * @return string 
     */
    public function getMesAnio()
    {
        return $this->mes.'/'.$this->anio;
    }
    
    /**
     * Set anio
     *
     * @param integer $anio
     * @return VariablesGastosAdministrativos
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
     * Set totalPersonal
     *
     * @param integer $totalPersonal
     * @return VariablesGastosAdministrativos
     */
    public function setTotalPersonal($totalPersonal)
    {
        $this->totalPersonal = $totalPersonal;

        return $this;
    }

    /**
     * Get totalPersonal
     *
     * @return integer 
     */
    public function getTotalPersonal()
    {
        return $this->totalPersonal;
    }

    /**
     * Set promedioUsuariosDia
     *
     * @param float $promedioUsuariosDia
     * @return VariablesGastosAdministrativos
     */
    public function setPromedioUsuariosDia($promedioUsuariosDia)
    {
        $this->promedioUsuariosDia = $promedioUsuariosDia;

        return $this;
    }

    /**
     * Get promedioUsuariosDia
     *
     * @return float 
     */
    public function getPromedioUsuariosDia()
    {
        return $this->promedioUsuariosDia;
    }

    /**
     * Set cantCamas
     *
     * @param integer $cantCamas
     * @return VariablesGastosAdministrativos
     */
    public function setCantCamas($cantCamas)
    {
        $this->cantCamas = $cantCamas;

        return $this;
    }

    /**
     * Get cantCamas
     *
     * @return integer 
     */
    public function getCantCamas()
    {
        return $this->cantCamas;
    }

    /**
     * Set cantCelulares
     *
     * @param integer $cantCelulares
     * @return VariablesGastosAdministrativos
     */
    public function setCantCelulares($cantCelulares)
    {
        $this->cantCelulares = $cantCelulares;

        return $this;
    }

    /**
     * Get cantCelulares
     *
     * @return integer 
     */
    public function getCantCelulares()
    {
        return $this->cantCelulares;
    }

    /**
     * Set cantAiresMantoExterno
     *
     * @param integer $cantAiresMantoExterno
     * @return VariablesGastosAdministrativos
     */
    public function setCantAiresMantoExterno($cantAiresMantoExterno)
    {
        $this->cantAiresMantoExterno = $cantAiresMantoExterno;

        return $this;
    }

    /**
     * Get cantAiresMantoExterno
     *
     * @return integer 
     */
    public function getCantAiresMantoExterno()
    {
        return $this->cantAiresMantoExterno;
    }

    /**
     * Set areaFisica
     *
     * @param float $areaFisica
     * @return VariablesGastosAdministrativos
     */
    public function setAreaFisica($areaFisica)
    {
        $this->areaFisica = $areaFisica;

        return $this;
    }

    /**
     * Get areaFisica
     *
     * @return float 
     */
    public function getAreaFisica()
    {
        return $this->areaFisica;
    }

    /**
     * Set tomasConPlantaEmergencia
     *
     * @param integer $tomasConPlantaEmergencia
     * @return VariablesGastosAdministrativos
     */
    public function setTomasConPlantaEmergencia($tomasConPlantaEmergencia)
    {
        $this->tomasConPlantaEmergencia = $tomasConPlantaEmergencia;

        return $this;
    }

    /**
     * Get tomasConPlantaEmergencia
     *
     * @return integer 
     */
    public function getTomasConPlantaEmergencia()
    {
        return $this->tomasConPlantaEmergencia;
    }

    /**
     * Set cantidadLuminarias
     *
     * @param integer $cantidadLuminarias
     * @return VariablesGastosAdministrativos
     */
    public function setCantidadLuminarias($cantidadLuminarias)
    {
        $this->cantidadLuminarias = $cantidadLuminarias;

        return $this;
    }

    /**
     * Get cantidadLuminarias
     *
     * @return integer 
     */
    public function getCantidadLuminarias()
    {
        return $this->cantidadLuminarias;
    }

    /**
     * Set cantidadTelFijos
     *
     * @param integer $cantidadTelFijos
     * @return VariablesGastosAdministrativos
     */
    public function setCantidadTelFijos($cantidadTelFijos)
    {
        $this->cantidadTelFijos = $cantidadTelFijos;

        return $this;
    }

    /**
     * Get cantidadTelFijos
     *
     * @return integer 
     */
    public function getCantidadTelFijos()
    {
        return $this->cantidadTelFijos;
    }

    /**
     * Set cantidadTelSalida0
     *
     * @param integer $cantidadTelSalida0
     * @return VariablesGastosAdministrativos
     */
    public function setCantidadTelSalida0($cantidadTelSalida0)
    {
        $this->cantidadTelSalida0 = $cantidadTelSalida0;

        return $this;
    }

    /**
     * Get cantidadTelSalida0
     *
     * @return integer 
     */
    public function getCantidadTelSalida0()
    {
        return $this->cantidadTelSalida0;
    }

    /**
     * Set cantidadRadios
     *
     * @param integer $cantidadRadios
     * @return VariablesGastosAdministrativos
     */
    public function setCantidadRadios($cantidadRadios)
    {
        $this->cantidadRadios = $cantidadRadios;

        return $this;
    }

    /**
     * Get cantidadRadios
     *
     * @return integer 
     */
    public function getCantidadRadios()
    {
        return $this->cantidadRadios;
    }

    /**
     * Set areaConClimatizacionChiller
     *
     * @param float $areaConClimatizacionChiller
     * @return VariablesGastosAdministrativos
     */
    public function setAreaConClimatizacionChiller($areaConClimatizacionChiller)
    {
        $this->areaConClimatizacionChiller = $areaConClimatizacionChiller;

        return $this;
    }

    /**
     * Get areaConClimatizacionChiller
     *
     * @return float 
     */
    public function getAreaConClimatizacionChiller()
    {
        return $this->areaConClimatizacionChiller;
    }

    /**
     * Set tiempoUtilizacionLuminarias
     *
     * @param float $tiempoUtilizacionLuminarias
     * @return VariablesGastosAdministrativos
     */
    public function setTiempoUtilizacionLuminarias($tiempoUtilizacionLuminarias)
    {
        $this->tiempoUtilizacionLuminarias = $tiempoUtilizacionLuminarias;

        return $this;
    }

    /**
     * Get tiempoUtilizacionLuminarias
     *
     * @return float 
     */
    public function getTiempoUtilizacionLuminarias()
    {
        return $this->tiempoUtilizacionLuminarias;
    }

    /**
     * Set estructura
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $estructura
     * @return VariablesGastosAdministrativos
     */
    public function setEstructura(\MINSAL\CostosBundle\Entity\Estructura $estructura = null)
    {
        $this->estructura = $estructura;

        return $this;
    }

    /**
     * Get estructura
     *
     * @return \MINSAL\CostosBundle\Entity\Estructura 
     */
    public function getEstructura()
    {
        return $this->estructura;
    }
}
