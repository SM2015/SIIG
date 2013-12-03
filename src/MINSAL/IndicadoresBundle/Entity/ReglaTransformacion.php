<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use MINSAL\IndicadoresBundle\Validator as CustomAssert;

/**
 * MINSAL\IndicadoresBundle\Entity\ReglaTransformacion
 *
 * @ORM\Table(name="regla_transformacion")
 * @ORM\Entity
 */
class ReglaTransformacion
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
     * @var string $regla
     *
     * @ORM\Column(name="regla", type="string", length=15, nullable=false)
     */
    private $regla;

    /**
     * @var string $limiteInferior
     *
     * @ORM\Column(name="limite_inferior", type="string", length=100, nullable=false)
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $limiteInferior;

    /**
     * @var string $limiteSuperior
     *
     * @ORM\Column(name="limite_superior", type="string", length=100, nullable=true)
     */
    private $limiteSuperior;

    /**
     * @var string $transformacion
     *
     * @ORM\Column(name="transformacion", type="string", length=100, nullable=false)
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $transformacion;

    /**
     * @ORM\ManyToOne(targetEntity="Diccionario", inversedBy="reglas")
     * @ORM\JoinColumn(name="id_diccionario", referencedColumnName="id", onDelete="CASCADE")
     **/
    private $diccionario;

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
     * Set regla
     *
     * @param  string              $regla
     * @return ReglaTransformacion
     */
    public function setRegla($regla)
    {
        $this->regla = $regla;

        return $this;
    }

    /**
     * Get regla
     *
     * @return string
     */
    public function getRegla()
    {
        return $this->regla;
    }

    /**
     * Set limiteInferior
     *
     * @param  string              $limiteInferior
     * @return ReglaTransformacion
     */
    public function setLimiteInferior($limiteInferior)
    {
        $this->limiteInferior = $limiteInferior;

        return $this;
    }

    /**
     * Get limiteInferior
     *
     * @return string
     */
    public function getLimiteInferior()
    {
        return $this->limiteInferior;
    }

    /**
     * Set limiteSuperior
     *
     * @param  string              $limiteSuperior
     * @return ReglaTransformacion
     */
    public function setLimiteSuperior($limiteSuperior)
    {
        $this->limiteSuperior = $limiteSuperior;

        return $this;
    }

    /**
     * Get limiteSuperior
     *
     * @return string
     */
    public function getLimiteSuperior()
    {
        return $this->limiteSuperior;
    }

    /**
     * Set transformacion
     *
     * @param  string              $transformacion
     * @return ReglaTransformacion
     */
    public function setTransformacion($transformacion)
    {
        $this->transformacion = $transformacion;

        return $this;
    }

    /**
     * Get transformacion
     *
     * @return string
     */
    public function getTransformacion()
    {
        return $this->transformacion;
    }

    /**
     * Set diccionario
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\Diccionario $diccionario
     * @return ReglaTransformacion
     */
    public function setDiccionario(\MINSAL\IndicadoresBundle\Entity\Diccionario $diccionario = null)
    {
        $this->diccionario = $diccionario;

        return $this;
    }

    /**
     * Get diccionario
     *
     * @return \MINSAL\IndicadoresBundle\Entity\Diccionario
     */
    public function getDiccionario()
    {
        return $this->diccionario;
    }
}