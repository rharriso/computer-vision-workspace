pkg load image;

img = double(imread('octagon.png')) / 255.;
imshow(img);

[gx gy] = imgradientxy(img, 'sobel'); % prewitt, central, intermediate
imshow((gx + 4) / 8); % normalize by sobel mass
imshow((gy + 4) / 8); % normalize by sobel mass
[gmag gdir] = imgradient(gx, gy);
imshow(gmag / (4 * sqrt(2))); % gmag = sqrt(gx^2 + gy^2), so: [0, 4 * sqrt(2))]
imshow((gdir + 180.0) / 360.0); % angle is in degrees [-180, 180]

% Gradient Direction
function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
  mag_over = mag_min <= gmag;
  angle_good = angle_low <= gdir & gdir <= angle_high;
  result = mag_over & angle_good;
endfunction

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
imshow(my_grad);  % NOTE: enable after you've implemented select_gdirimshow(my_grad);  % NOTE: enable after you've implemented select_gdir

