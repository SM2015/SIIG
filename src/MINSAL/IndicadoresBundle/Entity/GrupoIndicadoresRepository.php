<?php

namespace MINSAL\IndicadoresBundle\Entity;

use Doctrine\ORM\EntityRepository;

use MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;

/**
 * GrupoIndicadoresRepository
 *
 */
class GrupoIndicadoresRepository extends EntityRepository
{
    public function getIndicadoresSala(GrupoIndicadores $sala)
    {
        $em = $this->getEntityManager();

        $dql = "SELECT i.filtro, i.dimension, i.posicion, i.tipoGrafico, i.orden,
                    f.id as idIndicador, i.filtroPosicionDesde, i.filtroPosicionHasta,
                    i.filtroElementos, i.vista
                    FROM IndicadoresBundle:GrupoIndicadoresIndicador i
                    JOIN i.indicador f
                    WHERE
                        i.grupo = :sala";
        $query = $em->createQuery($dql);
        $query->setParameter('sala', $sala->getId());

        return $query->getArrayResult();
    }

}
