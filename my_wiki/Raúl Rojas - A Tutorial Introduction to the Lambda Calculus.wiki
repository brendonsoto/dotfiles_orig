= Contents =
        - [[#Questions|Questions]]
        - [[#Recap|Recap]]

_Link:_ http://www.inf.fu-berlin.de/lehre/WS03/alpi/lambda.pdf


The successor function (gets the next integer) is defined as follows:
S ≡ λwyx.y(wyx)

So this is the successor function applied to 1:
S0 ≡ (λwyx.y(wyx))(λsz.z)

Let's evaluate it (I'm copying + pasting to get the lambdas and to be quick):
S0 = (λwyx.y(wyx))(λsz.z)
= (λwyx.y(wyx)) (λsz.z) << Adding space for clarity
> [ w := (λsz.z) ]
= (λyx.y((λsz.z)yx)) << Substitution
> [ s := y ]
= (λyx.y((λz.z)x)) << Substitution
> [ z := x ]
= (λyx.y(x)) << Substitution

Alright, so this is somehow supposed to equal 1 right? So going alongside this train of thought 2 should be either `y(y(x))` or something like `y(x)y(x)`. So let's try it. 
First off, going to substitut y & x for b & a in (λyx.y(x)) to avoid it clashing with the successor function. *Alpha equivalence* let's us do that. 

S1 = (λwyx.y(wyx))(λba.b(a))
> [ w := (λba.b(a)) ]
= (λyx.y((λba.b(a))yx)) << Substitution
= (λyx.y ( (λba.b(a)) yx) ) << Added spaces for clarity
= (λyx.y ( (λba.b(a)) yx) ) << Added spaces for clarity
> [ b := y ]
= (λyx.y ( (λa.y(a)) x) ) << Substitution
> [ a := x ]
= (λyx.y ( (y(x)) ) ) << Substitution
= (λyx.y (y(x)) ) << Clean up
= (λyx.y(y(x))) << Clean up

Yeah, lo and behold we have `y(y(x))` as predicted. So in English I guess we can explain this as regirtitating or recycling the result of the first function in the same function. We're getting the output of the innermost function and using that as the input for the same function.



it's 2 + 3 using lambda calculations. We're not explicitly using numbers, but are symbolizing 2 + 3 without ever declaring 2 or 3!
2S3 ≡ ( λsz.s ( sz))( λwyx.y ( wyx))( λuv.u ( u ( uv)))
= (λsz.s(sz)) (λwyx.y(wyx)) (λuv.u(u(uv)))
> [ s := (\wyx.y(wyx)) ]
= (\z.(\wyx.y(wyx))((\wyx.y(wyx))z)) (\uv.u(u(uv)))
> [ z := (\uv.u(u(uv))) ]
= (\wyx.y(wyx))((\wyx.y(wyx))(\uv.u(u(uv)))) << Ask Court about copy + pasting vs typign the whole thing out
> [ w := ((\wyx.y(wyx))(\uv.u(u(uv)))) ]
= (\yx.y(((\wyx.y(wyx))(\uv.u(u(uv))))yx))
= (\yx.y ( ( (\wyx.y(wyx)) (\uv.u(u(uv))) ) yx ))
> [ w := (\uv.u(u(uv))) ]
= (\yx.y ( ( (\yx.y( (\uv.u(u(uv))) yx)) ) yx ))
> [ u := y ]
= (\yx.y ( ( (\yx.y( (\v.p(p(pv))) x)) ) yx ))
> [ v := x ]
= (\yx.y ( ( (\yx.y( (p(p(px))) )) ) yx ))
= (\yx.y ( (\yx.y(p(p(px)))) yx ))
= (\yx.y ( (\ab.a(p(p(pb)))) yx ))
> [ a := y ]
= (\yx.y ( (\b.y(p(p(pb)))) x ))
> [ b := x ]
= (\yx.y ( (y(p(p(px)))) ))
= (\yx.y ((y(p(p(px))))))
= (\yx.yy(p(p(px))))

==== Questions ====
I'm at "The predecessor function" section (3.3) and am wondering, why are the formulas we've covered so far the way they are?
Why is zero (\sz.z)?
Doesn't False follow the same abstraction?
Is the fact that zero and false are the same intentional?
Why are numbers represented like (\ab.a(ab)) [2]? Why not something like (\a.aa)?
For instance, a pair (a, b) is defined as: (\z.zab). Why have the z at all? Is the z some sort of identify function for ab? If so, why have it in the first place?
It also seems very weird that you can apply True or False to a pair to get the first or the former.


==== Recap ====
I'm going to write down the functions I've learned here:
*KEY:*
() = Alias
[] = explanation
{} = arguments to be used in the definition

Identity = \x.x
0 = \sz.z
1 = \sz.s(z)
2 = \sz.s(s(z))
3 = ... follow above pattern
Successor [i.e. x + 1] = λwyx.y(wyx)
Addition {x,y} = x Successor y
Multiplication = \xyz.x(yz)
- i.e. 2 * 2 = \xyz.x(yz) 2 2 => \yz.2(yz) 2 => \z.2(2z)
True (T) = \xy.x
False (F) = \xy.y
- Any positive integer applied to False produces the identity function
AND (^) = \xy.xy(\uv.v) => \xy.xyF
OR (v) = \xy.x(\uv.u)y => \xy.xTy
NOT (¬ [i'll use ~]) = \x.x(\uv.v)(\ab.a) => \x.xFT
x == 0? (Z) [Checks if n is 0] = \x.xF~F
Predecessor (P) [Gets n-1] = (λn.nΦ(λz.z00)F
- Φ [generates (n+1, n) from (n, n-1)]= (λpz.z(S(pT))(pT))
Greater than or equal to (G) [x>= y] {x,y} = 
