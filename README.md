**Glamstrad**: a Locomotive BASIC interpreter implemented in Gleam.

![Amstrad CPC 464](CutePersonalComputer.png)

Locomotive BASIC was the built-in programming language of my first computer, the Amstrad CPC. This is a work in progress as an excuse to learn Gleam.

## Setup

```sh
gleam run
```

## Usage

The REPL starts with the classic CPC boot screen.
- Type BASIC expressions at the `Ready` prompt.
- Use `?` as shorthand for `PRINT`.

```basic
PRINT 2 + 3
 5
```

```basic
PRINT SIN(3.14159)
 2.65358979335273e-6
```

```basic
?HEX$(255)
FF
```

```basic
?BIN$(10, 8)
00001010
```

```basic
?STR$(42)
 42
```

```basic
?ROUND(3.14159, 2)
 3.14
```

## Supported Functions and Operators

### Math

| Function | Description |
|-------|-------------|
| `ABS(x)` | Absolute value |
| `ATN(x)` | Arctangent |
| `CINT(x)` | Round to 16-bit integer (-32768..32767) |
| `COS(x)` | Cosine |
| `EXP(x)` | e^x |
| `FIX(x)` | Truncate toward zero |
| `INT(x)` | Floor (truncate toward negative infinity) |
| `LOG(x)` | Natural logarithm |
| `LOG10(x)` | Base-10 logarithm |
| `ROUND(x)` | Round to nearest integer |
| `ROUND(x, n)` | Round to n decimal places |
| `SGN(x)` | Sign (-1, 0, or 1) |
| `SIN(x)` | Sine |
| `SQR(x)` | Square root |
| `TAN(x)` | Tangent |

### Arithmetic Operators

`+` `-` `*` `/`

### Bitwise Operators

`AND` `OR` `XOR`

### String

| Function | Description |
|-------|-------------|
| `BIN$(x)` | Binary string representation |
| `BIN$(x, width)` | Binary with zero-padded width |
| `HEX$(x)` | Hexadecimal string representation |
| `HEX$(x, width)` | Hexadecimal with zero-padded width |
| `STR$(x)` | Number to string |

### I/O

| BASIC | Description |
|-------|-------------|
| `PRINT expr` / `? expr` | Print a value |
| `CLS` | Clear screen |

## License

[No](LICENSE).
