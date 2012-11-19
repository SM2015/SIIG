<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CategoriaIndicador
 *
 * @ORM\Table(name="categoria_indicador")
 * @ORM\Entity
 */
class CategoriaIndicador
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
     * @ORM\Column(name="codigo", type="string", length=50, nullable=false)
     */
    private $codigo;
        
    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=200, nullable=false)
     */
    private $descripcion;
    
    /**
     * @ORM\OneToMany(targetEntity="FichaTecnica", mappedBy="categoriaIndicador")
     **/
    private $indicadores;

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
     * @return CategoriaIndicador
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
     * @return CategoriaIndicador
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
    
    public function __toString() {
        return $this->descripcion;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->indicadores = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add indicadores
     *
     * @param MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     * @return CategoriaIndicador
     */
    public function addIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores[] = $indicadores;
    
        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     */
    public function removeIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores->removeElement($indicadores);
    }

    /**
     * Get indicadores
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getIndicadores()
    {
        return $this->indicadores;
    }
}