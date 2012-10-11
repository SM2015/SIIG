<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatEcos
 *
 * @ORM\Table(name="cat_ecos")
 * @ORM\Entity
 */
class CatEcos
{
    /**
     * @var integer $idestasib
     *
     * @ORM\Column(name="idestasib", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_ecos_idestasib_seq", allocationSize=1, initialValue=1)
     */
    private $idestasib;

    /**
     * @var integer $sibasi
     *
     * @ORM\Column(name="sibasi", type="integer", nullable=true)
     */
    private $sibasi;

    /**
     * @var integer $subred
     *
     * @ORM\Column(name="subred", type="integer", nullable=true)
     */
    private $subred;

    /**
     * @var integer $idMun
     *
     * @ORM\Column(name="id_mun", type="integer", nullable=true)
     */
    private $idMun;

    /**
     * @var string $tipo
     *
     * @ORM\Column(name="tipo", type="string", length=5, nullable=true)
     */
    private $tipo;

    /**
     * @var string $estasib
     *
     * @ORM\Column(name="estasib", type="string", length=150, nullable=true)
     */
    private $estasib;

    /**
     * @var integer $lat
     *
     * @ORM\Column(name="lat", type="integer", nullable=true)
     */
    private $lat;

    /**
     * @var integer $lng
     *
     * @ORM\Column(name="lng", type="integer", nullable=true)
     */
    private $lng;

    /**
     * @var integer $nivelmspas
     *
     * @ORM\Column(name="nivelmspas", type="integer", nullable=true)
     */
    private $nivelmspas;

    /**
     * @var integer $codigoucsf
     *
     * @ORM\Column(name="codigoucsf", type="integer", nullable=true)
     */
    private $codigoucsf;

    /**
     * @var integer $idRegion
     *
     * @ORM\Column(name="id_region", type="integer", nullable=true)
     */
    private $idRegion;

    /**
     * @var integer $idSimmow
     *
     * @ORM\Column(name="id_simmow", type="integer", nullable=true)
     */
    private $idSimmow;

    /**
     * @var integer $anioApertura
     *
     * @ORM\Column(name="anio_apertura", type="integer", nullable=true)
     */
    private $anioApertura;



    /**
     * Get idestasib
     *
     * @return integer 
     */
    public function getIdestasib()
    {
        return $this->idestasib;
    }

    /**
     * Set sibasi
     *
     * @param integer $sibasi
     * @return CatEcos
     */
    public function setSibasi($sibasi)
    {
        $this->sibasi = $sibasi;
    
        return $this;
    }

    /**
     * Get sibasi
     *
     * @return integer 
     */
    public function getSibasi()
    {
        return $this->sibasi;
    }

    /**
     * Set subred
     *
     * @param integer $subred
     * @return CatEcos
     */
    public function setSubred($subred)
    {
        $this->subred = $subred;
    
        return $this;
    }

    /**
     * Get subred
     *
     * @return integer 
     */
    public function getSubred()
    {
        return $this->subred;
    }

    /**
     * Set idMun
     *
     * @param integer $idMun
     * @return CatEcos
     */
    public function setIdMun($idMun)
    {
        $this->idMun = $idMun;
    
        return $this;
    }

    /**
     * Get idMun
     *
     * @return integer 
     */
    public function getIdMun()
    {
        return $this->idMun;
    }

    /**
     * Set tipo
     *
     * @param string $tipo
     * @return CatEcos
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;
    
        return $this;
    }

    /**
     * Get tipo
     *
     * @return string 
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set estasib
     *
     * @param string $estasib
     * @return CatEcos
     */
    public function setEstasib($estasib)
    {
        $this->estasib = $estasib;
    
        return $this;
    }

    /**
     * Get estasib
     *
     * @return string 
     */
    public function getEstasib()
    {
        return $this->estasib;
    }

    /**
     * Set lat
     *
     * @param integer $lat
     * @return CatEcos
     */
    public function setLat($lat)
    {
        $this->lat = $lat;
    
        return $this;
    }

    /**
     * Get lat
     *
     * @return integer 
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set lng
     *
     * @param integer $lng
     * @return CatEcos
     */
    public function setLng($lng)
    {
        $this->lng = $lng;
    
        return $this;
    }

    /**
     * Get lng
     *
     * @return integer 
     */
    public function getLng()
    {
        return $this->lng;
    }

    /**
     * Set nivelmspas
     *
     * @param integer $nivelmspas
     * @return CatEcos
     */
    public function setNivelmspas($nivelmspas)
    {
        $this->nivelmspas = $nivelmspas;
    
        return $this;
    }

    /**
     * Get nivelmspas
     *
     * @return integer 
     */
    public function getNivelmspas()
    {
        return $this->nivelmspas;
    }

    /**
     * Set codigoucsf
     *
     * @param integer $codigoucsf
     * @return CatEcos
     */
    public function setCodigoucsf($codigoucsf)
    {
        $this->codigoucsf = $codigoucsf;
    
        return $this;
    }

    /**
     * Get codigoucsf
     *
     * @return integer 
     */
    public function getCodigoucsf()
    {
        return $this->codigoucsf;
    }

    /**
     * Set idRegion
     *
     * @param integer $idRegion
     * @return CatEcos
     */
    public function setIdRegion($idRegion)
    {
        $this->idRegion = $idRegion;
    
        return $this;
    }

    /**
     * Get idRegion
     *
     * @return integer 
     */
    public function getIdRegion()
    {
        return $this->idRegion;
    }

    /**
     * Set idSimmow
     *
     * @param integer $idSimmow
     * @return CatEcos
     */
    public function setIdSimmow($idSimmow)
    {
        $this->idSimmow = $idSimmow;
    
        return $this;
    }

    /**
     * Get idSimmow
     *
     * @return integer 
     */
    public function getIdSimmow()
    {
        return $this->idSimmow;
    }

    /**
     * Set anioApertura
     *
     * @param integer $anioApertura
     * @return CatEcos
     */
    public function setAnioApertura($anioApertura)
    {
        $this->anioApertura = $anioApertura;
    
        return $this;
    }

    /**
     * Get anioApertura
     *
     * @return integer 
     */
    public function getAnioApertura()
    {
        return $this->anioApertura;
    }
}