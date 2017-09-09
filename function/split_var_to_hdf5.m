target = 'val';
filepath = ['/home/RSI2017-ljm/Mic/fashion-landmarks/FData/Img/upper/newData/' target '/'];
chunk = 1374;
for t = 1:6
    if (size(val,2) > chunk * t)
        temp_label = val(:,chunk * (t-1)+1:chunk* t);
        temp_img = val_img(:,:,:,chunk * (t-1)+1: chunk * t);   
    else
        temp_label = val(:,chunk * (t-1)+1:end);
        temp_img = val_img(:,:,:,chunk * (t-1)+1:end);
    end
    h5create([filepath target num2str(t) '.hdf5'],'/data',size(temp_img),'Datatype','double');
    h5write([filepath target num2str(t) '.hdf5'],'/data',temp_img);
    h5create([filepath target num2str(t) '.hdf5'],'/label',size(temp_label),'Datatype','double');
    h5write([filepath target num2str(t) '.hdf5'],'/label',temp_label);
    disp(t);
end
