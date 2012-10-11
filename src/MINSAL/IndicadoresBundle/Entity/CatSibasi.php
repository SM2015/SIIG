<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatSibasi
 *
 * @ORM\Table(name="cat_sibasi")
 * @ORM\Entity
 */
class CatSibasi
{
    /**
     * @var integer $idsibasi
     *
     * @ORM\Column(name="idsibasi", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_sibasi_idsibasi_seq", allocationSize=1, initialValue=1)
     */
    private $idsibasi;

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
     * Get idsibasi
     *
     * @return integer 
     */
    public function getIdsibasi()
    {
        return $this->idsibasi;
    }

    /**
     * Set nomsibasi
     *
     * @param string $nomsibasi
     * @return CatSibasi
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
     * @return CatSibasi
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