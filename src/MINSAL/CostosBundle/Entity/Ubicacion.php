<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Ubicacion
 *
 * @ORM\Table(name="costos.ubicacion")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class Ubicacion
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="costos.ubicacion_id_seq")
     */
    private $id;

    /**
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=20, nullable=false)
     */
    private $codigo;
    
    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=250, nullable=false)
     */
    private $nombre;
    
    /**
     * @ORM\ManyToOne(targetEntity="Estructura")
     * */
    private $establecimiento;
    
    /**
     * @ORM\OneToMany(targetEntity="Estructura", mappedBy="ubicacionDependencia")
     **/
    private $dependencias;
        

    public function __toString()
    {
        return $this->nombre ? : '';
    }


    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->dependencias = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set codigo
     *
     * @param string $codigo
     * @return Ubicacion
     */
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get codigo
     *
     * @return string 
     */
    public function getCodigo()
    {
        return $this->codigo;
    }
    
    public function getCodigoEstablecimientoNombreUbicacion() {
        return '(Establecimiento: '.$this->getEstablecimiento()->getCodigo() . ') ' . $this->getNombre();
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Ubicacion
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set establecimiento
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $establecimiento
     * @return Ubicacion
     */
    public function setEstablecimiento(\MINSAL\CostosBundle\Entity\Estructura $establecimiento = null)
    {
        $this->establecimiento = $establecimiento;

        return $this;
    }

    /**
     * Get establecimiento
     *
     * @return \MINSAL\CostosBundle\Entity\Estructura 
     */
    public function getEstablecimiento()
    {
        return $this->establecimiento;
    }

    /**
     * Add dependencias
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $dependencias
     * @return Ubicacion
     */
    public function addDependencia(\MINSAL\CostosBundle\Entity\Estructura $dependencias)
    {
        $this->dependencias[] = $dependencias;

        return $this;
    }

    /**
     * Remove dependencias
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $dependencias
     */
    public function removeDependencia(\MINSAL\CostosBundle\Entity\Estructura $dependencias)
    {
        $this->dependencias->removeElement($dependencias);
    }

    /**
     * Get dependencias
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getDependencias()
    {
        return $this->dependencias;
    }
}
