<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Boletin
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="MINSAL\IndicadoresBundle\Entity\BoletinRepository")
 */
class Boletin
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100)
     */
    private $nombre;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="creado", type="datetime")
     */
    private $creado;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="actualizado", type="datetime")
     */
    private $actualizado;

    /**
     * @var string
     *
     * @ORM\Column(name="token", type="string", length=72)
     */
    private $token;

	/**
     * @ORM\ManyToOne(targetEntity="GrupoIndicadores")
     * @ORM\JoinColumn(name="sala", referencedColumnName="id")
     * @return integer
     */
    
    private $sala;

    /**
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\Group")
     * @ORM\JoinColumn(name="grupo", referencedColumnName="id")
     * @return integer
     */
    private $grupo;
	
	/**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="UsuarioGrupoIndicadores", mappedBy="grupoIndicadores" , cascade={"all"}, orphanRemoval=true)
     **/
    private $usuarios;
	/**
     * @var \boolean
     */
	private $enviar;
	public function __construct()
    {
		$this->usuarios = new \Doctrine\Common\Collections\ArrayCollection();
        $this->setCreado(new \DateTime());
        $this->setActualizado(new \DateTime());
		
		$todos = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$valor="";
		for($i=0;$i<72;$i++) 
			$valor.= substr($todos,rand(0,62),1);
		$this->setToken($valor);
    }
	/**
     * @ORM\PreUpdate
     */
    public function setUpdatedValue()
    {
       $this->setActualizado(new \DateTime());
    }
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
     * Get enviar
     *
     * @return boolean 
     */
	public function getEnviar()
    {
        return $this->enviar;
    }
	/**
     * Set enviar
     *
     * @param boolean $enviar
     * @return Boletin
     */
	public function setEnviar($enviar)
    {
        $this->enviar = $enviar;
    
        return $this;
    }
    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Boletin
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    
        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set creado
     *
     * @param \DateTime $creado
     * @return Boletin
     */
    public function setCreado($creado)
    {
        $this->creado = $creado;
    
        return $this;
    }

    /**
     * Get creado
     *
     * @return \DateTime 
     */
    public function getCreado()
    {
        return $this->creado;
    }

    /**
     * Set actualizado
     *
     * @param \DateTime $actualizado
     * @return Boletin
     */
    public function setActualizado($actualizado)
    {
        $this->actualizado = $actualizado;
    	
        return $this;
    }

    /**
     * Get actualizado
     *
     * @return \DateTime 
     */
    public function getActualizado()
    {
        return $this->actualizado;
    }

    /**
     * Set token
     *
     * @param string $token
     * @return Boletin
     */
    public function setToken($token)
    {
        $this->token = $token;
    
        return $this;
    }

    /**
     * Get token
     *
     * @return string 
     */
    public function getToken()
    {
        return $this->token;
    }

    /**
     * Set sala
     *
     * @param integer $sala
     * @return Boletin
     */
    public function setSala($sala)
    {
        $this->sala = $sala;
    
        return $this;
    }

    /**
     * Get sala
     *
     * @return integer 
     */
    public function getSala()
    {
        return $this->sala;
    }

    /**
     * Set grupo
     *
     * @param integer $grupo
     * @return Boletin
     */
    public function setGrupo($grupo)
    {
        $this->grupo = $grupo;
    
        return $this;
    }

    /**
     * Get grupo
     *
     * @return integer 
     */
    public function getGrupo()
    {
        return $this->grupo;
    }
	
	/**
     * Get usuarios
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsuarios()
    {
        return $this->usuarios;
    }		

    /**
     * Add usuarios
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios
     * @return Boletin
     */
    public function addUsuario(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios)
    {
        $this->usuarios[] = $usuarios;
    
        return $this;
    }

    /**
     * Remove usuarios
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios
     */
    public function removeUsuario(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $usuarios)
    {
        $this->usuarios->removeElement($usuarios);
    }
	
	public function __toString() {
        return $this->nombre ? :'';
    }
}