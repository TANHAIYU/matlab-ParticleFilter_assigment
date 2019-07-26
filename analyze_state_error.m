function mean_squared_error = analyze_state_error(poses, true_poses, measurements)
numPoses = size(poses, 1);
pose_diff = poses - true_poses;
figure('Name', 'Error Visualization');
subplot(1,2,1);
plot(1:numPoses, zeros(1, numPoses), 'r-'); hold on;
plot(1:numPoses, pose_diff(:,1), 'bx'); hold on;
title('Pose error in x-direction');
% axis equal;
axis ([0 250 -1 1]);
subplot(1,2,2);
plot(1:numPoses, zeros(1, numPoses), 'r-'); hold on;
plot(1:numPoses, pose_diff(:,2), 'bx');
title('Pose error in y-direction');
% axis equal;
axis ([0 250 -1 1]);
mean_squared_error = sum(pose_diff.^2, 1) ./ numPoses;
end

