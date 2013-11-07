<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 */
	class ValidHTMLcolor extends Constraint
	{
		public $message = 'The string "%string%" contains an illegal character: it can only contain letters or numbers or #.';
	}
?>