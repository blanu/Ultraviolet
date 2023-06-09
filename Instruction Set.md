The instruction set for the Ultraviolet virtual machine is unusual in that it includes high-level instructions for interfacing with I/O devices and manipulating data structures. Since it is a virtual machine and not a physical machine, the instruction set is completely extendable based on the capabilities of the physical machine or emulator on which it is running. The instruction set is modular and programs can be sandboxed to run using only allowed instructions in order to provide security.

Here is a high-level overview of instruction set modules that are under development at the moment:
- Audio - based on the Teensy Audio library
- Video - based on the Adafruit GFX library
- Array math - operations with arrays of integer and floating point numbers
- Text - textual string manipulation
- Networking - TCP and UDP network sockets