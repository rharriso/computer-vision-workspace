pkg load image;

function index = find_template1D(t, s)
    % TODO: Locate template t in signal s and return index
    c = normxcorr2(t, s);
    [maxValue, rawIndex] = max(c);
    index = rawIndex - size(t, 2) + 1; % move index to the front of the template window
endfunction

function [yIndex xIndex] = find_template2D(template, img)
  c = normxcorr2(template, img);
  [yRaw xRaw] = find(c==max(c(:)));
  yIndex = yRaw - size(template, 1) + 1;
  xIndex = xRaw - size(template, 2) + 1;
endfunction

% find template 1D
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
% print values and indices
disp('Signal: '), disp([1:size(s, 2); s]);
disp('Template: '), disp([1:size(t, 2); t]);

% find image template 
tablet = imread('tablet.png');
imshow(tablet);
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

colormap('gray'), imagesc(tablet);
hold on;
plot(x, y, 'r+', 'markersize', 16);
hold off;