<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\IndicadoresBundle\Entity\VariableCaptura
 *
 * @ORM\Table(name="variable_captura")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class VariableCaptura
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
     * @var string $texto_ayuda
     *
     * @ORM\Column(name="texto_ayuda", type="text", nullable=true)
     */
    private $textoAyuda;
    
    /**
     * @var string $esPoblacion
     *
     * @ORM\Column(name="es_poblacion", type="boolean", nullable=true)
     */
    private $esPoblacion;
    
    
    /**
     * @var string $nombre
     *
     * @ORM\Column(name="descripcion", type="string", length=200, nullable=false)
     */
    private $descripcion;
    
    /**
     * @ORM\ManyToOne(targetEntity="CategoriaVariableCaptura")
     * @ORM\JoinColumn(name="id_categoria_captura", referencedColumnName="id")
     * */
    private $categoria;
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\CostosBundle\Entity\Formulario")
     * */
    private $formulario;

   

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
     * @return VariableCaptura
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
     * @return VariableCaptura
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
     * @param \MINSAL\IndicadoresBundle\Entity\CategoriaVariableCaptura $categoria
     * @return VariableCaptura
     */
    public function setCategoria(\MINSAL\IndicadoresBundle\Entity\CategoriaVariableCaptura $categoria = null)
    {
        $this->categoria = $categoria;

        return $this;
    }

    /**
     * Get categoria
     *
     * @return \MINSAL\IndicadoresBundle\Entity\CategoriaVariableCaptura 
     */
    public function getCategoria()
    {
        return $this->categoria;
    }
    
    public function __toString() {
        return $this->descripcion;
    }

    /**
     * Set textoAyuda
     *
     * @param string $textoAyuda
     * @return VariableCaptura
     */
    public function setTextoAyuda($textoAyuda)
    {
        $this->textoAyuda = $textoAyuda;

        return $this;
    }

    /**
     * Get textoAyuda
     *
     * @return string 
     */
    public function getTextoAyuda()
    {
        return $this->textoAyuda;
    }

    /**
     * Set esPoblacion
     *
     * @param boolean $esPoblacion
     * @return VariableCaptura
     */
    public function setEsPoblacion($esPoblacion)
    {
        $this->esPoblacion = $esPoblacion;

        return $this;
    }

    /**
     * Get esPoblacion
     *
     * @return boolean 
     */
    public function getEsPoblacion()
    {
        return $this->esPoblacion;
    }

    

    /**
     * Set formulario
     *
     * @param \MINSAL\CostosBundle\Entity\Formulario $formulario
     * @return VariableCaptura
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
}
