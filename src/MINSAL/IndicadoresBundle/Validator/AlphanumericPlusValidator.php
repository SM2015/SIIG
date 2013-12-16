<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class AlphanumericPlusValidator extends ConstraintValidator
{
	public function validate($value, Constraint $constraint)
	{
		if(!empty($value)){
			if (!preg_match('/^[a-zA-Za0-9 áéíóúüÁÉÍÓÚÜ\'ñÑ.,\r\n_\-%]+$/', $value, $matches)) {
				$this->context->addViolation($constraint->message, array('%string%' => $value));
			}
		}
	}
}
?>