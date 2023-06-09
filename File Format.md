```
struct Program
{
	let handlers: [EventHandler]
}

struct EventHandler
{
	let event: String
	let handler: [Message]
}

struct Message
{
	let receiver: UInt64
	let selector: UInt64
	let argument: Any
}
```

For encoding, a compact binary encoding such as CBOR can be used as long as it has runtime dynamiam. The byte format of the argument parameter is determined by examining the selector argument. Therefore, the decoding of the argument must be driven by the receiver, which is only known at runtime.

## Notes

How about cryptogtaphic signatures on modules
How about zipping modules to avoid the temptation to optimize the format?