<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\Conexion;
use Doctrine\DBAL as DBAL;

/**
 * ConexionRepository
 * 
 */
class ConexionRepository extends EntityRepository {

    public function getConexionGenerica(Conexion $conexion) {
        // Construir el Conector genérico
        $config = new DBAL\Configuration();

        $connectionParams = array(
            'dbname' => $conexion->getNombreBaseDatos(),
            'user' => $conexion->getUsuario(),
            'password' => $conexion->getClave(),
            'host' => $conexion->getIp(),
            'driver' => $conexion->getIdMotor()->getCodigo()
        );
        if ($conexion->getPuerto() != '' and $conexion->getIdMotor()->getCodigo() != 'pdo_sqlite')
            $connectionParams['port'] = $conexion->getPuerto();

        $conn = DBAL\DriverManager::getConnection($connectionParams, $config);
        
        return $conn;
    }

}
