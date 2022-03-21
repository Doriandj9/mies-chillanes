<?php 
namespace includes;

/**
 * @author Dorian Armijos
 * @link https://github.com/Doriandj9
 */

class Funciones {
    /**
     * La opcion de informar si es o no reutilizable
     * 
     * @var string 
     */
    private $reutilizacion;

    /**
     * @return string Es el mensaje que recivio
     */

    public function empezar(string $mensaje): string
    {
        return $mensaje;
    }
}
