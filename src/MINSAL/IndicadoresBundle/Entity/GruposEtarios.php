<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\GruposEtarios
 *
 * @ORM\Table(name="grupos_etarios")
 * @ORM\Entity
 */
class GruposEtarios
{
    /**
     * @var integer $idGrupo
     *
     * @ORM\Column(name="id_grupo", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="grupos_etarios_id_grupo_seq", allocationSize=1, initialValue=1)
     */
    private $idGrupo;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=25, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $sentencia
     *
     * @ORM\Column(name="sentencia", type="text", nullable=true)
     */
    private $sentencia;



    /**
     * Get idGrupo
     *
     * @return integer 
     */
    public function getIdGrupo()
    {
        return $this->idGrupo;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return GruposEtarios
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
     * @param string $sentencia
     * @return GruposEtarios
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
}