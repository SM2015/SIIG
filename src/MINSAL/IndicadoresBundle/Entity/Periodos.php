<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Periodos
 *
 * @ORM\Table(name="periodos")
 * @ORM\Entity
 */
class Periodos
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
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=25, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=7, nullable=false)
     */
    private $codigo;

    /**
     * @var string $sentencia
     *
     * @ORM\Column(name="sentencia", type="text", nullable=true)
     */
    private $sentencia;

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
     * @param  string   $descripcion
     * @return Periodos
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
     * Set sentencia
     *
     * @param  string   $sentencia
     * @return Periodos
     */
    public function setSentencia($sentencia)
    {
        $this->sentencia = $sentencia;

        return $this;
    }

    /**
     * Get sentencia
     *
     * @return string
     */
    public function getSentencia()
    {
        return $this->sentencia;
    }

    public function __toString()
    {
        return $this->descripcion ? :'';
    }

    /**
     * Set codigo
     *
     * @param  string   $codigo
     * @return Periodos
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
     * Set id
     *
     * @param  integer  $id
     * @return Periodos
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
}