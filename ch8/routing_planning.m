count=50;
[x1,y1,theta1,kr1]=straight([0,0],[20,0],0,count);
[x2,y2,theta2,kr2]=arc([20,0],[30,10],0,pi/2,count);
[x3,y3,theta3,kr3]=arc([30,10],[40,20],pi/2,0,count);
[x4,y4,theta4,kr4]=arc([40,20],[40,40],0,pi,count);
[x5,y5,theta5,kr5]=arc([40,40],[35,35],pi,3*pi/2,count);
[x6,y6,theta6,kr6]=arc([35,35],[25,35],3*pi/2,pi/2,count);
[x7,y7,theta7,kr7]=arc([25,35],[15,35],pi/2,3*pi/2,count);
[x8,y8,theta8,kr8]=arc([15,35],[5,35],3*pi/2,pi/2,count);
[x9,y9,theta9,kr9]=arc([5,35],[-15,35],pi/2,3*pi/2,count);
[x10,y10,theta10,kr10]=straight([-15,35],[-15,15],3*pi/2,count);
[x11,y11,theta11,kr11]=arc([-15,15],[0,0],3*pi/2,2*pi,count);
xr=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11];
yr=[y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11];
thetar=[theta1,theta2,theta3,theta4,theta5,theta6,theta7,theta8,theta9,theta10,theta11];
kappar=[kr1,kr2,kr3,kr4,kr5,kr6,kr7,kr8,kr9,kr10,kr11];






    


function[xr,yr,thetar,kr]=straight(init_coord,end_coord,init_angle,count)
delta_x=(end_coord(1)-init_coord(1))/(count-1);
delta_y=(end_coord(2)-init_coord(2))/(count-1);
for i=1:count
    xr(i)=init_coord(1)+delta_x*i;
    yr(i)=init_coord(2)+delta_y*i;
    thetar(i)=init_angle;
    kr(i)=0;
end      
end

function[xr,yr,thetar,kr]=arc(init_coord,end_coord,init_angle,end_angle,count)
    L=sqrt((init_coord(1)-end_coord(1))^2+(init_coord(2)-end_coord(2))^2);
    R=L/sqrt(2*(1-cos(end_angle-init_angle)));
    delta_angle=(end_angle-init_angle)/(count-1) ;
  
       for i=1:count
           if delta_angle>0
               xr(i)=init_coord(1)-R*sin(init_angle)+R*sin(init_angle+delta_angle*(i-1));
               yr(i)=init_coord(2)+R*cos(init_angle)-R*cos(init_angle+delta_angle*(i-1));
               thetar(i)=init_angle+delta_angle*i;
               kr(i)=1/R;
           else
               xr(i)=init_coord(1)+R*sin(init_angle)-R*sin(init_angle+delta_angle*(i-1));

               yr(i)=init_coord(2)-R*cos(init_angle)+R*cos(init_angle+delta_angle*(i-1));
               thetar(i)=init_angle+delta_angle*i;
               kr(i)=-1/R;
           end               
       end  
end


