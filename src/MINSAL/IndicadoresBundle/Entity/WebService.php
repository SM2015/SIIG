<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MINSAL\IndicadoresBundle\Entity\WebService
 *
 * @ORM\Table(name="web_service")
 * @ORM\Entity
 */
class WebService
{
    /**
     * @var integer $idWebService
     *
     * @ORM\Column(name="id_web_service", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="web_service_id_web_service_seq", allocationSize=1, initialValue=1)
     */
    private $idWebService;

    /**
     * @var string $nombreWebService
     *
     * @ORM\Column(name="nombre_web_service", type="string", length=100, nullable=false)
     */
    private $nombreWebService;

    /**
     * @var string $urlWebService
     *
     * @ORM\Column(name="url_web_service", type="string", length=150, nullable=false)
     */
    private $urlWebService;

    /**
     * @var string $nombreFuncWebService
     *
     * @ORM\Column(name="nombre_func_web_service", type="string", length=100, nullable=false)
     */
    private $nombreFuncWebService;

    /**
     * @var string $credencialesUsuario
     *
     * @ORM\Column(name="credenciales_usuario", type="string", length=150, nullable=false)
     */
    private $credencialesUsuario;

    /**
     * @var string $sentenciaConsulta
     *
     * @ORM\Column(name="sentencia_consulta", type="string", length=500, nullable=false)
     */
    private $sentenciaConsulta;

    /**
     * @var string $comentario
     *
     * @ORM\Column(name="comentario", type="text", nullable=true)
     */
    private $comentario;



    /**
     * Get idWebService
     *
     * @return integer 
     */
    public function getIdWebService()
    {
        return $this->idWebService;
    }

    /**
     * Set nombreWebService
     *
     * @param string $nombreWebService
     * @return WebService
     */
    public function setNombreWebService($nombreWebService)
    {
        $this->nombreWebService = $nombreWebService;
    
        return $this;
    }

    /**
     * Get nombreWebService
     *
     * @return string 
     */
    public function getNombreWebService()
    {
        return $this->nombreWebService;
    }

    /**
     * Set urlWebService
     *
     * @param string $urlWebService
     * @return WebService
     */
    public function setUrlWebService($urlWebService)
    {
        $this->urlWebService = $urlWebService;
    
        return $this;
    }

    /**
     * Get urlWebService
     *
     * @return string 
     */
    public function getUrlWebService()
    {
        return $this->urlWebService;
    }

    /**
     * Set nombreFuncWebService
     *
     * @param string $nombreFuncWebService
     * @return WebService
     */
    public function setNombreFuncWebService($nombreFuncWebService)
    {
        $this->nombreFuncWebService = $nombreFuncWebService;
    
        return $this;
    }

    /**
     * Get nombreFuncWebService
     *
     * @return string 
     */
    public function getNombreFuncWebService()
    {
        return $this->nombreFuncWebService;
    }

    /**
     * Set credencialesUsuario
     *
     * @param string $credencialesUsuario
     * @return WebService
     */
    public function setCredencialesUsuario($credencialesUsuario)
    {
        $this->credencialesUsuario = $credencialesUsuario;
    
        return $this;
    }

    /**
     * Get credencialesUsuario
     *
     * @return string 
     */
    public function getCredencialesUsuario()
    {
        return $this->credencialesUsuario;
    }

    /**
     * Set sentenciaConsulta
     *
     * @param string $sentenciaConsulta
     * @return WebService
     */
    public function setSentenciaConsulta($sentenciaConsulta)
    {
        $this->sentenciaConsulta = $sentenciaConsulta;
    
        return $this;
    }

    /**
     * Get sentenciaConsulta
     *
     * @return string 
     */
    public function getSentenciaConsulta()
    {
        return $this->sentenciaConsulta;
    }

    /**
     * Set comentario
     *
     * @param string $comentario
     * @return WebService
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;
    
        return $this;
    }

    /**
     * Get comentario
     *
     * @return string 
     */
    public function getComentario()
    {
        return $this->comentario;
    }
}