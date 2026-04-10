x = linspace(a, b, 100);

u = sinh(x);

fprintf('Krok siatki h = %.4f (czyli 2/7)\n\n', h);
fprintf('  v  |      x_v      |      u_v      \n');
fprintf('--------------------------------------\n');

x_v = [-1, -5/7, -3/7, -1/7, 1/7, 3/7, 5/7, 1];
u_v = sinh(x_v);
h = x_v(2) - x_v(1);
for v = 1:length(x_v)
    fprintf('%3d  |  %10.6f  |  %10.6f\n', v, x_v(v), u_v(v));
end

figure(1, 'visible', 'off');
clf; 
hold on; 
grid on;
plot(x, u, 'b-', 'LineWidth', 2);

set(gca, 'FontSize', 20);

grid on;
title('Wykres funkcji u(x) = sinh(x)', 'FontSize', 16);
xlabel('x', 'FontSize', 20);
ylabel('u(x)', 'FontSize', 20);

hold on;
plot([a b], [0 0], 'k-', 'LineWidth', 1);          % Oś X
plot([0 0], [min(u) max(u)], 'k-', 'LineWidth', 1); % Oś Y
hold off;

set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_sinh.png');
print(output_path, '-dpng', '-r500');


