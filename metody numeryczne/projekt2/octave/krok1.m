% =========================================================================
% PROJEKT: METODY NUMERYCZNE - METODA RÓŻNIC SKOŃCZONYCH (MRS) 1D (Wersja 3)
% AUTOR: FRANCISZEK SZAREK, GRUPA 12
% TEMAT: ROZWIĄZANIE RÓWNANIA HELMHOLTZA: u'' + k^2 * u = f Z ZAPISEM WYNIKÓW I WYKRESU DO PLIKU
% ŚRODOWISKO: GNU OCTAVE
% =========================================================================

clear; clc; close all;

fprintf('=========================================================\n');
fprintf('Rozpoczynanie obliczen MRS dla siatki N = 7\n');
fprintf('=========================================================\n');

% --- 1. PARAMETRY WEJŚCIOWE ZGODNIE Z TABLICĄ I TRANSKRYPCJĄ ---
N = 7;                  % Liczba węzłów (x_1 do x_7)
L = 1.0;                % Przyjęta długość przedziału obliczeniowego
h = L / (N - 1);        % Krok siatki obliczeniowej
x = linspace(0, L, N);  % Współrzędne węzłów siatki

k = 1.0;                % Współczynnik k z równania u'' + k^2*u = f
f_impuls = 3.0;         % Wartość źródła f działającego w węźle 6

pochodna_lewa = 5.0;    % Warunek Neumanna na lewym brzegu (pochodna = 5)
wartosc_prawa = 8.0;    % Warunek Dirichleta na prawym brzegu (u_7 = 8)

% --- 2. INICJALIZACJA MACIERZY UKŁADU ---
A = zeros(N, N);
b = zeros(N, 1);

% --- 3. BUDOWA UKŁADU RÓWNAŃ (A * u = b) ---

% Wiersz 1: Lewy brzeg (x_1) - Warunek Neumanna (iloraz progresywny)
A(1, 1) = -1;
A(1, 2) = 1;
b(1)    = pochodna_lewa * h;

% Wiersze 2 do 6: Węzły wewnętrzne siatki
for i = 2:6
    A(i, i-1) = 1;
    A(i, i)   = (k^2 * h^2) - 2;
    A(i, i+1) = 1;
    
    if i == 6
        b(i) = f_impuls * h^2;
    else
        b(i) = 0.0;
    end
end

% Wiersz 7: Prawy brzeg (x_7) - Warunek Dirichleta
A(N, N) = 1;
b(N)    = wartosc_prawa;

% --- 4. ROZWIĄZANIE UKŁADU ZA POMOCĄ ODWRACANIA MACIERZY ---
A_inv = inv(A);
u = A_inv * b;

% --- 5. ZAPIS WYNIKÓW TEKSTOWYCH DO PLIKU ---
nazwa_pliku_txt = 'wyniki_mrs_szarek.txt';
fileID = fopen(nazwa_pliku_txt, 'w');

if fileID == -1
    error('Nie udalo sie otworzyc pliku do zapisu.');
end

fprintf(fileID, '=========================================================\n');
fprintf(fileID, 'RAPORT Z OBLICZEN NUMERYCZNYCH - METODA ROZNIC SKONCZONYCH\n');
fprintf(fileID, 'AUTOR: FRANCISZEK SZAREK, GRUPA 12\n');
fprintf(fileID, '=========================================================\n\n');

fprintf(fileID, 'WYNIKI KONCOWE (Wartosci u w wezlach):\n');
fprintf(fileID, '%-10s %-15s %-15s\n', 'Wezel', 'Wspolrzedna x', 'Wartosc u(x)');
fprintf(fileID, '---------------------------------------------\n');
for i = 1:N
    fprintf(fileID, 'x_%d        %-15.4f %-15.4f\n', i, x(i), u(i));
end

fclose(fileID);
fprintf('Wyniki tekstowe zostaly pomyslnie zapisane do pliku: %s\n', nazwa_pliku_txt);

% --- 6. WIZUALIZACJA WYNIKÓW I ZAPIS WYKRESU DO PLIKU PNG ---
fig = figure('Name', 'Projekt MRS 1D - Franciszek Szarek', 'Visible', 'off'); % Tworzymy wykres w tle
plot(x, u, '-sb', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'r');
grid on;

title('Rozwiązanie równania \Delta u + k^2u = f Metodą Różnic Skończonych', 'FontSize', 12);
xlabel('Współrzędna przestrzenna x (Węzły x_1 - x_7)', 'FontSize', 11);
ylabel('Wartość poszukiwanej funkcji u(x)', 'FontSize', 11);

% Adnotacje
text(x(1)+0.02, u(1), sprintf('Neumann: u''=%g', pochodna_lewa), 'Color', [0, 0.5, 0], 'FontWeight', 'bold');
text(x(6)-0.05, u(6)+0.5, sprintf('Impuls f=%g', f_impuls), 'Color', [0.7, 0, 0.7]);
text(x(7)-0.18, u(7)-0.5, sprintf('Dirichlet: u=8', wartosc_prawa), 'Color', [0, 0.5, 0], 'FontWeight', 'bold');

% Zapisywanie wykresu
nazwa_pliku_png = 'wykres_mrs_szarek.png';
print(fig, nazwa_pliku_png, '-dpng', '-r300'); % Zapis do PNG w rozdzielczości 300 DPI