---
title: "SICP - Solution: Exercise 1.25"
date: 2018-10-18T04:03:58+02:00
draft: false
type: posts
---

## Exercise 1.25

> Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written
> 
> ```scheme
> (define (expmod base exp m)
>   (remainder (fast-expt base exp) m))
> ```
> 
> Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

## Solution

### Experimenting

The first step in Alyssa P. Hacker version of `expmod` is the computation of `fast-expt`. Let's try a simple case and see what happens.

```
(display (fast-expt 941 1009))
2248692327561909336281157014383192571806230777765227367652505071757859618500065999
7221372308178067113160000534666202546092717641068006242594397222397973882647460436
4871243162923887929484566931086692572561249041171061820503681063075717227004271555
8499649082939263928355311846274911587171867244390757191424069360287775327594530047
7045846705932912111779053540061583398870902793098349487218384167189075171866330453
8056269156373368535940988274886312124840761258507162478803364448607945599160114122
0015879669086959208651943029364352618115390085428998404729836073628458159845116560
8127589664012803204169323034205933223452280957236534994243679721216140485619640062
3323468767140531885730965715360991675137945389895663642104137689755761799983124982
2622205398230737962257520930045200876690128568997584649143843402664185679080216824
4369479270035618016804290642592117262042552229389030519490524340028652706643677403
3814954234180006250202256480092086863826917421208160462037424824070683581719029050
1521604928615789430123830924148012176463227952901708716160822096272557769634462706
6957075491223767587424356100650113412804974976333826548456069714159674249160913890
2887630423999406563389045932251463683628931459812917048547126205541043546297891178
4271366817991227525523042753565242243910772092612055407263075453631708005649514860
0753292311679997705003786329059075344177638421172090373413653470246650008007827312
3087729551064838436535320178643173614914487126947351163219056403895273435927420484
8641236989997250493724848706654012051046800524283939020378885675445569125160712144
7573009857814463166349745695834964521158510644839614654587652634399363586260054252
5307223139465604686240175127820109277914298601590505407856849815778652632772862867
3914200022381159394611780128539310153465772106606049529385133065477902206999736347
1769436109253839382213754825306378203367973123925271592553352521845032391182443845
3918277840498144618945124055568048896269320484753244599768554367648631565088117185
6604625354925729580623293929482739583577907808491480978573200263126163732583084138
6386385067948324142008080348680559051600118455710028862146506741159536646046512166
3165443562069751309201273702298921056615874729315113410588943562420639537216492516
6213882557404990522404500702537097950623125159346259557875962563602852604575772939
8933916315414476794959561851056626149452312715808170288113389456514510539104171266
1719326300168510286340949946265489227136195160770572727095934850082113875131836864
0321032995072403695183255513240068163159475271186223487351383686443178612992226682
1328930799678468421467147534565493794701270135596886550607205824485879563251201847
8274820047160191500013706042892327894895435235955205008000333518835929001918329288
0945235883494420049546437286307931305985342924481211352651573353550651628664914271
3904244575551765307837325917336250605592037221167237140433178672549280512171288511
0087096970935733477653473611809585967403812349837877308334464921130107561749546564
5215964878429006380976605000883169274765651774061
```

This number is 3001 digits long and this is just for the smallest prime number in the list. The [number of digits](http://mathforum.org/library/drmath/view/62942.html) for the result of `(fast-expt base exp)` will be $\log\_{10}\left(base^{exp}\right)+1=exp\times\log\_{10}\left(base\right)+1$ digits long.

Trying to run a larger case like `(fast-expt 12345678 1000000007)` will yield a result with 256 million digits. Depending of the encoding, it might take up to 256 MB of memory just to store it.

### Why should we care about the size of an intermediate result?

Luckily, DrRacket can handle on such large numbers without too much hassle, but in many languages, operations like multiplication works only on `fixnum` type numbers. To quote DrRacker section on [Numbers](https://docs.racket-lang.org/reference/numbers.html):

> The precision and size of exact numbers is limited only by available memory (and the
> precision of operations that can produce irrational numbers). In particular, adding,
> multiplying, subtracting, and dividing exact numbers always produces an exact result.
>
> A fixnum is an exact integer whose two’s complement representation fit into 31 bits
> on a 32-bit platform or 63 bits on a 64-bit platform; furthermore, no allocation is
> required when computing with fixnums.

These large numbers are called
[Arbitrary-precision arithmetic](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic) or bignum arithmetic. On top of taking large memory space, computations on `bignum` is much slower to perform than on `fixnum`. To quote the above Wikipedia article:

> Arbitrary-precision arithmetic is considerably slower than arithmetic using numbers
> that fit entirely within processor registers, since the latter are usually implemented
> in hardware arithmetic whereas the former must be implemented in software. Even if the
> computer lacks hardware for certain operations (such as integer division, or all
> floating-point operations) and software is provided instead, it will use number sizes
> closely related to the available hardware registers: one or two words only and definitely
> not N words.

Operations like multiplication and remainder on `fixnum` can be seen as $O(1)$, on bignum they have a much higher complexity of $O(N \log\left(N\right) \log\left(\log\left(N\right)\right)$, assuming algorithm like [Karatsuba algorithm](https://en.wikipedia.org/wiki/Karatsuba_algorithm) that is implemented in DrRacket.

By contrast the original algorithm doesn't try to fully compute the `exp` before computing the remainder, but break down the problem into smaller numbers of roughly the same size:

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
```

This can be checked by tracing its execution on the same parameters:

```
>(expmod 941 1008 1009)
> (expmod 941 504 1009)
> >(expmod 941 252 1009)
> > (expmod 941 126 1009)
> > >(expmod 941 63 1009)
> > > (expmod 941 62 1009)
> > > >(expmod 941 31 1009)
> > > > (expmod 941 30 1009)
> > > > >(expmod 941 15 1009)
> > > > > (expmod 941 14 1009)
> > > > > > (expmod 941 7 1009)
> > > > > > > (expmod 941 6 1009)
> > > > > > > > (expmod 941 3 1009)
> > > > > > > > > (expmod 941 2 1009)
> > > > > > > > > > (expmod 941 1 1009)
> > > > > > > > > > > (expmod 941 0 1009)
< < < < < < < < < < < 1
< < < < < < < < < < 941
< < < < < < < < < 588
< < < < < < < < 376
< < < < < < < 116
< < < < < < 184
< < < < < 559
< < < < <330
< < < < 937
< < < <860
< < < 3
< < <805
< < 247
< <469
< 1008
```

### Conclusion

Alyssa P. Hacker version of `expmod`:

- It gives a much larger intermediate result, which could require more memory than available on the computer.
- This large intermediate result requires the use of special algorithms for multiplications and remainders that are much slower than computations on smaller `fixnum` numbers.

### Open questions

- Does DrRacket use automatically fixnum on our optimized version?
- How is remainder computed? What is the complexity?
