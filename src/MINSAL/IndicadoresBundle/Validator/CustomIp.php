<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 */
	class CustomIp extends Constraint
	{
		public $message = 'The string "%string%" contains an illegal character: it can only contain letters, numbers or (. \/)';
	}
?>