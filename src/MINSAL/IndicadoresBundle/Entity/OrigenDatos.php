<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\TablaDatos
 *
 * @ORM\Table(name="origen_datos")
 * @ORM\Entity
 */
class OrigenDatos
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="tabla_datos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;
    
    /**
     * @ORM\OneToOne(targetEntity="Sentencia")
     * @ORM\JoinColumn(name="id_sentencia_sql", referencedColumnName="id")
     **/
    private $sentenciaSql;
    
    /**
     * @var string $archivo
     *
     * @ORM\Column(name="archivo", type="text", nullable=true)
     */
    private $archivo;
    

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
     * Set nombre
     *
     * @param string $nombre
     * @return TablaDatos
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    
        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return TablaDatos
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
     * Set archivo
     *
     * @param string $archivo
     * @return OrigenDatos
     */
    public function setArchivo($archivo)
    {
        $this->archivo = $archivo;
    
        return $this;
    }

    /**
     * Get archivo
     *
     * @return string 
     */
    public function getArchivo()
    {
        return $this->archivo;
    }

    /**
     * Set sentenciaSql
     *
     * @param MINSAL\IndicadoresBundle\Entity\Sentencia $sentenciaSql
     * @return OrigenDatos
     */
    public function setSentenciaSql(\MINSAL\IndicadoresBundle\Entity\Sentencia $sentenciaSql = null)
    {
        $this->sentenciaSql = $sentenciaSql;
    
        return $this;
    }

    /**
     * Get sentenciaSql
     *
     * @return MINSAL\IndicadoresBundle\Entity\Sentencia 
     */
    public function getSentenciaSql()
    {
        return $this->sentenciaSql;
    }
}