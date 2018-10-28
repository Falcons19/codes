clc
clear all
disp('All Inputs in Pounds');
disp(' ');
totalLift = input('Total lifting capacity: ');
emptyWeight = input('Empty Weight of plane: ');
batteryWeight = input('Weight of main battery pack: ');
motorWeight = input('Weight of motor: ');
elecWeight = input('Weight of elctronics: ');
disp('Weight of CDA = 0.5625 lbs');
disp(' ');
disp('Payload lifting capacity: ');
payloadLift = totalLift - (emptyWeight+batteryWeight+motorWeight+elecWeight+0.5625)

Nc = 40:1:60;            %Max 80 Colonists
Nh = 1:1:15;            %Max 15 Habitats
x = 10;                 %Max 10 Water bottles (1000ml)
Nw = 16.9:16.9:(16.9*x); 
S = 40:1:50;             %Max 50lbs static payload
N = 5;                  %Number of rounds

for i=1:length(Nc)
    for j=1:length(Nh)
        for k=1:length(Nw)
            for l=1:length(S)
                score(i,j,k,l) = (Nc(i)*(25/15)*(2^(1-max((Nc(i)/(8*Nh(j))),(Nc(i)/Nw(k))))) + 2*S(l))/N;
            end
        end
    end
end

t = 1;
for i=1:length(Nc)
    for j=1:length(Nh)
        for k=1:length(Nw)
            for l=1:length(S)
                if((Nh(j)*0.36875 + S(l) + Nw(k)*0.0652) <= N*payloadLift)
                    FSS(t,1) = Nc(i);
                    FSS(t,2) = Nh(j);
                    FSS(t,3) = Nw(k);
                    FSS(t,4) = S(l);
                    FSS(t,5) = score(i,j,k,l);        
                    t = t + 1;
                end
            end
        end
    end
end
FSS_Sorted = sortrows(FSS,-5);

disp('Colonists(#) | Habitats(#) | Water(fl-oz) | Static(lbs) | Score');
FSS_Sorted(1:40,:)
csvwrite('payload_optimization.csv',FSS_Sorted);