load Z.mat
[row,column]=size(Z);
x=Z(1,:);
ylab={'周数','轮虫','溶氧','COD','水温','PH值','盐度','透明度','总碱度','氯离子','透明度','生物量'};
disp (['共有' num2str(row-1) '个指标需要插值']) ;
disp('正在对一号池三次埃尔米特插值，请等待');
for i=2:row
    y=Z(i,:);
    new_x=1:15;
    p1=pchip(x,y,new_x);
    subplot(4,3,i-1);
    plot(x,y,'bo',new_x,p1,'r-');
    axis([0 15,-inf,inf]);
    xlabel('星期');
    ylabel(ylab{i});
    P(i-1,:)=p1;
end
legend( '原始数据','三次埃尔米特插值数据','Location','SouthEast')