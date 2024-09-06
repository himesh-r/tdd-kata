# TDD Kata Example

This repository demonstrates the principles and practice of **Test-Driven Development (TDD)** through a simple example. It highlights how following the TDD process results in cleaner, more maintainable code.

## The Essence of TDD

Test-Driven Development (TDD) is a software development approach where you write tests **before** writing the corresponding production code. The process is guided by three core rules:

1. **Write only enough production code to pass a failing test.**
2. **Write only enough of a test to cause a failure.**
3. **Refactor and repeat** in small, incremental steps.

By adhering to these principles, TDD helps ensure that the code is always driven by the tests, leading to better design, testability, and maintainability.

## Why This Repository is Important

The true value of this repository lies in its **commit history**. Each commit represents a step in the TDD process, showing how tests drive the implementation. Reviewing the commit history reveals:

- How tests guide the creation of production code.
- **SOLID violations** when multiple types of tests are required for a single method.
- The incremental evolution of both the tests and the codebase.

## Requirements

This repository includes the implementation of a simple **string calculator** function, `add()`. Below are the functional requirements:

### Functionality:

- The `add()` function accepts a string of **comma-separated numbers** as input and returns their sum.

  - **Example:** `add("2,3")` → returns `5`

- The function can handle **any number of non-negative integers**.

- In addition to commas, the `add()` function should accept a **newline character (`\n`)** as a valid delimiter.

  - **Example:** `add("2\n3,4")` → returns `9`

- The function allows a **custom delimiter**, which can be specified at the beginning of the input string using the format `//<custom-delimiter>\n`.

  - **Example:** `add("//;\n3;5")` → returns `8`

- If the input contains **negative numbers**, the function should raise an **exception**.

## Conclusion

This example demonstrates how following TDD leads to a more structured and thoughtful approach to software development. Through small, test-driven steps, the codebase evolves naturally, encouraging clean, testable code. The commit history is a valuable resource for understanding the progression of the implementation.
