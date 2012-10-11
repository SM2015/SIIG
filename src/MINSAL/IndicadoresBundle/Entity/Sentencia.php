<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Sentencia
 *
 * @ORM\Table(name="sentencia")
 * @ORM\Entity
 */
class Sentencia
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sentencia_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombreConsulta
     *
     * @ORM\Column(name="nombre_consulta", type="string", length=100, nullable=false)
     */
    private $nombreConsulta;

    /**
     * @var string $sentenciaSql
     *
     * @ORM\Column(name="sentencia_sql", type="text", nullable=false)
     */
    private $sentenciaSql;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=true)
     */
    private $comentario;

    /**
     * @var Conexion
     *
     * @ORM\ManyToOne(targetEntity="Conexion")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_conexion", referencedColumnName="id")
     * })
     */
    private $idConexion;



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
     * Set nombreConsulta
     *
     * @param string $nombreConsulta
     * @return Sentencia
     */
    public function setNombreConsulta($nombreConsulta)
    {
        $this->nombreConsulta = $nombreConsulta;
    
        return $this;
    }

    /**
     * Get nombreConsulta
     *
     * @return string 
     */
    public function getNombreConsulta()
    {
        return $this->nombreConsulta;
    }

    /**
     * Set sentenciaSql
     *
     * @param string $sentenciaSql
     * @return Sentencia
     */
    public function setSentenciaSql($sentenciaSql)
    {
        $this->sentenciaSql = $sentenciaSql;
    
        return $this;
    }

    /**
     * Get sentenciaSql
     *
     * @return string 
     */
    public function getSentenciaSql()
    {
        return $this->sentenciaSql;
    }

    /**
     * Set comentario
     *
     * @param string $comentario
     * @return Sentencia
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

    /**
     * Set idConexion
     *
     * @param MINSAL\IndicadoresBundle\Entity\Conexion $idConexion
     * @return Sentencia
     */
    public function setIdConexion(\MINSAL\IndicadoresBundle\Entity\Conexion $idConexion = null)
    {
        $this->idConexion = $idConexion;
    
        return $this;
    }

    /**
     * Get idConexion
     *
     * @return MINSAL\IndicadoresBundle\Entity\Conexion 
     */
    public function getIdConexion()
    {
        return $this->idConexion;
    }
}