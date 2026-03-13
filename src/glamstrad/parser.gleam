import glamstrad/basic/types.{
  IntLiteral, Literal, NoArg, RealLiteral, Statement, StringLiteral,
}

import glamstrad/lexer
import gleam/option.{None, Some}
import nibble

pub fn run(tokens) {
  nibble.run(tokens, nibble.one_of(parsers()))
}

fn parsers() {
  [
    print(),
    commands(),
  ]
}

fn print() {
  use _ <- nibble.do(nibble.token(lexer.Print))
  use expression <- nibble.do(expression())
  nibble.return(Statement(types.PRINT, expression))
}

fn commands() {
  nibble.take_map("expected command", fn(token) {
    case token {
      lexer.Command("CLS") -> Some(Statement(types.CLS, Literal(NoArg)))
      _ -> None
    }
  })
}

fn expression() {
  nibble.one_of([
    nibble.take_map("expected expression", fn(token) {
      case token {
        lexer.StringLiteral(str) -> Some(Literal(StringLiteral(str)))
        lexer.RealLiteral(float) -> Some(Literal(RealLiteral(float)))
        lexer.IntLiteral(int) -> Some(Literal(IntLiteral(int)))
        _ -> None
      }
    }),
    nibble.return(Literal(NoArg)),
  ])
}
