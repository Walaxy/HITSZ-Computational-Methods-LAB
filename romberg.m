f = @(x) x.^2 .* exp(x); 
f = @(x) exp(x).*sin(x);
f = @(x) 4./(1+x.^2);
f = @(x) 1./(x+1);
f = @(x) exp(-x);
a= 0; 
b = 1; 
eps = 1e-5;
R = my_romberg(a, b, f, eps); 
format long;
display(R)
fprintf("最终近似结果:%.15f\n", R(end, end))
fprintf("实际精确值是:%.15f\n", integral(f,a,b))


function R = my_romberg(a, b, f, eps) 
h = b - a; 
R = zeros(20); 
R(1, 1) = h / 2 * (f(a) + f(b)); 
for j = 2 : 10 
    h = h / 2;
    sum = 0;
    for k = 1 : 2^(j-2)
        sum = sum + f(a + (2*k-1)*h);
    end
    R(j, 1) = 1 / 2 * R(j-1, 1) + h * sum; 
    for i = 2 : j
        R(j, i) = (4^(i-1) * R(j, i-1) - R(j-1, i-1)) / (4^(i-1) - 1); % Tj,i
    end
   
    if abs(R(j, j) - R(j-1, j-1)) < eps
        break;
    end
end

R = R(1:j, 1:j);
end