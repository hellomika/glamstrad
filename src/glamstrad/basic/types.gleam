pub type Statement {
  Statement(Command, Expression)
}

pub type Command {
  PRINT
  CLS
}

pub type Expression {
  // Call(Function, Expression)
  Literal(Literal)
}

// pub type Function {
// }

pub type Literal {
  StringLiteral(String)
  RealLiteral(Float)
  IntLiteral(Int)
  NoArg
}

pub type Error {
  InputError
  LexError
  ParseError
  ImproperArgument
  Overflow
  OverflowWith(Literal)
}
