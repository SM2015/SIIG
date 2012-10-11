<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatDepartamento
 *
 * @ORM\Table(name="cat_departamento")
 * @ORM\Entity
 */
class CatDepartamento
{
    /**
     * @var integer $idDepartamento
     *
     * @ORM\Column(name="id_departamento", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_departamento_id_departamento_seq", allocationSize=1, initialValue=1)
     */
    private $idDepartamento;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;

    /**
     * @var integer $factor
     *
     * @ORM\Column(name="factor", type="integer", nullable=true)
     */
    private $factor;

    /**
     * @var integer $gis
     *
     * @ORM\Column(name="gis", type="integer", nullable=true)
     */
    private $gis;

    /**
     * @var string $digestyc
     *
     * @ORM\Column(name="digestyc", type="string", length=10, nullable=true)
     */
    private $digestyc;

    /**
     * @var integer $idRegion
     *
     * @ORM\Column(name="id_region", type="integer", nullable=false)
     */
    private $idRegion;

    /**
     * @var string $abreviatura
     *
     * @ORM\Column(name="abreviatura", type="string", length=5, nullable=false)
     */
    private $abreviatura;



    /**
     * Get idDepartamento
     *
     * @return integer 
     */
    public function getIdDepartamento()
    {
        return $this->idDepartamento;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatDepartamento
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
     * Set factor
     *
     * @param integer $factor
     * @return CatDepartamento
     */
    public function setFactor($factor)
    {
        $this->factor = $factor;
    
        return $this;
    }

    /**
     * Get factor
     *
     * @return integer 
     */
    public function getFactor()
    {
        return $this->factor;
    }

    /**
     * Set gis
     *
     * @param integer $gis
     * @return CatDepartamento
     */
    public function setGis($gis)
    {
        $this->gis = $gis;
    
        return $this;
    }

    /**
     * Get gis
     *
     * @return integer 
     */
    public function getGis()
    {
        return $this->gis;
    }

    /**
     * Set digestyc
     *
     * @param string $digestyc
     * @return CatDepartamento
     */
    public function setDigestyc($digestyc)
    {
        $this->digestyc = $digestyc;
    
        return $this;
    }

    /**
     * Get digestyc
     *
     * @return string 
     */
    public function getDigestyc()
    {
        return $this->digestyc;
    }

    /**
     * Set idRegion
     *
     * @param integer $idRegion
     * @return CatDepartamento
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
     * Set abreviatura
     *
     * @param string $abreviatura
     * @return CatDepartamento
     */
    public function setAbreviatura($abreviatura)
    {
        $this->abreviatura = $abreviatura;
    
        return $this;
    }

    /**
     * Get abreviatura
     *
     * @return string 
     */
    public function getAbreviatura()
    {
        return $this->abreviatura;
    }
}