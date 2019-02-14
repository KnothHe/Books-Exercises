If the interpreter use applicative-order evalution, then (test 0 (p)) will firstly evaluate the value of (p).
According to the defination of (p), the value of (p) is (p), which is an infinite loop, we will never get the
value of (p).

However, if the interpreter use normal-order evalution, the (test 0 (p)) will expand as below

```shceme
(if (= 0 0)
    0
    (p))
```

Because 0 equals 0, the value of (test 0 (p)) is just 0, the interpreter will never try to evaluate the value of (p),
which avoid infinite loop.
