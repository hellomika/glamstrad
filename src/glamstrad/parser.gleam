import glamstrad/basic/types.{Call, Literal, Nothing, Statement}
import glamstrad/lexer
import gleam/option.{None, Some}
import nibble

pub fn run(tokens) {
  nibble.run(tokens, statements())
}

fn statements() {
  use command <- nibble.do(command())
  use expression <- nibble.do(expression())
  nibble.return(Statement(command, expression))
}

fn command() {
  nibble.take_map("expected command", fn(token) {
    case token {
      lexer.Command(command) -> Some(command)
      _ -> None
    }
  })
}

fn expression() {
  nibble.one_of([
    literal(),
    call(),
    nibble.return(Literal(Nothing)),
  ])
}

fn literal() {
  nibble.take_map("expected expression", fn(token) {
    case token {
      lexer.Literal(literal) -> Some(Literal(literal))
      _ -> None
    }
  })
}

fn call() {
  use function <- nibble.do(function())
  use _ <- nibble.do(nibble.token(lexer.LParen))
  use arguments <- nibble.do(arguments())
  use _ <- nibble.do(nibble.token(lexer.RParen))
  nibble.return(Call(function, arguments))
}

fn function() {
  nibble.take_map("expected function", fn(token) {
    case token {
      lexer.Function(function) -> Some(function)
      _ -> None
    }
  })
}

fn arguments() {
  nibble.sequence(
    nibble.one_of([
      literal(),
      call(),
    ]),
    nibble.token(lexer.Comma),
  )
}
