pub type Statement {
  Statement(Command, Expression)
}

pub type Expression {
  Call(Function, List(Expression))
  Literal(Literal)
}

pub type Function {
  MathFunction(MathFunction)
  StringFunction(StringFunction)
}

pub type Literal {
  IntLiteral(Int)
  RealLiteral(Float)
  StringLiteral(String)
  Nothing
}

pub type Number {
  IntNumber(Int)
  RealNumber(Float)
}

pub type Error {
  SyntaxError
  InputError
  LexError
  ParseError
  ImproperArgument
  TypeMismatch
  Overflow
  OverflowWith(Literal)
}

pub type Command {
  CLS
  PRINT
}

pub type MathFunction {
  ABS
  ATN
  CINT
  COS
  EXP
  FIX
  INT
  LOG10
  LOG
  ROUND
  SGN
  SIN
  SQR
  TAN
}

pub type StringFunction {
  BIN
  HEX
  STR
}
