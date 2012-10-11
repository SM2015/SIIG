<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatMunicipio
 *
 * @ORM\Table(name="cat_municipio")
 * @ORM\Entity
 */
class CatMunicipio
{
    /**
     * @var integer $idMunicipio
     *
     * @ORM\Column(name="id_municipio", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_municipio_id_municipio_seq", allocationSize=1, initialValue=1)
     */
    private $idMunicipio;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=100, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $deptoDigestyc
     *
     * @ORM\Column(name="depto_digestyc", type="string", length=5, nullable=true)
     */
    private $deptoDigestyc;

    /**
     * @var string $municDigestyc
     *
     * @ORM\Column(name="munic_digestyc", type="string", length=5, nullable=true)
     */
    private $municDigestyc;

    /**
     * @var string $abrevDepto
     *
     * @ORM\Column(name="abrev_depto", type="string", length=5, nullable=true)
     */
    private $abrevDepto;

    /**
     * @var string $abrevMunicipio
     *
     * @ORM\Column(name="abrev_municipio", type="string", length=25, nullable=true)
     */
    private $abrevMunicipio;

    /**
     * @var CatDepartamento
     *
     * @ORM\ManyToOne(targetEntity="CatDepartamento")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_departamento", referencedColumnName="id_departamento")
     * })
     */
    private $idDepartamento;



    /**
     * Get idMunicipio
     *
     * @return integer 
     */
    public function getIdMunicipio()
    {
        return $this->idMunicipio;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatMunicipio
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
     * Set deptoDigestyc
     *
     * @param string $deptoDigestyc
     * @return CatMunicipio
     */
    public function setDeptoDigestyc($deptoDigestyc)
    {
        $this->deptoDigestyc = $deptoDigestyc;
    
        return $this;
    }

    /**
     * Get deptoDigestyc
     *
     * @return string 
     */
    public function getDeptoDigestyc()
    {
        return $this->deptoDigestyc;
    }

    /**
     * Set municDigestyc
     *
     * @param string $municDigestyc
     * @return CatMunicipio
     */
    public function setMunicDigestyc($municDigestyc)
    {
        $this->municDigestyc = $municDigestyc;
    
        return $this;
    }

    /**
     * Get municDigestyc
     *
     * @return string 
     */
    public function getMunicDigestyc()
    {
        return $this->municDigestyc;
    }

    /**
     * Set abrevDepto
     *
     * @param string $abrevDepto
     * @return CatMunicipio
     */
    public function setAbrevDepto($abrevDepto)
    {
        $this->abrevDepto = $abrevDepto;
    
        return $this;
    }

    /**
     * Get abrevDepto
     *
     * @return string 
     */
    public function getAbrevDepto()
    {
        return $this->abrevDepto;
    }

    /**
     * Set abrevMunicipio
     *
     * @param string $abrevMunicipio
     * @return CatMunicipio
     */
    public function setAbrevMunicipio($abrevMunicipio)
    {
        $this->abrevMunicipio = $abrevMunicipio;
    
        return $this;
    }

    /**
     * Get abrevMunicipio
     *
     * @return string 
     */
    public function getAbrevMunicipio()
    {
        return $this->abrevMunicipio;
    }

    /**
     * Set idDepartamento
     *
     * @param MINSAL\IndicadoresBundle\Entity\CatDepartamento $idDepartamento
     * @return CatMunicipio
     */
    public function setIdDepartamento(\MINSAL\IndicadoresBundle\Entity\CatDepartamento $idDepartamento = null)
    {
        $this->idDepartamento = $idDepartamento;
    
        return $this;
    }

    /**
     * Get idDepartamento
     *
     * @return MINSAL\IndicadoresBundle\Entity\CatDepartamento 
     */
    public function getIdDepartamento()
    {
        return $this->idDepartamento;
    }
}