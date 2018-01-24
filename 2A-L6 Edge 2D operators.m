% For Your Eyes Only
pkg load image;

frizzy = rgb2gray(imread('frizzy.png'));
froomer = rgb2gray(imread('froomer.png'));
imshow(frizzy);
imshow(froomer);

combined = edge(frizzy, 'canny') & edge(froomer, 'canny');
imshow(combined);