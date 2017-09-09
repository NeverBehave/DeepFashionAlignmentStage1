filepath = '/home/RSI2017-ljm/Mic/fashion-landmarks/FData/Img/upper/';
load([filepath 'Uppertrainposition.mat']);
img = zeros(28283,224,224,3);
for t = 1:28283
img_orig = imread([filepath 'train/' char(Uppertrainposition{t,1})]);
img(t,:,:,:) = img_orig;
end
h5create([filepath 'train.hdf5'],'/data',size(img),'Datatype','double');
h5write([filepath 'train.hdf5'],'/data',img);
disp(t)
h5disp([filepath 'train.hdf5']);