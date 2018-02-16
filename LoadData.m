function [filename, pathname]=LoadData()
[filename, pathname] = uigetfile({'*.mat','All Files'});
load([ pathname,filename]);
%global getVarName;
%getVarName=who('FP*');
%gb=evalin('base','getVarName');
%end