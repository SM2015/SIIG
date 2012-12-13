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
     * @ORM\ManyToMany(targetEntity="FichaTecnica", inversedBy="usuariosFavoritos")
     * @ORM\JoinTable(name="usuario_indicadores_favoritos",
     *      joinColumns={@ORM\JoinColumn(name="id_usuario", referencedColumnName="id", onDelete="CASCADE")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_indicador", referencedColumnName="id", onDelete="CASCADE")}
     *      )
     **/
    private $favoritos;
    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();
        $this->favoritos = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add favoritos
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $favoritos
     * @return User
     */
    public function addFavorito(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $favoritos)
    {
        $this->favoritos[] = $favoritos;
    
        return $this;
    }

    /**
     * Remove favoritos
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $favoritos
     */
    public function removeFavorito(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $favoritos)
    {
        $this->favoritos->removeElement($favoritos);
    }

    /**
     * Get favoritos
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFavoritos()
    {
        return $this->favoritos;
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
}