load('data_simple.mat');

% initialization
numParticles = 500;
initial_state_uncertainty = 4; % initial uncertainty: 4m
initial_state_cov_matrix = diag([initial_state_uncertainty^2 initial_state_uncertainty^2]);

% the particle set, the weight is supposed to be stored in the first column. Please define
% the remaining part of the particle set vector according to the task.
% initialization of particles
particles = pf_init (numParticles, initial_state_cov_matrix);

% preparation for simulation of particle filter
particle_sets = cell(numT + 1, 3);
particle_sets{1, 3} = particles;

% this vectors stores the list of estimated states (excluding the initial state). 
state_history = zeros(numT, 2);

% main loop of particle filter
for i = 1:numT
    particles_predicted = pf_predict(particles, delta_motion(i,:), noise_system);
    particles_updated = pf_update(particles_predicted, measurements(i,:), noise_meas);
    particles_resampled = pf_resample(particles_updated);
    particles = particles_resampled;
    
    % store the particle sets for the simulation
    particle_sets(i+1,:) = {particles_predicted, particles_updated, particles_resampled};    

    % store the estimated state after resampling for error analysis in 'state_history'
    state_history (i,:) = compute_particle_statistics (particles_updated);
end

% analyze the estimation error
mean_error = analyze_state_error(state_history, true_poses);

% simulate the particle filter
simulate_particle_filter(particle_sets, true_poses);
