v2=[v,vbr];
a2=[a,abr];
br2=[tr,br];


F=scatteredInterpolant(v2',a2',br2');%转成列向量
vubr=0:0.05:50;
aubr=-8:0.05:5;
tablebr=zeros(length(vubr),length(aubr));
for i=1:length(vubr)
    for j=1:length(aubr)
        tablebr(i,j)=F(vubr(i),aubr(j));
    end
end