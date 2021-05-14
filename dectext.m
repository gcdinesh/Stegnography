c=fopen('textdec.txt');
arr=fscanf(c,'%d');
[r,col]=size(arr);
q=r/16;
rem=mod(r,16);
text=fopen('aes_ptext.txt','w');
k=1;
for i = 1:q
    ciphertext=ones(1,16);
    for j = 1:16
        ciphertext(1,j)=double(arr(k));
        k=k+1;
    end;
    plain=aes_dec(ciphertext);
    fprintf(text,'%c',char(plain));
end;
fclose(c);
fclose(text);