import glamstrad/basic/screen
import glamstrad/lexer
import glamstrad/parser
import gleam/result
import gleam/string

pub type Error {
  InputError
  LexError
  ParseError
}

pub fn init() {
  screen.init()
}

pub fn run() {
  case interpret() {
    Error(_) -> screen.syntax_error()
    _ -> Nil
  }
}

fn interpret() {
  use input <- result.try(prompt())
  use tokens <- result.try(lex(input))
  use command <- result.try(parse(tokens))
  eval(command)
}

fn prompt() {
  screen.prompt()
  |> result.map_error(fn(_) { InputError })
}

fn lex(input) {
  input
  |> string.trim()
  |> lexer.run()
  |> result.map_error(fn(_) { LexError })
}

fn parse(tokens) {
  tokens
  |> parser.run()
  |> result.map_error(fn(_) { ParseError })
}

fn eval(command) {
  case command {
    parser.PrintStatement(str) -> screen.print(str)
    parser.ClsStatement -> screen.cls()
  }
}
