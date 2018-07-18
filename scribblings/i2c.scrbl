#lang scribble/manual
@title{i2c: integer -> char}
@author{Salt Ho}
@defmodulelang[i2c]
@section{Introduction}

This is a domain-specific language that relies on @racketmodname[brag] language. You can translate
the integer into char like

@codeblock|{
#lang i2c
72 101 108 108 111 44
32 119 111 114 108 100 33
}|


We will get
@codeblock|{
Hello, world!
}|

@section{Other}
@defmodulelang[i2c/reverse]

We can translate char back to integer with

@codeblock|{
#lang i2c/reverse
Hello, world!
}|

We will get

@codeblock|{
72
101
108
108
111
44
32
119
111
114
108
100
33
}|