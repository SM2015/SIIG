<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use MINSAL\IndicadoresBundle\Validator as CustomAssert;

/**
 * MINSAL\IndicadoresBundle\Entity\Conexion
 *
 * @ORM\Table(name="conexion")
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\ConexionRepository")
 */
class Conexion
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
     * @var string $nombreConexion
     *
     * @ORM\Column(name="nombre_conexion", type="string", length=100, nullable=false)
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $nombreConexion;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=true)
     */
    private $comentario;

    /**
     * @var string $ip
     *
     * @ORM\Column(name="ip", type="string", length=40, nullable=false)
     * @CustomAssert\CustomIp(message="CustomIp.Message")
     */
    private $ip;

    /**
     * @var string $usuario
     *
     * @ORM\Column(name="usuario", type="string", length=25, nullable=false)
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $usuario;

    /**
     * @var string $clave
     *
     * @ORM\Column(name="clave", type="string", length=150, nullable=false)
     */
    private $clave;

    /**
     * @var string $nombreBaseDatos
     *
     * @ORM\Column(name="nombre_base_datos", type="string", length=50, nullable=false)
     * @CustomAssert\OnlyAlphanumeric(message="OnlyAlphanumeric.Message")
     */
    private $nombreBaseDatos;

    /**
     * @var string $puerto
     *
     * @ORM\Column(name="puerto", type="string", length=5, nullable=true)
     * @Assert\Type(type="integer")
     */
    private $puerto;

    /**
     * @var string $instancia
     *
     * @ORM\Column(name="instancia", type="string", length=50, nullable=true)
     */
    private $instancia;

    /**
     * @ORM\ManyToMany(targetEntity="OrigenDatos", mappedBy="conexiones")
     */
    private $origenes;

    /**
     * @var MotorBd
     *
     * @ORM\ManyToOne(targetEntity="MotorBd")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_motor", referencedColumnName="id")
     * })
     */
    private $idMotor;

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
     * Set nombreConexion
     *
     * @param  string   $nombreConexion
     * @return Conexion
     */
    public function setNombreConexion($nombreConexion)
    {
        $this->nombreConexion = $nombreConexion;

        return $this;
    }

    /**
     * Get nombreConexion
     *
     * @return string
     */
    public function getNombreConexion()
    {
        return $this->nombreConexion;
    }

    /**
     * Set comentario
     *
     * @param  string   $comentario
     * @return Conexion
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
     * Set ip
     *
     * @param  string   $ip
     * @return Conexion
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set usuario
     *
     * @param  string   $usuario
     * @return Conexion
     */
    public function setUsuario($usuario)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario
     *
     * @return string
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set clave
     *
     * @param  string   $clave
     * @return Conexion
     */
    public function setClave($clave)
    {
        $Util = new \MINSAL\IndicadoresBundle\Util\Util();
        $this->clave = $Util->encriptar_clave($clave);

        return $this;
    }

    /**
     * Get clave
     *
     * @return string
     */
    public function getClave()
    {
        $Util = new \MINSAL\IndicadoresBundle\Util\Util();

        return $Util->desencriptar_clave($this->clave);
    }

    /**
     * Set nombreBaseDatos
     *
     * @param  string   $nombreBaseDatos
     * @return Conexion
     */
    public function setNombreBaseDatos($nombreBaseDatos)
    {
        $this->nombreBaseDatos = $nombreBaseDatos;

        return $this;
    }

    /**
     * Get nombreBaseDatos
     *
     * @return string
     */
    public function getNombreBaseDatos()
    {
        return $this->nombreBaseDatos;
    }

    /**
     * Set puerto
     *
     * @param  string   $puerto
     * @return Conexion
     */
    public function setPuerto($puerto)
    {
        $this->puerto = $puerto;

        return $this;
    }

    /**
     * Get puerto
     *
     * @return string
     */
    public function getPuerto()
    {
        return $this->puerto;
    }

    /**
     * Set instancia
     *
     * @param  string   $instancia
     * @return Conexion
     */
    public function setInstancia($instancia)
    {
        $this->instancia = $instancia;

        return $this;
    }

    /**
     * Get instancia
     *
     * @return string
     */
    public function getInstancia()
    {
        return $this->instancia;
    }

    /**
     * Set idMotor
     *
     * @param  MINSAL\IndicadoresBundle\Entity\MotorBd $idMotor
     * @return Conexion
     */
    public function setIdMotor(\MINSAL\IndicadoresBundle\Entity\MotorBd $idMotor = null)
    {
        $this->idMotor = $idMotor;

        return $this;
    }

    /**
     * Get idMotor
     *
     * @return MINSAL\IndicadoresBundle\Entity\MotorBd
     */
    public function getIdMotor()
    {
        return $this->idMotor;
    }

    public function __toString()
    {
        return $this->nombreConexion.' - '.$this->ip .' - ' . $this->nombreBaseDatos;
    }

    /**
     * Set id
     *
     * @param  integer  $id
     * @return Conexion
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->origenes = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add origenes
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenes
     * @return Conexion
     */
    public function addOrigene(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenes)
    {
        $this->origenes[] = $origenes;

        return $this;
    }

    /**
     * Remove origenes
     *
     * @param \MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenes
     */
    public function removeOrigene(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenes)
    {
        $this->origenes->removeElement($origenes);
    }

    /**
     * Get origenes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOrigenes()
    {
        return $this->origenes;
    }
}