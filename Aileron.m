clc
clear all
tau=input('Enter the aileron effectiveness:');
CL_wing=input('Enter the 3-D Lift curve slope for wing IN RADIANS:');
Cr=input('Enter the root chord of wing:');
lamda=input('Enter taper ratio of wing:');
delA=input('Enter the deflection of aileron:');
Ixx=input('Enter the inertia about x-axis:');
Sht=input('Enter hstab area:');
Svt=input('Enter vstab area:');
Cdr=input('Enter the roll drag coefficient:'); %should be between 0.7-1.2
yd=input('Enter the distance of MAC of wing from centre line:');
v=input('Enter the cruise velocity:');
S=input('Enter wing area:');
b=input('Enter wing span:');
y0=input('Enter aileron outboard location:');
yi=input('Enter aileron inboard location:');
CldelA=((2*CL_wing*tau*Cr)/(S*b))*((((y0*y0)/2)+((2/3)*((lamda-1)/b)*(y0*y0*y0)))-(((yi*yi)/2)+((2/3)*((lamda-1)/b)*(yi*yi*yi))));
Cl=(CldelA*delA*3.14)/180;
La=0.5*1.225*v*v*S*Cl*b;
roll_rate=((2*La)/(1.225*(S+Sht+Svt)*Cdr*yd*yd*yd))^0.5
bank_angle1=(Ixx*log(roll_rate*roll_rate))/(1.225*yd*yd*yd*(S+Sht+Svt)*Cdr)
rate_rollrate=(roll_rate*roll_rate)/(2*bank_angle1)
time_for_45=((2*45)/(rate_rollrate))^0.5
Ca_C=input('Enter the Ca/C ratio:');
MAC=input('Enter the MAC of wing:');
Aileron_MAC=MAC*Ca_C;
Area_Aileron=Aileron_MAC*(y0-yi)
Area_ratio=Area_Aileron/S