- my interpreter give me this result

```txt
(1 (2 (3 (4))))
```

just copy from scheme wiki (doesn't want to draw it)

- Tree:

```txt
 (1 (2 (3 4)))
      ^
    /   \
   1     ^ (2 (3 4))
       /   \
      2     ^ (3 4)
          /   \
         3     4
```

- Box and pointer

```
   +---+---+   +---+---+
   | * | * +-->| * | / |
   +-+-+---+   +-+-+---+
     |          |   
     V          V      
   +---+      +---+---+   +---+---+
   | 1 |      | * | * +-->| * | / |
   +---+      +-+-+---+   +---+---+
                |           |
                V           V
              +---+       +---+---+   +---+---+
              | 2 |       | * | * +-->| * | / |
              +---+       +-+-+---+   +-+-+---+
                            |           |
                            V           V
                          +---+       +---+
                          | 3 |       | 4 |
                          +---+       +---+
```