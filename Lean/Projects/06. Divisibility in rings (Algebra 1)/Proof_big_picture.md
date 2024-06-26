# Divisibility

**Elias and Petr**  
Proseminar on Computer-Aided Mathematics,  
Heidelberg, Summer Semester 2024

## Introduction

In this project, we define irreducible and prime elements of a commutative ring. The goal is to define factorable rings and show that in a factorable ring every irreducible element is prime.

## Basics

- Let $ R $ be an *integral domain*, which is a commutative ring without zero divisors.
- We say that an element $ x \in R $ divides an element $ y \in R $ if and only if $ y $ is a multiple of $ x $. Formally: $ x \mid y $ if there exists $ a \in R $ such that $ y = a \cdot x $.
- If zero divides $ x $, then $ x $ must be zero.
- If $ x $ divides a non-zero element $ y $, then $ x $ is non-zero.
- $a\in R$ is called a *unit* if $\exists\ b\in R\ |\ a\cdot b=b\cdot a=1$.
- Two elements $x$ and $y$ are called associated if and only if $x$ and $ y $ differ by a unit. Formally: For $x, y\in R$ $x\sim y$ is true, if  $\exists a\in R: y = a \cdot x$. $x\sim y$ is an equivalence relation.
- An element $ x \in R $ is non-trivial if it is neither zero nor a unit.
- An element $ x \in R $ is irreducible if it is non-trivial and whenever $ x = a \cdot b $, either $ a $ or $ b $ is a unit.
- An element $ x \in R $ is prime if it is non-trivial and whenever $ x \mid a \cdot b $, it divides one of the factors, in other words, it satisfies Euclid's lemma.

## Main Results

1. In an integral domain, every prime element is irreducible.

    **Proof:**

    Let $ R $ be an integral domain and $ x \in R $ a prime element. We show that $ x $ is irreducible:
    1. Let $ x = a \cdot b $ for $ a, b \in R $.
    2. Since $ x $ is prime, from $ x \mid a \cdot b $, it follows that $ x \mid a $ or $ x \mid b $.
    3. Assume $ x \mid a $. Then there exists $ c \in R $ with $ a = c \cdot x $.
    4. Set $ x = a \cdot b = (c \cdot x) \cdot b = c \cdot (x \cdot b) $.
    5. Since $ R $ is an integral domain and $ x \neq 0 $, it follows $ c \cdot b = 1 $. Thus, $ b $ is a unit.
    6. Similarly, $ a $ is a unit if $ x \mid b $.
    7. Therefore, $ x $ is irreducible.

    **Example:**

    Consider the ring of integers $\mathbb{Z}$. The element 2 is prime because 2 is neither zero nor a unit, and if 2 divides a product, it divides one of the factors. If $2 = a \cdot b$, then one of the factors must be a unit (1 or -1). Therefore, 2 is irreducible.

2. Define factorable rings (also called unique factorization domains) and show that in any factorable ring, every irreducible element is prime.

    **Definition:**

    An integral domain $D$ is called a unique factorization domain (UFD) if for every nonzero non-unit element $a$ of $D$, $a$ can be factored into irreducible elements, $a=p_1 p_2 \cdots p_m$ and if there $a=p_1 p_2 \cdots p_m=q_1 q_2 \cdots q_n$ are two irreducible factorizations of $a$, then $m=n$ and there is a permutation $\sigma$ such that each $p_i$ is an associate of $q_{\sigma(i)}$.

    **Proof:**

    1. Let $p$ irreducible, and $pc=ab$. We need to show that $p|a\lor p|b$.
        1. Case 1: $a=0$, then $p|a$, similarly for $b$.
        2. Case 2: $a$ is a unit, then we can rearrange $pc=ab$ to $b=pa^{-1}c\implies p|b$ .
    2. Case 3:  $a$ and $b$ are non-zero, non-unit, therefore $c\neq 0$.
    3. If $c$ is a unit, then $pc$ is irreducible, and either $a$ or $b$ is a unit, so $c$ is not a unit.
    4. Since $D$ is a UFD, there exist unique factorisations: $a=a_{1}a_{2}\dots a_{r}$, $b=b_{1}b_{2}\dots b_{s}$, $c=c_{1}c_{2}\dots c_{t}$. Since $$ c_{1}c_{2}\dots c_{t}\cdot p=a_{1}a_{2}\dots a_{r}\cdot  b_{1}b_{2}\dots b_{s} $$ $p$ must be an associate of one of $a_{i}$ or $b_{i}$.
    5. Suppose $up=a_{i}$, $u$ is a unit. Then rewriting $a$ as $a=a_{1}a_{2}\dots a_{i-1}pu\cdot a_{i+1}\dots a_{r}$ shows $p|a$. Similarly, if $up=b_{i}$, $p|b$. Thus, $p$ is prime.

    **Example:**

    Consider the ring of integers $\mathbb{Z}$. In $\mathbb{Z}$, every integer is either a unit, zero, or can be represented as a product of prime numbers (which are irreducible). If an irreducible number like 3 divides a product $a \cdot b$, then it divides either $a$ or $b$. Thus, 3 is also prime.

## Proof Details from Lean Code

1. **Lemma:** If zero divides $ x $, then $ x $ is zero.

    **Proof:**

    Let $ 0 \mid x $. Then there exists $ a \in R $ such that
    $$
    x = a \cdot 0.
    $$
    Since $ a \cdot 0 = 0 $, it follows
    $$
    x = 0.
    $$

    **Example:**

    Consider the ring of integers $\mathbb{Z}$. If 0 divides an integer $x$, then $x$ must be 0, since any number multiplied by 0 is again 0.

2. **Lemma:** If $ x $ divides a non-zero element $ y $, then $ x $ is non-zero.

    **Proof:**

    Let $ x \mid y $ and $ y \neq 0 $. Assume $ x = 0 $. Then there exists $ a \in R $ such that
    $$
    y = a \cdot x = a \cdot 0 = 0,
    $$
    which contradicts $ y \neq 0 $. Therefore,
    $$
    x \neq 0.
    $$

    **Example:**

    Consider the ring of integers $\mathbb{Z}$. If a number $x$ divides a non-zero number $y$, then $x$ cannot be zero, since the product of a non-zero number with 0 is zero.
