<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\Conexion;
use Doctrine\DBAL as DBAL;

/**
 * ConexionRepository
 *
 */
class ConexionRepository extends EntityRepository
{
    public function getConexionGenerica(Conexion $conexion)
    {
        if ($conexion->getIdMotor()->getCodigo() == 'pdo_dblib') {
            $servername = $conexion->getIp();
            if ($conexion->getPuerto() != '')
                $servername .= ',' . $conexion->getPuerto();
            $conn = mssql_connect($servername, $conexion->getUsuario(), $conexion->getClave());
            mssql_select_db($conexion->getNombreBaseDatos(), $conn);
        } else {
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
        }

        return $conn;
    }

}
