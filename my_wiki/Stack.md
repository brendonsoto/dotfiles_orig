[[2018-09-15| Stack - A Personal Exploration]]

= Stack -- User Guide =
_Going through the [User Guide](https://docs.haskellstack.org/en/stable/GUIDE/#stack-test))bj) here..._

== Stack's functions ==
So what I'm getting out of this is that Stack is supposed to be the one tooling project to rule them all.

A big goal of Stack is to make projects *reproducible*.

*? Question ?*
So Stack uses a `stack.yml` file as a blueprint for the project, but it also can generate one? Least from my experience `stack new <my_proj>` produces a directory with `stack.yml` inside.


== Hello World Example ==
Syntax for creating projects with Stack:
`stack new _project-name_ _template_`

Building:
`stack build`

Executing:
`stack exec _executable-from-stack-build_`

Testing:
`stack test`


== Inner Workings of stack ==
According to the doc, `_my-proj_.cabal` should *not* be modified. It is generated via `stack build`.


`stack.yaml` controls the Stack-specific settings such as:
- the resolver (what version of GHC to use)
- the package to build
- extra dependencies
- whether to use the system GHC or not
- extra dependencies
- other stuff

*? Question ?*
What's the difference between the extra dependencies and package settings between `stack.yaml` and `package.yaml`?


`_my-project_.cabal` is generated from the `package.yaml` file.

`package.yaml` is built upon the `hpack` library

The resolver downloads a `snapshot` which has a version of GHC and a bunch of packages (check stackage.org for more).
