<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Estructura
 *
 * @ORM\Table(name="costos.centros_de_produccion")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class CentrosDeProduccion
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
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
     * @ORM\OneToMany(targetEntity="VariablesGastosAdministrativos", mappedBy="centroDeProduccion")
     **/
    private $variablesGastosAdministrativos;
    
    private $nombreCompleto;
    
    public function getNombreCompleto() {
        return $this->getEstablecimiento()->getNombre().' - '. $this->getNombre();
    }
        

    public function __toString()
    {
        return $this->nombre ? : '';
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
     * @return Dependencia
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

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Dependencia
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
     * @return Dependencia
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
     * Constructor
     */
    public function __construct()
    {
        $this->variablesGastosAdministrativos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add variablesGastosAdministrativos
     *
     * @param \MINSAL\CostosBundle\Entity\VariablesGastosAdministrativos $variablesGastosAdministrativos
     * @return CentrosDeProduccion
     */
    public function addVariablesGastosAdministrativo(\MINSAL\CostosBundle\Entity\VariablesGastosAdministrativos $variablesGastosAdministrativos)
    {
        $this->variablesGastosAdministrativos[] = $variablesGastosAdministrativos;

        return $this;
    }

    /**
     * Remove variablesGastosAdministrativos
     *
     * @param \MINSAL\CostosBundle\Entity\VariablesGastosAdministrativos $variablesGastosAdministrativos
     */
    public function removeVariablesGastosAdministrativo(\MINSAL\CostosBundle\Entity\VariablesGastosAdministrativos $variablesGastosAdministrativos)
    {
        $this->variablesGastosAdministrativos->removeElement($variablesGastosAdministrativos);
    }

    /**
     * Get variablesGastosAdministrativos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getVariablesGastosAdministrativos()
    {
        return $this->variablesGastosAdministrativos;
    }
}
