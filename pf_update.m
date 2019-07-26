function particles_upd = pf_update(particles, measurement, noise_meas)
particles_upd = zeros(size(particles));

num_particles = size(particles, 1);

% the state variables are kept
particles_upd(:,2:3) = particles(:,2:3);

for i = 1:num_particles 
particles_upd(i,1) = particles(i,1) .* mvnpdf(measurement, particles(i,2:3), noise_meas);
end

