<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Formulario
 *
 * @ORM\Table(name="costos.formulario")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity(repositoryClass="MINSAL\CostosBundle\Entity\FormularioRepository")

 */
class Formulario
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
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=20, nullable=false)
     */
    private $codigo;
    
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
     * @var string $areaCosteo
     *
     * @ORM\Column(name="area_costeo", type="string", length=50, nullable=true)
     */
    protected $areaCosteo;
    
    /**
     * @var string $columnas_fijas
     *
     * @ORM\Column(name="columnas_fijas", type="integer", nullable=true)
     */
    protected $columnasFijas;
        
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * 
     * @ORM\ManyToMany(targetEntity="Campo", inversedBy="formularios")
     * @ORM\JoinTable(name="costos.formulario_campo")
     * @ORM\OrderBy({"posicion" = "ASC"})
     **/
    private $campos;
    
    /**
    * @var \Doctrine\Common\Collections\ArrayCollection
    * @ORM\OneToMany(targetEntity="GrupoColumnas", mappedBy="formulario", cascade={"all"}, orphanRemoval=true)
    * @ORM\OrderBy({"descripcion" = "ASC"})
    */
    private $gruposColumnas;
   
    
    /**
     * @ORM\ManyToOne(targetEntity="MINSAL\IndicadoresBundle\Entity\OrigenDatos")
     * */
    private $origenDatos;
    
    public function __toString()
    {
        return $this->nombre ? : '';
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
    
    public function setIdentificador($id)
    {
        return $this->id = $id;
    }

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return Formulario
     */
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get codigo
     *
     * @return string 
     */
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Formulario
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
     * @return Formulario
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
     * Add gruposColumnas
     *
     * @param \MINSAL\CostosBundle\Entity\GrupoColumnas $gruposColumnas
     * @return Formulario
     */
    public function addGruposColumna(\MINSAL\CostosBundle\Entity\GrupoColumnas $gruposColumnas)
    {
        $this->gruposColumnas[] = $gruposColumnas;

        return $this;
    }

    /**
     * Remove gruposColumnas
     *
     * @param \MINSAL\CostosBundle\Entity\GrupoColumnas $gruposColumnas
     */
    public function removeGruposColumna(\MINSAL\CostosBundle\Entity\GrupoColumnas $gruposColumnas)
    {
        $this->gruposColumnas->removeElement($gruposColumnas);
    }

    /**
     * Get gruposColumnas
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getGruposColumnas()
    {
        return $this->gruposColumnas;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->campos = new \Doctrine\Common\Collections\ArrayCollection();
        $this->gruposColumnas = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add campos
     *
     * @param \MINSAL\CostosBundle\Entity\Campo $campos
     * @return Formulario
     */
    public function addCampo(\MINSAL\CostosBundle\Entity\Campo $campos)
    {
        $this->campos[] = $campos;

        return $this;
    }

    /**
     * Remove campos
     *
     * @param \MINSAL\CostosBundle\Entity\Campo $campos
     */
    public function removeCampo(\MINSAL\CostosBundle\Entity\Campo $campos)
    {
        $this->campos->removeElement($campos);
    }

    /**
     * Get campos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCampos()
    {
        return $this->campos;
    }

    /**
     * Set origenDatos
     *
     * @param \MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos
     * @return Formulario
     */
    public function setOrigenDatos(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $origenDatos = null)
    {
        $this->origenDatos = $origenDatos;

        return $this;
    }

    /**
     * Get origenDatos
     *
     * @return \MINSAL\IndicadoresBundle\Entity\OrigenDatos 
     */
    public function getOrigenDatos()
    {
        return $this->origenDatos;
    }

    /**
     * Set areaCosteo
     *
     * @param string $areaCosteo
     * @return Formulario
     */
    public function setAreaCosteo($areaCosteo)
    {
        $this->areaCosteo = $areaCosteo;

        return $this;
    }

    /**
     * Get areaCosteo
     *
     * @return string 
     */
    public function getAreaCosteo()
    {
        return $this->areaCosteo;
    }

    /**
     * Set columnasFijas
     *
     * @param integer $columnasFijas
     * @return Formulario
     */
    public function setColumnasFijas($columnasFijas)
    {
        $this->columnasFijas = $columnasFijas;

        return $this;
    }

    /**
     * Get columnasFijas
     *
     * @return integer 
     */
    public function getColumnasFijas()
    {
        return $this->columnasFijas;
    }
}
