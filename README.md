# Learn Functional Programming with Elixir

## Running Code

- Get Elixir version
`$ elixir -v`

- Open Elixir's interactive shell
`$ iex`
*(Press Ctrl + C twice to exit)*

- Execute script file
`$ elixir hello_world.exs`

- File Extensions
**.ex** for compiled files
**.exs** for script files

## Chapter 1 - Thinking Functionally
*The rules that govern typipcal everyday programming are changing. That doesn't happen often. When it does, something important is going on.*

### Why Functional?

We need to write code that takes advantage of concurrency and parallelism.

#### The limitations of Imperative Languages

Imperative Languages have shared mutating values, which can be dangerous for concorrency and easily introduce bugs.

Instead of libraries that offer mechanisms to help lock and sync the changes, functional programming offers a better alternative.

#### Moving to Functional Programming

In FP, **functions** are the basic building blocks, values are **immutable**, and the code is **declarative**.


