# Power Series Solutions

**Power series solutions** are another technique we can use to solve 2nd-order homogeneous ODEs of the form
\begin{equation}
y^{\prime\prime} + p(x) y^{\prime} + q(x) y = 0
\end{equation}
This is useful for more-general cases where our other techniques fail.

For example, how would you find the solution to this ODE?
\begin{equation}
(1 + x^2) y^{\prime\prime} - 4 x y^{\prime} + 6y = 0
\end{equation}
None of the methods we've discussed so far would allow us to find an analytical solution to this problem—but we can using a power series solution. 

Power series solutions will be of the form
\begin{equation}
y = \sum_{n=0}^{\infty} a_n x^n
\end{equation}
where the coefficients $a_n$ are what we need to find.

1. First, for power series to be a valid solution, we need to check whether $x=0$ is an **ordinary point** of the ODE: is the ODE *continuous* and *bounded* at $x=0$?

*Continuous* means that there should be no discontinuity at $x=0$. 

*Bounded* means that the solution should be finite at $x=0$.

For example, consider the ODE
\begin{equation}
y^{\prime\prime} - 4xy^{\prime} + (4x^2 - 2)y = 0
\end{equation}
Both $p(x) = -4x$ and $q(x) = (4x^2 - 2)$ are continuous and bounded at $x=0$, so $x=0$ **is** an ordinary point.

On the other hand, what about 
\begin{equation}
y^{\prime\prime} + x^3 y^{\prime} + \frac{1}{x} y = 0 \text{ ?}
\end{equation}
In this case, the solution is unbounded at $x=0$, and so it is **not** an ordinary point.

2. If $x=0$ is an ordinary point, then we can find a solution in the form of a power series:
\begin{equation}
y = \sum_{n=0}^{\infty} a_n x^n
\end{equation}

We then solve for the coefficients $a_n$ by plugging this in to the ODE. To do that, we'll need to take advantage of certain properties of power series.

## Properties of power series

- **Dummy index rule**. We can replace the index variable used in the power series with another index variable arbitrarily:
\begin{equation}
\sum_{n=0}^{\infty} a_n x^n = \sum_{m=0}^{\infty} a_m x^m
\end{equation}
This is because the index variable is just a "dummy" that only has meaning inside the sum.

- **Product rule**. We can bring variables, including $x$, multiplying an entire power series into the power series:
\begin{equation}
x \sum_{n=0}^{\infty} a_n x^n = \sum_{n=0}^{\infty} a_n x^{n+1}
\end{equation}

- **Derivatives**. We can take derivatives of our power series:
\begin{align}
y^{\prime} &= \sum_{n=0}^{\infty} a_n (n) x^{n-1} = \sum_{n=1}^{\infty} a_n (n) x^{n-1} \\
y^{\prime\prime} &= \sum_{n=0}^{\infty} a_n (n)(n-1) x^{n-2} = \sum_{n=2}^{\infty} a_n (n)(n-1) x^{n-2}
\end{align}
Notice that we can change where the sums in the power series start, because for $y^{\prime}$ the term corresponding to $n=1$ would just be zero, and similar for the first two terms of $y^{\prime\prime}$.

- **Index shift**. We can redefine the index used within a sum to shift where it starts. For example, if we let $m=n-1$, or $n=m+1$, then:
\begin{equation}
\sum_{n=1}^{\infty} a_n (n) x^{n-1} = \sum_{m=0}^{\infty} a_{m+1} (m+1) x^m
\end{equation}
Or, in other case, if we let $m=n-2$, or $n=m+2$, then:
\begin{equation}
\sum_{n=2}^{\infty} a_n (n)(n-1) x^{n-2} = \sum_{m=0}^{\infty} a_{m+2} (m+2)(m+1) x^m
\end{equation}

Now, let's apply these properties to solve ODEs.

## Power series example 1

Let's try to apply the power series approach to solve
\begin{equation}
y^{\prime\prime} + y = 0 \;,
\end{equation}
where we know the solution will be $y(x) = c_1 \sin x + c_2 \cos x$.

1. Is $x=0$ an ordinary point? Yes, the ODE is continuous and bounded at $x=0$.
So, we can find a solution of the form $y(x) = \sum_{n=0}^{\infty} a_n x^n$.

2. Now, we solve for the coefficents by plugging the power series into the ODE:
\begin{equation}
\sum_{n=2}^{\infty} a_n (n)(n-1) x^{n-2} + \sum_{n=0}^{\infty} a_n x^n = 0
\end{equation}
Let's use the index shift rule on the first part of that:
\begin{equation}
\sum_{n=2}^{\infty} a_n (n)(n-1) x^{n-2} \rightarrow \sum_{m=0}^{\infty} a_{m+2} (m+2)(m+1) x^m
\end{equation}
Then, we can use the dummy index rule to change $m$ back to $n$:
\begin{equation}
\sum_{m=0}^{\infty} a_m (m+2)(m+1) x^m \rightarrow \sum_{n=0}^{\infty} a_n (n+2)(n+1) x^n
\end{equation}
Now, let's replace the first term in the ODE with that, merge both terms into a single sum, and simplify:
\begin{align}
\sum_{n=0}^{\infty} a_n (n+2)(n+1) x^n + \sum_{n=0}^{\infty} a_n x^n &= 0 \\
\sum_{n=0}^{\infty} x^n \left[ a_{n+2}(n+2)(n+1) + a_n \right] &= 0
\end{align}

There are infinite terms in this sum, involving the continuous variable $x$; the only way that equation can be satisfied is if

- $x=0$ always, which cannot be true, or
- $a_{n+2}(n+2)(n+1) + a_n = 0$ for all values of $n$. This is what we can use to find the coefficients of our power series solution.

Use that expression to define a recursive formula for the coefficients:
\begin{equation}
a_{n+2} = \frac{-a_n}{(n+1)(n+2)}
\end{equation}
We can see that the even coefficients will be related to each other, and the odd coefficients will be related. Let's try to identify a pattern with each, starting with the even terms:
\begin{align}
n=0: \quad a_2 &= \frac{-a_0}{1 \cdot 2} = \frac{-a_0}{2!} \\
n=2: \quad a_4 &= \frac{-a_2}{3 \cdot 4} = \frac{a_0}{4!} \\
n=4: \quad a_6 &= \frac{-a_4}{5 \cdot 6} = \frac{-a_0}{6!}
\end{align}
and the odd terms:
\begin{align}
n=1: \quad a_3 &= \frac{-a_1}{2 \cdot 3} = \frac{-a_1}{3!} \\
n=3: \quad a_5 &= \frac{-a_3}{4 \cdot 5} = \frac{a_1}{5!} \\
n=5: \quad a_7 &= \frac{-a_5}{6 \cdot 7} = \frac{-a_1}{7!}
\end{align}

Now, let's put that all together:
\begin{align}
y(x) &= a_0 + a_1 x + a_2 x^2 + a_3 x^3 + \dots \\
y &= a_0 \left( 1 - \frac{x^2}{2!} + \frac{x^4}{4!} + \dots \right) + a_1 \left( x - \frac{x^3}{3!} + \frac{x^5}{5!} + \dots \right)
\end{align}
which you might recognize as being the Taylor series expansion of sine and cosine:
\begin{equation}
y(x) = a_0 \cos x + a_1 \sin x
\end{equation}
So, our unknown coefficients end up being our integration constants, which we can use our two constraints to find.

## Power series example 2

Find the solution to the ODE
\begin{equation}
(1 + x^2) y^{\prime\prime} - 4x y^{\prime} + 6y = 0
\end{equation}

First, rearrange into standard form:
\begin{equation}
y^{\prime\prime} - \frac{4x}{1+x^2} y^{\prime} + \frac{6}{1+x^2} y = 0
\end{equation}
Then, check whether $x=0$ is an ordinary point: yes, it is.

Now, let's insert the power series into the ODE:
\begin{align}
y^{\prime\prime} + x^2 y^{\prime\prime} - 4 x y^{\prime} + 6 y &= 0 \\
\sum_{n=2}^{\infty} a_n (n)(n-1)x^{n-2} + x^2 \sum_{n=0}^{\infty} a_n (n)(n-1)x^{n-2} - 4 x \sum_{n=1} a_n (n) x^{n-1} + 6 \sum_{n=0}^{\infty} a_n x^n &= 0
\end{align}
First, we'll use the power rule:
\begin{equation}
\sum_{n=2}^{\infty} a_n (n)(n-1)x^{n-2} + \sum_{n=2}^{\infty} a_n (n)(n-1)x^{n} - 4 \sum_{n=1} a_n (n) x^{n} + 6 \sum_{n=0}^{\infty} a_n x^n = 0
\end{equation}
and then the index shift and dummy index rules on the first term:
\begin{equation}
\sum_{n=2}^{\infty} a_n (n)(n-1)x^{n-2} \rightarrow \sum_{m=0}^{\infty} a_{m+2} (m+2)(m+1) x^m \rightarrow \sum_{n=0}^{\infty} a_{n+2} (n+2)(n+1) x^n
\end{equation}

Then, put that back into the full equation and combine the sums:
\begin{align}
\sum_{n=0}^{\infty} a_{n+2} (n+2)(n+1) x^n + \sum_{n=0}^{\infty} a_n (n)(n-1)x^{n}  - 4 \sum_{n=1} a_n (n) x^{n} + 6 \sum_{n=0}^{\infty} a_n x^n &= 0 \\
\sum_{n=0}^{\infty} x^n \left[ a_{n+2} (n+2)(n+1) + a_n (n)(n-1) - 4a_n (n) + 6a_n \right] &= 0 \\
a_{n+2} (n+2)(n+1) + a_n (n^2 -5n + 6) &= 0 \\
a_{n+2} (n+2)(n+1) + a_n (n-3)(n-2) &= 0 \\
\end{align}

Thus, our recursion formula for the coefficients $a_n$ is
\begin{equation}
a_{n+2} = -a_n \frac{(n-3)(n-2)}{(n+1)(n+2)}
\end{equation}
Again, we can see that the even terms will be related and the odd terms will be related:
\begin{align}
n=0: \quad a_2 &= -a_0 \frac{6}{2} = -3 a_0 \\
n=2: \quad a_4 &= 0 \\
n=4: \quad a_6 &= -a_4 \frac{2}{30} = 0 \\
&\ldots
\end{align}
and the odd terms:
\begin{align}
n=1: \quad a_3 &= -a_1 \frac{2}{6} = \frac{-a_1}{3} \\
n=3: \quad a_5 &= 0 \\
n=5: \quad a_7 &= -a_5 \frac{6}{42} = 0 \\
&\ldots
\end{align}

The solution is then
\begin{align}
y(x) &= a_0 + a_1 x - 3 a_0 x^2 - \frac{a_1}{3} x^3 \\
y &= a_0 \left(1 - 3x^2 \right) + a_1 \left( x - \frac{x^3}{3} \right)
\end{align}
where we find $a_0$ and $a_1$ using our initial or boundary conditions.
