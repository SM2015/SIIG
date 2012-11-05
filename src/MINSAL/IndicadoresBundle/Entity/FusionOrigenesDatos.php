<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\IndicadoresBundle\Entity\TablaDatos
 *
 * @ORM\Table(name="fusion_origenes_datos")
 * @ORM\Entity
 */
class FusionOrigenesDatos {

    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fusion_origenes_datos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="OrigenDatos", inversedBy="fusiones")
     * @ORM\JoinColumn(name="id_origen_datos", referencedColumnName="id")
     **/
    private $origenDatos;
    
    /**
     * @ORM\ManyToOne(targetEntity="OrigenDatos")
     * @ORM\JoinColumn(name="id_origen_datos_fusionado", referencedColumnName="id")
     **/
    private $origenDatosFusionado;
    
    /**
     * @var string $campos
     *
     * @ORM\Column(name="campos", type="text", nullable=true)
     */
    private $campos;

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
     * Set origenDatos
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos
     * @return FusionOrigenesDatos
     */
    public function setOrigenDatos(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos = null)
    {
        $this->origenDatos = $origenDatos;
    
        return $this;
    }

    /**
     * Get origenDatos
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos 
     */
    public function getOrigenDatos()
    {
        return $this->origenDatos;
    }

    /**
     * Set origenDatosFusionado
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatosFusionado
     * @return FusionOrigenesDatos
     */
    public function setOrigenDatosFusionado(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatosFusionado = null)
    {
        $this->origenDatosFusionado = $origenDatosFusionado;
    
        return $this;
    }

    /**
     * Get origenDatosFusionado
     *
     * @return MINSAL\IndicadoresBundle\Entity\OrigenDatos 
     */
    public function getOrigenDatosFusionado()
    {
        return $this->origenDatosFusionado;
    }

    /**
     * Set campos
     *
     * @param string $campos
     * @return FusionOrigenesDatos
     */
    public function setCampos($campos)
    {
        $this->campos = $campos;
    
        return $this;
    }

    /**
     * Get campos
     *
     * @return string 
     */
    public function getCampos()
    {
        return $this->campos;
    }
}