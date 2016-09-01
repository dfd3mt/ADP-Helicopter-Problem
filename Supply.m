AvailBH=4;                          %Number of Black Hawk pairs available
BHAttrib=3;                         %Number of required black hawk attributes
AvailTeams=5;                       %Number of available Flight crews each for a team of two black hawks to start day
MaxFuel=360*ones(AvailBH,1);        %Total amount of gallons of fuel a BH can hold
CapRem=4000*rand(AvailBH,1);   %Weight Capacity Remaining in lbs
%TTMinorMaint=15;                   %Amount of time until next scheduled minor maintenence
%TTSigMaint=50;                     %Amount of time until next scheduled significant maintenence
InFlight=randsample([0,1],AvailBH,true);    %Indicator for whether or not the bird is inflight
BlackHawk=zeros(AvailBH,BHAttrib);  %Preallocate matrix
BlackHawk(:,1)=MaxFuel;             
BlackHawk(:,2)=CapRem;
BlackHawk(:,3)=InFlight;
BlackHawkHead={'MaxFuel' 'CapRem' 'InFlight'}
BlackHawk