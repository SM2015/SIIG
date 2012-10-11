<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Catalogos
 *
 * @ORM\Table(name="catalogos")
 * @ORM\Entity
 */
class Catalogos
{
    /**
     * @var integer $idCat
     *
     * @ORM\Column(name="id_cat", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="catalogos_id_cat_seq", allocationSize=1, initialValue=1)
     */
    private $idCat;

    /**
     * @var string $nombreTabla
     *
     * @ORM\Column(name="nombre_tabla", type="string", nullable=false)
     */
    private $nombreTabla;

    /**
     * @var string $nombreCat
     *
     * @ORM\Column(name="nombre_cat", type="string", length=50, nullable=false)
     */
    private $nombreCat;

    /**
     * @var string $campoLlave
     *
     * @ORM\Column(name="campo_llave", type="string", length=50, nullable=true)
     */
    private $campoLlave;

    /**
     * @var string $nombreCampoDescripcion
     *
     * @ORM\Column(name="nombre_campo_descripcion", type="string", length=25, nullable=true)
     */
    private $nombreCampoDescripcion;

    /**
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="text", nullable=true)
     */
    private $codigo;

    /**
     * @var integer $catPadreId
     *
     * @ORM\Column(name="cat_padre_id", type="integer", nullable=false)
     */
    private $catPadreId;



    /**
     * Get idCat
     *
     * @return integer 
     */
    public function getIdCat()
    {
        return $this->idCat;
    }

    /**
     * Set nombreTabla
     *
     * @param string $nombreTabla
     * @return Catalogos
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

    /**
     * Set nombreCat
     *
     * @param string $nombreCat
     * @return Catalogos
     */
    public function setNombreCat($nombreCat)
    {
        $this->nombreCat = $nombreCat;
    
        return $this;
    }

    /**
     * Get nombreCat
     *
     * @return string 
     */
    public function getNombreCat()
    {
        return $this->nombreCat;
    }

    /**
     * Set campoLlave
     *
     * @param string $campoLlave
     * @return Catalogos
     */
    public function setCampoLlave($campoLlave)
    {
        $this->campoLlave = $campoLlave;
    
        return $this;
    }

    /**
     * Get campoLlave
     *
     * @return string 
     */
    public function getCampoLlave()
    {
        return $this->campoLlave;
    }

    /**
     * Set nombreCampoDescripcion
     *
     * @param string $nombreCampoDescripcion
     * @return Catalogos
     */
    public function setNombreCampoDescripcion($nombreCampoDescripcion)
    {
        $this->nombreCampoDescripcion = $nombreCampoDescripcion;
    
        return $this;
    }

    /**
     * Get nombreCampoDescripcion
     *
     * @return string 
     */
    public function getNombreCampoDescripcion()
    {
        return $this->nombreCampoDescripcion;
    }

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return Catalogos
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
     * Set catPadreId
     *
     * @param integer $catPadreId
     * @return Catalogos
     */
    public function setCatPadreId($catPadreId)
    {
        $this->catPadreId = $catPadreId;
    
        return $this;
    }

    /**
     * Get catPadreId
     *
     * @return integer 
     */
    public function getCatPadreId()
    {
        return $this->catPadreId;
    }
}