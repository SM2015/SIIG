<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 */
	class AlphanumericPlus extends Constraint
	{
		public $message = 'The string "%string%" contains an illegal character: it can only contain letters, numbers or (. , \' �) or accented vowels or diaeresis.';
	}
?>