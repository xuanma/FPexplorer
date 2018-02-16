function varargout = FPxuan1(varargin)
% FPXUAN1 MATLAB code for FPxuan1.fig
%      FPXUAN1, by itself, creates a new FPXUAN1 or raises the existing
%      singleton*.
%
%      H = FPXUAN1 returns the handle to a new FPXUAN1 or the handle to
%      the existing singleton*.
%
%      FPXUAN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FPXUAN1.M with the given input arguments.
%
%      FPXUAN1('Property','Value',...) creates a new FPXUAN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FPxuan1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FPxuan1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FPxuan1

% Last Modified by GUIDE v2.5 06-Jun-2016 14:41:58

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FPxuan1_OpeningFcn, ...
                   'gui_OutputFcn',  @FPxuan1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before FPxuan1 is made visible.
function FPxuan1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FPxuan1 (see VARARGIN)

% Choose default command line output for FPxuan1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FPxuan1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FPxuan1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global channel;
channel=get(hObject,'Value');
if channel==[]
    channel=1;
end
assignin('base', 'channel',channel);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Success');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%gb=LoadData();
%LoadData;
[filename, pathname] = uigetfile({'*.mat','All Files'});
set(handles.edit2, 'String', [pathname,filename]);
load([pathname,filename]);
getVarName=who('FP*');
global tsStep;
global Ts;
global FPWave;
getStep=who('*step');tsStep=0;eval(['tsStep=eval([getStep{1, 1}])']);assignin('base','tsStep',tsStep);
getTs=who('*ts');Ts=0;eval(['Ts=eval([getTs{1, 1}])']);assignin('base','Ts',Ts);

j=0;
for i=1:length(getVarName)
    if(length(getVarName{i,1})<6)
        j=j+1;
        FPWaveString{j,1}=eval(['getVarName{i,1}']);
        FPWave{j,1}=eval([getVarName{i,1}]);
    end
end
assignin('base','FPWaveString',FPWaveString);

set(handles.listbox1, 'String',FPWaveString);
global checkState;
checkState=zeros(4,1);

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.xlsx','*.xls');
set(handles.edit3, 'String', [pathname,filename]);
timeEvent=xlsread([pathname,filename],3);
global tInterval;
global tsStep;
global Ts;
global FPWave;
trialNum=zeros(5,1);
for i=1:length(timeEvent)
    switch timeEvent(i,3)
        case 1
            trialNum(1,1)=trialNum(1,1)+1;
            tInterval{1,1}.start(trialNum(1,1),1)=timeEvent(i,1);
            tInterval{1,1}.endt(trialNum(1,1),1)=timeEvent(i,2);
            tInterval{1,1}.ind(trialNum(1,1),1)=ceil((timeEvent(i,1)-Ts)/tsStep);
            tInterval{1,1}.ind(trialNum(1,1),2)=ceil((timeEvent(i,2)-Ts)/tsStep);
            tInterval{1,1}.dispStyle{trialNum(1,1),1}=strcat(num2str(timeEvent(i,1)),'---',num2str(timeEvent(i,2)));
        case 2
            trialNum(2,1)=trialNum(2,1)+1;
            tInterval{2,1}.start(trialNum(2,1),1)=timeEvent(i,1);
            tInterval{2,1}.endt(trialNum(2,1),1)=timeEvent(i,2);
            tInterval{2,1}.ind(trialNum(2,1),1)=ceil((timeEvent(i,1)-Ts)/tsStep);
            tInterval{2,1}.ind(trialNum(2,1),2)=ceil((timeEvent(i,2)-Ts)/tsStep);
            tInterval{2,1}.dispStyle{trialNum(2,1),1}=strcat(num2str(tInterval{2,1}.start(trialNum(2,1),1)),'---',num2str(tInterval{2,1}.endt(trialNum(2,1),1)));
        case 3
            trialNum(3,1)=trialNum(3,1)+1;
            tInterval{3,1}.start(trialNum(3,1),1)=timeEvent(i,1);
            tInterval{3,1}.endt(trialNum(3,1),1)=timeEvent(i,2);
            tInterval{3,1}.ind(trialNum(3,1),1)=ceil((timeEvent(i,1)-Ts)/tsStep);
            tInterval{3,1}.ind(trialNum(3,1),2)=ceil((timeEvent(i,2)-Ts)/tsStep);
            tInterval{3,1}.dispStyle{trialNum(3,1),1}=strcat(num2str(timeEvent(i,1)),'---',num2str(timeEvent(i,2)));
        case 4
            trialNum(4,1)=trialNum(4,1)+1;
            tInterval{4,1}.start(trialNum(4,1),1)=timeEvent(i,1);
            tInterval{4,1}.endt(trialNum(4,1),1)=timeEvent(i,2);
            tInterval{4,1}.ind(trialNum(4,1),1)=ceil((timeEvent(i,1)-Ts)/tsStep);
            tInterval{4,1}.ind(trialNum(4,1),2)=ceil((timeEvent(i,2)-Ts)/tsStep);
            tInterval{4,1}.dispStyle{trialNum(4,1),1}=strcat(num2str(timeEvent(i,1)),'---',num2str(timeEvent(i,2)));
    end
end
set(handles.listbox2, 'String', tInterval{1,1}.dispStyle);
set(handles.listbox3, 'String', tInterval{2,1}.dispStyle);
set(handles.listbox4, 'String', tInterval{3,1}.dispStyle);
set(handles.listbox5, 'String', tInterval{4,1}.dispStyle);
assignin('base', 'tInterval',tInterval);
for k=1:length(FPWave)
    for i=1:4
        for j=1:trialNum(i,1)
           FPWave{k,2}.interval{i,1}.trial{j,1}=FPWave{k,1}(tInterval{i,1}.ind(j,1):tInterval{i,1}.ind(j,2),1);
        end
    end
end
assignin('base','FPWave',FPWave);

global intervalList;
intervalList=zeros(4,1);

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
global intervalList;
intervalList(1,1)=get(hObject,'Value');
set(handles.text6, 'String',num2str(intervalList(1,1)));

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
global intervalList;
intervalList(2,1)=get(hObject,'Value');
set(handles.text7, 'String',num2str(intervalList(2,1)));

% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4
global intervalList;
intervalList(3,1)=get(hObject,'Value');
set(handles.text8, 'String',num2str(intervalList(3,1)));

% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5
global intervalList;
intervalList(4,1)=get(hObject,'Value');
set(handles.text9, 'String',num2str(intervalList(4,1)));

% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global checkState;
checkState(1,1)=get(hObject,'Value');


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global checkState;
checkState(2,1)=get(hObject,'Value');


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global checkState;
checkState(3,1)=get(hObject,'Value');

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global checkState;
checkState(4,1)=get(hObject,'Value');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%FPWave=evalin('base','FPWave');
%get(hObject,'Value')
%checkState(1,1)=get(handles.checkbox2, 'Value');
%checkState(2,1)=get(handles.checkbox3, 'Value');
global checkState;
global FPWave;
global channel;
assignin('base', 'checkState',checkState);
if isempty(channel)==1
    channel=1;
end
assignin('base','channel',channel);
global intervalList;
assignin('base', 'intervalList',intervalList);
if any(checkState)==0   
   figure;
   plot(FPWave{channel,1}(:,1));
else
    for i=1:4
     if checkState(i,1)==1
        if intervalList(i,1)==0
            k=1;
        else
            k=intervalList(i,1);
        end
        figure
        plot(FPWave{channel,2}.interval{i,1}.trial{k,1}(:));
     end
    end
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
global intervalList;
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
else
    for i=1:4
     if checkState(i,1)==1
        if intervalList(i,1)==0
            k=1;
        else
            k=intervalList(i,1);
        end
        %add the code%%%%%%%%%%
        data=FPWave{channel,2}.interval{i,1}.trial{k,1}(:);
        L=length(data );
        NFFT = 2^nextpow2(L); % Next power of 2 from length of y
        y = fft(data,NFFT)/L;
        f = Fs/2*linspace(0,1,NFFT/2+1);
        plotLength=length(f);
        % Plot single-sided amplitude spectrum.
        figure
        plot(f(1:plotLength),2*abs(y(1:plotLength)));grid on
        title('Single-Sided Amplitude Spectrum of y(t)');
        xlabel('Frequency (Hz)')
        ylabel('|Y(f)|');
        figure
        semilogx(f(1:plotLength),2*abs(y(1:plotLength)));grid on
        %%%%%%%%
     end
    end
end


% --- Executes on button press in pushbutton6.
%分频段滤波
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
global intervalList;
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
else
    for i=1:4
     if checkState(i,1)==1
        if intervalList(i,1)==0
            k=1;
        else
            k=intervalList(i,1);
        end
        %add the code%%%%%%%%%%
        data=FPWave{channel,2}.interval{i,1}.trial{k,1}(:);
        L=length(data );
        %滤波程序段
        w1=filter(alphaFilter,data);FPWave{channel,2}.interval{i,1}.trial{k,2}=w1;%alpha滤出来存到第二列
        w2=filter(betaFilter,data);FPWave{channel,2}.interval{i,1}.trial{k,3}=w2;%beta滤出来存到第三列
        w3=filter(deltaFilter,data);FPWave{channel,2}.interval{i,1}.trial{k,4}=w3;
        w4=filter(gamma1Filter,data);FPWave{channel,2}.interval{i,1}.trial{k,5}=w4;
        w5=filter(gamma2Filter,data);FPWave{channel,2}.interval{i,1}.trial{k,6}=w5;
        w6=filter(gamma3Filter,data);FPWave{channel,2}.interval{i,1}.trial{k,7}=w6;
        w7=filter(bhfFilter,data);FPWave{channel,2}.interval{i,1}.trial{k,8}=w7;
        %画图程序段
        figure
        scrsz = get(0,'ScreenSize'); 
        set(gcf,'Position',scrsz);
        subplot(711);
        plot(w1);xlabel('sampling points');ylabel('amplitude');title('alpha band');
        subplot(712);
        plot(w2);xlabel('sampling points');ylabel('amplitude');title('beta band');
        subplot(713);
        plot(w3);xlabel('sampling points');ylabel('amplitude');title('delta band');
        subplot(714);
        plot(w4);xlabel('sampling points');ylabel('amplitude');title('gamma1 band');
        subplot(715);
        plot(w5);xlabel('sampling points');ylabel('amplitude');title('gamma2 band');
        subplot(716);
        plot(w6);xlabel('sampling points');ylabel('amplitude');title('gamma3 band');
        subplot(717);
        plot(w7);xlabel('sampling points');ylabel('amplitude');title('bhf band');
        %%%%%%%%
     end
    end
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
%global intervalList;
global avg_s;
global avg_e;
global avg_length;
if avg_e<=avg_s
    avg_e=avg_s+1;
end
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
   checkState(1,1)=1;
else
    for i=1:4
     if checkState(i,1)==1
        %得到avg分析的length
        if avg_e>length(FPWave{channel, 2}.interval{i, 1}.trial)
            avg_e=avg_s+1;
        end
        for k=1:avg_e-avg_s+1
            L(k)=length(FPWave{channel,2}.interval{i,1}.trial{avg_s+k-1,1}(:));
        end
        avg_length(i)=min(L);
        %add the code%%%%%%%%%%
        %data=FPWave{channel,2}.interval{i,1}.trial{k,1}(:);
        %平均程序段
        clear data;
        for k=1:avg_e-avg_s+1
            data(:,k)=FPWave{channel,2}.interval{i,1}.trial{avg_s+k-1,1}(1:avg_length(i));
        end
        clear w;
        for k=1:avg_length(i)
            w(k)=mean(data(k,:));
        end
        %画图程序段
        figure
        plot(w);title('AVG Waveform');
        %存储程序段
        FPWave{channel,2}.interval{i,1}.avgWave=w;
        %%%%%%%%
     end
    end
end
assignin('base','avg_length',avg_length);
assignin('base','FPWave',FPWave);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global avg_s;
avg_s=str2num(get(hObject,'String'));
if isempty(avg_s)==1
    avg_s=1;
end
assignin('base', 'avg_s',avg_s);



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global avg_e;
avg_e=str2num(get(hObject,'String'));
if isempty(avg_e)==1
    avg_e=2;
end
assignin('base', 'avg_e',avg_e);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
global viewCh;
%global intervalList;
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
   checkState(1,1)=1;
else
    for i=1:4
     if checkState(i,1)==1
        %画图程序段
        figure
        plot(FPWave{channel,2}.interval{i,1}.avgWave{1,viewCh});
		title('AVG Waveform');
     end
    end
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
global viewCh;
viewCh=get(hObject,'Value');
assignin('base','viewCh',viewCh);


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
%求取平均%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FPWave;
global avg_s;
global avg_e;
steps=length(FPWave);
h = waitbar(0,'Please wait...');
if isempty(avg_s)==1
    avg_s=1;
end
if avg_e<=avg_s
    avg_e=avg_s+1;
end
for i=1:length(FPWave)
    for j=1:length(FPWave{i,2}.interval)
        if avg_e>size(FPWave{i,2}.interval{j,1}.trial,1)
           avg_e=size(FPWave{i,2}.interval{j,1}.trial,1);
        end
        for k=1:avg_e-avg_s+1
            L(k)=length(FPWave{i,2}.interval{j,1}.trial{avg_s+k-1,1}(:));
        end
        avg_length(j)=min(L);
        clear data;
        %形成矩阵
        for m=1:size(FPWave{i,2}.interval{j,1}.trial,2)
            for k=1:avg_e-avg_s+1
              data(:,k)=FPWave{i,2}.interval{j,1}.trial{avg_s+k-1,m}(1:avg_length(j));
            end
            clear w;
            for k=1:avg_length(j)
                w(k)=mean(data(k,:));
            end
            FPWave{i,2}.interval{j,1}.avgWave{1,m}=w;
        end
    end
    waitbar(i / steps);
end
close(h);
assignin('base','FPWave',FPWave);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
%global intervalList;
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
   checkState(1,1)=1;
else
    for i=1:4
     if checkState(i,1)==1
        %画图程序段
        figure
        plot(FPWave{channel,2}.interval{i,1}.avgWave{1,1});
		title('AVG Waveform');
     end
    end
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FPWave;
h = waitbar(0,'Please wait...');
steps=length(FPWave);
for i=1:length(FPWave)
    for j=1:length(FPWave{i,2}.interval)
        for k=1:length(FPWave{i,2}.interval{j,1}.trial)
            data=FPWave{i,2}.interval{j,1}.trial{k,1}(:);
            w1=filter(alphaFilter,data);FPWave{i,2}.interval{j,1}.trial{k,2}=w1;%alpha滤出来存到第二列
            w2=filter(betaFilter,data);FPWave{i,2}.interval{j,1}.trial{k,3}=w2;%beta滤出来存到第三列
            w3=filter(deltaFilter,data);FPWave{i,2}.interval{j,1}.trial{k,4}=w3;
            w4=filter(gamma1Filter,data);FPWave{i,2}.interval{j,1}.trial{k,5}=w4;
            w5=filter(gamma2Filter,data);FPWave{i,2}.interval{j,1}.trial{k,6}=w5;
            w6=filter(gamma3Filter,data);FPWave{i,2}.interval{j,1}.trial{k,7}=w6;
            w7=filter(bhfFilter,data);FPWave{i,2}.interval{j,1}.trial{k,8}=w7; 
        end
    end
    waitbar(i / steps);
end
close(h);
assignin('base','FPWave',FPWave);
            


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global checkState;
global FPWave;
global channel;
global tsStep;
global intervalList;
if isempty(channel)==1
    channel=1;
end
Fs=1/tsStep;

if any(checkState)==0   
   %figure;
   %plot(FPWave{channel,1}(:,1));
else
    for i=1:4
     if checkState(i,1)==1
        if intervalList(i,1)==0
            k=1;
        else
            k=intervalList(i,1);
        end
        %add the code%%%%%%%%%%
		
        %画图程序段
        figure
        scrsz = get(0,'ScreenSize'); 
        set(gcf,'Position',scrsz);
        subplot(711);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,2});xlabel('sampling points');ylabel('amplitude');title('alpha band');
        subplot(712);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,3});xlabel('sampling points');ylabel('amplitude');title('beta band');
        subplot(713);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,4});xlabel('sampling points');ylabel('amplitude');title('delta band');
        subplot(714);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,5});xlabel('sampling points');ylabel('amplitude');title('gamma1 band');
        subplot(715);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,6});xlabel('sampling points');ylabel('amplitude');title('gamma2 band');
        subplot(716);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,7});xlabel('sampling points');ylabel('amplitude');title('gamma3 band');
        subplot(717);
        plot(FPWave{channel, 2}.interval{i, 1}.trial{k,8});xlabel('sampling points');ylabel('amplitude');title('bhf band');
        %%%%%%%%
     end
    end
end
