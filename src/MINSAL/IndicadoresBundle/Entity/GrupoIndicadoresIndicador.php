<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores
 *
 * @ORM\Table(name="grupo_indicadores_indicador")
 * @ORM\Entity
 */
class GrupoIndicadoresIndicador
{
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
     * @ORM\Column(name="filtro", type="string", length=500, nullable=false)
     */
    private $filtro;
    
    /**
     * @var string $posicion
     *
     * @ORM\Column(name="posicion", type="integer", nullable=false)
     */
    private $posicion;
    
    /**
     * @var string $tipoGrafico
     *
     * @ORM\Column(name="tipo_grafico", type="string", length=50, nullable=false)
     */
    private $tipoGrafico;

    /**
     * Set dimension
     *
     * @param string $dimension
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
     * @param string $filtro
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
     * @param integer $posicion
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
     * @param string $tipoGrafico
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
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador
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
     * @param \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores $grupo
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
}