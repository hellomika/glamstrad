import glamstrad/ansi
import glamstrad/basic/types.{
  type Literal, IntLiteral, Nothing, RealLiteral, StringLiteral,
}
import gleam/float
import gleam/int
import gleam/io
import in

const intro = "\n"
  <> " Amstrad 128K Microcomputer (v3)\n"
  <> "\n"
  <> " ©1985 Amstrad Consumer Electronics plc\n"
  <> "           and Locomotive Software Ltd.\n"
  <> "\n"
  <> " BASIC 1.1\n"

pub fn init() -> Nil {
  ansi.bg(18)
  ansi.text(227)
  ansi.bold()
  clear_screen()
  io.println(intro)
}

pub fn prompt() -> Result(String, in.Error) {
  io.println("Ready")
  in.read_line()
}

pub fn cls() -> Result(Nil, a) {
  clear_screen()
  |> Ok()
}

pub fn print(literal: Literal) -> Result(Nil, a) {
  literal
  |> to_string()
  |> io.println()
  |> Ok()
}

pub fn syntax_error() -> Nil {
  io.println("Syntax error")
}

fn clear_screen() -> Nil {
  ansi.clear()
  ansi.home()
}

fn to_string(literal: Literal) -> String {
  case literal {
    StringLiteral(str) -> str
    RealLiteral(float) -> float.to_string(float)
    IntLiteral(int) -> int.to_string(int)
    Nothing -> ""
  }
}
