pkg load image;
moon = imread('moon.png');
imshow(moon);

noisy_moon = imnoise(moon, 'salt & pepper', 0.02);
imshow(noisy_moon);

% median filter
imshow(medfilt2(noisy_moon));