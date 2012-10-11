<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Roles
 *
 * @ORM\Table(name="roles")
 * @ORM\Entity
 */
class Roles
{
    /**
     * @var integer $idRol
     *
     * @ORM\Column(name="id_rol", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="roles_id_rol_seq", allocationSize=1, initialValue=1)
     */
    private $idRol;

    /**
     * @var string $rol
     *
     * @ORM\Column(name="rol", type="string", length=30, nullable=true)
     */
    private $rol;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;



    /**
     * Get idRol
     *
     * @return integer 
     */
    public function getIdRol()
    {
        return $this->idRol;
    }

    /**
     * Set rol
     *
     * @param string $rol
     * @return Roles
     */
    public function setRol($rol)
    {
        $this->rol = $rol;
    
        return $this;
    }

    /**
     * Get rol
     *
     * @return string 
     */
    public function getRol()
    {
        return $this->rol;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return Roles
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
}