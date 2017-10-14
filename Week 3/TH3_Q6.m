function TH3_Q6(n)
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');

    imgTest = imgTestAll(:,n);
    lblImageTest = lblTestAll(n);
    figure;
    img2D = reshape(imgTest,28,28);
    imshow(img2D);
    strLabelImage = 'Ban dau ';
    strLabelImage = [strLabelImage,num2str(lblImageTest),'.'];
    strLabelImage = [strLabelImage,' Du doan: '];
    strLabelImage = [strLabelImage,num2str(TH3_Q5(n)),'.'];

    if(num2str(TH3_Q5(n)) == num2str(lblImageTest))
        strLabelImage = [strLabelImage,' Ket qua dung.'];
    else
        strLabelImage = [strLabelImage,' Ket qua sai.'];
    end
    title(strLabelImage);
end