<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\OpcionesMenu
 *
 * @ORM\Table(name="opciones_menu")
 * @ORM\Entity
 */
class OpcionesMenu
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="opciones_menu_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=50, nullable=false)
     */
    private $nombre;

    /**
     * @var integer $idPadre
     *
     * @ORM\Column(name="id_padre", type="integer", nullable=true)
     */
    private $idPadre;

    /**
     * @var string $ruta
     *
     * @ORM\Column(name="ruta", type="string", length=100, nullable=false)
     */
    private $ruta;

    /**
     * @var integer $publicado
     *
     * @ORM\Column(name="publicado", type="integer", nullable=false)
     */
    private $publicado;



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
     * @return OpcionesMenu
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
     * Set idPadre
     *
     * @param integer $idPadre
     * @return OpcionesMenu
     */
    public function setIdPadre($idPadre)
    {
        $this->idPadre = $idPadre;
    
        return $this;
    }

    /**
     * Get idPadre
     *
     * @return integer 
     */
    public function getIdPadre()
    {
        return $this->idPadre;
    }

    /**
     * Set ruta
     *
     * @param string $ruta
     * @return OpcionesMenu
     */
    public function setRuta($ruta)
    {
        $this->ruta = $ruta;
    
        return $this;
    }

    /**
     * Get ruta
     *
     * @return string 
     */
    public function getRuta()
    {
        return $this->ruta;
    }

    /**
     * Set publicado
     *
     * @param integer $publicado
     * @return OpcionesMenu
     */
    public function setPublicado($publicado)
    {
        $this->publicado = $publicado;
    
        return $this;
    }

    /**
     * Get publicado
     *
     * @return integer 
     */
    public function getPublicado()
    {
        return $this->publicado;
    }
}