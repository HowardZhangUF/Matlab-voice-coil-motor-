function varargout = ForcerStudio(varargin)
% FORCERSTUDIO MATLAB code for ForcerStudio.fig
%      FORCERSTUDIO, by itself, creates a new FORCERSTUDIO or raises the existing
%      singleton*.
%
%      H = FORCERSTUDIO returns the handle to a new FORCERSTUDIO or the handle to
%      the existing singleton*.
%
%      FORCERSTUDIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCERSTUDIO.M with the given input arguments.
%
%      FORCERSTUDIO('Property','Value',...) creates a new FORCERSTUDIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForcerStudio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForcerStudio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForcerStudio

% Last Modified by GUIDE v2.5 13-Dec-2021 00:40:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForcerStudio_OpeningFcn, ...
                   'gui_OutputFcn',  @ForcerStudio_OutputFcn, ...
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


% --- Executes just before ForcerStudio is made visible.
function ForcerStudio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForcerStudio (see VARARGIN)

% Choose default command line output for ForcerStudio
handles.output = hObject;
im = imread('logoname.jpg');
imshow(im);
% Update handles structure
guidata(hObject, handles);
hold on;

% UIWAIT makes ForcerStudio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ForcerStudio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.slider1,'Value');%讀取拉條數值
set(handles.text13,'String',num2str(a));%顯示該數值
       p00 =handles.p00;
       p10 =handles.p10;
       p01 =handles.p01;
       p20 =handles.p20;
       p11 =handles.p11;
       p02 =handles.p02;
       p30 =handles.p30;
       p21 =handles.p21;
       p12 =handles.p12;
       p40 =handles.p40;
       p31 =handles.p31;
       p22 =handles.p22;  
       p00a =handles.p00a;
       p10a =handles.p10a;
       p01a =handles.p01a;
       p20a =handles.p20a;
       p11a =handles.p11a;
       p02a =handles.p02a;
       p30a =handles.p30a;
       p21a =handles.p21a;
       p12a =handles.p12a;
       p40a =handles.p40a;
       p31a =handles.p31a;
       p22a =handles.p22a;
x=get(handles.slider1,'Value');%讀取位移數值
y=get(handles.slider3,'Value');%讀取目標接觸力數值
edit2value = p00a + p10a.*x + p01a.*y + p20a.*x.^2 + p11a.*x.*y + p02a.*y.^2 + p30a.*x.^3 + p21a.*x.^2.*y + p12a.*x.*y.^2 + p40a.*x.^4 + p31a.*x.^3.*y + p22a.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
set(handles.text6,'String',num2str(edit2value));%顯示應輸出電流數值
hold on;
c=x;
d=y;
hold on;
y=edit2value;%讀取目標接觸力數值
ww= p00 + p10.*x + p01.*y + p20.*x.^2 + p11.*x.*y + p02.*y.^2 + p30.*x.^3 + p21.*x.^2.*y + p12.*x.*y.^2 + p40.*x.^4 + p31.*x.^3.*y + p22.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
set(handles.text16,'String',num2str(ww));%顯示應輸出電流數值
hold on;
b=get(handles.slider4,'Value');%磁場模型
if b==0
    plot(handles.axes2,x,ww,'or','MarkerSize',3,'MarkerFaceColor','r');
    plot3(handles.axes1,c,edit2value,d,'.r','MarkerSize',15,'MarkerFaceColor','r');
end
if b==10
    plot(handles.axes2,x,ww,'og','MarkerSize',3,'MarkerFaceColor','g');
    plot3(handles.axes1,c,edit2value,d,'.g','MarkerSize',15,'MarkerFaceColor','g');
end
if b==20
    plot(handles.axes2,x,ww,'ob','MarkerSize',3,'MarkerFaceColor','b');
    plot3(handles.axes1,c,edit2value,d,'.b','MarkerSize',15,'MarkerFaceColor','b');
end
if b==30
    plot(handles.axes2,x,ww,'oy','MarkerSize',3,'MarkerFaceColor','y');
    plot3(handles.axes1,c,edit2value,d,'.y','MarkerSize',15,'MarkerFaceColor','y');
end
if b==40
    plot(handles.axes2,x,ww,'ok','MarkerSize',3,'MarkerFaceColor','k');
    plot3(handles.axes1,c,edit2value,d,'.k','MarkerSize',15,'MarkerFaceColor','k');
end
if b==50
    plot(handles.axes2,x,ww,'oc','MarkerSize',3,'MarkerFaceColor','c');
    plot3(handles.axes1,c,edit2value,d,'.c','MarkerSize',15,'MarkerFaceColor','c');
end
xlabel(handles.axes2,'position(mm)');
ylabel(handles.axes2,'force(N)');
grid(handles.axes2,'on');
grid(handles.axes1,'on');

%yticks(handles.axes2,[49.9 50 50.1]);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
       p00 =handles.p00;
       p10 =handles.p10;
       p01 =handles.p01;
       p20 =handles.p20;
       p11 =handles.p11;
       p02 =handles.p02;
       p30 =handles.p30;
       p21 =handles.p21;
       p12 =handles.p12;
       p40 =handles.p40;
       p31 =handles.p31;
       p22 =handles.p22;  
       p00a =handles.p00a;
       p10a =handles.p10a;
       p01a =handles.p01a;
       p20a =handles.p20a;
       p11a =handles.p11a;
       p02a =handles.p02a;
       p30a =handles.p30a;
       p21a =handles.p21a;
       p12a =handles.p12a;
       p40a =handles.p40a;
       p31a =handles.p31a;
       p22a =handles.p22a;
x=get(handles.slider1,'Value')%讀取當前位移數值
y=get(handles.slider3,'Value')%讀取目標接觸力數值
Rp=x;
Tp=x;
Tf=y;
edit2value = p00a + p10a.*x + p01a.*y + p20a.*x.^2 + p11a.*x.*y + p02a.*y.^2 + p30a.*x.^3 + p21a.*x.^2.*y + p12a.*x.*y.^2 + p40a.*x.^4 + p31a.*x.^3.*y + p22a.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
Tc=edit2value;
grid on;
hold all;
set(handles.text6,'String',num2str(edit2value)); %應輸出電流值
xx = linspace(1, 20, 200);		% 在 x 軸 [-2,2] 之間取 25 點  
yy = linspace(1, 3, 30);		% 在 y 軸 [-2,2] 之間取 25 點  
[x,y] = meshgrid(xx, yy);		% xx 和 yy 都是 25×25 的矩陣
zz = p00 + p10.*x + p01.*y + p20.*x.^2 + p11.*x.*y + p02.*y.^2 + p30.*x.^3 + p21.*x.^2.*y + p12.*x.*y.^2 + p40.*x.^4 + p31.*x.^3.*y + p22.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
mesh(handles.axes1,xx, yy, zz);				% 畫出立體曲面圖  
colormap('default')				% 顏色改回預設值 
title(handles.axes1,'Magnetic field model');%磁場模型(電流與力量與位置)
xlabel(handles.axes1,'position(mm)')
ylabel(handles.axes1,'current(A)')
zlabel(handles.axes1,'force(N)')
%set(handles.text13,'String',num2str(a));%顯示該數值
x=Tp
y=Tc
Rf=p00 + p10.*x + p01.*y + p20.*x.^2 + p11.*x.*y + p02.*y.^2 + p30.*x.^3 + p21.*x.^2.*y + p12.*x.*y.^2 + p40.*x.^4 + p31.*x.^3.*y + p22.*x.^2.*y.^2		% zz 也是 25×2 的矩陣  
rotate3d on;
hold on;
%plot3(handles.axes1,Rp,Tc,Tf,'xr','MarkerSize',15,'MarkerFaceColor','r');
%b
guidata(hObject, handles);
hold on;





% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=get(handles.slider3,'Value');%讀取拉條數值
set(handles.text14,'String',num2str(a));%顯示該數值
       p00 =handles.p00;
       p10 =handles.p10;
       p01 =handles.p01;
       p20 =handles.p20;
       p11 =handles.p11;
       p02 =handles.p02;
       p30 =handles.p30;
       p21 =handles.p21;
       p12 =handles.p12;
       p40 =handles.p40;
       p31 =handles.p31;
       p22 =handles.p22;  
       p00a =handles.p00a;
       p10a =handles.p10a;
       p01a =handles.p01a;
       p20a =handles.p20a;
       p11a =handles.p11a;
       p02a =handles.p02a;
       p30a =handles.p30a;
       p21a =handles.p21a;
       p12a =handles.p12a;
       p40a =handles.p40a;
       p31a =handles.p31a;
       p22a =handles.p22a;
x=get(handles.slider1,'Value');%讀取位移數值
y=get(handles.slider3,'Value');%讀取目標接觸力數值
edit2value = p00a + p10a.*x + p01a.*y + p20a.*x.^2 + p11a.*x.*y + p02a.*y.^2 + p30a.*x.^3 + p21a.*x.^2.*y + p12a.*x.*y.^2 + p40a.*x.^4 + p31a.*x.^3.*y + p22a.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
set(handles.text6,'String',num2str(edit2value));%顯示應輸出電流數值
hold on;
plot3(handles.axes1,x,edit2value,y,'.r','MarkerSize',15,'MarkerFaceColor','r');


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function text14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=get(handles.slider4,'Value');%讀取工具重量數值edit1
if w==0
       p00 =      -30.38 % (-30.79, -29.97)
       p10 =      0.8935 % (0.7589, 1.028)
       p01 =       34.56 % (34.12, 35.01)
       p20 =     -0.1765 % (-0.194, -0.159)
       p11 =       1.607 % (1.497, 1.717)
       p02 =     -0.3099 % (-0.4243, -0.1955)
       p30 =     0.01291 % (0.01181, 0.01402)
       p21 =    -0.08013 % (-0.08685, -0.07341)
       p12 =    -0.01948 % (-0.04628, 0.007324)
       p40 =  -0.0003034 % (-0.0003291, -0.0002777)
       p31 =   0.0008068 % (0.0006565, 0.000957)
       p22 =   0.0002149 % (-0.001021, 0.001451)
       p00a =      0.8859 % (0.8803, 0.8915)
       p10a =    -0.06695 % (-0.06984, -0.06407)
       p01a =     0.02932 % (0.02905, 0.02958)
       p20a =    0.009082 % (0.008565, 0.0096)
       p11a =   -0.001212 % (-0.001275, -0.001149)
       p02a =   6.987e-06 % (3.706e-06, 1.027e-05)
       p30a =  -0.0005647 % (-0.0006015, -0.0005279)
       p21a =   6.933e-05 % (6.459e-05, 7.406e-05)
       p12a =  -3.008e-09 % (-6.709e-07, 6.649e-07)
       p40a =   1.272e-05 % (1.183e-05, 1.36e-05)
       p31a =  -9.947e-07 % (-1.134e-06, -8.559e-07)
       p22a =   7.343e-09 % (-2.196e-08, 3.665e-08)
end
if w==10
       p00 =      -40.97 % (-41.53, -40.41)
       p10 =       1.172 % (1.01, 1.334)
       p01 =       34.91 % (34.34, 35.48)
       p20 =     -0.2128 % (-0.2319, -0.1937)
       p11 =       1.604 % (1.472, 1.736)
       p02 =     -0.4185 % (-0.5593, -0.2777)
       p30 =     0.01528 % (0.01412, 0.01644)
       p21 =     -0.0869 % (-0.09462, -0.07919)
       p12 =    0.004994 % (-0.02613, 0.03611)
       p40 =  -0.0003578 % (-0.0003843, -0.0003312)
       p31 =    0.001081 % (0.0009209, 0.001241)
       p22 =  -0.0005222 % (-0.001937, 0.000893)
       p00a =       1.186 % (1.181, 1.19)
       p10a =    -0.08566 % (-0.08838, -0.08294)
       p01a =     0.02956 % (0.02931, 0.0298)
       p20a =     0.01082 % (0.0103, 0.01133)
       p11a =   -0.001273 % (-0.001333, -0.001213)
       p02a =   5.827e-06 % (1.822e-06, 9.833e-06)
       p30a =  -0.0006396 % (-0.0006766, -0.0006027)
       p21a =   7.615e-05 % (7.108e-05, 8.122e-05)
       p12a =   1.218e-08 % (-7.847e-07, 8.091e-07)
       p40a =   1.407e-05 % (1.318e-05, 1.496e-05)
       p31a =  -1.183e-06 % (-1.339e-06, -1.026e-06)
       p22a =   5.106e-09 % (-2.958e-08, 3.979e-08)
end
if w==20
       p00 =      -51.37 % (-52.13, -50.61)
       p10 =       1.376 % (1.178, 1.573)
       p01 =       35.32 % (34.61, 36.04)
       p20 =     -0.2455 % (-0.2641, -0.2269)
       p11 =       1.541 % (1.378, 1.705)
       p02 =     -0.4436 % (-0.6076, -0.2796)
       p30 =     0.01736 % (0.01634, 0.01838)
       p21 =    -0.08198 % (-0.09097, -0.07298)
       p12 =    0.008287 % (-0.02824, 0.04481)
       p40 =  -0.0004016 % (-0.0004245, -0.0003787)
       p31 =   0.0009451 % (0.000787, 0.001103)
       p22 =  -0.0006841 % (-0.002341, 0.000973)
       p00a =       1.477 % (1.473, 1.482)
       p10a =     -0.1014 % (-0.1038, -0.09888)
       p01a =     0.02936 % (0.0291, 0.02963)
       p20a =     0.01234 % (0.01187, 0.01281)
       p11a =   -0.001219 % (-0.001283, -0.001155)
       p02a =   8.392e-06 % (3.427e-06, 1.336e-05)
       p30a =  -0.0007103 % (-0.0007447, -0.0006758)
       p21a =   7.226e-05 % (6.697e-05, 7.755e-05)
       p12a =  -4.372e-07 % (-1.414e-06, 5.393e-07)
       p40a =   1.546e-05 % (1.463e-05, 1.629e-05)
       p31a =  -1.079e-06 % (-1.242e-06, -9.157e-07)
       p22a =   2.336e-08 % (-1.851e-08, 6.524e-08)
end
if w==30
       p00 =      -62.76 % (-64.24, -61.28)
       p10 =       1.691 % (1.353, 2.029)
       p01 =       36.37 % (35.05, 37.69)
       p20 =     -0.2732 % (-0.299, -0.2474)
       p11 =       1.405 % (1.131, 1.679)
       p02 =     -0.6597 % (-0.9502, -0.3693)
       p30 =     0.01862 % (0.01747, 0.01976)
       p21 =    -0.07535 % (-0.08933, -0.06136)
       p12 =     0.02694 % (-0.03155, 0.08543)
       p40 =  -0.0004245 % (-0.0004489, -0.0004001)
       p31 =   0.0008416 % (0.0006296, 0.001054)
       p22 =   -0.001072 % (-0.003635, 0.00149)
       p00a =       1.778 % (1.774, 1.783)
       p10a =     -0.1174 % (-0.1201, -0.1148)
       p01a =     0.02935 % (0.02903, 0.02968)
       p20a =     0.01362 % (0.01312, 0.01412)
       p11a =   -0.001198 % (-0.001275, -0.001122)
       p02a =   1.031e-05 % (2.755e-06, 1.787e-05)
       p30a =  -0.0007556 % (-0.0007918, -0.0007194)
       p21a =   6.963e-05 % (6.301e-05, 7.625e-05)
       p12a =  -2.658e-07 % (-1.691e-06, 1.16e-06)
       p40a =   1.616e-05 % (1.529e-05, 1.704e-05)
       p31a =  -9.795e-07 % (-1.187e-06, -7.725e-07)
       p22a =   6.853e-09 % (-5.402e-08, 6.773e-08)
end
if w==40
       p00 =      -75.47 % (-77.89, -73.05)
       p10 =       2.237 % (1.714, 2.761)
       p01 =       38.41 % (36.44, 40.38)
       p20 =     -0.3215 % (-0.3568, -0.2862)
       p11 =       1.132 % (0.7395, 1.524)
       p02 =      -1.037 % (-1.435, -0.6386)
       p30 =     0.02074 % (0.01944, 0.02203)
       p21 =    -0.06227 % (-0.08155, -0.04299)
       p12 =     0.07275 % (-0.003845, 0.1493)
       p40 =  -0.0004657 % (-0.0004914, -0.0004399)
       p31 =   0.0007392 % (0.0004852, 0.0009932)
       p22 =   -0.002968 % (-0.006227, 0.0002908)
       p00a =       2.075 % (2.07, 2.079)
       p10a =      -0.133 % (-0.1359, -0.1301)
       p01a =     0.02931 % (0.0289, 0.02971)
       p20a =     0.01501 % (0.01445, 0.01556)
       p11a =   -0.001194 % (-0.001286, -0.001101)
       p02a =   1.521e-05 % (4.387e-06, 2.603e-05)
       p30a =  -0.0008152 % (-0.0008555, -0.0007749)
       p21a =   6.975e-05 % (6.167e-05, 7.784e-05)
       p12a =  -4.245e-07 % (-2.405e-06, 1.556e-06)
       p40a =   1.731e-05 % (1.633e-05, 1.828e-05)
       p31a =  -9.831e-07 % (-1.237e-06, -7.288e-07)
       p22a =   7.491e-09 % (-7.511e-08, 9.009e-08)
end
if w==50
       p00 =      -92.36 % (-96.41, -88.32)
       p10 =       3.441 % (2.635, 4.247)
       p01 =       43.21 % (40.06, 46.37)
       p20 =      -0.402 % (-0.4482, -0.3558)
       p11 =      0.4885 % (-0.1023, 1.079)
       p02 =      -1.885 % (-2.499, -1.271)
       p30 =     0.02307 % (0.02189, 0.02424)
       p21 =    -0.03129 % (-0.05845, -0.004117)
       p12 =       0.157 % (0.04612, 0.2678)
       p40 =  -0.0004831 % (-0.0005025, -0.0004638)
       p31 =   0.0001518 % (-0.0001284, 0.000432)
       p22 =    -0.00478 % (-0.009247, -0.0003136)
       p00a =       2.381 % (2.377, 2.386)
       p10a =     -0.1524 % (-0.1553, -0.1495)
       p01a =     0.02946 % (0.02897, 0.02996)
       p20a =     0.01674 % (0.01618, 0.01731)
       p11a =   -0.001085 % (-0.0012, -0.00097)
       p02a =  -1.925e-07 % (-1.808e-05, 1.769e-05)
       p30a =  -0.0008829 % (-0.0009245, -0.0008413)
       p21a =   5.403e-05 % (4.283e-05, 6.522e-05)
       p12a =   2.092e-06 % (-1.031e-06, 5.214e-06)
       p40a =   1.837e-05 % (1.735e-05, 1.939e-05)
       p31a =  -4.789e-07 % (-8.405e-07, -1.172e-07)
       p22a =  -7.633e-08 % (-2.008e-07, 4.818e-08)
end
handles.p00=p00;
guidata(hObject,handles);
handles.p10=p10;
guidata(hObject,handles);
handles.p01=p01;
guidata(hObject,handles);
handles.p20=p20;
guidata(hObject,handles);
handles.p11=p11;
guidata(hObject,handles);
handles.p02=p02;
guidata(hObject,handles);
handles.p30=p30;
guidata(hObject,handles);
handles.p21=p21;
guidata(hObject,handles);
handles.p12=p12;
guidata(hObject,handles);
handles.p40=p40;
guidata(hObject,handles);
handles.p31=p31;
guidata(hObject,handles);
handles.p22=p22;
guidata(hObject,handles);
handles.p00a=p00a;
guidata(hObject,handles);
handles.p10a=p10a;
guidata(hObject,handles);
handles.p01a=p01a;
guidata(hObject,handles);
handles.p20a=p20a;
guidata(hObject,handles);
handles.p11a=p11a;
guidata(hObject,handles);
handles.p02a=p02a;
guidata(hObject,handles);
handles.p30a=p30a;
guidata(hObject,handles);
handles.p21a=p21a;
guidata(hObject,handles);
handles.p12a=p12a;
guidata(hObject,handles);
handles.p40a=p40a;
guidata(hObject,handles);
handles.p31a=p31a;
guidata(hObject,handles);
handles.p22a=p22a;
guidata(hObject,handles);
x=get(handles.slider1,'Value')%讀取位移數值
y=get(handles.slider3,'Value')%讀取目標接觸力數值
edit2value = p00a + p10a.*x + p01a.*y + p20a.*x.^2 + p11a.*x.*y + p02a.*y.^2 + p30a.*x.^3 + p21a.*x.^2.*y + p12a.*x.*y.^2 + p40a.*x.^4 + p31a.*x.^3.*y + p22a.*x.^2.*y.^2;		% zz 也是 25×2 的矩陣  
set(handles.text6,'String',num2str(edit2value));%顯示應輸出電流數值




% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=get(handles.slider4,'Value');%讀取拉條數值
set(handles.text15,'String',num2str(a));%顯示該數值


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.slider3,'Value');%讀取拉條數值
x1=[a a a a a a a a a a a a a a a a a a a a ;a a a a a a a a a a a a a a a a a a a a;a a a a a a a a a a a a a a a a a a a a];
mesh(handles.axes1,x1);
rotate3d on;


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on key press with focus on slider3 and none of its controls.
