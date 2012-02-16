//===----------------------------------------------------------------------===//
// Klee Symbolic Virtual Machine
//===----------------------------------------------------------------------===//

klee is a symbolic virtual machine built on top of the LLVM compiler
infrastructure. Currently, there are two primary components:

  1. The core symbolic virtual machine engine; this is responsible for
     executing LLVM bitcode modules with support for symbolic
     values. This is comprised of the code in lib/.

  2. A POSIX/Linux emulation layer oriented towards supporting uClibc,
     with additional support for making parts of the operating system
     environment symbolic.

Additionally, there is a simple library for replaying computed inputs
on native code (for closed programs). There is also a more complicated
infrastructure for replaying the inputs generated for the POSIX/Linux
emulation layer, which handles running native programs in an
environment that matches a computed test input, including setting up
files, pipes, environment variables, and passing command line
arguments.

For further information, see the webpage or docs in www/.


/////////////my work
1.track thread's instruction and find the constraint

2.jump out of the dead loop when sequence loop exist by setting a max
time to track the same branch instruction

3.fork a new state for each branch instruction but only collect the
constraint of the symbolic data

4.finished a thread file(only pthread_* function and its simple
definition),the file is inclued in libkleeRunTest
