function TH3_Q7()
    nNumber = 1;
    right = 0;
    wrong = 0;
    while(nNumber <= 10000)
        lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');

        lblImageTest = lblTestAll(nNumber);

        if(num2str(TH3_Q5(nNumber)) == num2str(lblImageTest))
            right = right + 1;
        else
            wrong = wrong + 1;
        end
        nNumber = nNumber + 1;
    end
    fprintf('\nSo anh nhan dang dung: [%d].',right);
    fprintf('\nSo anh nhan dang sai: [%d].',wrong);
end