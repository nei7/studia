x = linspace(-1, 1, 100);

u = sinh(x);

figure(1, 'visible', 'off');
clf; 
hold on; 
grid on;
plot(x, u, 'b-', 'LineWidth', 2);

grid on;
title('Wykres funkcji u(x) = sinh(x)');
xlabel('x');
ylabel('u(x)');

hold on;
plot([-1 1], [0 0], 'k-', 'LineWidth', 1);          % Oś X
plot([0 0], [min(u) max(u)], 'k-', 'LineWidth', 1); % Oś Y
hold off;

set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_sinh.png');
print(output_path, '-dpng', '-r300');