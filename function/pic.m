filepath = '/home/RSI2017-ljm/Mic/fashion-landmarks/FData/Img/upper/';
load([filepath 'label/test/' 'TestSample.mat']);
position = zeros(6875,12);
for t = 1:6875
img_orig = imread([filepath 'data/test/' char(TestSample{t,1})]);
scale = 224 / max(size(img_orig));
s1 = round(size(img_orig,1) *scale);
s2 = round(size(img_orig,2) *scale);

if size(img_orig,1) == 224 && size(img_orig,2) == 224
    offset = [0,0,0];
else
    img_resi = imresize(img_orig,[s1,s2]);

    pad = [224 224 0] - size(img_resi);
    pad(pad<0) = 0;

    offset = floor(pad./2);
end

p = TestSample{t,2:13};
position(t,:) = (p * scale + repmat([offset(2),offset(1)],[1,6]))/224-0.5;
disp(t);
end
save([filepath 'label/test/' 'test_landmark.mat']);
