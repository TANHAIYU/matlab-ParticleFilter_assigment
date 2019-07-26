function simulate_particle_filter(particle_sets, true_poses)
% Simulates the evolution of the particle sets. The particle_sets is a
% cell-array of dimensions [numPoses x 3] with the following format:
% The first column contains the particle set after the prediction, the
% second column after the update or innovation and finally the third column
% after the resampling.

figure('Name', 'ParticleFilter Simulation'); hold on;
subplot(1,2,1);

numT = size(particle_sets, 1);
for i = 2:numT
    subplot(1,2,1);
    plot(true_poses(:,1), true_poses(:,2), 'b-', 'LineWidth', 2); hold on;
    [mu, sigma] = compute_particle_statistics(particle_sets{i, 3});
    plot(mu(1), mu(2), 'ro', 'LineWidth', 2);
    axis equal;
    subplot(1,2,2);
    cla;
    % prediction
    particles_pred = particle_sets{i, 1};
    particles_upd = particle_sets{i, 2};
    particles_resampled = particle_sets{i, 3};
    plot(particles_pred(:,2), particles_pred(:,3), 'bx', 'LineWidth', 2); hold on;
    plot(particles_upd(:,2), particles_upd(:,3), 'ro', 'LineWidth', 2);
    plot(particles_resampled(:,2), particles_resampled(:,3), 'yd', 'LineWidth', 4);
    axis equal;
    pause(0.2);
end
end

