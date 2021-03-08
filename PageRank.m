function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
 
  % extragerea numarului de pagini web  
  fid = fopen (nume, "r");
  n = fgetl(fid);
  n = str2double(n);
 
  % X - extragere matrice din nume.in
  X = dlmread(nume, ' ', 1, 0);
  
  % extragere val1 din matricea X
  val1 = X(n + 1, 1);
  
  % extragere val1 din matricea X
  val2 = X(n + 2, 1);
  
  
  filename = strcat(nume, '.out');
  file = fopen(filename, 'w');
  
  %afisare numar pagini web in nume.out
  fprintf(file, '%d\n', n);
  fprintf(file, '\n');
  
  %afisare PR prin metoda 1 in nume.out
  R = Iterative(nume, d, eps);
  fprintf(file, '%f\n', R);
  fprintf(file, '\n');
  
  %afisare PR prin metoda 2 in nume.out
  R1 = Algebraic(nume, d);
  fprintf(file, '%f\n', R1);
  fprintf(file, '\n');
  
  R2(1 : n, 1) = 1 : n;
  R2(1 : n, 2) = 0;
  
  % extragerea elementelor din R1 in R2 in
  % ordine descrescatoare
  R2(1 : n, 3) = sort(R1, 'descend');
  
  % creare matrice R2 ce reprezinta F=u(PR1(i))
  for i = 1 : n
    for j = 1 : n
      if ( R1(j) == R2(i, 3) && R2(1 : i, 2) != j)
        R2(i, 2) = j;
        R2(i, 3) = Apartenenta(R2(i, 3), val1, val2);
      endif
    endfor
  endfor
  
  % afisare noua matrice R2 in nume.out
  for i = 1 : size(R2, 1)
    fprintf(file, '%f ', R2(i, :));
    fprintf(file, '\n');
  end
  fclose(file)
endfunction