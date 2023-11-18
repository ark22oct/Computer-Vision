1)

A = [0.5 1 -2]
B = [3  6 -5]

C = cross(A,B);

disp (C);

% 2)

Intersection = [0 0 1];
verifyingC = dot(C, Intersection);
disp (verifyingC);

% Problem 5

% Times: x-axis
year = (1900:10:2010)';

% Population: y-axis
population = [75.995, 91.972, 105.711, 123.203, 131.669, 150.697, 179.323, 203.212, 226.505, 249.633, 281.422, 308.748]';

% Linear model
linear_coefficients = polyfit(year, population, 1);
linear_fit = polyval(linear_coefficients, year);
linear_population_2020 = polyval(linear_coefficients, 2020);

% Quadratic model
quadratic_coefficients = polyfit(year, population, 2);
quadratic_fit = polyval(quadratic_coefficients, year);
quadratic_population_2020 = polyval(quadratic_coefficients, 2020);

% Plot the data and the fitted models
figure;
plot(year, population, 'o', year, linear_fit, '-', year, quadratic_fit, '--');
xlabel('Year');
ylabel('Population (millions)');
legend('Data', 'Linear Fit', 'Quadratic Fit');
title('Population Growth Over Time');

% Display the predicted populations for 2020
disp(['Linear Model Prediction for 2020: ', num2str(linear_population_2020)]);
disp(['Quadratic Model Prediction for 2020: ', num2str(quadratic_population_2020)]);

Part 3:
Generate a point cloud of a sphere
radius = 1;
numPoints = 1000;
theta = linspace(0, 2*pi, numPoints);
phi = linspace(0, pi, numPoints);
[THETA, PHI] = meshgrid(theta, phi);
x = radius * sin(PHI) .* cos(THETA);
y = radius * sin(PHI) .* sin(THETA);
z = radius * cos(PHI);

Create a point cloud object
ptCloud = pointCloud([x(:), y(:), z(:)]);

Save the point cloud to 'object3d.mat'
save('object3d.mat', 'ptCloud');

Load the point cloud from 'object3d.mat'
load('object3d.mat');

Define parameters for sphere fitting
maxDistance = 0.01;
roi = [-inf, 0.5; 0.2, 0.4; 0.1, inf];
sampleIndices = findPointsInROI(ptCloud, roi);

Fit a sphere to the point cloud
[model, inlierIndices] = pcfitsphere(ptCloud, maxDistance, 'SampleIndices', sampleIndices);
globe = select(ptCloud, inlierIndices);

Plot the extracted globe (fitted sphere)
figure;
pcshow(globe);
title('Fitted Sphere Point Cloud');