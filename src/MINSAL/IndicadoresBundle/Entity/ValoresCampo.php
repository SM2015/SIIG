<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\TablaDatos
 *
 * @ORM\Table(name="valores_campo")
 * @ORM\Entity
 */
class ValoresCampo
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="valores_campo_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string $nombre
     *
     * @ORM\Column(name="nombre", type="integer", nullable=false)
     */
    private $fila;
    
    /**
     * @var string $valor
     *
     * @ORM\Column(name="valor", type="string", length=255, nullable=true)
     */
    private $valor;
    
    /**
     * @ORM\ManyToOne(targetEntity="Campo")
     * @ORM\JoinColumn(name="id_campo", referencedColumnName="id")
     **/
    private $campo;
        
    

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
     * Set fila
     *
     * @param integer $fila
     * @return ValoresCampo
     */
    public function setFila($fila)
    {
        $this->fila = $fila;
    
        return $this;
    }

    /**
     * Get fila
     *
     * @return integer 
     */
    public function getFila()
    {
        return $this->fila;
    }

    /**
     * Set valor
     *
     * @param string $valor
     * @return ValoresCampo
     */
    public function setValor($valor)
    {
        $this->valor = $valor;
    
        return $this;
    }

    /**
     * Get valor
     *
     * @return string 
     */
    public function getValor()
    {
        return $this->valor;
    }

    /**
     * Set campo
     *
     * @param MINSAL\IndicadoresBundle\Entity\Campo $campo
     * @return ValoresCampo
     */
    public function setCampo(\MINSAL\IndicadoresBundle\Entity\Campo $campo = null)
    {
        $this->campo = $campo;
    
        return $this;
    }

    /**
     * Get campo
     *
     * @return MINSAL\IndicadoresBundle\Entity\Campo 
     */
    public function getCampo()
    {
        return $this->campo;
    }
}