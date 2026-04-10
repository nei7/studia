
u_dokladna = cosh(x);

% Puste wektory na pochodne
u_prog = NaN(1, n);
u_regr = NaN(1, n);
u_cent = NaN(1, n);

% ==========================================================
% 2. OBLICZENIA POCHODNYCH
% ==========================================================
for i = 1:n
    if i < n
        u_prog(i) = (u(i+1) - u(i)) / h;
    end
    if i > 1
        u_regr(i) = (u(i) - u(i-1)) / h;
    end
    if i > 1 && i < n
        u_cent(i) = (u(i+1) - u(i-1)) / (2*h);
    end
end

% ==========================================================
% 3. GENERATOR TABEL W LATEX
% ==========================================================
fprintf('\n\n===== SKOPIUJ PONIZSZY KOD DO LATEXA =====\n\n');

% --- TABELA 1: PROGRESYWNA ---
fprintf('\\begin{table}[h!]\n\\centering\n\\renewcommand{\\arraystretch}{1.2}\n\\begin{tabular}{|c|c|c|c|}\n\\hline\n');
fprintf('\\textbf{Węzeł $x$} & \\textbf{Dokładna $u''$} & \\textbf{Numeryczna $\\tilde{u}''$} & \\textbf{Błąd [\\%%]} \\\\ \\hline\n');
for i = 1:n-1
    blad = abs((u_dokladna(i) - u_prog(i)) / u_dokladna(i)) * 100;
    fprintf('$%5.2f$ & $%10.4f$ & $%10.4f$ & $%5.2f\\%%$ \\\\ \\hline\n', x(i), u_dokladna(i), u_prog(i), blad);
end
fprintf('\\end{tabular}\n\\caption{Wartości pochodnej i błąd dla ilorazu progresywnego.}\n\\label{tab:progresywna}\n\\end{table}\n\n');

% --- TABELA 2: REGRESYWNA ---
fprintf('\\begin{table}[h!]\n\\centering\n\\renewcommand{\\arraystretch}{1.2}\n\\begin{tabular}{|c|c|c|c|}\n\\hline\n');
fprintf('\\textbf{Węzeł $x$} & \\textbf{Dokładna $u''$} & \\textbf{Numeryczna $\\tilde{u}''$} & \\textbf{Błąd [\\%%]} \\\\ \\hline\n');
for i = 2:n
    blad = abs((u_dokladna(i) - u_regr(i)) / u_dokladna(i)) * 100;
    fprintf('$%5.2f$ & $%10.4f$ & $%10.4f$ & $%5.2f\\%%$ \\\\ \\hline\n', x(i), u_dokladna(i), u_regr(i), blad);
end
fprintf('\\end{tabular}\n\\caption{Wartości pochodnej i błąd dla ilorazu regresywnego.}\n\\label{tab:regresywna}\n\\end{table}\n\n');

% --- TABELA 3: CENTRALNA ---
fprintf('\\begin{table}[h!]\n\\centering\n\\renewcommand{\\arraystretch}{1.2}\n\\begin{tabular}{|c|c|c|c|}\n\\hline\n');
fprintf('\\textbf{Węzeł $x$} & \\textbf{Dokładna $u''$} & \\textbf{Numeryczna $\\tilde{u}''$} & \\textbf{Błąd [\\%%]} \\\\ \\hline\n');
for i = 2:n-1
    blad = abs((u_dokladna(i) - u_cent(i)) / u_dokladna(i)) * 100;
    fprintf('$%5.2f$ & $%10.4f$ & $%10.4f$ & $%5.2f\\%%$ \\\\ \\hline\n', x(i), u_dokladna(i), u_cent(i), blad);
end
fprintf('\\end{tabular}\n\\caption{Wartości pochodnej i błąd dla ilorazu centralnego.}\n\\label{tab:centralna}\n\\end{table}\n\n');