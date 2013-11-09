<?php
namespace MINSAL\IndicadoresBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;

class LoadMaster
{
    public function save(array $datos, ObjectManager $manager, $class_obj)
    {
        $clase = explode('\\', get_class($class_obj));
        $clase = str_replace('Data','',str_replace('Load','',array_pop($clase)));
        $clase_ruta = 'MINSAL\\IndicadoresBundle\\Entity\\'.$clase;

        foreach ($datos as $i => $f) {
            $obj = new $clase_ruta();
            foreach ($f['campos'] as $k => $c) {
                call_user_func(array(&$obj, 'set' . $k), $c);
            }
            if (isset($f['foraneas']))
                foreach ($f['foraneas'] as $k=>$c) {
                    call_user_func(array(&$obj, 'set'.$k), $manager->merge($class_obj->getReference($c)));
                }
            $manager->persist($obj);

            $class_obj->addReference($clase . '-' . $i, $obj);
        }
        $manager->flush();
    }

}
