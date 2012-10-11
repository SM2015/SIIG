<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatUscfSiban
 *
 * @ORM\Table(name="cat_uscf_siban")
 * @ORM\Entity
 */
class CatUscfSiban
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_uscf_siban_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer $idEstablecimiento
     *
     * @ORM\Column(name="id_establecimiento", type="integer", nullable=true)
     */
    private $idEstablecimiento;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", nullable=true)
     */
    private $descripcion;

    /**
     * @var integer $idSibasi
     *
     * @ORM\Column(name="id_sibasi", type="integer", nullable=true)
     */
    private $idSibasi;

    /**
     * @var string $tipo
     *
     * @ORM\Column(name="tipo", type="string", nullable=true)
     */
    private $tipo;

    /**
     * @var integer $mesCreacion
     *
     * @ORM\Column(name="mes_creacion", type="integer", nullable=true)
     */
    private $mesCreacion;



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
     * Set idEstablecimiento
     *
     * @param integer $idEstablecimiento
     * @return CatUscfSiban
     */
    public function setIdEstablecimiento($idEstablecimiento)
    {
        $this->idEstablecimiento = $idEstablecimiento;
    
        return $this;
    }

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
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatUscfSiban
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
     * Set idSibasi
     *
     * @param integer $idSibasi
     * @return CatUscfSiban
     */
    public function setIdSibasi($idSibasi)
    {
        $this->idSibasi = $idSibasi;
    
        return $this;
    }

    /**
     * Get idSibasi
     *
     * @return integer 
     */
    public function getIdSibasi()
    {
        return $this->idSibasi;
    }

    /**
     * Set tipo
     *
     * @param string $tipo
     * @return CatUscfSiban
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
     * Set mesCreacion
     *
     * @param integer $mesCreacion
     * @return CatUscfSiban
     */
    public function setMesCreacion($mesCreacion)
    {
        $this->mesCreacion = $mesCreacion;
    
        return $this;
    }

    /**
     * Get mesCreacion
     *
     * @return integer 
     */
    public function getMesCreacion()
    {
        return $this->mesCreacion;
    }
}