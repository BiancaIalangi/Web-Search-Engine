function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  % Functie implementata din laborator
  
  [m n] = size(A);
  Q = [];
  % iteram prin fiecare coloană pentru a calcula matricea ortogonala Q
  for k = 1 : n
    % se inițializeaza cu q coloana curentă din A și se păstreaza o copie a acesteia
    q = A(1 : m, k);
    temp = q;
    for j = 1 : k-1
      % se calculeaza produsul scalar
      sp = sum(temp .* Q(:, j));
      % formarea vectorilor ortogonali
      q = q - sp * Q(1 : m, j);
    endfor
    % norma vectorului
    q = q / norm(q);
    % adaugarea in matrice
    Q = [Q q];
  endfor

  % matricea superios triunghiulara va fi egala cu (Q)' * A
  R = Q' * A;
  
  B =   inv(R) * (Q)';
endfunction