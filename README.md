# Element
Element is a simple golfing language that compiles to Perl.  It was first created in March 2012.

See "Documentation" for details on Element's intructions.

**[Esolangs.org page](http://esolangs.org/wiki/Element)** for more documentation and examples.

**[Online interpreter](https://tio.run/#element)**

## Examples

**Hello World!**

    Hello\ World\!`

**Nth Fibonacci Number**

    1_'[3:~2@+]`

Explanation:

    1                  push a 1
     _'                take input then move it to the control stack
       [      ]        FOR loop
       [3:    ]        make two additional copies of the top number (3 is the total count)
       [  ~   ]        turn one copy into a zero
       [   2@ ]        move from position 0 to position 2, behind the old number
       [     +]        add the old and newer number
               `       output the result

