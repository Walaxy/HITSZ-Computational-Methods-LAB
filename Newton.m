syms x;
f = x^2-2*x*exp(-x)+exp(-2*x);
f = x-exp(-x);
fh = matlabFunction(f);
df = matlabFunction(diff(f));
eps1 = 1e-6;
eps2 = 1e-4;
N = 20;
x0 = 0.5;
[x_star, n] = newton(fh, df, eps1, eps2, x0, N);
display(x_star)

function [x_star, n] = newton(f, df, eps1, eps2, x0, N)
    n=1; 
    while n<= N 
        %2.1 
        F = f(x0); 
        DF = df(x0); 
        if abs(F)<eps1 
            x_star = x0; 
            return 
        end
        if abs(DF)<eps2 
            display("Failed") 
            return 
        end
        %2.2
        x1=x0-F/DF; 
        %2.3 
        Tol = abs(x1-x0); 
        if abs(Tol)<eps1 
            x_star=x1; 
            return 
        end
        %2.4
        n=n+1; 
        x0=x1; 
    end
    display("Failed") 
    return
end
