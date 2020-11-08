brake=0.1;%初始化油门
for i=1:80
    %该程序非常耗时，如果需要更多更密集的数据，请先测试
    sim('calibration');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    brake_temp(:,i)=ones(length(vx.data),1)*brake;
    brake=brake+0.1;
    
end


%合并,一定要转成行向量再合并，否则会导致合并失败
vbr=v_temp(:,1)';
abr=a_temp(:,1)';
br=brake_temp(:,1)';
for i=2:80
    vbr=[vbr,v_temp(:,i)'];
    abr=[abr,a_temp(:,i)'];
    br=[br,brake_temp(:,i)'];
end
% 
%拟合
F=scatteredInterpolant(vbr',abr',br');%转成列向量
vubr=0:0.05:50;
aubr=-8:0.05:0;
tablebr=zeros(length(vubr),length(aubr));
for i=1:length(vubr)
    for j=1:length(aubr)
        tablebr(i,j)=F(vubr(i),aubr(j));
    end
end






    
    
    
