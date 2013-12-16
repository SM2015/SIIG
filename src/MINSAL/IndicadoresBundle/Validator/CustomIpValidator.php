<?php
namespace MINSAL\IndicadoresBundle\Validator;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class CustomIpValidator extends ConstraintValidator
{
	public function validate($value, Constraint $constraint)
	{
		if (!preg_match('/^[a-zA-Za0-9.\/]+$/', $value, $matches)) {
			$this->context->addViolation($constraint->message, array('%string%' => $value));
		}
	}
}
?>