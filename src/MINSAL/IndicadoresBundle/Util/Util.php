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

    public function encriptar_clave($cadena) {
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $key = md5('m1ns4l');

        $crypttext = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $cadena, MCRYPT_MODE_ECB, $iv);
        return base64_encode($crypttext);
    }

    public function desencriptar_clave($cadena) {
        $cadena = base64_decode($cadena);
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $key = md5('m1ns4l');

        $texto = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, $cadena, MCRYPT_MODE_ECB, $iv);
        return $texto;
    }

    public function validar($dato, $tipo) {
        switch ($tipo) {
            case 'date':
                $dato_aux = explode("-", $dato);
                if (count($dato_aux) != 3)
                    return false;
                if (is_numeric($dato_aux[0]) && is_numeric($dato_aux[1]) && is_numeric($dato_aux[2])) {
                    return checkdate($dato_aux[1], $dato_aux[2], $dato_aux[0]);
                }
                return false;
                break;
            case 'integer':
                return ( preg_match( '/^\d*$/'  , $dato) == 1 );
                break;
            case 'float':
                return is_numeric($dato);
                break;
            case 'varchar(255)':
                return (strlen($dato)<=255);
                break;            
            default:
                return true;
        }
    }
    /**
     * Creates a temporary file.
     * The file is not created if the $content argument is null
     *
     * @param  string $content  Optional content for the temporary file
     * @param  string $extension An optional extension for the filename
     *
     * @return string The filename
     */
    public function createTemporaryFile($content = null, $extension = null)
    {
        $ruta = dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR. '..'.DIRECTORY_SEPARATOR.
                '..'.DIRECTORY_SEPARATOR.'web'.DIRECTORY_SEPARATOR.'uploads'.DIRECTORY_SEPARATOR.'tmp'.DIRECTORY_SEPARATOR;
        $filename = $ruta . uniqid('indicadores', true);
        
        if (null !== $extension) {
            $filename .= '.'.$extension;
        }
        if (null !== $content) {
            file_put_contents($filename, $content);
        }        
        return $filename;
    }

}
