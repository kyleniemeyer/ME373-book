# Solutions to 1st-order ODEs

## 1. Solution by direct integration

When equations are of this form, we can directly integrate:

\begin{align}
\frac{dy}{dx} &= y^{\prime} = f(x) \\
\int dy &= \int f(x) dx \\
y(x) &= \int f(x) dx + C
\end{align}

For example:
\begin{align}
\frac{dy}{dx} &= x^2 \\
y(x) &= \frac{1}{3} x^3 + C
\end{align}

While these problems look simple, there may not be an obvious closed-form solution to all:

\begin{align}
\frac{dy}{dx} &= e^{-x^2} \\
y(x) &= \int e^{-x^2} dx + C
\end{align}

(You may recognize this as leading to the error function, $\text{erf}$:
$\frac{1}{2} \sqrt{\pi} \text{erf}(x) + C$,
so the exact solution to the integral over the range $[0,1]$ is 0.7468.)

## 2. Solution by separation of variables

If the given derivative is a separate function of $x$ and $y$, then we can solve via separation of variables:
\begin{align}
\frac{dy}{dx} &= f(x) g(y) = \frac{h(x)}{j(y)} \\
\int \frac{1}{g(y)} dy &= \int f(x) dx
\end{align}

For example, consider this problem:
\begin{equation}
y^{\prime} = \frac{dy}{dx} = 1 + y^2 \\
\end{equation}
We can separate this into a problem that looks like $f(y) dy = g(x) dx$, where $dy = \frac{1}{1+y^2}$ and $g(x) = 1$.
\begin{align}
\int \frac{dy}{1 + y^2} &= \int dx \\
\arctan y &= x + c \\
y(x) &= \tan(x+c)
\end{align}

Unfortunately, not every separable ODE can be integrated:
\begin{align}
\frac{dy}{dx} &= \frac{e^x / 2 + 5}{y^2 + \cos y} \\
(y^2 + \cos y) dy &= (e^x / 2 + 5) dx
\end{align}

## 3. General solution to linear 1st-order ODEs

Given a general linear 1st-order ODE of the form
\begin{equation}
\frac{dy}{dx} + p(x) y = q(x)
\end{equation}
we can solve by integration factor:
\begin{equation}
y(x) = e^{-\int p(x) dx} \left[ \int e^{\int p(x) dx} q(x) dx + C \right]
\end{equation}

For example, in this equation
\begin{equation}
y^{\prime} + xy - 5 e^x = 0
\end{equation}
after rearranging to the standard form
\begin{equation}
y^{\prime} + xy = 5 e^x
\end{equation}
we see that $p(x) = x$ and $q(x) = 5e^x$.

## 4. Solution to nonlinear 1st-order ODEs

Given a general nonlinear 1st-order ODE
\begin{equation}
\frac{dy}{dx} + p(x) y = q(x) y^a 
\end{equation}
where $a \neq 1$ and $a$ is a constant. This is known as the Bernoulli equation.

We can solve by transforming to a linear equation, by changing the dependent variable from $y$ to $z$:
\begin{align}
\text{let} \quad z &= y^{1-a} \\
\frac{dz}{dx} &= (1-a) y^{-a} \frac{dy}{dx}
\end{align}
Multiply the original equation by $(1-a) y^{-a}$:
\begin{align}
(1-a) y^{-a} \frac{dy}{dx} + (1-a) y^{-a} p(x) y &= (1-a) y^{-a} q(x) y^a \\
\frac{dz}{dx} + p(x) (1-a) z &= q(x) (1-a) \;,
\end{align}
which is now a *linear* first-order ODE, that looks like
\begin{equation}
\frac{dz}{dx} + p(x)^{\prime} z = q(x)^{\prime}
\end{equation}
where $p(x)^{\prime} = (1-a) p(x)$ and $q(x)^{\prime} = (1-a)q(x)$. 

We can solve this using the integrating-factor approach discussed above. Then, once we have $z(x)$, we can find $y(x)$:
\begin{align}
z &= y^{1-a} \\
y &= z^{\frac{1}{1-a}}
\end{align}