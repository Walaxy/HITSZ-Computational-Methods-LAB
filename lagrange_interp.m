n = 5;
x = linspace(-5, 5, n+1);
f = 1./(1+x.^2); 
Pn1 = my_lagrange_interp(x, f, 0.75);
fprintf('x=0.75, Pn(x)= %.8f\n',Pn1)
Pn2 = my_lagrange_interp(x, f, 1.75);
fprintf('x=1.75, Pn(x)= %.8f\n',Pn2)
Pn3 = my_lagrange_interp(x, f, 2.75);
fprintf('x=2.75, Pn(x)= %.8f\n',Pn3)
Pn4 = my_lagrange_interp(x, f, 3.75);
fprintf('x=3.75, Pn(x)= %.8f\n',Pn4)
Pn5 = my_lagrange_interp(x, f, 4.75);
fprintf('x=4.75, Pn(x)= %.8f\n',Pn5)


function Pn = my_lagrange_interp(x, f, xi) 
n = length(x) - 1; Pn = 0;
for k = 1:n+1 
    l = 1; 
    for j = [1:k-1, k+1:n+1] 
        l = l*(xi - x(j))/(x(k) - x(j));    
    end
    Pn = Pn + f(k)*l; 
end
end
