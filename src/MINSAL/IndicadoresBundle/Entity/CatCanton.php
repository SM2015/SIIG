<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatCanton
 *
 * @ORM\Table(name="cat_canton")
 * @ORM\Entity
 */
class CatCanton
{
    /**
     * @var integer $idCanton
     *
     * @ORM\Column(name="id_canton", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_canton_id_canton_seq", allocationSize=1, initialValue=1)
     */
    private $idCanton;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=false)
     */
    private $descripcion;

    /**
     * @var integer $idMunicipio
     *
     * @ORM\Column(name="id_municipio", type="integer", nullable=false)
     */
    private $idMunicipio;

    /**
     * @var string $digestyc
     *
     * @ORM\Column(name="digestyc", type="string", length=10, nullable=true)
     */
    private $digestyc;



    /**
     * Get idCanton
     *
     * @return integer 
     */
    public function getIdCanton()
    {
        return $this->idCanton;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatCanton
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
     * Set idMunicipio
     *
     * @param integer $idMunicipio
     * @return CatCanton
     */
    public function setIdMunicipio($idMunicipio)
    {
        $this->idMunicipio = $idMunicipio;
    
        return $this;
    }

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
     * Set digestyc
     *
     * @param string $digestyc
     * @return CatCanton
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
}