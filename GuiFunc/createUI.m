function S = createUI()
S.f = figure;
VgDC_Inst={'LIA'};
VgAC_Inst={'SMA'};
VsAC_Inst={'SMA'};
LockIN = {'SRS830'};

uicontrol('Style', 'TEXT','Units','normalized','Position',[0.1,0.8,0.1,0.1],'string','INSTR');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.25,0.8,0.1,0.1],'string','Start (mV for AC, V for DC)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.4,0.8,0.1,0.1],'string','Step Size (mV for AC, V for DC)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.55,0.8,0.1,0.1],'string','END (mV for AC, V for DC)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.7,0.8,0.1,0.1],'string','Attenuation');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.85,0.8,0.1,0.1],'string','comunication address');

uicontrol('Style', 'TEXT','Units','normalized','Position',[0.1,0.2,0.1,0.1],'string','Mix Down Freq (Hz)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.25,0.2,0.1,0.1],'string','Freq Start (Mhz)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.4,0.2,0.1,0.1],'string','Freq Step (Mhz)');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.55,0.2,0.1,0.1],'string','Freq End (Mhz)');

S.VgDCInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.7,0.1,0.1],'string','VgDC');
S.VgACInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.6,0.1,0.1],'string','VgAC');
S.VsACInf  = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.5,0.1,0.1],'string','VsAC');
S.LIAInf     = uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.4,0.1,0.1],'string','LIA');

S.VgDCInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.7,0.1,0.1],'string',VgDC_Inst);
S.VgACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.6,0.1,0.1],'string',VgAC_Inst);
S.VsACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.5,0.1,0.1],'string',VsAC_Inst);
S.LIAInst      = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.4,0.1,0.1],'string',LockIN);

S.VgDCStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.7,0.1,0.095],'String',5);
S.VgACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.6,0.1,0.095]);
S.VsACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.5,0.1,0.095]);

S.VgDCSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.7,0.1,0.095]);
S.VgACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.6,0.1,0.095]);
S.VsACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.5,0.1,0.095]);

S.VgDCEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.7,0.1,0.095]);
S.VgACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.6,0.1,0.095]);
S.VsACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.5,0.1,0.095]);

S.VgACAttn  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.6,0.1,0.095]);
S.VsACAttn  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.5,0.1,0.095]);

S.mixF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.1,0.3,0.1,0.095]);
S.sF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.3,0.1,0.095]);
S.stepF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.3,0.1,0.095]);
S.eF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.3,0.1,0.095]);

S.VgDCInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.7,0.15,0.095]);
S.VgACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.6,0.15,0.095]);
S.VsACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.5,0.15,0.095]);
S.LIAInstAdr      = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.4,0.15,0.095]);

S.btnStart = uicontrol('Style','PushButton', 'String','Start','Units','normalized', 'Position',[0.03 0.01 0.1 0.1]);
S.btnStop = uicontrol('Style','PushButton', 'String','Ramp Down','Units','normalized', 'Position',[0.15 0.01 0.1 0.1]);
end
