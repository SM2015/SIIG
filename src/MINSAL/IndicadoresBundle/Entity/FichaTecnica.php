<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * MINSAL\IndicadoresBundle\Entity\FichaTecnica
 *
 * @ORM\Table(name="ficha_tecnica")
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\FichaTecnicaRepository")
 */
class FichaTecnica
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
     * @ORM\Column(name="nombre", type="string", length=150, nullable=false)
     */
    private $nombre;

    /**
     * @var string $tema
     *
     * @ORM\Column(name="tema", type="text", nullable=false)
     */
    private $tema;

    /**
     * @var string $concepto
     *
     * @ORM\Column(name="concepto", type="text", nullable=true)
     */
    private $concepto;

    /**
     * @var string $objetivo
     *
     * @ORM\Column(name="objetivo", type="text", nullable=true)
     */
    private $objetivo;

    /**
     * @var string $uso
     *
     * @ORM\Column(name="uso", type="text", nullable=true)
     */
    private $uso;

    /**
     * @var string $definicionOperativa
     *
     * @ORM\Column(name="definicion_operativa", type="text", nullable=true)
     */
    private $definicionOperativa;

    /**
     * @var string $unidadMedida
     *
     * @ORM\Column(name="unidad_medida", type="string", length=50, nullable=false)
     */
    private $unidadMedida;

    /**
     * @var string $formula
     *
     * @ORM\Column(name="formula", type="string", length=300, nullable=false)
     */
    private $formula;

    /**
     * @var string $observacion
     *
     * @ORM\Column(name="observacion", type="text", nullable=true)
     */
    private $observacion;

    /**
     * @var string $camposIndicador
     *
     * @ORM\Column(name="campos_indicador", type="text", nullable=true)
     */
    private $camposIndicador;
    
    /**
     * @var integer $confiabilidad
     *
     * @ORM\Column(name="confiabilidad", type="integer", nullable=true)
     * 
     * @Assert\Range(
     *      min = "0",
     *      max = "100"
     * )
     */
    private $confiabilidad;
        
    /**
     * @var datetime $updatedAt
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;
    
    /**
     * @var datetime ultimaLectura
     *
     * @ORM\Column(name="ultima_lectura", type="datetime", nullable=true)
     */
    private $ultimaLectura;
    
    
    /**
     * @var ClasificacionNivel
     *
     * @ORM\ManyToOne(targetEntity="ClasificacionNivel")
     * @ORM\JoinColumn(name="id_clasificacion_nivel", referencedColumnName="id")
     */
    private $idClasificacionNivel;

    /**
     * @var ClasificacionPrivacidad
     *
     * @ORM\ManyToOne(targetEntity="ClasificacionPrivacidad")
     * @ORM\JoinColumn(name="id_clasificacion_privacidad", referencedColumnName="id")
     */
    private $idClasificacionPrivacidad;

    /**
     * @var ClasificacionTecnica
     *
     * @ORM\ManyToOne(targetEntity="ClasificacionTecnica", inversedBy="indicadores" )
     * @ORM\JoinColumn(name="id_clasificacion_tecnica", referencedColumnName="id")
     */
    private $idClasificacionTecnica;

    /**
     * @var ClasificacionUso
     *
     * @ORM\ManyToOne(targetEntity="ClasificacionUso")
     * @ORM\JoinColumn(name="id_clasificacion_uso", referencedColumnName="id")
     */
    private $idClasificacionUso;
        

    /**
     * @var ResponsableIndicador
     *
     * @ORM\ManyToOne(targetEntity="ResponsableIndicador")
     * @ORM\JoinColumn(name="id_responsable_indicador", referencedColumnName="id")
     */
    private $idResponsableIndicador;
    
    /**
     * 
     * @var periodo
     *
     * @ORM\ManyToOne(targetEntity="Periodos")
     * @ORM\JoinColumn(name="id_periodo", referencedColumnName="id")
     * @ORM\OrderBy({"descripcion" = "ASC"})
     **/
    private $periodo;

    /**
    * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="IndicadorAlertas", mappedBy="indicador", cascade={"all"}, orphanRemoval=true)
     * 
     */
    private $alertas;
    
    /**
     * @ORM\ManyToMany(targetEntity="VariableDato", inversedBy="indicadores")
     * @ORM\JoinTable(name="ficha_tecnica_variable_dato",
     *      joinColumns={@ORM\JoinColumn(name="id_ficha_tecnica", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_variable_dato", referencedColumnName="id")}
     *      )
     * @ORM\OrderBy({"nombre" = "ASC"})
     **/
    private $variables;             
    
    /**
     * @ORM\ManyToMany(targetEntity="Campo")
     * @ORM\JoinTable(name="ficha_tecnica_campo",
     *      joinColumns={@ORM\JoinColumn(name="id_ficha_tecnica", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_campo", referencedColumnName="id")}
     *      )
     **/
    private $campos;
    
    /**
     * @ORM\ManyToMany(targetEntity="User", mappedBy="favoritos")
     **/
    private $usuariosFavoritos;

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
     * @return FichaTecnica
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
     * Set tema
     *
     * @param string $tema
     * @return FichaTecnica
     */
    public function setTema($tema)
    {
        $this->tema = $tema;
    
        return $this;
    }

    /**
     * Get tema
     *
     * @return string 
     */
    public function getTema()
    {
        return $this->tema;
    }

    /**
     * Set concepto
     *
     * @param string $concepto
     * @return FichaTecnica
     */
    public function setConcepto($concepto)
    {
        $this->concepto = $concepto;
    
        return $this;
    }

    /**
     * Get concepto
     *
     * @return string 
     */
    public function getConcepto()
    {
        return $this->concepto;
    }

    /**
     * Set objetivo
     *
     * @param string $objetivo
     * @return FichaTecnica
     */
    public function setObjetivo($objetivo)
    {
        $this->objetivo = $objetivo;
    
        return $this;
    }

    /**
     * Get objetivo
     *
     * @return string 
     */
    public function getObjetivo()
    {
        return $this->objetivo;
    }

    /**
     * Set uso
     *
     * @param string $uso
     * @return FichaTecnica
     */
    public function setUso($uso)
    {
        $this->uso = $uso;
    
        return $this;
    }

    /**
     * Get uso
     *
     * @return string 
     */
    public function getUso()
    {
        return $this->uso;
    }

    /**
     * Set definicionOperativa
     *
     * @param string $definicionOperativa
     * @return FichaTecnica
     */
    public function setDefinicionOperativa($definicionOperativa)
    {
        $this->definicionOperativa = $definicionOperativa;
    
        return $this;
    }

    /**
     * Get definicionOperativa
     *
     * @return string 
     */
    public function getDefinicionOperativa()
    {
        return $this->definicionOperativa;
    }

    /**
     * Set unidadMedida
     *
     * @param string $unidadMedida
     * @return FichaTecnica
     */
    public function setUnidadMedida($unidadMedida)
    {
        $this->unidadMedida = $unidadMedida;
    
        return $this;
    }

    /**
     * Get unidadMedida
     *
     * @return string 
     */
    public function getUnidadMedida()
    {
        return $this->unidadMedida;
    }

    /**
     * Set formula
     *
     * @param string $formula
     * @return FichaTecnica
     */
    public function setFormula($formula)
    {
        $this->formula = $formula;
    
        return $this;
    }

    /**
     * Get formula
     *
     * @return string 
     */
    public function getFormula()
    {
        return $this->formula;
    }

    /**
     * Set observacion
     *
     * @param string $observacion
     * @return FichaTecnica
     */
    public function setObservacion($observacion)
    {
        $this->observacion = $observacion;
    
        return $this;
    }

    /**
     * Get observacion
     *
     * @return string 
     */
    public function getObservacion()
    {
        return $this->observacion;
    }

    /**
     * Set confiabilidad
     *
     * @param integer $confiabilidad
     * @return FichaTecnica
     */
    public function setConfiabilidad($confiabilidad)
    {
        $this->confiabilidad = $confiabilidad;
    
        return $this;
    }

    /**
     * Get confiabilidad
     *
     * @return integer 
     */
    public function getConfiabilidad()
    {
        return $this->confiabilidad;
    }

    /**
     * Set idClasificacionNivel
     *
     * @param MINSAL\IndicadoresBundle\Entity\ClasificacionNivel $idClasificacionNivel
     * @return FichaTecnica
     */
    public function setIdClasificacionNivel(\MINSAL\IndicadoresBundle\Entity\ClasificacionNivel $idClasificacionNivel = null)
    {
        $this->idClasificacionNivel = $idClasificacionNivel;
    
        return $this;
    }

    /**
     * Get idClasificacionNivel
     *
     * @return MINSAL\IndicadoresBundle\Entity\ClasificacionNivel 
     */
    public function getIdClasificacionNivel()
    {
        return $this->idClasificacionNivel;
    }

    /**
     * Set idClasificacionPrivacidad
     *
     * @param MINSAL\IndicadoresBundle\Entity\ClasificacionPrivacidad $idClasificacionPrivacidad
     * @return FichaTecnica
     */
    public function setIdClasificacionPrivacidad(\MINSAL\IndicadoresBundle\Entity\ClasificacionPrivacidad $idClasificacionPrivacidad = null)
    {
        $this->idClasificacionPrivacidad = $idClasificacionPrivacidad;
    
        return $this;
    }

    /**
     * Get idClasificacionPrivacidad
     *
     * @return MINSAL\IndicadoresBundle\Entity\ClasificacionPrivacidad 
     */
    public function getIdClasificacionPrivacidad()
    {
        return $this->idClasificacionPrivacidad;
    }

    /**
     * Set idClasificacionTecnica
     *
     * @param MINSAL\IndicadoresBundle\Entity\ClasificacionTecnica $idClasificacionTecnica
     * @return FichaTecnica
     */
    public function setIdClasificacionTecnica(\MINSAL\IndicadoresBundle\Entity\ClasificacionTecnica $idClasificacionTecnica = null)
    {
        $this->idClasificacionTecnica = $idClasificacionTecnica;
    
        return $this;
    }

    /**
     * Get idClasificacionTecnica
     *
     * @return MINSAL\IndicadoresBundle\Entity\ClasificacionTecnica 
     */
    public function getIdClasificacionTecnica()
    {
        return $this->idClasificacionTecnica;
    }

    /**
     * Set idClasificacionUso
     *
     * @param MINSAL\IndicadoresBundle\Entity\ClasificacionUso $idClasificacionUso
     * @return FichaTecnica
     */
    public function setIdClasificacionUso(\MINSAL\IndicadoresBundle\Entity\ClasificacionUso $idClasificacionUso = null)
    {
        $this->idClasificacionUso = $idClasificacionUso;
    
        return $this;
    }

    /**
     * Get idClasificacionUso
     *
     * @return MINSAL\IndicadoresBundle\Entity\ClasificacionUso 
     */
    public function getIdClasificacionUso()
    {
        return $this->idClasificacionUso;
    }

    /**
     * Set idResponsableIndicador
     *
     * @param MINSAL\IndicadoresBundle\Entity\ResponsableIndicador $idResponsableIndicador
     * @return FichaTecnica
     */
    public function setIdResponsableIndicador(\MINSAL\IndicadoresBundle\Entity\ResponsableIndicador $idResponsableIndicador = null)
    {
        $this->idResponsableIndicador = $idResponsableIndicador;
    
        return $this;
    }

    /**
     * Get idResponsableIndicador
     *
     * @return MINSAL\IndicadoresBundle\Entity\ResponsableIndicador 
     */
    public function getIdResponsableIndicador()
    {
        return $this->idResponsableIndicador;
    }
           
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->periodos = new \Doctrine\Common\Collections\ArrayCollection();
        $this->presentaciones = new \Doctrine\Common\Collections\ArrayCollection();
        $this->variables = new \Doctrine\Common\Collections\ArrayCollection();
    }        

    /**
     * Add campos
     *
     * @param MINSAL\IndicadoresBundle\Entity\Campo $campos
     * @return FichaTecnica
     */
    public function addCampo(\MINSAL\IndicadoresBundle\Entity\Campo $campos)
    {
        $this->campos[] = $campos;
    
        return $this;
    }

    /**
     * Remove campos
     *
     * @param MINSAL\IndicadoresBundle\Entity\Campo $campos
     */
    public function removeCampo(\MINSAL\IndicadoresBundle\Entity\Campo $campos)
    {
        $this->campos->removeElement($campos);
    }

    /**
     * Get campos
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getCampos()
    {
        return $this->campos;
    }

    /**
     * Set id
     *
     * @param integer $id
     * @return FichaTecnica
     */
    public function setId($id)
    {
        $this->id = $id;
    
        return $this;
    }

    /**
     * Set camposIndicador
     *
     * @param string $camposIndicador
     * @return FichaTecnica
     */
    public function setCamposIndicador($camposIndicador)
    {
        $this->camposIndicador = $camposIndicador;
    
        return $this;
    }

    /**
     * Get camposIndicador
     *
     * @return string 
     */
    public function getCamposIndicador()
    {
        return $this->camposIndicador;
    }
        

    /**
     * Add alertas
     *
     * @param MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas
     * @return FichaTecnica
     */
    public function addAlertas(\MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas)
    {
        //$alertas->setIndicador($this);
        $this->alertas[] = $alertas;
    
        return $this;
    }
    

    /**
     * Get alertas
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getAlertas()
    {
        return $this->alertas;
    }
    
    public function __toString() {
        return $this->nombre;
    }

    /**
     * Add alertas
     *
     * @param MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas
     * @return FichaTecnica
     */
    public function addAlerta(\MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas)
    {
        $this->alertas[] = $alertas;
    
        return $this;
    }

    /**
     * Remove alertas
     *
     * @param MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas
     */
    public function removeAlerta(\MINSAL\IndicadoresBundle\Entity\IndicadorAlertas $alertas)
    {
        $this->alertas->removeElement($alertas);
    }
    
    public function removeAlertas()
    {
        $this->alertas=array();
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     * @return FichaTecnica
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    
        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime 
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * Add variables
     *
     * @param \MINSAL\IndicadoresBundle\Entity\VariableDato $variables
     * @return FichaTecnica
     */
    public function addVariable(\MINSAL\IndicadoresBundle\Entity\VariableDato $variables)
    {
        $this->variables[] = $variables;
    
        return $this;
    }

    /**
     * Remove variables
     *
     * @param \MINSAL\IndicadoresBundle\Entity\VariableDato $variables
     */
    public function removeVariable(\MINSAL\IndicadoresBundle\Entity\VariableDato $variables)
    {
        $this->variables->removeElement($variables);
    }

    /**
     * Get variables
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getVariables()
    {
        return $this->variables;
    }

    /**
     * Set ultimaLectura
     *
     * @param \DateTime $ultimaLectura
     * @return FichaTecnica
     */
    public function setUltimaLectura($ultimaLectura)
    {
        $this->ultimaLectura = $ultimaLectura;
    
        return $this;
    }

    /**
     * Get ultimaLectura
     *
     * @return \DateTime 
     */
    public function getUltimaLectura()
    {
        return $this->ultimaLectura;
    }

    /**
     * Set periodo
     *
     * @param \MINSAL\IndicadoresBundle\Entity\Periodos $periodo
     * @return FichaTecnica
     */
    public function setPeriodo(\MINSAL\IndicadoresBundle\Entity\Periodos $periodo = null)
    {
        $this->periodo = $periodo;
    
        return $this;
    }

    /**
     * Get periodo
     *
     * @return \MINSAL\IndicadoresBundle\Entity\Periodos 
     */
    public function getPeriodo()
    {
        return $this->periodo;
    }

    /**
     * Add usuariosFavoritos
     *
     * @param \MINSAL\IndicadoresBundle\Entity\User $usuariosFavoritos
     * @return FichaTecnica
     */
    public function addUsuariosFavorito(\MINSAL\IndicadoresBundle\Entity\User $usuariosFavoritos)
    {
        $this->usuariosFavoritos[] = $usuariosFavoritos;
    
        return $this;
    }

    /**
     * Remove usuariosFavoritos
     *
     * @param \MINSAL\IndicadoresBundle\Entity\User $usuariosFavoritos
     */
    public function removeUsuariosFavorito(\MINSAL\IndicadoresBundle\Entity\User $usuariosFavoritos)
    {
        $this->usuariosFavoritos->removeElement($usuariosFavoritos);
    }

    /**
     * Get usuariosFavoritos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getUsuariosFavoritos()
    {
        return $this->usuariosFavoritos;
    }
}