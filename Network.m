NumHLZ=6;
GridLoc=[22 14;24 30;17 44;28 34;43 35;21 11];
HLZAttr=3;

HLZAdMat=zeros(NumHLZ);
for i=1:NumHLZ-1
    for j=i+1:NumHLZ
        HLZAdMat(i,j)=sqrt(((GridLoc(i,1)-GridLoc(j,1))^2)+((GridLoc(i,2)-GridLoc(j,2))^2));
    end
end
for j=1:NumHLZ-1
    for i=j+1:NumHLZ
        HLZAdMat(i,j)=sqrt(((GridLoc(i,1)-GridLoc(j,1))^2)+((GridLoc(i,2)-GridLoc(j,2))^2));
    end
end

HLZ=zeros(NumHLZ,HLZAttr);           %preallocates space for HLZ
HLZ(:,1)=ones(NumHLZ,1);            %open or closed indicator for HLZ
HLZ(:,2)=randi(3,NumHLZ,1);         %fuel resupply 0 means none, 1 means cold, 2 means hot
HLZ(:,3)=round(5+40*rand(NumHLZ,1));         %No longer than time a bird can be on the ground in minutes
HLZHead={'Status' 'Fuel' 'TimeonGround'}
HLZ