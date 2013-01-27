<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Sonata\UserBundle\Entity\BaseUser as BaseUser;
use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\GroupInterface;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user_user")
 */
class User extends BaseUser{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
            
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="UsuarioGrupoIndicadores", mappedBy="grupoIndicadores", cascade={"all"}, orphanRemoval=true)
     **/
    private $gruposIndicadores;    
   
     
    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     * @ORM\OneToMany(targetEntity="UsuarioIndicador", mappedBy="indicadores" , cascade={"all"}, orphanRemoval=true)
     **/
    private $indicadores;
    
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
     * @var \Doctrine\Common\Collections\Collection
     */
    protected $groups;


    /**
     * Add groups
     *
     * @param \Application\Sonata\UserBundle\Entity\Group $groups
     * @return User
     */
    public function addGroup(GroupInterface $groups)
    {
        $this->groups[] = $groups;
    
        return $this;
    }

    /**
     * Remove groups
     *
     * @param \Application\Sonata\UserBundle\Entity\Group $groups
     */
    public function removeGroup(GroupInterface $groups)
    {
        $this->groups->removeElement($groups);
    }

    /**
     * Gets the groups granted to the user.
     *
     * @return Collection
     */
    public function getGroups()
    {
        return $this->groups ?: $this->groups = new ArrayCollection();
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->gruposIndicadores = new \Doctrine\Common\Collections\ArrayCollection();
        $this->indicadores = new \Doctrine\Common\Collections\ArrayCollection();
        $this->groups = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add gruposIndicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $gruposIndicadores
     * @return User
     */
    public function addGruposIndicadore(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $gruposIndicadores)
    {
        $this->gruposIndicadores[] = $gruposIndicadores;
    
        return $this;
    }

    /**
     * Remove gruposIndicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $gruposIndicadores
     */
    public function removeGruposIndicadore(\MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores $gruposIndicadores)
    {
        $this->gruposIndicadores->removeElement($gruposIndicadores);
    }

    /**
     * Get gruposIndicadores
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getGruposIndicadores()
    {
        return $this->gruposIndicadores;
    }

    /**
     * Add indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioIndicador $indicadores
     * @return User
     */
    public function addIndicadore(\MINSAL\IndicadoresBundle\Entity\UsuarioIndicador $indicadores)
    {
        $this->indicadores[] = $indicadores;
    
        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\UsuarioIndicador $indicadores
     */
    public function removeIndicadore(\MINSAL\IndicadoresBundle\Entity\UsuarioIndicador $indicadores)
    {
        $this->indicadores->removeElement($indicadores);
    }

    /**
     * Get indicadores
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getIndicadores()
    {
        return $this->indicadores;
    }
}