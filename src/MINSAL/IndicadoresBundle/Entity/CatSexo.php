<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\CatSexo
 *
 * @ORM\Table(name="cat_sexo")
 * @ORM\Entity
 */
class CatSexo
{
    /**
     * @var integer $idSexo
     *
     * @ORM\Column(name="id_sexo", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cat_sexo_id_sexo_seq", allocationSize=1, initialValue=1)
     */
    private $idSexo;

    /**
     * @var string $descripcion
     *
     * @ORM\Column(name="descripcion", type="string", length=50, nullable=false)
     */
    private $descripcion;

    /**
     * @var string $inicial
     *
     * @ORM\Column(name="inicial", type="string", length=5, nullable=false)
     */
    private $inicial;



    /**
     * Get idSexo
     *
     * @return integer 
     */
    public function getIdSexo()
    {
        return $this->idSexo;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     * @return CatSexo
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
     * Set inicial
     *
     * @param string $inicial
     * @return CatSexo
     */
    public function setInicial($inicial)
    {
        $this->inicial = $inicial;
    
        return $this;
    }

    /**
     * Get inicial
     *
     * @return string 
     */
    public function getInicial()
    {
        return $this->inicial;
    }
}