import glamstrad/lexer
import glamstrad/parser.{PrintStatement}
import gleam/io
import gleam/result
import gleam/string
import in

pub type Error {
  InputError
  LexError
  ParseError
}

pub fn main() {
  repl()
}

fn repl() {
  case interpret() {
    Error(_) -> io.println("Syntax error")
    _ -> Nil
  }

  repl()
}

fn interpret() {
  use input <- result.try(prompt())
  use tokens <- result.try(lex(input))
  use command <- result.try(parse(tokens))
  eval(command)
}

fn prompt() {
  io.println("Ready")
  in.read_line() |> result.map_error(fn(_) { InputError })
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
    PrintStatement(str) -> str |> io.println() |> Ok()
  }
}
