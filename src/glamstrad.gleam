import glamstrad/ansi
import glamstrad/lexer
import glamstrad/parser.{PrintStatement}
import gleam/io
import gleam/result
import gleam/string
import in

const intro = "\n"
  <> " Amstrad 128K Microcomputer (v3)\n"
  <> "\n"
  <> " ©1985 Amstrad Consumer Electronics plc\n"
  <> "           and Locomotive Software Ltd.\n"
  <> "\n"
  <> " BASIC 1.1\n"

pub type Error {
  InputError
  LexError
  ParseError
}

pub fn main() {
  init()
  repl()
}

fn init() {
  ansi.bg(18)
  ansi.text(227)
  ansi.bold()
  ansi.clear()
  ansi.home()
  io.println(intro)
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
