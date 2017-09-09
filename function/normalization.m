filepath = '/home/RSI2017-ljm/Mic/fashion-landmarks/FData/Img/upper/';
load([filepath 'label/test/' 'TestSample.mat']);

for t = 1:6875
img_orig = imread([filepath 'data/test/' char(TestSample{t,1})]);
scale = 224 / max(size(img_orig));
s1 = round(size(img_orig,1) *scale);
s2 = round(size(img_orig,2) *scale);
if size(img_orig,1) == 224 && size(img_orig,2) == 224
    img_resi = img_orig;
    offset = [0,0,0];
else
    img_resi = imresize(img_orig,[s1,s2]);

    pad = [224 224 0] - size(img_resi);
    pad(pad<0) = 0;

    offset = floor(pad./2);
    img_resi = padarray(img_resi, offset,'pre');
    img_resi = padarray(img_resi, pad-offset,'post');
end

assert(size(img_resi,1) == 224);
assert(size(img_resi,2) == 224);


%% image normalization
pixel_means = reshape([102.9801, 115.9465, 122.7717], [1 1 3]);
img_stan = single(img_resi);
img_stan = permute(img_stan, [2, 1, 3]);
img_stan = img_stan(:, :, [3, 2, 1]);
img_stan = bsxfun(@minus, img_stan, pixel_means);

imwrite(img_stan,[filepath 'data/test/normalize/' char(TestSample{t,1})]);
%disp(Uppertrainposition{t,1});
end
