%Lab 9
%Kara Meyer
%5-2-2019
%Find slope between data points with uneven step values using 
%Numerical Differentiation

clear all;

%Define your wavelength and index 
x=[.2 .25 .3 .36 .45 .6 1 1.6 2.2];
n=[1.551 1.507 1.488 1.475 1.466 1.458 1.450 1.443 1.435];

%Call the function
[xDiff,dispersion]= FirstDerivUneq(n,x)

%Use diff and divide by out x differences to find the dispertion
dispersionMatlab=diff(n)./xDiff %See how accurate our results are

function [xDiff,dispersion]= FirstDerivUneq(n,x)

    %Create a blank array for the dispersion values to be entered into
    %Also create a blank array for x difference values to be entered into
    dispersion=zeros(1,length(n)-1);
    xDiff=zeros(1,length(x)-1);

    %Calculate your dispersion between the first two data points
    %Also calculate the x difference for later calculation 
    dispersion(1)= (n(2)-n(1))/(x(2)-x(1));
    xDiff(1)=x(2)-x(1);

    %Calculate your dispersion for in between data points
    %Also calculate the x difference for later calculation 
    for i=2:(length(n)-2)
        dispersion(i)= (n(i+1)-n(i-1))/(2*(x(i+1)-x(i-1)));
        xDiff(i)=x(i+1)-x(i);
    end

    %Calculate your dispersion between the last two data points
    %Also calculate the x difference for later calculation 
    dispersion(length(n)-1)= (n(length(n))-n(length(n)-1))/(x(length(x))-x(length(x)-1));
    xDiff(length(xDiff))=x(length(x))-x(length(x)-1);

end