<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use MINSAL\IndicadoresBundle\Validator as CustomAssert;

/**
 * MINSAL\IndicadoresBundle\Entity\Diccionario
 *
 * @ORM\Table(name="diccionario")
 * @ORM\Entity
 */
class Diccionario
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
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $codigo;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=200, nullable=false)
     * @CustomAssert\AlphanumericPlus(message="AlphanumericPlus.Message")
     */
    private $descripcion;

    /**
    * @ORM\OneToMany(targetEntity="ReglaTransformacion", mappedBy="diccionario")
    */
    private $reglas;

    public function __toString()
    {
        return $this->descripcion ? :'';
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->reglas = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set descripcion
     *
     * @param  string      $descripcion
     * @return Diccionario
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
     * Add reglas
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\ReglaTransformacion $reglas
     * @return Diccionario
     */
    public function addRegla(\MINSAL\IndicadoresBundle\Entity\ReglaTransformacion $reglas)
    {
        $this->reglas[] = $reglas;

        return $this;
    }

    /**
     * Remove reglas
     *
     * @param \MINSAL\IndicadoresBundle\Entity\ReglaTransformacion $reglas
     */
    public function removeRegla(\MINSAL\IndicadoresBundle\Entity\ReglaTransformacion $reglas)
    {
        $this->reglas->removeElement($reglas);
    }

    /**
     * Get reglas
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getReglas()
    {
        return $this->reglas;
    }

    /**
     * Set codigo
     *
     * @param  string      $codigo
     * @return Diccionario
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
}