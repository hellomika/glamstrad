import glamstrad/ansi
import gleam/io
import in

const intro = "\n"
  <> " Amstrad 128K Microcomputer (v3)\n"
  <> "\n"
  <> " ©1985 Amstrad Consumer Electronics plc\n"
  <> "           and Locomotive Software Ltd.\n"
  <> "\n"
  <> " BASIC 1.1\n"

pub fn init() {
  ansi.bg(18)
  ansi.text(227)
  ansi.bold()
  clear_screen()
  io.println(intro)
}

pub fn prompt() {
  io.println("Ready")
  in.read_line()
}

pub fn cls() {
  clear_screen()
  |> Ok()
}

pub fn print(str) {
  str
  |> io.println()
  |> Ok()
}

pub fn syntax_error() {
  io.println("Syntax error")
}

fn clear_screen() {
  ansi.clear()
  ansi.home()
}
