Ultraviolet is an object-oriented virtual machine, in the same category as the Smalltalk-80 virtual machine, but using a different design. Virtual machines generally consist of instructions, each consisting of an opcode and one or more operands, where the operands can be basic values (fixed-size integers, floating point number) or pointers to system memory. There is also often a special kind of system memory called a register and sometimes registers are specialized into different types.

The Ultraviolet object-oriented virtual machine works along similar lines, but uses a different set of names related to objects-oriented programming. An instruction is called a send and it includes a receiver, a message selector, and a message. A receiver is a special pointer. Similarly to a register, receivers can be specialized for specific purposes. The message selector is similar to the opcode. It specifies which computational operation should take place. Finally, a message takes the place of the one or more operands usually present in an instruction. It is a single pointer to a data structure whose format is specific to the receiver and message selector specified.

## Operand Size

The size of the receiver pointer, message selector, and message pointer are all the machine-specific size of a pointer, which is usually the size of an unsigned fixed-size integer, as defined by the specific language and platform used. Ultraviolet is generally run on 32-bit and 64-bit processors, so while an 8-bit implementation is possible, this limits the number of receivers and messages that are possible on such an implementation.

## Memory Organization

Memory is organized into arenas. There is a strict separation between effects and events. Effects are long-lived and each effect has its own arena for allocation, with its own semantics. Some effects are staticly allocated as determined at compile time and are never deallocated, whereas some effects might use a queue-based pool allocation methodology. Events, on the other hand, are short-lived. Each event invocation has its own arena which is cleared after the event's execution has concluded. Persistance between event invocations therefore requires interaction with the effect system.

How many instances of each effect are accessible depends on the compile-time configuration of the application. Some effects are allocated staticly at compile time, while others are given a cap or no cap on the number of instances. An application can also be sandboxed by removing unwanted effects at compile-time. At run-time, if a specific effect type can be instantiated, then the system keeps track of how many instances have been allocated and applies a cap if so configured. Events, on the other hand, are invoked on-demand as the system registers an occurence of the relevant event.

## Addressing Mode

Virtual machines generally have several addressing modes, such as immediate and indirect. The Ultraviolet virtual machine only uses direct (immediate) addressing. When running on a desktop operating system, the virtual machine may have access to virtual memory, but from the perspective of the VM, there is no internal implementation of virtual memory, so all memory access is direct access to  physical memory.

## Memory Management

There is no low-level malloc/free pattern, no automatic reference counting, no traditional garbage collection, or and no manual ownership tracking. Instead, the Ultraviolet virtual machine uses capability-based arena allocation strategy with strict separation between events and effects. This approach has similar benefits to generational garbage collection in that long-lived data structures (effects) are separated from short-lived data structures (events).