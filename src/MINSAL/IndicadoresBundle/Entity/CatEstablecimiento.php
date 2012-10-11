<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatEstablecimiento
 *
 * @ORM\Table(name="cat_establecimiento")
 * @ORM\Entity
 */
class CatEstablecimiento
{
    /**
     * @var integer $idEstablecimiento
     *
     * @ORM\Column(name="id_establecimiento", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_establecimiento_id_establecimiento_seq", allocationSize=1, initialValue=1)
     */
    private $idEstablecimiento;

    /**
     * @var integer $etz
     *
     * @ORM\Column(name="etz", type="integer", nullable=true)
     */
    private $etz;

    /**
     * @var integer $sib
     *
     * @ORM\Column(name="sib", type="integer", nullable=true)
     */
    private $sib;

    /**
     * @var integer $subred
     *
     * @ORM\Column(name="subred", type="integer", nullable=true)
     */
    private $subred;

    /**
     * @var string $nomsibasi
     *
     * @ORM\Column(name="nomsibasi", type="string", length=90, nullable=true)
     */
    private $nomsibasi;

    /**
     * @var integer $reg
     *
     * @ORM\Column(name="reg", type="integer", nullable=true)
     */
    private $reg;

    /**
     * @var integer $dep
     *
     * @ORM\Column(name="dep", type="integer", nullable=true)
     */
    private $dep;

    /**
     * @var integer $mun
     *
     * @ORM\Column(name="mun", type="integer", nullable=true)
     */
    private $mun;

    /**
     * @var integer $idmun
     *
     * @ORM\Column(name="idmun", type="integer", nullable=true)
     */
    private $idmun;

    /**
     * @var string $tip
     *
     * @ORM\Column(name="tip", type="string", length=3, nullable=true)
     */
    private $tip;

    /**
     * @var integer $udep
     *
     * @ORM\Column(name="udep", type="integer", nullable=true)
     */
    private $udep;

    /**
     * @var string $umun
     *
     * @ORM\Column(name="umun", type="string", length=6, nullable=true)
     */
    private $umun;

    /**
     * @var string $idtipoestablecimiento
     *
     * @ORM\Column(name="idtipoestablecimiento", type="string", length=3, nullable=true)
     */
    private $idtipoestablecimiento;

    /**
     * @var integer $tipo
     *
     * @ORM\Column(name="tipo", type="integer", nullable=true)
     */
    private $tipo;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=120, nullable=true)
     */
    private $descripcion;

    /**
     * @var string $funchona
     *
     * @ORM\Column(name="funchona", type="string", length=3, nullable=true)
     */
    private $funchona;

    /**
     * @var string $establec
     *
     * @ORM\Column(name="establec", type="string", length=18, nullable=true)
     */
    private $establec;

    /**
     * @var string $codloc
     *
     * @ORM\Column(name="codloc", type="string", length=12, nullable=true)
     */
    private $codloc;

    /**
     * @var float $lat
     *
     * @ORM\Column(name="lat", type="float", nullable=true)
     */
    private $lat;

    /**
     * @var float $lng
     *
     * @ORM\Column(name="lng", type="float", nullable=true)
     */
    private $lng;

    /**
     * @var string $tipoexpediente
     *
     * @ORM\Column(name="tipoexpediente", type="string", length=1, nullable=false)
     */
    private $tipoexpediente;



    /**
     * Get idEstablecimiento
     *
     * @return integer 
     */
    public function getIdEstablecimiento()
    {
        return $this->idEstablecimiento;
    }

    /**
     * Set etz
     *
     * @param integer $etz
     * @return CatEstablecimiento
     */
    public function setEtz($etz)
    {
        $this->etz = $etz;
    
        return $this;
    }

    /**
     * Get etz
     *
     * @return integer 
     */
    public function getEtz()
    {
        return $this->etz;
    }

    /**
     * Set sib
     *
     * @param integer $sib
     * @return CatEstablecimiento
     */
    public function setSib($sib)
    {
        $this->sib = $sib;
    
        return $this;
    }

    /**
     * Get sib
     *
     * @return integer 
     */
    public function getSib()
    {
        return $this->sib;
    }

    /**
     * Set subred
     *
     * @param integer $subred
     * @return CatEstablecimiento
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
     * Set nomsibasi
     *
     * @param string $nomsibasi
     * @return CatEstablecimiento
     */
    public function setNomsibasi($nomsibasi)
    {
        $this->nomsibasi = $nomsibasi;
    
        return $this;
    }

    /**
     * Get nomsibasi
     *
     * @return string 
     */
    public function getNomsibasi()
    {
        return $this->nomsibasi;
    }

    /**
     * Set reg
     *
     * @param integer $reg
     * @return CatEstablecimiento
     */
    public function setReg($reg)
    {
        $this->reg = $reg;
    
        return $this;
    }

    /**
     * Get reg
     *
     * @return integer 
     */
    public function getReg()
    {
        return $this->reg;
    }

    /**
     * Set dep
     *
     * @param integer $dep
     * @return CatEstablecimiento
     */
    public function setDep($dep)
    {
        $this->dep = $dep;
    
        return $this;
    }

    /**
     * Get dep
     *
     * @return integer 
     */
    public function getDep()
    {
        return $this->dep;
    }

    /**
     * Set mun
     *
     * @param integer $mun
     * @return CatEstablecimiento
     */
    public function setMun($mun)
    {
        $this->mun = $mun;
    
        return $this;
    }

    /**
     * Get mun
     *
     * @return integer 
     */
    public function getMun()
    {
        return $this->mun;
    }

    /**
     * Set idmun
     *
     * @param integer $idmun
     * @return CatEstablecimiento
     */
    public function setIdmun($idmun)
    {
        $this->idmun = $idmun;
    
        return $this;
    }

    /**
     * Get idmun
     *
     * @return integer 
     */
    public function getIdmun()
    {
        return $this->idmun;
    }

    /**
     * Set tip
     *
     * @param string $tip
     * @return CatEstablecimiento
     */
    public function setTip($tip)
    {
        $this->tip = $tip;
    
        return $this;
    }

    /**
     * Get tip
     *
     * @return string 
     */
    public function getTip()
    {
        return $this->tip;
    }

    /**
     * Set udep
     *
     * @param integer $udep
     * @return CatEstablecimiento
     */
    public function setUdep($udep)
    {
        $this->udep = $udep;
    
        return $this;
    }

    /**
     * Get udep
     *
     * @return integer 
     */
    public function getUdep()
    {
        return $this->udep;
    }

    /**
     * Set umun
     *
     * @param string $umun
     * @return CatEstablecimiento
     */
    public function setUmun($umun)
    {
        $this->umun = $umun;
    
        return $this;
    }

    /**
     * Get umun
     *
     * @return string 
     */
    public function getUmun()
    {
        return $this->umun;
    }

    /**
     * Set idtipoestablecimiento
     *
     * @param string $idtipoestablecimiento
     * @return CatEstablecimiento
     */
    public function setIdtipoestablecimiento($idtipoestablecimiento)
    {
        $this->idtipoestablecimiento = $idtipoestablecimiento;
    
        return $this;
    }

    /**
     * Get idtipoestablecimiento
     *
     * @return string 
     */
    public function getIdtipoestablecimiento()
    {
        return $this->idtipoestablecimiento;
    }

    /**
     * Set tipo
     *
     * @param integer $tipo
     * @return CatEstablecimiento
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;
    
        return $this;
    }

    /**
     * Get tipo
     *
     * @return integer 
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatEstablecimiento
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
     * Set funchona
     *
     * @param string $funchona
     * @return CatEstablecimiento
     */
    public function setFunchona($funchona)
    {
        $this->funchona = $funchona;
    
        return $this;
    }

    /**
     * Get funchona
     *
     * @return string 
     */
    public function getFunchona()
    {
        return $this->funchona;
    }

    /**
     * Set establec
     *
     * @param string $establec
     * @return CatEstablecimiento
     */
    public function setEstablec($establec)
    {
        $this->establec = $establec;
    
        return $this;
    }

    /**
     * Get establec
     *
     * @return string 
     */
    public function getEstablec()
    {
        return $this->establec;
    }

    /**
     * Set codloc
     *
     * @param string $codloc
     * @return CatEstablecimiento
     */
    public function setCodloc($codloc)
    {
        $this->codloc = $codloc;
    
        return $this;
    }

    /**
     * Get codloc
     *
     * @return string 
     */
    public function getCodloc()
    {
        return $this->codloc;
    }

    /**
     * Set lat
     *
     * @param float $lat
     * @return CatEstablecimiento
     */
    public function setLat($lat)
    {
        $this->lat = $lat;
    
        return $this;
    }

    /**
     * Get lat
     *
     * @return float 
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set lng
     *
     * @param float $lng
     * @return CatEstablecimiento
     */
    public function setLng($lng)
    {
        $this->lng = $lng;
    
        return $this;
    }

    /**
     * Get lng
     *
     * @return float 
     */
    public function getLng()
    {
        return $this->lng;
    }

    /**
     * Set tipoexpediente
     *
     * @param string $tipoexpediente
     * @return CatEstablecimiento
     */
    public function setTipoexpediente($tipoexpediente)
    {
        $this->tipoexpediente = $tipoexpediente;
    
        return $this;
    }

    /**
     * Get tipoexpediente
     *
     * @return string 
     */
    public function getTipoexpediente()
    {
        return $this->tipoexpediente;
    }
}