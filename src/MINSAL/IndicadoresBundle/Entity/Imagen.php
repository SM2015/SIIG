<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

/**
 * MINSAL\IndicadoresBundle\Entity;
 *
 * @ORM\Entity
 * @ORM\Table(name="imagen")
 * @ORM\HasLifecycleCallbacks
 */
class Imagen
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
     * @var string $path
     *
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    protected $path;
    
    
    /**
     * @var $archivo
     *
     * @Assert\File(
     *      maxSize = "5M",
     *      mimeTypes = {"image/jpeg", "image/gif", "image/png", "image/tiff"},
     *      maxSizeMessage = "The maximum allowed file size is 5MB.",
     *      mimeTypesMessage = "Only the filestype image are allowed."
     * )
     */
    public $archivo;
    
    
    /**
     * @var string $titulo
     *
     * @ORM\Column(name="titulo", type="string", length=255)
     */
    private $titulo;
    
    /**
     * @var text $descripcion
     *
     * @ORM\Column(name="descripcion", type="text")
     */
    private $descripcion;

    /**
     * Set path
     *
     * @param string $path
     * @return Image
     */
    public function setPath($path)
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get path
     *
     * @return string 
     */
    public function getPath()
    {
        return $this->path;
    }
    
    /**
     *
     * @ORM\ManyToOne(targetEntity="GrupoIndicadores", inversedBy="imagenes")
     */
    private $sala;


    /**
     * Set sala
     *
     * @param \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores $sala
     * @return Image
     */
    public function setSala(\MINSAL\IndicadoresBundle\Entity\GrupoIndicadores $sala = null)
    {
        $this->sala = $sala;

        return $this;
    }

    /**
     * Get sala
     *
     * @return \MINSAL\IndicadoresBundle\Entity\GrupoIndicadores 
     */
    public function getSala()
    {
        return $this->sala;
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
     * Set titulo
     *
     * @param string $titulo
     * @return Imagen
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;

        return $this;
    }

    /**
     * Get titulo
     *
     * @return string 
     */
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return Imagen
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
     * Llamar antes de guardar la entidad
     * 
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function preUpload(){
        if (null != $this->archivo){
            $filename = sha1(uniqid(mt_rand(), true));
            $this->path = $filename.'.'.$this->archivo->guessExtension();
        }
    }
    
    /**
     * @ORM\PostRemove()
     */
    public function removeUpload() {
        if ($file = $this->getAbsolutePath()){
            unlink($file);
        }
            
    }
    
    
    /**
     * @ORM\PostPersist()
     * @ORM\PostUpdate()
     */
    public function upload() {
        
        //La propiedad de archivo puede estar vacio si el campo no es requerido
        if (null === $this->archivo){
            return;
        }
        
        //usar el nombre original del archivo
        $this->archivo->move(
            $this->getUploadRootDir(),
            $this->path   
                );
        
        $this->archivo = null;
    }
    
    public function setDefaultOptions(OptionsResolverInterface $resolver) {
        $resolver->setDefaults(array('data_class' =>'MINSAL\IndicadoresBundle\Entity\Imagen'));
    }
    
    public function getAbsolutePath()
    {
        return null === $this->path
            ? null
            : $this->getUploadRootDir().'/'.$this->path;
    }

    public function getWebPath()
    {
        return null === $this->path
            ? null
            : $this->getUploadDir().'/'.$this->path;
    }

    protected function getUploadRootDir()
    {
        // the absolute directory path where uploaded
        // documents should be saved
        return __DIR__.'/../../../../web/'.$this->getUploadDir();
    }

    protected function getUploadDir()
    {
        // get rid of the __DIR__ so it doesn't screw up
        // when displaying uploaded doc/image in the view.
        return 'uploads/documents';
    }
}