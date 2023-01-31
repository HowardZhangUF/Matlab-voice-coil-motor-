function varargout = ForcerStudioEX(varargin)
% FORCERSTUDIOEX MATLAB code for ForcerStudioEX.fig
%      FORCERSTUDIOEX, by itself, creates a new FORCERSTUDIOEX or raises the existing
%      singleton*.
%
%      H = FORCERSTUDIOEX returns the handle to a new FORCERSTUDIOEX or the handle to
%      the existing singleton*.
%
%      FORCERSTUDIOEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCERSTUDIOEX.M with the given input arguments.
%
%      FORCERSTUDIOEX('Property','Value',...) creates a new FORCERSTUDIOEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForcerStudioEX_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForcerStudioEX_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForcerStudioEX

% Last Modified by GUIDE v2.5 26-Jan-2022 14:32:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForcerStudioEX_OpeningFcn, ...
                   'gui_OutputFcn',  @ForcerStudioEX_OutputFcn, ...
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


% --- Executes just before ForcerStudioEX is made visible.
function ForcerStudioEX_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForcerStudioEX (see VARARGIN)

% Choose default command line output for ForcerStudioEX
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ForcerStudioEX wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ForcerStudioEX_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
im = imread('logoname.jpg');
imshow(im);
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(handles.edit1,'string'))%弄┰兵计
order = "COM"+ num2str(a)
s = serialport(order,115200,"Timeout",5)  %﹚竡﹃癸禜ㄏノ.ボ猭砞竚ㄤ妮┦
%s = tcpclient('192.168.255.1', 80, 'Timeout', 5)
configureTerminator(s,"CR/LF") %砞竚﹃︽狠 ASCII 才﹃硄獺沧ゎ才
s.Terminator %沧ゎゼ硈钡块狠
s.writeline("en");
readline(s)
handles.myData=s;%办跑计
guidata(hObject,handles);%办跑计





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=handles.myData%㊣跑计S
s.writeline("opmode 2");%家Αち传Θ竚北家Α
readline(s)
s.writeline("en");%家Αち传Θ竚北家Α
readline(s)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=handles.myData%㊣跑计S
readline(s)
s.writeline("clearfaults");%家Αち传Θ竚北家Α
readline(s)  
readline(s)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a=str2double(get(handles.edit1,'string'))%弄┰兵计
%order = "COM"+ num2str(a)
%s = serialport(order,115200,"Timeout",5)  %﹚竡﹃癸禜
%configureTerminator(s,"CR/LF")
s=handles.myData%㊣跑计S
s.writeline("opmode 8");%家Αち传Θ竚北家Α
readline(s)  
s.writeline("moveabs 9 5");%单硉簿笆 12.5mm竚 (硉50mm/s
x=2;%IQ璸衡ノ 斗皌э
readline(s) 
pause(0.3)
s.writeline("moveabs 9 5");%单硉簿笆 12.5mm竚 (硉50mm/s
readline(s) 
pause(4)
s.writeline("I");%絬伴秖代筿瑈
readline(s)
pause(1)
readline(s)
strsplit(ans,' ')
I=ans(1)
set(handles.text20,'String',I);%陪ボ絬伴筿瑈计
s.writeline("IQ");%北竟筿瑈计
readline(s)
readline(s)
strsplit(ans,' ')
IQ=ans(1)
set(handles.text21,'String',IQ);%陪ボ北竟筿瑈计
IQ=str2num(ans(1))
       p1 =  -0.0006562  ;
       p2 =     0.03382  ;
       p3 =     -0.8398  ;
       p4 =        10.4  ;
       p5 =       164.9  ;
     kt = p1*x^4 + p2*x^3 + p3*x^2 + p4*x + p5
    W=-IQ*kt/5;
    Wg=W/9.81;
set(handles.text4,'String',W);%陪ボ北竟筿瑈计
set(handles.text26,'String',Wg)
%s.writeline("IQ");%絬伴秖代筿瑈
%IQ=readline(s)
%set(handles.text21,IQ) 



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=handles.myData%㊣跑计S
%s.writeline("opmode 2");%家Αち传Θ竚北家Α
%readline(s)  
F=str2double(get(handles.edit2,'string'))%弄┰兵计
for i=1:1000  
s.writeline("PFB");%絬伴秖代筿瑈
readline(s)
readline(s)
pause(0.005)
strsplit(ans,' ')
PFB=ans(1)
x=str2num(PFB)
       p1 =  -0.0006562  ;
       p2 =     0.03382  ;
       p3 =     -0.8398  ;
       p4 =        10.4  ;
       p5 =       164.9  ;
     kt = p1*x^4 + p2*x^3 + p3*x^2 + p4*x + p5
     A=F./kt./0.2
force = "t "+ num2str(round(A ,3))
s.writeline(force)%絬伴秖代筿瑈
readline(s)
pause(0.005)
strsplit(ans,'t')
T=ans(2)
set(handles.text22,'String',PFB);%陪ボ絬伴筿瑈计
set(handles.text23,'String',num2str(kt));%陪ボ絬伴筿瑈计
set(handles.text24,'String',T);%陪ボ絬伴筿瑈计

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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
robotip = get(handles.edit3,'string')%弄IP
%order = "COM"+ num2str(a)
t = tcpclient(robotip, 80, 'ConnectTimeout', 100)%﹚竡﹃癸禜ㄏノ.ボ猭砞竚ㄤ妮┦
configureTerminator(t,"CR/LF"); %砞竚﹃︽狠 ASCII 才﹃硄獺沧ゎ才
t.Terminator; %沧ゎゼ硈钡块狠
t.writeline('CONNECT Robot_access Keep-Alive:9999');
pause(0.1);
char(read(t))
handles.myData=t;%办跑计
guidata(hObject,handles);%办跑计


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=handles.myData%㊣跑计t
t.writeline('HOSTCTRL_REQUEST RPOSC 4');
pause(0.06);
char(read(t));
t.writeline('1,0');
pause(0.06);
c=char(read(t))
d = str2double(strsplit(c,','))
a = d(4);
b = d(5);
theta = rad2deg(acos(cosd(a)*cosd(b)))-90%w=wsin(theta)
set(handles.text29,'String',theta);
