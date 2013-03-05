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
     * @ORM\OneToMany(targetEntity="UsuarioGrupoIndicadores", mappedBy="usuario", cascade={"all"}, orphanRemoval=true)
     **/
    protected $gruposIndicadores;    
   
     /**
      * @ORM\ManyToMany(targetEntity="FichaTecnica", inversedBy="usuariosFavoritos")
      * @ORM\JoinTable(name="usuario_indicadores_favoritos",
      *      joinColumns={@ORM\JoinColumn(name="id_usuario", referencedColumnName="id", onDelete="CASCADE")},
      *      inverseJoinColumns={@ORM\JoinColumn(name="id_indicador", referencedColumnName="id", onDelete="CASCADE")}
      *      )
      **/
    private $favoritos;
    
    
    /**
     * @ORM\ManyToMany(targetEntity="FichaTecnica", inversedBy="usuarios")
     * @ORM\JoinTable(name="indicador_usuario",
     *      joinColumns={@ORM\JoinColumn(name="id_usuario", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="id_indicador", referencedColumnName="id")}
     *      )
     * @ORM\OrderBy({"nombre" = "ASC"})
     **/
    protected $indicadores;
    
    /**
     * 
     * @var clasificacionUso
     *
     * @ORM\ManyToOne(targetEntity="ClasificacionUso")
     * @ORM\OrderBy({"codigo" = "ASC"})
     **/
    private $clasificacionUso;
    
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
        parent::__construct();
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
     * Set clasificacionUso
     *
     * @param \MINSAL\IndicadoresBundle\Entity\ClasificacionUso $clasificacionUso
     * @return User
     */
    public function setClasificacionUso(\MINSAL\IndicadoresBundle\Entity\ClasificacionUso $clasificacionUso = null)
    {
        $this->clasificacionUso = $clasificacionUso;
    
        return $this;
    }

    /**
     * Get clasificacionUso
     *
     * @return \MINSAL\IndicadoresBundle\Entity\ClasificacionUso 
     */
    public function getClasificacionUso()
    {
        return $this->clasificacionUso;
    }

    /**
     * Add indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     * @return User
     */
    public function addIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
    {
        $this->indicadores[] = $indicadores;
    
        return $this;
    }

    /**
     * Remove indicadores
     *
     * @param \MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores
     */
    public function removeIndicadore(\MINSAL\IndicadoresBundle\Entity\FichaTecnica $indicadores)
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