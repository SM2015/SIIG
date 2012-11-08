<?php

namespace MINSAL\IndicadoresBundle\Util;

class Util {

    public function slug($text) {        
        $text = str_replace(array('á', 'é', 'í', 'ó', 'ú', 'ñ', 'Á', 'É', 'Í', 'Ó', 'Ú', 'Ñ'), array('a', 'e', 'i', 'o', 'u', 'ni', 'A', 'E', 'I', 'O', 'U', 'NI'), $text);
        $text = preg_replace('/\W+/', '_', $text);

        // trim and lowercase
        $text = strtolower(trim($text, '_'));
        
        return $text;
    }

}

?>
