import gleam/int
import gleam/io

const ansi = "\u{001b}["

pub fn clear() {
  print("2J")
}

pub fn home() {
  print("H")
}

pub fn bg(code: Int) {
  print("48;5;" <> int.to_string(code) <> "m")
}

pub fn text(code: Int) {
  print("38;5;" <> int.to_string(code) <> "m")
}

pub fn bold() {
  print("1m")
}

fn print(code) {
  io.print(ansi <> code)
}
