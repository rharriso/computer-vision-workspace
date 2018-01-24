pkg load image;
leaves = imread('fall-leaves.png');
imshow(leaves);

gausian_sigma = 15;
gausian_size = 31;
gausian_filter = fspecial('gaussian', gausian_size, gausian_sigma);

imshow(imfilter(leaves, gausian_filter, 0)) % black
imshow(imfilter(leaves, gausian_filter, 'circular')) % wraparound
imshow(imfilter(leaves, gausian_filter, 'replicate')) % copy edge
imshow(imfilter(leaves, gausian_filter, 'symmetric')) % reflect