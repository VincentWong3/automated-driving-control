%启动前检查车的初速度是否为180
x=0;%初始化刹车
%%刹车的初速度一定要比较高，180km/h、144km/h
for i=1:81
    %该程序非常耗时，如果需要更多更密集的数据，请先测试
    sim('calibration');
    v_temp1(:,i)=vx.data;
    a_temp1(:,i)=ax.data;
    brake_temp1(:,i)=ones(length(vx.data),1)*x;
    %%%%这里是消除奇异性，因为无论brake=1还是2，最后都会导致车的v，a=0；这将导致多值性
    for j=1:length(v_temp1(:,i))
        if v_temp1(j,i)<0.01
            brake_temp1(j,i)=0;
        end        
    end
  
    x=x-0.1;   
end
a_temp1(1,:)=a_temp1(2,:);

%合并,一定要转成行向量再合并，否则会导致合并失败
vbr=v_temp1(:,1)';
abr=a_temp1(:,1)';
br=brake_temp1(:,1)';
for i=2:length(v_temp1(1,:))
    vbr=[vbr,v_temp1(:,i)'];
    abr=[abr,a_temp1(:,i)'];
    br=[br,brake_temp1(:,i)'];
end







    
    
    
