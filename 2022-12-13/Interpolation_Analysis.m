load Z.mat
[row,column]=size(Z);
x=Z(1,:);
ylab={'����','�ֳ�','����','COD','ˮ��','PHֵ','�ζ�','͸����','�ܼ��','������','͸����','������'};
disp (['����' num2str(row-1) '��ָ����Ҫ��ֵ']) ;
disp('���ڶ�һ�ų����ΰ������ز�ֵ����ȴ�');
for i=2:row
    y=Z(i,:);
    new_x=1:15;
    p1=pchip(x,y,new_x);
    subplot(4,3,i-1);
    plot(x,y,'bo',new_x,p1,'r-');
    axis([0 15,-inf,inf]);
    xlabel('����');
    ylabel(ylab{i});
    P(i-1,:)=p1;
end
legend( 'ԭʼ����','���ΰ������ز�ֵ����','Location','SouthEast')