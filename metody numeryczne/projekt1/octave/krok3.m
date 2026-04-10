x = linspace(a, b, n);
u = sinh(x);

% Dokładna analityczna pochodna do porównań
x_smooth = linspace(a, b, 100);
u_dokl_smooth = cosh(x_smooth);

% Puste wektory na pochodne (wypełnione NaN dla węzłów brzegowych)
u_prog = NaN(1, n);
u_regr = NaN(1, n);
u_cent = NaN(1, n);

% Obliczenia
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
% WYKRES 1: Metoda Progresywna
% ==========================================================
figure(1, 'visible', 'off');
clf; hold on; grid on;
plot(x_smooth, u_dokl_smooth, 'Color', [0.7 0.7 0.7], 'LineWidth', 3, 'DisplayName', 'Dokladna (cosh)');
plot(x, u_prog, 'r-o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'Progresywna');

% Powiększenie czcionki
set(gca, 'FontSize', 20);
title('Przyblizenie pochodnej - Iloraz Progresywny', 'FontSize', 20);
xlabel('x', 'FontSize', 20); 
ylabel('u''(x)', 'FontSize', 20);
legend('Location', 'north', 'FontSize', 20);

xlim([-1.2 1.2]); ylim([0.8 1.8]);
set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_progresywna.png');
print(output_path, '-dpng', '-r300');
hold off;

% ==========================================================
% WYKRES 2: Metoda Regresywna
% ==========================================================
figure(2, 'visible', 'off'); clf; hold on; grid on;
plot(x_smooth, u_dokl_smooth, 'Color', [0.7 0.7 0.7], 'LineWidth', 3, 'DisplayName', 'Dokladna (cosh)');
plot(x, u_regr, 'b-s', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Regresywna');

% Powiększenie czcionki
set(gca, 'FontSize', 20);
title('Przyblizenie pochodnej - Iloraz Regresywny', 'FontSize', 20);
xlabel('x', 'FontSize', 20); 
ylabel('u''(x)', 'FontSize', 20);
legend('Location', 'north', 'FontSize', 20);

xlim([-1.2 1.2]); ylim([0.8 1.8]);
set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_regresywna.png');
print(output_path, '-dpng', '-r300');
hold off;

% ==========================================================
% WYKRES 3: Metoda Centralna
% ==========================================================
figure(3, 'visible', 'off'); clf; hold on; grid on;
plot(x_smooth, u_dokl_smooth, 'Color', [0.7 0.7 0.7], 'LineWidth', 3, 'DisplayName', 'Dokladna (cosh)');
plot(x, u_cent, 'g-^', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Centralna');

% Powiększenie czcionki
set(gca, 'FontSize', 20);
title('Przyblizenie pochodnej - Iloraz Centralny', 'FontSize', 20);
xlabel('x', 'FontSize', 20); 
ylabel('u''(x)', 'FontSize', 20);
legend('Location', 'north', 'FontSize', 20);

xlim([-1.2 1.2]); ylim([0.8 1.8]);
set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_centralna.png');
print(output_path, '-dpng', '-r300');
hold off;