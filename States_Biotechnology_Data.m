% Load the data from the Excel file
filename = 'U.S._States_Biotechnology_Data.xlsx';
data = readtable(filename, 'VariableNamingRule', 'preserve');

% Extract columns
states = data.State;
establishments = data.("Number of Biotech Establishments");
employment = data.("Biotech Employment");
economicImpact = data.("Economic Impact (in billions)");

% Create a bar graph for economic impact
figure;
bar(categorical(states), economicImpact, 'FaceColor', [0.2 0.6 0.8]);
title('Economic Impact of Biotechnology by State', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('U.S. States', 'FontSize', 12);
ylabel('Economic Impact (in billions)', 'FontSize', 12);
xtickangle(45);
set(gca, 'FontSize', 10, 'XTickLabelRotation', 45);

% Add data labels for economic impact
hold on;
for i = 1:length(economicImpact)
    text(i, economicImpact(i), sprintf('%.1f', economicImpact(i)), ...
        'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 8);
end
hold off;

% Create a second figure for a grouped bar chart (establishments vs. employment)
figure;
barData = [establishments, employment];
bar(categorical(states), barData, 'grouped');
title('Biotechnology Establishments and Employment by State', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('U.S. States', 'FontSize', 12);
ylabel('Count', 'FontSize', 12);
legend({'Establishments', 'Employment'}, 'FontSize', 10);
xtickangle(45);
set(gca, 'FontSize', 10, 'XTickLabelRotation', 45);

% Save figures
saveas(figure(1), 'Economic_Impact_BarChart.png');
saveas(figure(2), 'Biotech_Establishments_Employment_BarChart.png');
