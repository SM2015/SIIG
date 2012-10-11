<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\ClasificacionUso
 *
 * @ORM\Table(name="clasificacion_uso")
 * @ORM\Entity
 */
class ClasificacionUso
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="clasificacion_uso_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=false)
     */
    private $descripcion;

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
     * Set descripcion
     *
     * @param string $descripcion
     * @return ClasificacionUso
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
     * Set comentario
     *
     * @param string $comentario
     * @return ClasificacionUso
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
    
    public function __toString() {
        return $this->descripcion;
    }
}