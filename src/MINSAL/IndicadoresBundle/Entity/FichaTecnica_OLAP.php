<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;
use MINSAL\IndicadoresBundle\Entity\FichaTecnica;

class FichaTecnicaRepository extends EntityRepository {

    public function crearTablaIndicador(FichaTecnica $fichaTecnica, $duracion=10) {

   //Actualizar  solo despues de 10 o mas minutos
        $ahora = new \DateTime("now");
        if ($fichaTecnica->getUpdatedAt() != ''){            
            $ultimo_calculo = $fichaTecnica->getUpdatedAt()->getTimestamp();
            $diff_minutos = ($ahora->getTimestamp() - $ultimo_calculo) / 60;
            if ($diff_minutos <= $duracion)
                return;
        }

        $em = $this->getEntityManager();
        $fichaTecnica->setUpdatedAt($ahora);
        $em->persist($fichaTecnica);
        $em->flush();
	
	//Invocar  la funcion interna 
	//de postgres para crear cubos
        $sql='SELECT * FROM cargar_cubos();';
        $em->getConnection()->exec($sql);
    }
    	//SIN USO : se remplaza con llamadas AJAX al servidor OLAP
    public function calcularIndicador(FichaTecnica $fichaTecnica, $dimension, $filtro_registros=null) {
        $util = new \MINSAL\IndicadoresBundle\Util\Util();
        $formula = str_replace(array('{','}'), array('SUM(',')'), $fichaTecnica->getFormula());
        $nombre_indicador = $util->slug($fichaTecnica->getNombre());
        $tabla_indicador = 'tmp_ind_'.$nombre_indicador;
        
        $sql = "SELECT $dimension as category, round(($formula)::numeric,2) as measure
            FROM $tabla_indicador ";
        if ($filtro_registros != null){
            $sql .= ' WHERE 1=1 ';
            foreach ($filtro_registros as $campo => $valor)
                $sql .= " AND $campo = '$valor' ";
        }
        $sql .= "
            GROUP BY $dimension             
            HAVING (($formula)::numeric) > 0
            ORDER BY $dimension";                
        return $this->getEntityManager()->getConnection()->executeQuery($sql)->fetchAll();
    }

}
