<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\TipoGrafico
 *
 * @ORM\Table(name="tipo_grafico")
 * @ORM\Entity
 */
class TipoGrafico
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
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=true)
     */
    private $descripcion;

    /**
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=50, nullable=false)
     */
    private $codigo;

    /**
     * @ORM\ManyToMany(targetEntity="SignificadoCampo", mappedBy="tiposGraficos")
     **/
    private $significados;

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
     * @param  string    $descripcion
     * @return TipoCampo
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
     * Set codigo
     *
     * @param  string    $codigo
     * @return TipoCampo
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
     * @param  integer   $id
     * @return TipoCampo
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    public function __toString()
    {
        return $this->descripcion;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->significados = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add significados
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significados
     * @return TipoGrafico
     */
    public function addSignificado(\MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significados)
    {
        $this->significados[] = $significados;

        return $this;
    }

    /**
     * Remove significados
     *
     * @param \MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significados
     */
    public function removeSignificado(\MINSAL\IndicadoresBundle\Entity\SignificadoCampo $significados)
    {
        $this->significados->removeElement($significados);
    }

    /**
     * Get significados
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getSignificados()
    {
        return $this->significados;
    }
}