<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\FormCat
 *
 * @ORM\Table(name="form_cat")
 * @ORM\Entity
 */
class FormCat
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="form_cat_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer $orden
     *
     * @ORM\Column(name="orden", type="integer", nullable=false)
     */
    private $orden;

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
     * @var Catalogos
     *
     * @ORM\ManyToOne(targetEntity="Catalogos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cat", referencedColumnName="id_cat")
     * })
     */
    private $idCat;

    /**
     * @var Form
     *
     * @ORM\ManyToOne(targetEntity="Form")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_form", referencedColumnName="id_form")
     * })
     */
    private $idForm;



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
     * Set orden
     *
     * @param integer $orden
     * @return FormCat
     */
    public function setOrden($orden)
    {
        $this->orden = $orden;
    
        return $this;
    }

    /**
     * Get orden
     *
     * @return integer 
     */
    public function getOrden()
    {
        return $this->orden;
    }

    /**
     * Set objetivo
     *
     * @param string $objetivo
     * @return FormCat
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
     * @return FormCat
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
     * @return FormCat
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

    /**
     * Set idCat
     *
     * @param MINSAL\IndicadoresBundle\Entity\Catalogos $idCat
     * @return FormCat
     */
    public function setIdCat(\MINSAL\IndicadoresBundle\Entity\Catalogos $idCat = null)
    {
        $this->idCat = $idCat;
    
        return $this;
    }

    /**
     * Get idCat
     *
     * @return MINSAL\IndicadoresBundle\Entity\Catalogos 
     */
    public function getIdCat()
    {
        return $this->idCat;
    }

    /**
     * Set idForm
     *
     * @param MINSAL\IndicadoresBundle\Entity\Form $idForm
     * @return FormCat
     */
    public function setIdForm(\MINSAL\IndicadoresBundle\Entity\Form $idForm = null)
    {
        $this->idForm = $idForm;
    
        return $this;
    }

    /**
     * Get idForm
     *
     * @return MINSAL\IndicadoresBundle\Entity\Form 
     */
    public function getIdForm()
    {
        return $this->idForm;
    }
}