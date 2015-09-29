sndb = -40:0.1:10;
sn = 10 .^ (sndb ./ 10);

pr = 1 .- 1/2 .* erfc(sqrt(sn ./ 2));

plot(sndb, pr);
print 6.jpeg -djpeg -mono ;
grid on;
xlabel("Es/N0 (dB)")
ylabel("Pe")

pause;

