clc
clear
Actions = 3;                                        %defines number of actions or decisions to be made
ExpectCost=[-0,-1000,-3000,-1000000];                   %Input of the expected cost of operating in each state
Overhaul=-2000;                                      %Cost to overhaul the part
Replace=-4000;                                       %Cost to replace the part
LostProd=-2000;                                      %Cost for making a decision to either overhaul or replace the part due to lost production
States=size(ExpectCost,2);                          %defines the number of states based on the length of the expected value vector
iteration=2;                                        %sets iteration to record numnber of iterations
V(:,1)=[0;0;0;0];                                   %records the previous iteration value vector and is set to all ones so that the program can get into the while loop
V(:,iteration)=[10000;10000;10000;10000];           %records the current value vector
eps=0.1;                                         %terminating criteria
alpha=.95;                                          %scaling factor
vhat=0;
initialstate=round(rand*4+.5);                      %finds initial starting state
state=initialstate; 
gamma=.95;
change=50;

for i = 1:States
    for j=1:Actions
        if j==1
            C(i,j)=ExpectCost(i);
        else if j==2
            C(i,j)=Overhaul + LostProd;             % first loop builds the cost matrix using the parameters of 
            else                                    % ExpectCost, Overhaul, Replace, and LostProd
                C(i,j)=Replace + LostProd;
            end
        end
    end
end
C(4,1)=ExpectCost(4);                               % Hard code the prohibitive cost of doing nothing and overhauling a completely broken part
C(4,2)=ExpectCost(4);


while norm(V(:,iteration)-V(:,iteration-1))>eps                             % Checks the terminating condition
    for i = 1:3             %determines which state the move decision will take us to
            if i == 1       
            pds=state;
       
            else if i == 2
            pds = 2;
            
            else pds = 1;
                end
            end
        T(i)=C(state,i)+(gamma*V(pds,iteration));  %Stores the values of C(ij)+V
        [vhat,decision(iteration)]=max(T);
    end
            if decision(iteration) == 1             %takes us to the post decision state
              pds=state;
        
              else if decision(iteration) == 2
               pds = 2;
              else pds = 1;
                  end
            end
        choice(iteration,:)=[state;decision(iteration);pds];       %used for tracking
    V(:,iteration+1)= V(:,iteration);                               %updates all entries of value vector
    V(pds,iteration+1)=0;                                           %gets ready to update the pds entry
    V(pds,iteration+1)=(1-alpha)*V(pds,iteration)+alpha*vhat;       %updates the pds entry of the vector
    state = TPMState(pds);                                          %calls function to take random step
   
    iteration=iteration+1;   
    
  
    alpha=.95*((3000-iteration)/3000);                              %linearly decreases
    alpha1(iteration)=alpha;
end
V(:,iteration)
iteration            
sum(V(:,iteration))            
            
            