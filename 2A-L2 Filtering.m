% Apply a Gaussian filter to remove noise
saturn = imread('saturn.png');
imshow(saturn);

% TODO: Add noise to the image
noise_sigma = 25
noise_filter = randn(size(saturn)) .* noise_sigma;
noisey_saturn = noise_filter + saturn;
imshow(noisey_saturn)

% TODO: Now apply a Gaussian filter to smooth out the noise
% Note: You may need to pkg load image;
gausian_sigma = 15;
gausian_size = 31;

pkg load image
gaussian_filter = fspecial('gaussian', gausian_size, gausian_sigma);
filter_saturn = imfilter(noisey_saturn, gaussian_filter);
imshow(filter_saturn)