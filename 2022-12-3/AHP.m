%输入与判断P
disp('请输入判断矩阵A')
A=input('A=')
error=0;
[r,c]=size(A);
if r~=c || r<=1
    error=1;
end
if error==0
    [n,n]=size(A);
    if sum(sum(A<=0))>0
        error=2;
    end
end
if (error==0)
   if n>15
    error=3;
   end
end
if (error==0)
   if sum(sum(A'.*A~=ones(n)))>0
    error=4;
   end
end

%权重的计算
if error==0
%1.算术平均数求权重
    Sum_Of_A=sum(A);
    Sum_A=repmat(Sum_Of_A,n,1);
    Stand_A=A./Sum_A;
    disp('算术平均法求得权重为:')
    disp(sum(Stand_A,2)./n)
%2.几何平均求权重
    Prduct_A = prod(A,2);
    Prduct_n_A = Prduct_A .^ (1/n);
    disp('几何平均法求权重的结果为：');
    disp(Prduct_n_A ./ sum(Prduct_n_A))
%3.特征值求权重
    [V,D] = eig(A);
    Max_eig = max(max(D));
    [r,c]=find(D == Max_eig,1);
    disp('特征值法求权重的结果为：');
    disp( V(:,c) ./ sum(V(:,c)) )

%判断一致性
    CI = (Max_eig - n) / (n-1);
    RI=[0 0.00001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
    CR=CI/RI(n);
    if CR<0.1
        disp('一致性较好')
    else
        disp('一致性不好，请修改矩阵')
    end
    disp('一致性指标CI=')
    disp(CI)
    disp('一致性比例CR=')
    disp(CR)

%错误分析
elseif error==1
    disp('矩阵的维数太小或不为方阵!')
elseif error==2
    disp('矩阵中有小于0的元素!')
elseif error==3
    disp('矩阵的维数超过了十五!')
elseif error==4
    disp('矩阵不为正互反矩阵!')
end
