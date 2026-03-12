import glamstrad/lexer.{Cls, Print, StringLiteral}
import gleam/option.{None, Some}
import nibble

pub type Statement {
  PrintStatement(value: String)
  ClsStatement
}

pub fn run(tokens) {
  nibble.run(tokens, nibble.one_of(parsers()))
}

fn parsers() {
  [
    print(),
    cls(),
  ]
}

fn print() {
  use _ <- nibble.do(nibble.token(Print))
  use str <- nibble.do(string_literal())
  nibble.return(PrintStatement(str))
}

fn cls() {
  use _ <- nibble.do(nibble.token(Cls))
  nibble.return(ClsStatement)
}

fn string_literal() {
  nibble.take_map("expected string", fn(token) {
    case token {
      StringLiteral(str) -> Some(str)
      _ -> None
    }
  })
}
