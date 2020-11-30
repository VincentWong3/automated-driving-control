%%%启动前检查carsim的初速度是否为0
x=0;%初始化油门
for i=1:21
    %该程序非常耗时，如果需要更多更密集的数据，请先测试
    sim('calibration');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    thr_temp(:,i)=ones(length(vx.data),1)*x;        
    x=x+0.05;
end

%合并,一定要转成行向量再合并，否则会导致合并失败
 v=v_temp(:,1)';
 a=a_temp(:,1)';
 tr=thr_temp(:,1)';
for i=2:length(v_temp(1,:))
    v=[v,v_temp(:,i)'];
    a=[a,a_temp(:,i)'];
    tr=[tr,thr_temp(:,i)'];
end

        




    
    
    
