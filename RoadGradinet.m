function grad= RoadGradinet(pos)
%UNTITLED2 道路坡度信息
%返回值：角度
    GRAARRAY= [173.7,335,	535,	865,	1525,	2055,	2425,	2625 ;-2,-3,	12,	3.15,-8,3,4.25,	-2 ]; 
    grad=0;
    startPoint=GRAARRAY(1,:);
    gradList=GRAARRAY(2,:);
    grad=findAt( startPoint,gradList,pos);
end

