# Partial Differential Equations

This chapter focuses on numerical methods for solving partial differential equations (PDEs), which involve derivatives in multiple dimensions.

We can write a general, linear 2nd-order PDE for a variable $u(x,y)$ as
\begin{equation}
A \frac{\partial^2 u}{\partial x^2} + 2 B \frac{\partial^2 u}{\partial x \, \partial y} + C \frac{\partial^2 u}{\partial y^2} = F \left( x, y, u, \frac{\partial u}{\partial x}, \frac{\partial u}{\partial y} \right)
\end{equation}
where $A$, $B$, and $C$ are constants. Depending on their value, we can categorize a PDE into one of three categories:

- $B^2 - AC < 0$: elliptic
- $B^2 - AC = 0$: parabolic
- $B^2 - AC > 0$: hyperbolic

The different PDE types will exhibit different characteristics and will also require slightly different solution approaches.
