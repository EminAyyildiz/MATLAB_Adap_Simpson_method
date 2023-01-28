clc; %The system deletes the information in the command window at each reboot, providing a more aesthetic appearance.

clear; % this, again, like our clc code, helps us to clean our workspace and provide an aesthetic appearance.
close all;
first = intSimpsons(@ayyildiz01,1,3);%It calls the function we created with the simpson rule in the intSimpson file and writes 1 instead of a, instead of 3, instead of b.
fprintf("Value in the range 1-3 : %f \n", first) %The purpose of this code is to print the operation we have done in the top line on the screen.

fourth = intSimpsons(@ayyildiz01,3,5);%It calls the function we created with the simpson rule in the intSimpson file and writes 3 instead of a, instead of 5, instead of b.
fprintf("Value in the range 3-5 : %f \n", fourth)%The purpose of this code is to print the operation we have done in the top line on the screen.

second = intSimpsons(@ayyildiz01,5,7);%It calls the function we created with the simpson rule in the intSimpson file and writes 5 instead of a, instead of 7, instead of b.
fprintf("Value in the range 5-7 : %f \n", second)%The purpose of this code is to print the operation we have done in the top line on the screen.

fifth = intSimpsons(@ayyildiz01,7,9); %It calls the function we created with the simpson rule in the intSimpson file and writes 7 instead of a, instead of 9, instead of b.
fprintf("Value in the range 7-9 : %f \n", fifth)%The purpose of this code is to print the operation we have done in the top line on the screen.

integral1_3 = integral(@ayyildiz01,1,3);
integral3_5 = integral(@ayyildiz01,3,5);
integral5_7 = integral(@ayyildiz01,5,7);
integral7_9 = integral(@ayyildiz01,7,9);

% We calculate the integral of 1-3, 3,5, 5-7,7-9.
%task1-6
disp('TASK-1-6');%The purpose of this code is to issue a notification in the command window to indicate after 6 of the subheadings in TASK-1.


rand1 = 1+ (3-1)*rand(1);% %What we aim here is to have the system select a random number in the range of 1-3.

rand2 = 7+ (9-7)*rand(1);%5 7 arası
%At this point, the purpose of writing rand(1) is to ensure that only 1 number is selected from the ranges we want.
disp('rand1 value :');
disp(rand1);

disp('rand2 value :')
disp(rand2);

%My main purpose of using this code is to check if the random command is working. 
%It will allow us to see which number this number is with the rand values that we will print on the screen.

tol1 = 0.09;
tol2 = 0.005; %Here we define the tolerance values that we will use in the function by entering 3 different tolerance values.
tol3 = 0.0001;




[estIntEx1, intervalsEx1] = adapSimpsons(@ayyildiz01,rand1,rand2,tol1); 
%in this code we are calling the adapSimpson file.
%With estIntEx1 we aim to get the value of this function, and with IntervalsEx1 we aim to get the bottom rows that occur in this range.

fprintf("estIntEx1 value  : %f \n",estIntEx1);

sizeex1 = size(intervalsEx1);


[estIntEx2, intervalsEx2]= adapSimpsons(@ayyildiz01,rand1,rand2,tol2);
fprintf("estIntEx2 value  : %f \n",estIntEx2);



sizeex2 = size(intervalsEx2);%size kodu ile intervalsEx2 matriksinin boyutunu hesaplıyoruz.

[estIntEx3, intervalsEx3]= adapSimpsons(@ayyildiz01,rand1,rand2,tol3);
fprintf("estIntEx3 value  : %f \n",estIntEx3);


sizeex3 = size(intervalsEx3);

integralvalue = integral(@ayyildiz01, rand1, rand2); %The purpose of this code is to take the integral of our function in our ayyildiz01 file.
%The integral value we will take here is our real mathematical value, and it will allow us to compare the results of the operations we have done with the error values before.
fprintf('Integral value of the function : %f \n', integralvalue);


grid on % The goal of our input code is to make the grids appear behind the plot graph that we will print on the screen.
hold on %hold on kodumuzun hedefi ise veriyi tutmaktır. 3 farklı çıktı alacağımız için grafiklerin hepsinin tek grafikte olması için her veriyi tutmamız gerekmektedir.
% plot(sutun1,sutun2,'Color','blue',LineStyle='-', Marker="o"); % bu kodumuz genel olarak grafiği bastırmayı grafiğin hangi verileri kapsayacağı, nasıl bir görüntü elde edeceğiz renk gibi ifadeleri ayarlamamızı sağlar.
 %bastıracağımız grafiğe başlık vermeyi sağlar.
m = 1:0.1:9;
%At this point, we define our f(x) function, which goes from 1 to 9 with 0.1 increments, to use in the graph.

sutun1 = intervalsEx1(:,1);
sutun2 = intervalsEx1(:,2);

sutun3 = intervalsEx2(:,1);
sutun4 = intervalsEx2(:,2);

sutun5 = intervalsEx3(:,1);
sutun6 = intervalsEx3(:,2);

% The purpose of our column definition is to separate the intervalsEx matrices as column 1 and column 2.
son1 =intervalsEx1(end:end);
intson1 =[sutun1; son1];

son2 =intervalsEx2(end:end);
intson2 = [sutun3; son2];

son3 =intervalsEx3(end:end);
intson3 = [sutun5 ;son3];
%our goal here is to add our largest intervals value in the last row of the 2nd column to the 1st column. in this way, we will be able to get our biggest value when we print the chart.

subplot(3,1,1);
plot(m,ayyildiz01(m),"LineWidth",2, 'Color','green');
%At this point, we print the graph of the f(x) function with m variables that we defined above. this is to show the subintervals points on the graph.
%additionally here I defined the thickness and color of the line
title('intervalsExs1 GRAPH--tol = 0.09','FontSize',14,'Color','black'); %It allows to give a title to the graphic we print.
xline(intson1,Color='red',LineStyle='-.');

grid on


subplot(3,1,2);
plot(m,ayyildiz01(m),"LineWidth",2, Color="blue");
title('intervalsExs2 GRAPH--tol = 0.005','FontSize',14,'Color','blue');
xline(intson2,Color='black',LineStyle='--');
%My goal here is to use the columns we pulled from the intervalsEx chart we created as x values to ensure that the intervals in the chart appear in a vertical position.
grid on


subplot(3,1,3); %With the subplot command, I printed the graphics separately in the same window and specified which row, which column and which row.
plot(m,ayyildiz01(m),"LineWidth",2, Color="magenta");
title('intervalsExs3 GRAPH--tol = 0.001','FontSize',14,'Color','magenta');

xline(intson3,Color='blue');
grid on %I added grids to the back of the graphs formed with grid on.






