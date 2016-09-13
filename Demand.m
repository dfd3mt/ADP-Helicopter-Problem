function AMR = AMRrequest  %Can add input arguments later like the some of the state info

NumHLZ=1:6;                         %get from Network.m
NumAMRs=randi(6);                   %Number of AMR's to be considered during horizon
AMRAtt=8;                           %Number of attributes of the AMR object
SPLoc=randi(length(NumHLZ),NumAMRs,1);                %Starting location
 EndLoc=zeros(NumAMRs,1);
for i=1:NumAMRs
    EndLoc(i)=randi(length(NumHLZ));
    while EndLoc(i)==SPLoc(i)
        EndLoc(i)=randi(length(NumHLZ));
    end
end
    
%NumHLZ=repmat(NumHLZ,NumAMRs,1);
%availHLZ=NumHLZ(NumHLZ~=SPLoc);     %Possible destinations

     %Destination Location       
SPTime=randi([0600 2200],NumAMRs,1);          %Start Time  
SPWinB=randi(90,NumAMRs,1);                   %How much flexibility the passengers have to the left
SPWinE=randi(90,NumAMRs,1);                   %How much flexibility the passenders have to the right
NumPers=randi(14,NumAMRs,1);                  %Number of Passengers
EquipWeight=randi(3000,NumAMRs,1);            %
Priority=randi(5,NumAMRs,1);                  
%NumLegs=randi(6,NumAMRs);          %Number of Legs on current AMR
AMR=zeros(NumAMRs,AMRAtt);
AMR(:,1)=Priority;
AMR(:,2)=NumPers;
AMR(:,3)=SPLoc;
AMR(:,4)=EndLoc;
AMR(:,5)=SPTime;
AMR(:,6)=SPWinB;
AMR(:,7)=SPWinE;
AMR(:,8)=EquipWeight;
AMRHead={'Priority' 'NumPers' 'SPLoc' 'EndLoc' 'SPTime' 'SPWinB' 'SPWinE' 'EquipWeight'}
AMR
