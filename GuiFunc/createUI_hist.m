function S = createUI_hist()
load 'pastConf.mat';
S.f = figure;
VgDC_Inst={'KT26','LIA'};
VgAC_Inst={'SMA','ANA','KT33','AT81150'};
VsAC_Inst={'SMA','ANA','KT33','AT81150'};
LockIN = {'SRS830','SRS844'};

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

uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.7,0.1,0.1],'string','VgDC');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.6,0.1,0.1],'string','VgAC');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.5,0.1,0.1],'string','VsAC');
uicontrol('Style', 'TEXT','Units','normalized','Position',[0.00,0.4,0.1,0.1],'string','LIA');

S.VgDCInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.7,0.1,0.1],'string',VgDC_Inst);
S.VgACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.6,0.1,0.1],'string',VgAC_Inst);
S.VsACInst  = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.5,0.1,0.1],'string',VsAC_Inst);
S.LIAInst      = uicontrol('Style', 'popupmenu','Units','normalized','Position',[0.1,0.4,0.1,0.1],'string',LockIN);

S.VgDCStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.7,0.1,0.095],'String',pastConf.Arv(1,1));
S.VgACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.6,0.1,0.095],'String',pastConf.Arv(2,1));
S.VsACStart  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.5,0.1,0.095],'String',pastConf.Arv(3,1));

S.VgDCSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.7,0.1,0.095],'String',pastConf.Arv(1,2));
S.VgACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.6,0.1,0.095],'String',pastConf.Arv(2,2));
S.VsACSteps  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.5,0.1,0.095],'String',pastConf.Arv(3,2));

S.VgDCEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.7,0.1,0.095],'String',pastConf.Arv(1,3));
S.VgACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.6,0.1,0.095],'String',pastConf.Arv(2,3));
S.VsACEnd  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.5,0.1,0.095],'String',pastConf.Arv(3,3));

S.VgACAttn  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.6,0.1,0.095],'String',pastConf.Arv(5,2));
S.VsACAttn  = uicontrol('Style', 'edit','Units','normalized','Position',[0.7,0.5,0.1,0.095],'String',pastConf.Arv(5,3));

S.mixF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.1,0.3,0.1,0.095],'String',pastConf.Arv(5,1));
S.sF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.25,0.3,0.1,0.095],'String',pastConf.Arv(4,1));
S.stepF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.4,0.3,0.1,0.095],'String',pastConf.Arv(4,2));
S.eF  = uicontrol('Style', 'edit','Units','normalized','Position',[0.55,0.3,0.1,0.095],'String',pastConf.Arv(4,3));

S.VgDCInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.7,0.15,0.095],'String',pastConf.IpS{1});
S.VgACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.6,0.15,0.095],'String',pastConf.IpS{2});
S.VsACInstAdr  = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.5,0.15,0.095],'String',pastConf.IpS{3});
S.LIAInstAdr      = uicontrol('Style', 'edit','Units','normalized','Position',[0.85,0.4,0.15,0.095],'String',pastConf.IpS{4});

S.btnStart = uicontrol('Style','PushButton', 'String','Start','Units','normalized', 'Position',[0.03 0.01 0.1 0.1]);
S.btnStop = uicontrol('Style','PushButton', 'String','Ramp Down','Units','normalized', 'Position',[0.15 0.01 0.1 0.1]);
end