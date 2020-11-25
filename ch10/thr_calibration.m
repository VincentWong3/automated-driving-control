thr=0;%初始化油门
for i=1:101
    %该程序非常耗时，如果需要更多更密集的数据，请先测试
    sim('calibration');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    thr_temp(:,i)=ones(length(vx.data),1)*thr;
    thr=thr+0.01;
end

%合并,一定要转成行向量再合并，否则会导致合并失败
v=v_temp(:,1)';
a=a_temp(:,1)';
tr=thr_temp(:,1)';
for i=2:length(a_temp(1,:))
    v=[v,v_temp(:,i)'];
    a=[a,a_temp(:,i)'];
    tr=[tr,thr_temp(:,i)'];
end
%拟合
F=scatteredInterpolant(v',a',tr');%转成列向量
vu=0:0.1:50;
au=0:0.1:5;
table=zeros(length(vu),length(au));
for i=1:length(vu)
    for j=1:length(au)
        table(i,j)=F(vu(i),au(j));
    end
end

        




    
    
    
