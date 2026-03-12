import glamstrad/basic

pub fn main() {
  basic.init()
  repl()
}

fn repl() {
  basic.run()
  repl()
}
