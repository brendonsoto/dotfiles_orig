:javascript:

Consider the following scenario:
- component A is currently rendered
- there's a CTA that triggers component B to take the place of A
- A passes a callback/function to B
- the callback/function is a closure that references a variable created in the `submit` event of the CTA

What happens to component A then?
Does it stay alive since the variable in the closure is in play?
Does that depend on whether the variable is a primitive or object?