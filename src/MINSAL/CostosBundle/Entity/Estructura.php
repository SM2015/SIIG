<?php

namespace MINSAL\CostosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\CostosBundle\Entity\Estructura
 *
 * @ORM\Table(name="costos.estructura")
 * @UniqueEntity(fields="codigo", message="Código ya existe")
 * @ORM\Entity
 */
class Estructura
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
     * @ORM\Column(name="nombre", type="string", length=250, nullable=false)
     */
    private $nombre;
        

    /**
     * @var string $nivel
     *
     * @ORM\Column(name="nivel", type="integer", nullable=false)
     */
    private $nivel;
    
    /**
     * @ORM\OneToMany(targetEntity="Estructura", mappedBy="parent")
     **/
    private $children;

    /**
     * @ORM\ManyToOne(targetEntity="Estructura", inversedBy="children")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id")
     **/
    private $parent;
    
    /**
     * @ORM\OneToMany(targetEntity="UnidadesProductivas", mappedBy="establecimiento")
     **/
    private $unidadesProductivas;
        
        
    /**
     * @ORM\ManyToMany(targetEntity="ContratosFijosGA", inversedBy="establecimientos")
     * @ORM\OrderBy({"descripcion" = "ASC"})
     **/
    private $contratosFijos;
    
    /**
     * @ORM\OneToMany(targetEntity="Especialidad", mappedBy="establecimiento")
     **/
    private $especialidades;
    

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

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return Alineacion
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
     * Set descripcion
     *
     * @param string $descripcion
     * @return Alineacion
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
     * Constructor
     */
    public function __construct()
    {
        $this->children = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Estructura
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
     * Set nivel
     *
     * @param integer $nivel
     * @return Estructura
     */
    public function setNivel($nivel)
    {
        $this->nivel = $nivel;

        return $this;
    }

    /**
     * Get nivel
     *
     * @return integer 
     */
    public function getNivel()
    {
        return $this->nivel;
    }

    /**
     * Add children
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $children
     * @return Estructura
     */
    public function addChild(\MINSAL\CostosBundle\Entity\Estructura $children)
    {
        $this->children[] = $children;

        return $this;
    }

    /**
     * Remove children
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $children
     */
    public function removeChild(\MINSAL\CostosBundle\Entity\Estructura $children)
    {
        $this->children->removeElement($children);
    }

    /**
     * Get children
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getChildren()
    {
        return $this->children;
    }

    /**
     * Set parent
     *
     * @param \MINSAL\CostosBundle\Entity\Estructura $parent
     * @return Estructura
     */
    public function setParent(\MINSAL\CostosBundle\Entity\Estructura $parent = null)
    {
        $this->parent = $parent;

        return $this;
    }

    /**
     * Get parent
     *
     * @return \MINSAL\CostosBundle\Entity\Estructura 
     */
    public function getParent()
    {
        return $this->parent;
    }

    /**
     * Add especialidades
     *
     * @param \MINSAL\CostosBundle\Entity\Especialidad $especialidades
     * @return Estructura
     */
    public function addEspecialidade(\MINSAL\CostosBundle\Entity\Especialidad $especialidades)
    {
        $this->especialidades[] = $especialidades;

        return $this;
    }

    /**
     * Remove especialidades
     *
     * @param \MINSAL\CostosBundle\Entity\Especialidad $especialidades
     */
    public function removeEspecialidade(\MINSAL\CostosBundle\Entity\Especialidad $especialidades)
    {
        $this->especialidades->removeElement($especialidades);
    }

    /**
     * Get especialidades
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getEspecialidades()
    {
        return $this->especialidades;
    }

    /**
     * Add unidadesProductivas
     *
     * @param \MINSAL\CostosBundle\Entity\UnidadesProductivas $unidadesProductivas
     * @return Estructura
     */
    public function addUnidadesProductiva(\MINSAL\CostosBundle\Entity\UnidadesProductivas $unidadesProductivas)
    {
        $this->unidadesProductivas[] = $unidadesProductivas;

        return $this;
    }

    /**
     * Remove unidadesProductivas
     *
     * @param \MINSAL\CostosBundle\Entity\UnidadesProductivas $unidadesProductivas
     */
    public function removeUnidadesProductiva(\MINSAL\CostosBundle\Entity\UnidadesProductivas $unidadesProductivas)
    {
        $this->unidadesProductivas->removeElement($unidadesProductivas);
    }

    /**
     * Get unidadesProductivas
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getUnidadesProductivas()
    {
        return $this->unidadesProductivas;
    }

    /**
     * Add contratosFijos
     *
     * @param \MINSAL\CostosBundle\Entity\ContratosFijosGA $contratosFijos
     * @return Estructura
     */
    public function addContratosFijo(\MINSAL\CostosBundle\Entity\ContratosFijosGA $contratosFijos)
    {
        $this->contratosFijos[] = $contratosFijos;

        return $this;
    }

    /**
     * Remove contratosFijos
     *
     * @param \MINSAL\CostosBundle\Entity\ContratosFijosGA $contratosFijos
     */
    public function removeContratosFijo(\MINSAL\CostosBundle\Entity\ContratosFijosGA $contratosFijos)
    {
        $this->contratosFijos->removeElement($contratosFijos);
    }

    /**
     * Get contratosFijos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getContratosFijos()
    {
        return $this->contratosFijos;
    }

    /**
     * Add centrosDeProduccion
     *
     * @param \MINSAL\CostosBundle\Entity\CentrosDeProduccion $centrosDeProduccion
     * @return Estructura
     */
    public function addCentrosDeProduccion(\MINSAL\CostosBundle\Entity\CentrosDeProduccion $centrosDeProduccion)
    {
        $this->centrosDeProduccion[] = $centrosDeProduccion;

        return $this;
    }

    /**
     * Remove centrosDeProduccion
     *
     * @param \MINSAL\CostosBundle\Entity\CentrosDeProduccion $centrosDeProduccion
     */
    public function removeCentrosDeProduccion(\MINSAL\CostosBundle\Entity\CentrosDeProduccion $centrosDeProduccion)
    {
        $this->centrosDeProduccion->removeElement($centrosDeProduccion);
    }

    /**
     * Get centrosDeProduccion
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCentrosDeProduccion()
    {
        return $this->centrosDeProduccion;
    }
}
