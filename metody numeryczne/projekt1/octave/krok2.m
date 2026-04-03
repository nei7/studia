
x_ciagle = linspace(-1, 1, 100);
u_ciagle = sinh(x_ciagle);

n = 8;
x_wezly = linspace(-1, 1, n);
u_wezly = sinh(x_wezly);

figure(1, 'visible', 'off');
clf; 
hold on;
grid on;

plot(x_ciagle, u_ciagle, 'b-', 'LineWidth', 2);

plot([-1.2 1.2], [0 0], 'k-', 'LineWidth', 1.5);

for i = 1:n
    plot([x_wezly(i) x_wezly(i)], [0 u_wezly(i)], 'k--', 'LineWidth', 1); 

    plot(x_wezly(i), 0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
    
    plot(x_wezly(i), u_wezly(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
    

    text(x_wezly(i), -0.18, sprintf('x_%d', i), 'HorizontalAlignment', 'center', 'FontSize', 12);
    

    if u_wezly(i) >= 0
        text(x_wezly(i)+0.03, u_wezly(i) + 0.15, sprintf('u_%d', i), 'HorizontalAlignment', 'left', 'Color', 'b', 'FontSize', 12);
    else
        text(x_wezly(i)+0.03, u_wezly(i) - 0.15, sprintf('u_%d', i), 'HorizontalAlignment', 'left', 'Color', 'b', 'FontSize', 12);
    end
end

title(sprintf('Wykres u(x) = sinh(x) oraz węzłów dyskretyzacji (n=%d)', n));
xlabel('x');
ylabel('u(x)');
xlim([-1.2 1.2]);
ylim([-1.6 1.6]);
hold off;

set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_sinh_wezly.png');
print(output_path, '-dpng', '-r300');