<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores
 *
 * @ORM\Table(name="usuario_indicador")
 * @ORM\Entity
 */
class UsuarioIndicador
{
    /**
     *
     * @ORM\ManyToOne(targetEntity="FichaTecnica", inversedBy="usuarios")
     * @ORM\JoinColumn(name="indicador_id", referencedColumnName="id")
     * @ORM\Id
     */
    private $indicador;
    
    /**
     *
     * @ORM\ManyToOne(targetEntity="User", inversedBy="indicadores")
     * @ORM\JoinColumn(name="usuario_id", referencedColumnName="id")
     * @ORM\Id
     */
    private $usuario;
    
    /**
     * @var string $esFavorito
     *
     * @ORM\Column(name="es_favorito", type="boolean", nullable=true)
     */
    private $esFavorito;

    /**
     * Set esFavorito
     *
     * @param boolean $esFavorito
     * @return UsuarioIndicador
     */
    public function setEsFavorito($esFavorito)
    {
        $this->esFavorito = $esFavorito;
    
        return $this;
    }

    /**
     * Get esFavorito
     *
     * @return boolean 
     */
    public function getEsFavorito()
    {
        return $this->esFavorito;
    }

    /**
     * Set indicador
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicador
     * @return UsuarioIndicador
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
     * Set usuario
     *
     * @param \MINSAL\IndicadoresBundle\Entity\User $usuario
     * @return UsuarioIndicador
     */
    public function setUsuario(\MINSAL\IndicadoresBundle\Entity\User $usuario)
    {
        $this->usuario = $usuario;
    
        return $this;
    }

    /**
     * Get usuario
     *
     * @return \MINSAL\IndicadoresBundle\Entity\User 
     */
    public function getUsuario()
    {
        return $this->usuario;
    }
}