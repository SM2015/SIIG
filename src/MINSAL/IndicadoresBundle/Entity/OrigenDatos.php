<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * MINSAL\IndicadoresBundle\Entity\TablaDatos
 *
 * @ORM\Table(name="origen_datos")
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\OrigenDatosRepository")
 * @UniqueEntity(fields="sentenciaSql", message="La sentencia SQL ya fue utilizada")
 */
class OrigenDatos {

    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

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
     * @var string $sentenciaSql
     *
     * @ORM\Column(name="sentencia_sql", type="text", nullable=true)
     */
    private $sentenciaSql;

    /**
     * @var Conexion
     *
     * @ORM\ManyToOne(targetEntity="Conexion")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_conexion", referencedColumnName="id")
     * })
     */
    private $conexion;
    
    /**
     * @var string $archivoNombre
     *
     * @ORM\Column(name="archivo_nombre", type="string", length=100, nullable=true)
     */    
    protected $archivoNombre;
             
    public $file;
    
    /**
     * @var string $esFusionado
     *
     * @ORM\Column(name="es_fusionado", type="boolean", nullable=true)
     */    
    private $esFusionado;
    
     /**
     * @var string $esCatalogo
     *
     * @ORM\Column(name="es_catalogo", type="boolean", nullable=true)
     */    
    private $esCatalogo;
        
    /**
     * @var string $nombreCatalogo
     *
     * @ORM\Column(name="nombre_catalogo", type="string", length=100, nullable=true)
     */    
    protected $nombreCatalogo;
    
    /**
     * @var string $camposFusionados
     *
     * @ORM\Column(name="campos_fusionados", type="text", nullable=true)
     */
    private $camposFusionados;      
    
    /**
     * @ORM\ManyToMany(targetEntity="OrigenDatos")
     * @ORM\JoinTable(name="origen_datos_fusiones",
     *      joinColumns={@ORM\JoinColumn(name="id_origen_dato", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_origen_dato_fusionado", referencedColumnName="id")}
     *      )
     **/
    private $fusiones;
    
    /**
    * @ORM\OneToMany(targetEntity="Campo", mappedBy="origenDato")
    */
    private $campos;
    
    /**
     * @ORM\OneToMany(targetEntity="VariableDato", mappedBy="origenDatos")
     **/
    private $variables;
    
    public function __construct() {
        $this->fusiones = new \Doctrine\Common\Collections\ArrayCollection();
        $this->esCatalogo = false;
    }

    public function getAbsolutePath() {
        return null === $this->archivoNombre ? null : $this->getUploadRootDir() . '/' . $this->archivoNombre;
    }

    public function getWebPath() {
        return null === $this->archivoNombre ? null : $this->getUploadDir() . '/' . $this->archivoNombre;
    }

    protected function getUploadRootDir() {
        // the absolute directory path where uploaded documents should be saved
        return __DIR__.'/../../../../web/'.$this->getUploadDir();
        //return $basepath . $this->getUploadDir();
    }

    protected function getUploadDir() {
        // get rid of the __DIR__ so it doesn't screw when displaying uploaded doc/image in the view.
        return 'uploads/origen_datos';
    }

    public function upload($basepath) {
        // the file property can be empty if the field is not required
        if (null === $this->file) {
            return;
        }

        if (null === $basepath) {
            return;
        }

        // we use the original file name here but you should
        // sanitize it at least to avoid any security issues
        // move takes the target directory and then the target filename to move to
        $this->file->move($this->getUploadRootDir($basepath), $this->file->getClientOriginalName());

        // set the path property to the filename where you'ved saved the file
        $this->setArchivoNombre($this->file->getClientOriginalName());

        // clean up the file property as you won't need it anymore
        $this->file = null;
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return TablaDatos
     */
    public function setNombre($nombre) {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre() {
        return $this->nombre;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return TablaDatos
     */
    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string 
     */
    public function getDescripcion() {
        return $this->descripcion;
    }
        
    
    /**
     * Set archivoNombre
     *
     * @param string $archivoNombre
     * @return OrigenDatos
     */
    public function setArchivoNombre($archivoNombre)
    {
        $this->archivoNombre = $archivoNombre;
    
        return $this;
    }

    /**
     * Get archivoNombre
     *
     * @return string 
     */
    public function getArchivoNombre()
    {
        return $this->archivoNombre;
    }

    /**
     * Set sentenciaSql
     *
     * @param string $sentenciaSql
     * @return OrigenDatos
     */
    public function setSentenciaSql($sentenciaSql)
    {
        $this->sentenciaSql = $sentenciaSql;
    
        return $this;
    }

    /**
     * Get sentenciaSql
     *
     * @return string 
     */
    public function getSentenciaSql()
    {
        return $this->sentenciaSql;
    }
    
    public function __toString() {
        return $this->nombre;
    }

    /**
     * Set esFusionado
     *
     * @param boolean $esFusionado
     * @return OrigenDatos
     */
    public function setEsFusionado($esFusionado)
    {
        $this->esFusionado = $esFusionado;
    
        return $this;
    }

    /**
     * Get esFusionado
     *
     * @return boolean 
     */
    public function getEsFusionado()
    {
        return $this->esFusionado;
    }

    /**
     * Set camposFusionados
     *
     * @param string $camposFusionados
     * @return OrigenDatos
     */
    public function setCamposFusionados($camposFusionados)
    {
        $this->camposFusionados = $camposFusionados;
    
        return $this;
    }

    /**
     * Get camposFusionados
     *
     * @return string 
     */
    public function getCamposFusionados()
    {
        return $this->camposFusionados;
    }

    /**
     * Add fusiones
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $fusiones
     * @return OrigenDatos
     */
    public function addFusione(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $fusiones)
    {
        $this->fusiones[] = $fusiones;
    
        return $this;
    }

    /**
     * Remove fusiones
     *
     * @param MINSAL\IndicadoresBundle\Entity\OrigenDatos $fusiones
     */
    public function removeFusione(\MINSAL\IndicadoresBundle\Entity\OrigenDatos $fusiones)
    {
        $this->fusiones->removeElement($fusiones);
    }

    /**
     * Get fusiones
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getFusiones()
    {
        return $this->fusiones;
    }

    /**
     * Add campos
     *
     * @param MINSAL\IndicadoresBundle\Entity\Campo $campos
     * @return OrigenDatos
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
     * Set conexion
     *
     * @param MINSAL\IndicadoresBundle\Entity\Conexion $conexion
     * @return OrigenDatos
     */
    public function setConexion(\MINSAL\IndicadoresBundle\Entity\Conexion $conexion = null)
    {
        $this->conexion = $conexion;
    
        return $this;
    }

    /**
     * Get conexion
     *
     * @return MINSAL\IndicadoresBundle\Entity\Conexion 
     */
    public function getConexion()
    {
        return $this->conexion;
    }

    /**
     * Set id
     *
     * @param integer $id
     * @return OrigenDatos
     */
    public function setId($id)
    {
        $this->id = $id;
    
        return $this;
    }

    /**
     * Set esCatalogo
     *
     * @param boolean $esCatalogo
     * @return OrigenDatos
     */
    public function setEsCatalogo($esCatalogo)
    {
        $this->esCatalogo = $esCatalogo;
    
        return $this;
    }

    /**
     * Get esCatalogo
     *
     * @return boolean 
     */
    public function getEsCatalogo()
    {
        return $this->esCatalogo;
    }

    /**
     * Set nombreCatalogo
     *
     * @param string $nombreCatalogo
     * @return OrigenDatos
     */
    public function setNombreCatalogo($nombreCatalogo)
    {
        $this->nombreCatalogo = $nombreCatalogo;
    
        return $this;
    }

    /**
     * Get nombreCatalogo
     *
     * @return string 
     */
    public function getNombreCatalogo()
    {
        return $this->nombreCatalogo;
    }

    /**
     * Add variables
     *
     * @param \MINSAL\IndicadoresBundle\Entity\VariableDato $variables
     * @return OrigenDatos
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
}
