function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

  %creare L - vector coloana ce arata catre cate pagini
  %           merge mai departe
  L = zeros(n,1);
  for i = 1:n
    nr = 0;
    for j = 1:n
      if A(i,j) == 1;
        nr++;
      endif
     endfor
     L(i) = nr;
   endfor
     
  
  M = ((inv(diag(L)))*A)';
  one(1:n,1) = 1; 
  
  % creare R vectorul de PageRank-uri
  B = PR_Inv(eye(n) - d*M);
  R = B * ((1-d)/n)*one;

endfunction

	