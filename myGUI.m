function myGUI
close all;clc
%S.f = figure;
VgDC_Inst={'KT26','LIA'};
VgAC_Inst={'SMA','ANA','KT33','AT81150'};
VsAC_Inst={'SMA','ANA','KT33','AT81150'};
LockIN = {'SRS830','SRS844'};

S.INST  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.1,0.8,0.1,0.1],'string','INSTR');
S.VStart  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.25,0.8,0.1,0.1],'string','Start (mV for AC, V for DC)');
S.VStepNos  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.4,0.8,0.1,0.1],'string','Step Size (mV for AC, V for DC)');
S.VEnd     = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.55,0.8,0.1,0.1],'string','END (mV for AC, V for DC)');
S.INSTadr     = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.7,0.8,0.1,0.1],'string','comunication address');

S.mixD  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.1,0.2,0.1,0.1],'string','Mix Down Freq (Hz)');
S.Fstart  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.25,0.2,0.1,0.1],'string','Freq Start (Mhz)');
S.Fstep  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.4,0.2,0.1,0.1],'string','Freq Step (Mhz)');
S.Fend     = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.55,0.2,0.1,0.1],'string','Freq End (Mhz)');

S.VgDCInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.7,0.1,0.1],'string','VgDC');
S.VgACInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.6,0.1,0.1],'string','VgAC');
S.VsACInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.5,0.1,0.1],'string','VsAC');
S.LIAInf     = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.4,0.1,0.1],'string','LIA');

S.VgDCInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.7,0.1,0.1],'string',VgDC_Inst);
S.VgACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.6,0.1,0.1],'string',VgAC_Inst);
S.VsACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.5,0.1,0.1],'string',VsAC_Inst);
S.LIAInst      = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.4,0.1,0.1],'string',LockIN);

S.VgDCStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.7,0.1,0.095]);
S.VgACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.6,0.1,0.095]);
S.VsACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.5,0.1,0.095]);

S.VgDCSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.7,0.1,0.095]);
S.VgACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.6,0.1,0.095]);
S.VsACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.5,0.1,0.095]);

S.VgDCEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.7,0.1,0.095]);
S.VgACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.6,0.1,0.095]);
S.VsACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.5,0.1,0.095]);

S.mixF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.1,0.3,0.1,0.095]);
S.sF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.3,0.1,0.095]);
S.stepF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.3,0.1,0.095]);
S.eF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.3,0.1,0.095]);

S.VgDCInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.7,0.25,0.095]);
S.VgACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.6,0.25,0.095]);
S.VsACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.5,0.25,0.095]);
S.LIAInstAdr      = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.4,0.25,0.095]);

S.btn = uicontrol('Style','push', 'String','Create table','Units','normalized', 'Position',[0.03 0.01 0.1 0.1]);
set(S.btn, 'Callback',{@createtable,S});

set(S.btn, 'Callback',{@createtable,S});
    function createtable(varargin)
        rowSize = str2num(get(S.VgDCEnd, 'String'))
        val = S.VgDCEnd.String
        colSize = str2num(get(S.VgDCEnd, 'String'))
        initdata = zeros(rowSize,colSize);
        instR = get(S.LIAInst, 'value')
%         S.table = uitable('Parent',S.f, 'Data', initdata, ...
%             'Units','normalized', 'Position',[0.4 0.2 0.4 0.2], ...
%             'ColumnEditable',logical(ones(1,colSize)));
    end
end