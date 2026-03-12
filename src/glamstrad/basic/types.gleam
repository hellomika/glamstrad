import glamstrad/basic/function.{type Function}

pub type Statement {
  Statement(Command, Expression)
}

pub type Expression {
  Call(Function, List(Expression))
  Literal(Literal)
}

pub type Literal {
  IntLiteral(Int)
  RealLiteral(Float)
  StringLiteral(String)
  Nothing
}

pub type Error {
  SyntaxError
  InputError
  LexError
  ParseError
  ImproperArgument
  Overflow
  OverflowWith(Literal)
}

pub type Command {
  CLS
  PRINT
}
