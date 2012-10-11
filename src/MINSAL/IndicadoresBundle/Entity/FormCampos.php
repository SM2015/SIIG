<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\FormCampos
 *
 * @ORM\Table(name="form_campos")
 * @ORM\Entity
 */
class FormCampos
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="form_campos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer $idForm
     *
     * @ORM\Column(name="id_form", type="integer", nullable=false)
     */
    private $idForm;

    /**
     * @var string $nombreCampoT
     *
     * @ORM\Column(name="nombre_campo_t", type="string", length=30, nullable=false)
     */
    private $nombreCampoT;

    /**
     * @var string $nombreCampoF
     *
     * @ORM\Column(name="nombre_campo_f", type="string", length=50, nullable=false)
     */
    private $nombreCampoF;

    /**
     * @var string $tipoCampo
     *
     * @ORM\Column(name="tipo_campo", type="string", length=25, nullable=false)
     */
    private $tipoCampo;

    /**
     * @var integer $tamanoCampo
     *
     * @ORM\Column(name="tamano_campo", type="integer", nullable=false)
     */
    private $tamanoCampo;

    /**
     * @var integer $ordenCampo
     *
     * @ORM\Column(name="orden_campo", type="integer", nullable=false)
     */
    private $ordenCampo;

    /**
     * @var integer $idCampo
     *
     * @ORM\Column(name="id_campo", type="integer", nullable=false)
     */
    private $idCampo;

    /**
     * @var string $objetivo
     *
     * @ORM\Column(name="objetivo", type="text", nullable=true)
     */
    private $objetivo;

    /**
     * @var integer $llave
     *
     * @ORM\Column(name="llave", type="integer", nullable=false)
     */
    private $llave;

    /**
     * @var integer $llaveg
     *
     * @ORM\Column(name="llaveg", type="integer", nullable=false)
     */
    private $llaveg;



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
     * Set idForm
     *
     * @param integer $idForm
     * @return FormCampos
     */
    public function setIdForm($idForm)
    {
        $this->idForm = $idForm;
    
        return $this;
    }

    /**
     * Get idForm
     *
     * @return integer 
     */
    public function getIdForm()
    {
        return $this->idForm;
    }

    /**
     * Set nombreCampoT
     *
     * @param string $nombreCampoT
     * @return FormCampos
     */
    public function setNombreCampoT($nombreCampoT)
    {
        $this->nombreCampoT = $nombreCampoT;
    
        return $this;
    }

    /**
     * Get nombreCampoT
     *
     * @return string 
     */
    public function getNombreCampoT()
    {
        return $this->nombreCampoT;
    }

    /**
     * Set nombreCampoF
     *
     * @param string $nombreCampoF
     * @return FormCampos
     */
    public function setNombreCampoF($nombreCampoF)
    {
        $this->nombreCampoF = $nombreCampoF;
    
        return $this;
    }

    /**
     * Get nombreCampoF
     *
     * @return string 
     */
    public function getNombreCampoF()
    {
        return $this->nombreCampoF;
    }

    /**
     * Set tipoCampo
     *
     * @param string $tipoCampo
     * @return FormCampos
     */
    public function setTipoCampo($tipoCampo)
    {
        $this->tipoCampo = $tipoCampo;
    
        return $this;
    }

    /**
     * Get tipoCampo
     *
     * @return string 
     */
    public function getTipoCampo()
    {
        return $this->tipoCampo;
    }

    /**
     * Set tamanoCampo
     *
     * @param integer $tamanoCampo
     * @return FormCampos
     */
    public function setTamanoCampo($tamanoCampo)
    {
        $this->tamanoCampo = $tamanoCampo;
    
        return $this;
    }

    /**
     * Get tamanoCampo
     *
     * @return integer 
     */
    public function getTamanoCampo()
    {
        return $this->tamanoCampo;
    }

    /**
     * Set ordenCampo
     *
     * @param integer $ordenCampo
     * @return FormCampos
     */
    public function setOrdenCampo($ordenCampo)
    {
        $this->ordenCampo = $ordenCampo;
    
        return $this;
    }

    /**
     * Get ordenCampo
     *
     * @return integer 
     */
    public function getOrdenCampo()
    {
        return $this->ordenCampo;
    }

    /**
     * Set idCampo
     *
     * @param integer $idCampo
     * @return FormCampos
     */
    public function setIdCampo($idCampo)
    {
        $this->idCampo = $idCampo;
    
        return $this;
    }

    /**
     * Get idCampo
     *
     * @return integer 
     */
    public function getIdCampo()
    {
        return $this->idCampo;
    }

    /**
     * Set objetivo
     *
     * @param string $objetivo
     * @return FormCampos
     */
    public function setObjetivo($objetivo)
    {
        $this->objetivo = $objetivo;
    
        return $this;
    }

    /**
     * Get objetivo
     *
     * @return string 
     */
    public function getObjetivo()
    {
        return $this->objetivo;
    }

    /**
     * Set llave
     *
     * @param integer $llave
     * @return FormCampos
     */
    public function setLlave($llave)
    {
        $this->llave = $llave;
    
        return $this;
    }

    /**
     * Get llave
     *
     * @return integer 
     */
    public function getLlave()
    {
        return $this->llave;
    }

    /**
     * Set llaveg
     *
     * @param integer $llaveg
     * @return FormCampos
     */
    public function setLlaveg($llaveg)
    {
        $this->llaveg = $llaveg;
    
        return $this;
    }

    /**
     * Get llaveg
     *
     * @return integer 
     */
    public function getLlaveg()
    {
        return $this->llaveg;
    }
}