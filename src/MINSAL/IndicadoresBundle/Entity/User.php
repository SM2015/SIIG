<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Sonata\UserBundle\Entity\BaseUser as BaseUser;
use Doctrine\ORM\Mapping as ORM;

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
     * @ORM\ManyToMany(targetEntity="FichaTecnica")
     * @ORM\JoinTable(name="usuario_indicadores_favoritos",
     *      joinColumns={@ORM\JoinColumn(name="id_usuario", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_indicador", referencedColumnName="id")}
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
}