function [] = print_z(varname,z)
%print_z Stampa un numero complesso in notazione esponenziale, cartesiana e
%modulo/fase
%   Esempio: print_z('myvar',A)

fprintf('%3s = %6.3g phase %6.3g [deg] = ',varname,abs(z),rad2deg(angle(z)));
fprintf('%6.3g + %6.3gj = ',real(z),imag(z));
fprintf('%6.3g phase %6.3g [rad]\n',abs(z),angle(z));

end

