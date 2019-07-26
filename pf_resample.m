function particles_resampled = pf_resample(particles)
particles_resampled = zeros(size(particles));
num_particles = size(particles, 1);
normalized_weights = particles(:,1) ./ sum(particles(:,1), 1);

% weights are distributed uniformly
particles_resampled(:,1) = repmat(1/num_particles, num_particles, 1);

% draw samples according to normalized weights
indices = mnrnd(num_particles, normalized_weights);
cur_index = 1;
for i = 1:num_particles
    amount = indices(i);
    if (amount > 0)
        particles_resampled(cur_index:cur_index+amount-1, 2:3) = repmat(particles(i,2:3), amount, 1);
        cur_index = cur_index + amount;
    end
end

end

