% entropy
function res = h(x) 
	xc = 1 .- x;
	res = -x .* log2(x) .- xc .* log2(xc);
endfunction

% counts capacity for given delta (vector) and signal/noise ratio (number)
function res = C(delta, sb)                         
	p = -1/2 .* erfc((1 + delta) * sqrt(sb));
	e = -1/2 .* erfc((1 - delta) * sqrt(sb)) - p;
	ec = 1 - e;
	res = ec .* (1 - h(p ./ ec));		
endfunction


sndb = 5;
sn = 10 .^ (sndb ./ 10);

delta = 0 : 0.02 : 1.2;
cap = C(delta);

plot(delta, cap);
print 6.jpeg -djpeg -mono ;
grid on;
xlabel("delta")
ylabel("C, sn = " + sn)

pause;



