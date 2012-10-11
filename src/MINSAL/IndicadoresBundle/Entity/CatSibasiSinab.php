<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatSibasiSinab
 *
 * @ORM\Table(name="cat_sibasi_sinab")
 * @ORM\Entity
 */
class CatSibasiSinab
{
    /**
     * @var integer $idsibasiSinab
     *
     * @ORM\Column(name="idsibasi_sinab", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_sibasi_sinab_idsibasi_sinab_seq", allocationSize=1, initialValue=1)
     */
    private $idsibasiSinab;

    /**
     * @var string $nomsibasi
     *
     * @ORM\Column(name="nomsibasi", type="string", length=100, nullable=false)
     */
    private $nomsibasi;

    /**
     * @var integer $idRegion
     *
     * @ORM\Column(name="id_region", type="integer", nullable=false)
     */
    private $idRegion;



    /**
     * Get idsibasiSinab
     *
     * @return integer 
     */
    public function getIdsibasiSinab()
    {
        return $this->idsibasiSinab;
    }

    /**
     * Set nomsibasi
     *
     * @param string $nomsibasi
     * @return CatSibasiSinab
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
     * Set idRegion
     *
     * @param integer $idRegion
     * @return CatSibasiSinab
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
}