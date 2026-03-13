import glamstrad/basic/screen
import glamstrad/basic/types
import glamstrad/lexer
import glamstrad/parser
import gleam/result
import gleam/string

pub fn init() -> Nil {
  screen.init()
}

pub fn run() -> Nil {
  case interpret() {
    Error(_) -> screen.syntax_error()
    _ -> Nil
  }
}

fn interpret() {
  use input <- result.try(prompt())
  use tokens <- result.try(lex(input))
  use statement <- result.try(parse(tokens))
  eval(statement)
}

fn prompt() {
  screen.prompt()
  |> result.map_error(fn(_) { types.InputError })
}

fn lex(input) {
  input
  |> string.trim()
  |> lexer.run()
  |> result.map_error(fn(_) { types.LexError })
}

fn parse(tokens) {
  tokens
  |> parser.run()
  |> result.map_error(fn(_) { types.ParseError })
}

fn eval(statement) {
  case statement {
    types.Statement(types.PRINT, types.Literal(literal)) ->
      screen.print(literal)

    types.Statement(types.CLS, types.Literal(types.NoArg)) -> screen.cls()
    _ -> Ok(Nil)
  }
}
