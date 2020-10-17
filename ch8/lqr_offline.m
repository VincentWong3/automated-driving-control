cf=-110000;
cr=cf;
m=1412;
Iz=1536.7;
a=1.015;
b=2.910-1.015;
k=zeros(5000,4);
for i=1:5000
    vx=0.01*i;
    A=[0,1,0,0;
        0,(cf+cr)/(m*vx),-(cf+cr)/m,(a*cf-b*cr)/(m*vx);
        0,0,0,1;
        0,(a*cf-b*cr)/(Iz*vx),-(a*cf-b*cr)/Iz,(a*a*cf+b*b*cr)/(Iz*vx)];
    B=[0;
        -cf/m;
        0;
        -a*cf/Iz];
    Q=1*eye(4);
    R=10;
    k(i,:)=lqr(A,B,Q,R);
end
k1=k(:,1)';
k2=k(:,2)';
k3=k(:,3)';
k4=k(:,4)';




    
    
