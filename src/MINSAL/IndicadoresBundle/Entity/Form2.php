<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\Form2
 *
 * @ORM\Table(name="form_2")
 * @ORM\Entity
 */
class Form2
{
    /**
     * @var integer $id2
     *
     * @ORM\Column(name="id_2", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="form_2_id_2_seq", allocationSize=1, initialValue=1)
     */
    private $id2;

    /**
     * @var integer $idEstablecimiento
     *
     * @ORM\Column(name="id_establecimiento", type="integer", nullable=false)
     */
    private $idEstablecimiento;

    /**
     * @var integer $f2v1
     *
     * @ORM\Column(name="f2v1", type="integer", nullable=false)
     */
    private $f2v1;

    /**
     * @var integer $f2v2
     *
     * @ORM\Column(name="f2v2", type="integer", nullable=false)
     */
    private $f2v2;

    /**
     * @var integer $f2v3
     *
     * @ORM\Column(name="f2v3", type="integer", nullable=false)
     */
    private $f2v3;

    /**
     * @var integer $f2v4
     *
     * @ORM\Column(name="f2v4", type="integer", nullable=false)
     */
    private $f2v4;

    /**
     * @var integer $f2v5
     *
     * @ORM\Column(name="f2v5", type="integer", nullable=false)
     */
    private $f2v5;

    /**
     * @var integer $f2v6
     *
     * @ORM\Column(name="f2v6", type="integer", nullable=false)
     */
    private $f2v6;

    /**
     * @var integer $f2v7
     *
     * @ORM\Column(name="f2v7", type="integer", nullable=false)
     */
    private $f2v7;

    /**
     * @var integer $f2v8
     *
     * @ORM\Column(name="f2v8", type="integer", nullable=false)
     */
    private $f2v8;



    /**
     * Get id2
     *
     * @return integer 
     */
    public function getId2()
    {
        return $this->id2;
    }

    /**
     * Set idEstablecimiento
     *
     * @param integer $idEstablecimiento
     * @return Form2
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
     * Set f2v1
     *
     * @param integer $f2v1
     * @return Form2
     */
    public function setF2v1($f2v1)
    {
        $this->f2v1 = $f2v1;
    
        return $this;
    }

    /**
     * Get f2v1
     *
     * @return integer 
     */
    public function getF2v1()
    {
        return $this->f2v1;
    }

    /**
     * Set f2v2
     *
     * @param integer $f2v2
     * @return Form2
     */
    public function setF2v2($f2v2)
    {
        $this->f2v2 = $f2v2;
    
        return $this;
    }

    /**
     * Get f2v2
     *
     * @return integer 
     */
    public function getF2v2()
    {
        return $this->f2v2;
    }

    /**
     * Set f2v3
     *
     * @param integer $f2v3
     * @return Form2
     */
    public function setF2v3($f2v3)
    {
        $this->f2v3 = $f2v3;
    
        return $this;
    }

    /**
     * Get f2v3
     *
     * @return integer 
     */
    public function getF2v3()
    {
        return $this->f2v3;
    }

    /**
     * Set f2v4
     *
     * @param integer $f2v4
     * @return Form2
     */
    public function setF2v4($f2v4)
    {
        $this->f2v4 = $f2v4;
    
        return $this;
    }

    /**
     * Get f2v4
     *
     * @return integer 
     */
    public function getF2v4()
    {
        return $this->f2v4;
    }

    /**
     * Set f2v5
     *
     * @param integer $f2v5
     * @return Form2
     */
    public function setF2v5($f2v5)
    {
        $this->f2v5 = $f2v5;
    
        return $this;
    }

    /**
     * Get f2v5
     *
     * @return integer 
     */
    public function getF2v5()
    {
        return $this->f2v5;
    }

    /**
     * Set f2v6
     *
     * @param integer $f2v6
     * @return Form2
     */
    public function setF2v6($f2v6)
    {
        $this->f2v6 = $f2v6;
    
        return $this;
    }

    /**
     * Get f2v6
     *
     * @return integer 
     */
    public function getF2v6()
    {
        return $this->f2v6;
    }

    /**
     * Set f2v7
     *
     * @param integer $f2v7
     * @return Form2
     */
    public function setF2v7($f2v7)
    {
        $this->f2v7 = $f2v7;
    
        return $this;
    }

    /**
     * Get f2v7
     *
     * @return integer 
     */
    public function getF2v7()
    {
        return $this->f2v7;
    }

    /**
     * Set f2v8
     *
     * @param integer $f2v8
     * @return Form2
     */
    public function setF2v8($f2v8)
    {
        $this->f2v8 = $f2v8;
    
        return $this;
    }

    /**
     * Get f2v8
     *
     * @return integer 
     */
    public function getF2v8()
    {
        return $this->f2v8;
    }
}