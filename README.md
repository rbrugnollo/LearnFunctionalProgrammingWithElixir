# Learn Functional Programming with Elixir

- [Learn Functional Programming with Elixir](#learn-functional-programming-with-elixir)
  * [Running Code](#running-code)
  * [Chapter 1 - Thinking Functionally](#chapter-1---thinking-functionally)
    + [Why Functional?](#why-functional-)
      - [The limitations of Imperative Languages](#the-limitations-of-imperative-languages)
      - [Moving to Functional Programming](#moving-to-functional-programming)
    + [Working with Immutable Data](#working-with-immutable-data)
    + [Building Programs with Functions](#building-programs-with-functions)
        * [Pure functions](#pure-functions)
        * [Impure functions](#impure-functions)
      - [Transforming Values](#transforming-values)
      - [Declaring Code](#declaring-code)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

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
*The rules that govern typical everyday programming are changing. That doesn't happen often. When it does, something important is going on.*

### Why Functional?

We need to write code that takes advantage of concurrency and parallelism.

#### The limitations of Imperative Languages

Imperative Languages have shared mutating values, which can be dangerous for concorrency and easily introduce bugs.

Instead of libraries that offer mechanisms to help lock and sync the changes, functional programming offers a better alternative.

#### Moving to Functional Programming

In FP, **functions** are the basic building blocks, values are **immutable**, and the code is **declarative**.

### Working with Immutable Data

In FP, all values you create are *immutable*, no matter the operation we apply to it:


```
list = [1, 2, 3, 4]
# => [1, 2, 3, 4]

List.delete_at(list, -1)
# => [4]

list ++ [1]
# => [1, 2, 3, 4, 1]

IO.inspect list
# => [1, 2, 3, 4]
```

### Building Programs with Functions

- Functions are the primary tools for building a program
- They are usually short and expressive
- We combine multiple little functions to create a larger program
- Values are passed explicitly between functions
- Functions can be arguments and results

##### Pure functions
- Values are immutable
- The result is affected only by the function's arguments
- No side effects beyond the value returned

```
add2 = fn (n) -> n + 2 end

add2.(2)
# => 4
```

##### Impure functions
More complex, unpredictable results and with side effects *(Chapter 7)*


#### Transforming Values
Elixir's focus is on the data transformation flow, and the pipe ( |> ) operator can be used to combine multiples functions' calls and results, where the result of each expression will be passed as a value to the next function.

```
title 
|> String.split
|> capitalize_all
|> join_with_whitespace
```

#### Declaring Code
- Generates less and simpler code
- Less code = fewer bugs
- *what's necessary to solve a problem* instead of *how to solve a problem*( imperative)
