import glamstrad/basic/types.{
  type Error, type Literal, type Number, InputError, IntLiteral, IntNumber,
  RealLiteral, RealNumber, SyntaxError,
}

pub fn single_arg(lits: List(Literal)) -> Result(Literal, Error) {
  case lits {
    [lit] -> Ok(lit)
    _ -> Error(SyntaxError)
  }
}

pub fn to_number(lit: Literal) -> Result(Number, Error) {
  case lit {
    IntLiteral(n) -> Ok(IntNumber(n))
    RealLiteral(n) -> Ok(RealNumber(n))
    _ -> Error(InputError)
  }
}
