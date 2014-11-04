<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Formato
 *
 * @ORM\Table(name="costos.formato")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class Formato
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
     * @ORM\Column(name="descripcion", type="text", nullable=false)
     */
    private $descripcion;
    
    /**
     * @var string $formato
     *
     * @ORM\Column(name="cadena_formato", type="text", nullable=false)
     */
    private $formato;
        
    /**
     * @ORM\ManyToOne(targetEntity="TipoDato")
     * @ORM\JoinColumn(name="id_tipo_dato", referencedColumnName="id")
     * */
    private $tipoDato;

    public function __toString()
    {
        return $this->descripcion ? : '';
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
     * @return Formato
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
     * @return Formato
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
     * Set tipoDato
     *
     * @param \MINSAL\CostosBundle\Entity\TipoDato $tipoDato
     * @return Formato
     */
    public function setTipoDato(\MINSAL\CostosBundle\Entity\TipoDato $tipoDato = null)
    {
        $this->tipoDato = $tipoDato;

        return $this;
    }

    /**
     * Get tipoDato
     *
     * @return \MINSAL\CostosBundle\Entity\TipoDato 
     */
    public function getTipoDato()
    {
        return $this->tipoDato;
    }

    /**
     * Set formato
     *
     * @param string $formato
     * @return Formato
     */
    public function setFormato($formato)
    {
        $this->formato = $formato;

        return $this;
    }

    /**
     * Get formato
     *
     * @return string 
     */
    public function getFormato()
    {
        return $this->formato;
    }
}
