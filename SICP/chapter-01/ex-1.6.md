Beacuse new-if is a procedure, in actual scheme interpreter, procedure use applicative-order
evaluation, which means new-if whill firstly evaluate the value of all its three parameters.
The new-if version of sqrt-iter will always evaluate the value `(sqrt-iter (improve guess x) x)`,
this will never terminate.
