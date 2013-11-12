<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class OnlyAlphanumericValidator extends ConstraintValidator
{
	public function validate($value, Constraint $constraint)
	{
		if (!preg_match('/^[a-zA-Za0-9 _]+$/', utf8_decode($value), $matches)) {
			$this->context->addViolation($constraint->message, array('%string%' => $value));
		}
	}
}
?>