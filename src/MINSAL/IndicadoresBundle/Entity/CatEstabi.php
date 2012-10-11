<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatEstabi
 *
 * @ORM\Table(name="cat_estabi")
 * @ORM\Entity
 */
class CatEstabi
{
    /**
     * @var integer $idestasibi
     *
     * @ORM\Column(name="idestasibi", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_estabi_idestasibi_seq", allocationSize=1, initialValue=1)
     */
    private $idestasibi;

    /**
     * @var string $estasib
     *
     * @ORM\Column(name="estasib", type="string", length=150, nullable=true)
     */
    private $estasib;

    /**
     * @var integer $udep
     *
     * @ORM\Column(name="udep", type="integer", nullable=true)
     */
    private $udep;

    /**
     * @var integer $idMun
     *
     * @ORM\Column(name="id_mun", type="integer", nullable=true)
     */
    private $idMun;

    /**
     * @var integer $codigof
     *
     * @ORM\Column(name="codigof", type="integer", nullable=true)
     */
    private $codigof;



    /**
     * Get idestasibi
     *
     * @return integer 
     */
    public function getIdestasibi()
    {
        return $this->idestasibi;
    }

    /**
     * Set estasib
     *
     * @param string $estasib
     * @return CatEstabi
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
     * Set udep
     *
     * @param integer $udep
     * @return CatEstabi
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
     * Set idMun
     *
     * @param integer $idMun
     * @return CatEstabi
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
     * Set codigof
     *
     * @param integer $codigof
     * @return CatEstabi
     */
    public function setCodigof($codigof)
    {
        $this->codigof = $codigof;
    
        return $this;
    }

    /**
     * Get codigof
     *
     * @return integer 
     */
    public function getCodigof()
    {
        return $this->codigof;
    }
}