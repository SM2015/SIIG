<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\RolesOpciones
 *
 * @ORM\Table(name="roles_opciones")
 * @ORM\Entity
 */
class RolesOpciones
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="roles_opciones_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer $idOpcion
     *
     * @ORM\Column(name="id_opcion", type="integer", nullable=true)
     */
    private $idOpcion;

    /**
     * @var Roles
     *
     * @ORM\ManyToOne(targetEntity="Roles")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_rol", referencedColumnName="id_rol")
     * })
     */
    private $idRol;



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
     * Set idOpcion
     *
     * @param integer $idOpcion
     * @return RolesOpciones
     */
    public function setIdOpcion($idOpcion)
    {
        $this->idOpcion = $idOpcion;
    
        return $this;
    }

    /**
     * Get idOpcion
     *
     * @return integer 
     */
    public function getIdOpcion()
    {
        return $this->idOpcion;
    }

    /**
     * Set idRol
     *
     * @param MINSAL\IndicadoresBundle\Entity\Roles $idRol
     * @return RolesOpciones
     */
    public function setIdRol(\MINSAL\IndicadoresBundle\Entity\Roles $idRol = null)
    {
        $this->idRol = $idRol;
    
        return $this;
    }

    /**
     * Get idRol
     *
     * @return MINSAL\IndicadoresBundle\Entity\Roles 
     */
    public function getIdRol()
    {
        return $this->idRol;
    }
}