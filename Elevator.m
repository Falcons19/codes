1
clc
clear all
delmax=25;
spanratio=input('Enter the span ratio:');
W=input('enter weight:');
c=input('chord of h-stab:');
S=input('enter wing area:');
b=input('enter the span of hstab:');
rho=input('air density:');
Vc=input('enter cruise vel:');
CLaw=input('enter the slope of CL wing IN RADIANS:');
CLw=input('enter the CL of wing at cruise vel:');
AR=input('Enter the AR of wing:');
aw=input('wing angle of attack:');
ih=input('angle of incidence of hstab:');
CLcruise= (2*W)/(rho*S*Vc*Vc);
epsilon_0=(2*CLcruise)/(3.14*AR);
delepsilon=(2*CLaw)/(3.14*AR);
epsilon=epsilon_0+(delepsilon*(aw/57.3))
ah=aw+ih-(epsilon*57.3)
CLh=input('enter CLh:');
CLah=input('enter CLh slope:');
tau=((ah/57.3)+(-CLh/CLah))/(-0.436)

chord_ratio=input('enter the chord ratio based on tau:');
chord_e=c*chord_ratio
area_e=chord_e*spanratio*b
area_ratio=area_e/(c*b)
