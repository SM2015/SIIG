<?php

namespace MINSAL\IndicadoresBundle;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Procesador de datos extra para registro de Vitacora SIIG
 */
class FormatoVitacora
{
    /*
     * @var $container
     */
    private $container;

    /**
     * Toma un objeto @service_container:
     * @param \Symfony\Component\DependencyInjection\ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    /**
     * Funcion Principal, toma el registro, agrega datos y devuelve el registro modificado
     * @param  array $record
     * @return array
     */
    public function __invoke(array $record)
    {
        $token = $this->container->get('security.context')->getToken();

        $user_arr = null;
        if (is_object($token) && is_object($token->getUser())) {
            $user = $token->getUser();
            $user_arr = array(
                "id" => $user->getId(),
      "IP" => $this->container->get('request')->getClientIp(),
                "username" => $user->getUsername(),
                "email" => $user->getEmail(),
            );
        }

        $record['extra']['user'] = $user_arr;

        return $record;
    }
}
