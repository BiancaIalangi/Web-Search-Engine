function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
	
  % calculare y astfel incat se obtine dintr-o
  % functie continua
  if (x >= 0 && x < val1)
    y = 0;
  elseif (x >= val1 && x <= val2)
    y = (x- val1) / (val2 - val1);
  elseif (x > val2 && x <= 1)
    y = 1;
  endif
endfunction