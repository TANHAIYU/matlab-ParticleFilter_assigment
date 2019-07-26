function particles = pf_init (numParticles, initial_state_cov_matrix)
% Create initial set of numParticles particles around 0 with random 
% deviation given by the covariance matrix initial_state_cov_matrix.
% Each particle should contain in its first column its weight and the 
% other columns its state.

particles = zeros(numParticles, 3);

% fill in your code below this line
particles (:,1) = 1/numParticles;
particles (:,2:3) = mvnrnd([0 0], initial_state_cov_matrix, numParticles);


end
