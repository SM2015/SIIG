<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Form
 *
 * @ORM\Table(name="form")
 * @ORM\Entity
 */
class Form
{
    /**
     * @var integer $idForm
     *
     * @ORM\Column(name="id_form", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="form_id_form_seq", allocationSize=1, initialValue=1)
     */
    private $idForm;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=true)
     */
    private $nombre;

    /**
     * @var integer $menuPublicacion
     *
     * @ORM\Column(name="menu_publicacion", type="integer", nullable=false)
     */
    private $menuPublicacion;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=false)
     */
    private $comentario;

    /**
     * @var string $nombreTabla
     *
     * @ORM\Column(name="nombre_tabla", type="string", length=50, nullable=true)
     */
    private $nombreTabla;



    /**
     * Get idForm
     *
     * @return integer 
     */
    public function getIdForm()
    {
        return $this->idForm;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Form
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
     * Set menuPublicacion
     *
     * @param integer $menuPublicacion
     * @return Form
     */
    public function setMenuPublicacion($menuPublicacion)
    {
        $this->menuPublicacion = $menuPublicacion;
    
        return $this;
    }

    /**
     * Get menuPublicacion
     *
     * @return integer 
     */
    public function getMenuPublicacion()
    {
        return $this->menuPublicacion;
    }

    /**
     * Set comentario
     *
     * @param string $comentario
     * @return Form
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
     * Set nombreTabla
     *
     * @param string $nombreTabla
     * @return Form
     */
    public function setNombreTabla($nombreTabla)
    {
        $this->nombreTabla = $nombreTabla;
    
        return $this;
    }

    /**
     * Get nombreTabla
     *
     * @return string 
     */
    public function getNombreTabla()
    {
        return $this->nombreTabla;
    }
}