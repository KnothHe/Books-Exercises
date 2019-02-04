1.
$$
\begin{align}
Fib(0) &= (\phi^0 - \gamma^0)/\sqrt{5} = 0 \\
Fib(1) &= (\phi^1 - \gamma^1)/\sqrt{5} = ((1+\sqrt5)/2 -(1-\sqrt5)/2)/\sqrt5 = \sqrt5/\sqrt5 = 1
\end{align}
$$


2.
$$
\begin{align}
Fib(n-1) + Fib(n-2) &=  \frac{\phi^{n-1}-\gamma^{n-1}}{\sqrt5} + \frac{\phi^{n-2}-\gamma^{n-2}}{\sqrt5} \\
&= \frac{\phi^{n-1} - \gamma^{n-1} + \phi^{n-2} - \gamma^{n-2}}{\sqrt5} \\
&= \frac{(\phi^{n-1} + \phi^{n-2}) - (\gamma^{n-1} + \gamma^{n-2})}{\sqrt5} \\
\end{align}
$$

$$
\begin{align}
\end{align}
$$

$$
\begin{align}
\phi^{n-1} + \phi^{n-2} &= (\frac{1+\sqrt5}{2})^{n-1} + (\frac{1+\sqrt5}{2})^{n-2} \\
&= (\frac{1+\sqrt5}{2}+1)(\frac{1+\sqrt5}{2})^{n-2} \\
&= (\frac{3+\sqrt5}{2})(\frac{1+\sqrt5}{2})^{n-2} \\
&= (\frac{6+2\sqrt5}{4})(\frac{1+\sqrt5}{2})^{n-2} \\
&= (\frac{1+\sqrt5}{2})^{2}(\frac{1+\sqrt5}{2})^{n-2} \\
&= (\frac{1+\sqrt5}{2})^{n} \\
&= \phi^n
\end{align}
$$

$$
\begin{align}
\gamma^{n-1} + \gamma^{n-2} &= (\frac{1-\sqrt5}{2})^{n-1} + (\frac{1-\sqrt5}{2})^{n-2} \\
 &= (\frac{1-\sqrt5}{2}+1)(\frac{1-\sqrt5}{2})^{n-2} \\
 &= (\frac{3-\sqrt5}{2})(\frac{1-\sqrt5}{2})^{n-2} \\                                     
 &= (\frac{6-2\sqrt5}{4})(\frac{1-\sqrt5}{2})^{n-2} \\
 &= (\frac{1-\sqrt5}{2})^{2}(\frac{1-\sqrt5}{2})^{n-2} \\
 &= (\frac{1-\sqrt5}{2})^{n} \\
 &= \gamma^n
 \end{align}
$$

$$
\begin{align}
Fib(n-1) + Fib(n-2) &= \frac{(\phi^{n-1} + \phi^{n-2}) - (\gamma^{n-1} + \gamma^{n-2})}{\sqrt5} \\
&= \frac{\phi^n - \gamma^n}{\sqrt5} \\
&= Fib(n)

\end{align}
$$

3.
$$
Fib(n) = \frac{\phi^n - \gamma^n}{\sqrt5}
$$

$$
Fib(n) - \phi^n/\sqrt5 = -\gamma^n/\sqrt5
$$

just prove 
$$
\gamma^n/\sqrt5 \leq 1/2 \\
$$
that's prove
$$
\gamma^n \leq \sqrt5/2
$$
we have
$$
\gamma = (1 - \sqrt5)/2 \approx -0.618 \\
\gamma^n < 1 \\
\sqrt5 / 2 \approx 1.118
$$
[reference](http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html)