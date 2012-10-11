<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\FichaTecnicaVariableDato
 *
 * @ORM\Table(name="ficha_tecnica_variable_dato")
 * @ORM\Entity
 */
class FichaTecnicaVariableDato
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ficha_tecnica_variable_dato_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer $orden
     *
     * @ORM\Column(name="orden", type="integer", nullable=true)
     */
    private $orden;

    /**
     * @var FichaTecnica
     *
     * @ORM\ManyToOne(targetEntity="FichaTecnica", inversedBy="variables")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_ficha_tecnica", referencedColumnName="id")
     * })
     */
    private $idFichaTecnica;

    /**
     * @var VariableDato
     *
     * @ORM\ManyToOne(targetEntity="VariableDato", inversedBy="fichasTecnicas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_variable_dato", referencedColumnName="id")
     * })
     */
    private $idVariableDato;



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
     * @return FichaTecnicaVariableDato
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
     * Set idFichaTecnica
     *
     * @param MINSAL\IndicadoresBundle\Entity\FichaTecnica $idFichaTecnica
     * @return FichaTecnicaVariableDato
     */
    public function setIdFichaTecnica(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $idFichaTecnica = null)
    {
        $this->idFichaTecnica = $idFichaTecnica;
    
        return $this;
    }

    /**
     * Get idFichaTecnica
     *
     * @return MINSAL\IndicadoresBundle\Entity\FichaTecnica 
     */
    public function getIdFichaTecnica()
    {
        return $this->idFichaTecnica;
    }

    /**
     * Set idVariableDato
     *
     * @param MINSAL\IndicadoresBundle\Entity\VariableDato $idVariableDato
     * @return FichaTecnicaVariableDato
     */
    public function setIdVariableDato(\MINSAL\IndicadoresBundle\Entity\VariableDato $idVariableDato = null)
    {
        $this->idVariableDato = $idVariableDato;
    
        return $this;
    }

    /**
     * Get idVariableDato
     *
     * @return MINSAL\IndicadoresBundle\Entity\VariableDato 
     */
    public function getIdVariableDato()
    {
        return $this->idVariableDato;
    }
}