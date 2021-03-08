function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
 
  % extragere numarul de pagini web din nume.in
  fid = fopen (nume, "r");
  n = fgetl(fid);
  n = str2double(n);
  
  % X - extragere matrice din nume.in
  X = dlmread(nume, ' ', 1, 0);
  
  % creare A - matrice de adiacenta
  A = zeros(n);
  for i = 1 : n
    for j = 3 : n
      for k = 1 : n
        if (X(i, j) == k)
          A(i, k) = 1;
        endif
      endfor
    A(i, i) = 0;
    endfor
  endfor

  % creare L - vector coloana ce arata catre cate pagini
  %           merge mai departe
  L = zeros(n, 1);
  for i = 1 : n
    nr = 0;
    for j = 1 : n
      if A(i, j) == 1;
        nr++;
      endif
     endfor
     L(i) = nr;
   endfor
   
  % creare R initial   
  R_prev(1 : n, 1) = 1/n;
  
  M = ((inv(diag(L))) * A)';
  one(1 : n, 1) = 1; 

  R = d * M * R_prev + ((1 - d) / n) * one;
  
  % creare R vectorul de PageRank-uri
  while (norm(R - R_prev) >= eps)
    R_prev = R;
    R = d * M * R_prev + ((1 - d) / n) * one;
  end
  R = R_prev ;
  endfunction   
  