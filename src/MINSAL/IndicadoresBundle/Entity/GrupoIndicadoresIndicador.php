<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador
 *
 * @ORM\Table(name="grupo_indicadores_indicador")
 * @ORM\Entity
 */
class GrupoIndicadoresIndicador
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
     *
     * @ORM\ManyToOne(targetEntity="FichaTecnica", inversedBy="grupos")
     * @ORM\JoinColumn(name="indicador_id", referencedColumnName="id")
     */
    private $indicador;

    /**
     *
     * @ORM\ManyToOne(targetEntity="GrupoIndicadores", inversedBy="indicadores")
     * @ORM\JoinColumn(name="grupo_indicadores_id", referencedColumnName="id")
     */
    private $grupo;

    /**
     * @var string $dimension
     *
     * @ORM\Column(name="dimension", type="string", length=50, nullable=false)
     */
    private $dimension;

    /**
     * @var string $filtro
     *
     * @ORM\Column(name="filtro", type="string", length=500, nullable=true)
     */
    private $filtro;

    /**
     * @var string $posicionDesde
     *
     * @ORM\Column(name="filtro_posicion_desde", type="string", length=10, nullable=true)
     */
    private $filtroPosicionDesde;

    /**
     * @var string $posicionHasta
     *
     * @ORM\Column(name="filtro_posicion_hasta", type="string", length=10, nullable=true)
     */
    private $filtroPosicionHasta;

    /**
     * @var string $filtroElementos
     *
     * @ORM\Column(name="filtro_elementos", type="text", nullable=true)
     */
    private $filtroElementos;

    /**
     * @var string $posicion
     *
     * @ORM\Column(name="posicion", type="integer", nullable=true)
     */
    private $posicion;

    /**
     * @var string $tipoGrafico
     *
     * @ORM\Column(name="tipo_grafico", type="string", length=50, nullable=false)
     */
    private $tipoGrafico;

    /**
     * @var string $orden
     *
     * @ORM\Column(name="orden", type="string", length=100, nullable=true)
     */
    private $orden;

    /**
     * Set dimension
     *
     * @param  string                    $dimension
     * @return GrupoIndicadoresIndicador
     */
    public function setDimension($dimension)
    {
        $this->dimension = $dimension;

        return $this;
    }

    /**
     * Get dimension
     *
     * @return string
     */
    public function getDimension()
    {
        return $this->dimension;
    }

    /**
     * Set filtro
     *
     * @param  string                    $filtro
     * @return GrupoIndicadoresIndicador
     */
    public function setFiltro($filtro)
    {
        $this->filtro = $filtro;

        return $this;
    }

    /**
     * Get filtro
     *
     * @return string
     */
    public function getFiltro()
    {
        return $this->filtro;
    }

    /**
     * Set posicion
     *
     * @param  integer                   $posicion
     * @return GrupoIndicadoresIndicador
     */
    public function setPosicion($posicion)
    {
        $this->posicion = $posicion;

        return $this;
    }

    /**
     * Get posicion
     *
     * @return integer
     */
    public function getPosicion()
    {
        return $this->posicion;
    }

    /**
     * Set tipoGrafico
     *
     * @param  string                    $tipoGrafico
     * @return GrupoIndicadoresIndicador
     */
    public function setTipoGrafico($tipoGrafico)
    {
        $this->tipoGrafico = $tipoGrafico;

        return $this;
    }

    /**
     * Get tipoGrafico
     *
     * @return string
     */
    public function getTipoGrafico()
    {
        return $this->tipoGrafico;
    }

    /**
     * Set indicador
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador
     * @return GrupoIndicadoresIndicador
     */
    public function setIndicador(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador)
    {
        $this->indicador = $indicador;

        return $this;
    }

    /**
     * Get indicador
     *
     * @return \MINSAL\IndicadoresBundle\Entity\FichaTecnica
     */
    public function getIndicador()
    {
        return $this->indicador;
    }

    /**
     * Set grupo
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores $grupo
     * @return GrupoIndicadoresIndicador
     */
    public function setGrupo(\MINSAL\IndicadoresBundle\Entity\GrupoIndicadores $grupo)
    {
        $this->grupo = $grupo;

        return $this;
    }

    /**
     * Get grupo
     *
     * @return \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores
     */
    public function getGrupo()
    {
        return $this->grupo;
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
     * Set orden
     *
     * @param  string                    $orden
     * @return GrupoIndicadoresIndicador
     */
    public function setOrden($orden)
    {
        $this->orden = $orden;

        return $this;
    }

    /**
     * Get orden
     *
     * @return string
     */
    public function getOrden()
    {
        return $this->orden;
    }

    /**
     * Set filtroPosicionDesde
     *
     * @param  string                    $filtroPosicionDesde
     * @return GrupoIndicadoresIndicador
     */
    public function setFiltroPosicionDesde($filtroPosicionDesde)
    {
        $this->filtroPosicionDesde = $filtroPosicionDesde;

        return $this;
    }

    /**
     * Get filtroPosicionDesde
     *
     * @return string
     */
    public function getFiltroPosicionDesde()
    {
        return $this->filtroPosicionDesde;
    }

    /**
     * Set filtroPosicionHasta
     *
     * @param  string                    $filtroPosicionHasta
     * @return GrupoIndicadoresIndicador
     */
    public function setFiltroPosicionHasta($filtroPosicionHasta)
    {
        $this->filtroPosicionHasta = $filtroPosicionHasta;

        return $this;
    }

    /**
     * Get filtroPosicionHasta
     *
     * @return string
     */
    public function getFiltroPosicionHasta()
    {
        return $this->filtroPosicionHasta;
    }

    /**
     * Set filtroElementos
     *
     * @param  string                    $filtroElementos
     * @return GrupoIndicadoresIndicador
     */
    public function setFiltroElementos($filtroElementos)
    {
        $this->filtroElementos = $filtroElementos;

        return $this;
    }

    /**
     * Get filtroElementos
     *
     * @return string
     */
    public function getFiltroElementos()
    {
        return $this->filtroElementos;
    }
}