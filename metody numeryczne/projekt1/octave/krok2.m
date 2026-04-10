x_ciagle = linspace(a, b, 100);
u_ciagle = sinh(x_ciagle);

x_wezly = linspace(a, b, n);
u_wezly = sinh(x_wezly);

figure(1, 'visible', 'off');
clf; 
hold on;
grid on;

plot(x_ciagle, u_ciagle, 'b-', 'LineWidth', 2);

plot([-1.2 1.2], [0 0], 'k-', 'LineWidth', 1.5);

set(gca, 'FontSize', 20);

for i = 1:n
    plot([x_wezly(i) x_wezly(i)], [0 u_wezly(i)], 'k--', 'LineWidth', 1); 

    plot(x_wezly(i), 0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
    
    plot(x_wezly(i), u_wezly(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
    
    text(x_wezly(i), -0.18, sprintf('x_%d', i), 'HorizontalAlignment', 'center', 'FontSize', 20);
    
    % Zwiększono FontSize z 12 na 14 dla wartości u(x)
    if u_wezly(i) >= 0
        text(x_wezly(i)+0.03, u_wezly(i) + 0.15, sprintf('u_%d', i), 'HorizontalAlignment', 'left', 'Color', 'b', 'FontSize', 20);
    else
        text(x_wezly(i)+0.03, u_wezly(i) - 0.15, sprintf('u_%d', i), 'HorizontalAlignment', 'left', 'Color', 'b', 'FontSize', 20);
    end
end

% Powiększenie czcionki w tytule i na etykietach osi
title(sprintf('Wykres u(x) = sinh(x) oraz węzłów dyskretyzacji (n=%d)', n), 'FontSize', 20);
xlabel('x', 'FontSize', 20);
ylabel('u(x)', 'FontSize', 20);
xlim([-1.2 1.2]);
ylim([-1.6 1.6]);
hold off;

set(gcf, 'PaperPosition', [0 0 15 10]); 

output_path = fullfile(output_dir, 'wykres_sinh_wezly.png');
print(output_path, '-dpng', '-r300');