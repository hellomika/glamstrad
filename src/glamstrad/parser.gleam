import glamstrad/lexer.{Print, StringLiteral}
import gleam/option.{None, Some}
import nibble

pub type Statement {
  PrintStatement(value: String)
}

pub fn run(tokens) {
  nibble.run(tokens, print_parser())
}

fn print_parser() {
  use _ <- nibble.do(nibble.token(Print))
  use str <- nibble.do(string_literal())
  nibble.return(PrintStatement(str))
}

fn string_literal() {
  nibble.take_map("expected string", fn(token) {
    case token {
      StringLiteral(str) -> Some(str)
      _ -> None
    }
  })
}
