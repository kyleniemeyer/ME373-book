# Error

Applying the trapezoidal rule and Simpson's rule introduces the concept of **error** in numerical solutions.

In our work so far, we have come across two obvious kinds of error, that we'll come back to later:

- **local truncation error**, which represents how "wrong" each interval/step is compared with the exact solution; and
- **global truncation error**, which is the sum of the truncation errors over the entire method.

In any numerical solution, there are five main sources of error:

1. Error in input data: this comes from measurements, and can be *systematic* (for example, due to uncertainty in measurement devices) or *random*.

2. Rounding errors: loss of significant digits. This comes from the fact that computers cannot represent real numbers exactly, and instead use a floating-point representation.

3. Truncation error: due to an infinite process being broken off. For example, an infinite series or sum ending after a finite number of terms, or discretization error by using a finite step size to approximate a continuous function.

4. Error due to simplifications in a mathematical model: *"All models are wrong, but some are useful"* (George E.P. Box) All models make some idealizations, or simplifying assumptions, which introduce some error with respect to reality. For example, we may assume gases are continuous, that a spring has zero mass, or that a process is frictionless.

5. Human error and machine error: there are many potential sources of error in any code. These can come from typos, human programming errors, errors in input data, or (more rarely) a pure machine error. Even textbooks, tables, and formulas may have errors.

### Absolute and relative error

We can also differentiate between **absolute** and **relative** error in a quantity. If $y$ is an exact value and $\tilde{y}$ is an approximation to that value, then we have

- absolute error: $\Delta y = | \tilde{y} - y |$
- relative error: $\frac{\Delta y}{y} = \left| \frac{\tilde{y} - y}{y} \right|$

If $y$ is a vector, then we can define error using the maximum of the elements:
\begin{equation}
\max_i \frac{ |y_i - \tilde{y}_{i} |}{|y_i|}
\end{equation}