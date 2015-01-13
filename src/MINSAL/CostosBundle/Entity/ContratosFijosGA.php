<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\ContratosFijosGA
 *
 * @ORM\Table(name="costos.contratos_fijos_ga")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class ContratosFijosGA
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
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;
    
    /**
     * @var string $formula_consumo
     *
     * @ORM\Column(name="formula_consumo", type="text", nullable=true)
     */
    private $formulaConsumo;
    
    
    /**
     *
     * @ORM\ManyToMany(targetEntity="Estructura", mappedBy="contratosFijos")     
     */
    private $establecimientos;

    public function __toString()
    {
        return $this->descripcion ? : '';
    }
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\CostosBundle\Entity\CategoriasContratosFijosGA")
     * */
    private $categoria;
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\CostosBundle\Entity\CriteriosDistribucionGA")
     * */
    private $criterioDistribucion;

    

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
     * @return ContratosFijosGA
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
     * Set descripcion
     *
     * @param string $descripcion
     * @return ContratosFijosGA
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

    /**
     * Set categoria
     *
     * @param \MINSAL\CostosBundle\Entity\CategoriasContratosFijosGA $categoria
     * @return ContratosFijosGA
     */
    public function setCategoria(\MINSAL\CostosBundle\Entity\CategoriasContratosFijosGA $categoria = null)
    {
        $this->categoria = $categoria;

        return $this;
    }

    /**
     * Get categoria
     *
     * @return \MINSAL\CostosBundle\Entity\CategoriasContratosFijosGA 
     */
    public function getCategoria()
    {
        return $this->categoria;
    }

    /**
     * Set criterioDistribucion
     *
     * @param \MINSAL\CostosBundle\Entity\CriteriosDistribucionGA $criterioDistribucion
     * @return ContratosFijosGA
     */
    public function setCriterioDistribucion(\MINSAL\CostosBundle\Entity\CriteriosDistribucionGA $criterioDistribucion = null)
    {
        $this->criterioDistribucion = $criterioDistribucion;

        return $this;
    }

    /**
     * Get criterioDistribucion
     *
     * @return \MINSAL\CostosBundle\Entity\CriteriosDistribucionGA 
     */
    public function getCriterioDistribucion()
    {
        return $this->criterioDistribucion;
    }    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->establecimientos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add establecimientos
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $establecimientos
     * @return ContratosFijosGA
     */
    public function addEstablecimiento(\MINSAL\CostosBundle\Entity\Estructura $establecimientos)
    {
        $this->establecimientos[] = $establecimientos;

        return $this;
    }

    /**
     * Remove establecimientos
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $establecimientos
     */
    public function removeEstablecimiento(\MINSAL\CostosBundle\Entity\Estructura $establecimientos)
    {
        $this->establecimientos->removeElement($establecimientos);
    }

    /**
     * Get establecimientos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getEstablecimientos()
    {
        return $this->establecimientos;
    }

    /**
     * Set formulaConsumo
     *
     * @param string $formulaConsumo
     * @return ContratosFijosGA
     */
    public function setFormulaConsumo($formulaConsumo)
    {
        $this->formulaConsumo = $formulaConsumo;

        return $this;
    }

    /**
     * Get formulaConsumo
     *
     * @return string 
     */
    public function getFormulaConsumo()
    {
        return $this->formulaConsumo;
    }
}
