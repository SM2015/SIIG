<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\IndicadorAlertas
 *
 * @ORM\Table(name="Indicador_alertas")
 * @ORM\Entity
 */
class IndicadorAlertas
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
     * @var decimal $limiteInferior
     *
     * @ORM\Column(name="limite_inferior", type="float", nullable=false)
     */
    private $limiteInferior;

    /**
     * @var decimal $limiteSuperior
     *
     * @ORM\Column(name="limite_superior", type="float",  nullable=false)
     */
    private $limiteSuperior;

    /**
     * @var $color
     *
     * @ORM\ManyToOne(targetEntity="Alerta")
     * @ORM\JoinColumn(name="id_color_alerta", referencedColumnName="id", nullable=false)
     *
     */
    private $color;

    /**
     * @var $indicador
     *
     * @ORM\ManyToOne(targetEntity="FichaTecnica", inversedBy="alertas", cascade={"persist"})
     * @ORM\JoinColumn(name="id_indicador", referencedColumnName="id", nullable=false)
     *
     */
    private $indicador;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=true)
     */
    private $comentario;

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
     * Set limiteInferior
     *
     * @param  float            $limiteInferior
     * @return IndicadorAlertas
     */
    public function setLimiteInferior($limiteInferior)
    {
        $this->limiteInferior = $limiteInferior;

        return $this;
    }

    /**
     * Get limiteInferior
     *
     * @return float
     */
    public function getLimiteInferior()
    {
        return $this->limiteInferior;
    }

    /**
     * Set limiteSuperior
     *
     * @param  float            $limiteSuperior
     * @return IndicadorAlertas
     */
    public function setLimiteSuperior($limiteSuperior)
    {
        $this->limiteSuperior = $limiteSuperior;

        return $this;
    }

    /**
     * Get limiteSuperior
     *
     * @return float
     */
    public function getLimiteSuperior()
    {
        return $this->limiteSuperior;
    }

    /**
     * Set color
     *
     * @param  MINSAL\IndicadoresBundle\Entity\Alerta $color
     * @return IndicadorAlertas
     */
    public function setColor(\MINSAL\IndicadoresBundle\Entity\Alerta $color = null)
    {
        $this->color = $color;

        return $this;
    }

    /**
     * Get color
     *
     * @return MINSAL\IndicadoresBundle\Entity\Alerta
     */
    public function getColor()
    {
        return $this->color;
    }

    /**
     * Set indicador
     *
     * @param  MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador
     * @return IndicadorAlertas
     */
    public function setIndicador(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador = null)
    {
        $this->indicador = $indicador;

        return $this;
    }

    /**
     * Get indicador
     *
     * @return MINSAL\IndicadoresBundle\Entity\FichaTecnica
     */
    public function getIndicador()
    {
        return $this->indicador;
    }

    /**
     * Set comentario
     *
     * @param  string           $comentario
     * @return IndicadorAlertas
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;

        return $this;
    }

    /**
     * Get comentario
     *
     * @return string
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    public function __toString()
    {
        return $this->limiteInferior.' - '.$this->limiteSuperior.' '.$this->color.' '.$this->comentario;
    }
}