TatCaAnh = loadMNISTImages('train-images.idx3-ubyte');
Anh00001 = reshape(TatCaAnh(:,60000),28,28);
imshow(Anh00001);