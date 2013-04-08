<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatGenero
 *
 * @ORM\Table(name="significado_campo")
 * @ORM\Entity
 */
class SignificadoCampo
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
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=200, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $codigo
     *
     * @ORM\Column(name="codigo", type="string", length=40, nullable=false)
     */
    private $codigo;
    
    /**
     * @var string $uso_en_catalogo
     *
     * @ORM\Column(name="uso_en_catalogo", type="boolean", nullable=true)
     */    
    private $usoEnCatalogo;
    
     /**
     * @var string $catalogo
     *
     * @ORM\Column(name="catalogo", type="string", length=255, nullable=true)
     */
    private $catalogo;
    
    /**
     * @var string $nombre_mapa
     *
     * @ORM\Column(name="nombre_mapa", type="string", length=200, nullable=true)
     */
    private $nombreMapa;
    
    /**
     * @var string $escala
     *
     * @ORM\Column(name="escala", type="float", nullable=true)
     */
    private $escala;
    
    /**
     * @var string $origen_x
     *
     * @ORM\Column(name="origen_x", type="float", nullable=true)
     */
    private $origenX;
    
    /**
     * @var string $origen_y
     *
     * @ORM\Column(name="origen_y", type="float", nullable=true)
     */
    private $origenY;
    
    

    public function __construct() {
        $this->usoEnCatalogo = false;
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
     * Set descripcion
     *
     * @param string $descripcion
     * @return SignificadoCampo
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
     * Set codigo
     *
     * @param string $codigo
     * @return SignificadoCampo
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
     * Set id
     *
     * @param integer $id
     * @return SignificadoCampo
     */
    public function setId($id)
    {
        $this->id = $id;
    
        return $this;
    }

    /**
     * Set usoEnCatalogo
     *
     * @param boolean $usoEnCatalogo
     * @return SignificadoCampo
     */
    public function setUsoEnCatalogo($usoEnCatalogo)
    {
        $this->usoEnCatalogo = $usoEnCatalogo;
    
        return $this;
    }

    /**
     * Get usoEnCatalogo
     *
     * @return boolean 
     */
    public function getUsoEnCatalogo()
    {
        return $this->usoEnCatalogo;
    }

    /**
     * Set catalogo
     *
     * @param string $catalogo
     * @return SignificadoCampo
     */
    public function setCatalogo($catalogo)
    {
        $this->catalogo = $catalogo;
    
        return $this;
    }

    /**
     * Get catalogo
     *
     * @return string 
     */
    public function getCatalogo()
    {
        return $this->catalogo;
    }   

    /**
     * Set nombreMapa
     *
     * @param string $nombreMapa
     * @return SignificadoCampo
     */
    public function setNombreMapa($nombreMapa)
    {
        $this->nombreMapa = $nombreMapa;
    
        return $this;
    }

    /**
     * Get nombreMapa
     *
     * @return string 
     */
    public function getNombreMapa()
    {
        return $this->nombreMapa;
    }   
    
    public function __toString() {
        return $this->descripcion.'';
    }

    /**
     * Set escala
     *
     * @param float $escala
     * @return SignificadoCampo
     */
    public function setEscala($escala)
    {
        $this->escala = $escala;
    
        return $this;
    }

    /**
     * Get escala
     *
     * @return float 
     */
    public function getEscala()
    {
        return $this->escala;
    }

    /**
     * Set origenX
     *
     * @param float $origenX
     * @return SignificadoCampo
     */
    public function setOrigenX($origenX)
    {
        $this->origenX = $origenX;
    
        return $this;
    }

    /**
     * Get origenX
     *
     * @return float 
     */
    public function getOrigenX()
    {
        return $this->origenX;
    }

    /**
     * Set origenY
     *
     * @param float $origenY
     * @return SignificadoCampo
     */
    public function setOrigenY($origenY)
    {
        $this->origenY = $origenY;
    
        return $this;
    }

    /**
     * Get origenY
     *
     * @return float 
     */
    public function getOrigenY()
    {
        return $this->origenY;
    }
}