import gleam/list
import gleam/string
import nibble/lexer

pub type Token {
  Print
  Cls
  StringLiteral(String)
}

pub fn run(input: String) {
  lexer.run(input, lexer())
}

fn lexer() {
  lexer.simple(
    list.flatten([
      commands(),
      [
        lexer.string("\"", StringLiteral),
        lexer.whitespace(Nil) |> lexer.ignore(),
      ],
    ]),
  )
}

fn commands() {
  [
    command_token("PRINT", Print),
    lexer.token("?", Print),
    command_token("CLS", Cls),
  ]
}

fn command_token(command: String, token: Token) {
  lexer.keep(fn(lexeme, _lookahead) {
    case string.uppercase(lexeme) == command {
      True -> Ok(token)
      False -> Error(Nil)
    }
  })
}
