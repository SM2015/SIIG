<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\GrupoIndicadores
 *
 * @ORM\Table(name="grupo_indicadores")
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresRepository")
 */
class GrupoIndicadores
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
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="string", length=50, nullable=false)
     */
    private $nombre;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="UsuarioGrupoIndicadores", mappedBy="grupoIndicadores" , cascade={"all"}, orphanRemoval=true)
     **/
    private $usuarios;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="GrupoIndicadoresIndicador", mappedBy="grupo" , cascade={"all"}, orphanRemoval=true)
     **/
    private $indicadores;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->usuarios = new \Doctrine\Common\Collections\ArrayCollection();
        $this->indicadores = new \Doctrine\Common\Collections\ArrayCollection();
    }

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
     * @param  string           $nombre
     * @return GrupoIndicadores
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
     * Add usuarios
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios
     * @return GrupoIndicadores
     */
    public function addUsuario(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios)
    {
        $this->usuarios[] = $usuarios;

        return $this;
    }

    /**
     * Remove usuarios
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios
     */
    public function removeUsuario(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios)
    {
        $this->usuarios->removeElement($usuarios);
    }

    /**
     * Get usuarios
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsuarios()
    {
        return $this->usuarios;
    }

    /**
     * Add indicadores
     *
     * @param  \MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador $indicadores
     * @return GrupoIndicadores
     */
    public function addIndicadore(\MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador $indicadores)
    {
        $this->indicadores[] = $indicadores;

        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador $indicadores
     */
    public function removeIndicadore(\MINSAL\IndicadoresBundle\Entity\GrupoIndicadoresIndicador $indicadores)
    {
        $this->indicadores->removeElement($indicadores);
    }

    /**
     * Get indicadores
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIndicadores()
    {
        return $this->indicadores;
    }
}
