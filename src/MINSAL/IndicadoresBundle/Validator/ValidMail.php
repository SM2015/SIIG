<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 */
	class ValidMail extends Constraint
	{
		public $message = 'The string "%string%" is not a valid email account.';
	}
?>