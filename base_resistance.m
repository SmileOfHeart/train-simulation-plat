function [sys,x0,str,ts,simStateCompliance] = base_resistance(t,x,u,flag)
%tractedForceCurve Example unit delay MATLAB File S-function
%   The MATLAB file S-function is an example of how to implement a unit
%   delay.
%   
%   See sfuntmpl.m for a general S-function template.
%
%   See also SFUNTMPL.
    
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $

switch flag,
 
  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,                                                
    [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes;    
   
  %%%%%%%%%%
  % Output %
  %%%%%%%%%%
  case 3,                                               
    sys = mdlOutputs(t,x,u);    

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
   case { 1, 2, 4, 9 }
    sys=[];

  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end

%end sfundsc2

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes

sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = -1;
sizes.NumInputs      = -1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);

x0  = [];
str = [];
ts  = [-1 0]; % Sample period of 0.1 seconds (10Hz)

% speicfy that the simState for this s-function is same as the default
simStateCompliance = 'DefaultSimState';

% end mdlInitializeSizes




%end mdlUpdate

%
%=======================================================================
% mdlOutputs
% Return the output vector for the S-function
%=======================================================================
%
function sys = mdlOutputs(t,x,u)
            %输出基本阻力对应的加速度
            u=u*3.6;%换算成km/h
            a=2.031;
            b=0.0622;
            c=0.001807;
            sys=(a+b*u+c*u^2)*9.8/1000;
%end mdlOutputs

