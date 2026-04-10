a = -1;
b = 1;
h = (b - a) / (n - 1);

x = linspace(a, b, n);
u = sinh(x);
u_dokl = cosh(x);

E_prog = NaN(1, n);
E_regr = NaN(1, n);
E_cent = NaN(1, n);

for i = 1:n
    if i < n
        u_prog = (u(i+1) - u(i)) / h;
        E_prog(i) = abs((u_dokl(i) - u_prog) / u_dokl(i)) * 100;
    end
    if i > 1
        u_regr = (u(i) - u(i-1)) / h;
        E_regr(i) = abs((u_dokl(i) - u_regr) / u_dokl(i)) * 100;
    end
    if i > 1 && i < n
        u_cent = (u(i+1) - u(i-1)) / (2*h);
        E_cent(i) = abs((u_dokl(i) - u_cent) / u_dokl(i)) * 100;
    end
end
figure(1, 'visible', 'off'); clf; hold on; grid on;

% Rysowanie błędów dla każdej metody
plot(x, E_prog, 'r-o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'Bład - Progresywna');
plot(x, E_regr, 'b-s', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Bład - Regresywna');
plot(x, E_cent, 'g-^', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Bład - Centralna');

% Powiększenie czcionki na podziałkach osi do 20
set(gca, 'FontSize', 20);

% Powiększenie czcionki do 20 w tytule, etykietach i legendzie
title('Blad wzgledny E [%] przyblizen pochodnej', 'FontSize', 20);
xlabel('x', 'FontSize', 20); 
ylabel('E [%]', 'FontSize', 20);
legend('Location', 'north', 'FontSize', 20);
xlim([-1.2 1.2]);


set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_bledy.png');
print(output_path, '-dpng', '-r300');
hold off;