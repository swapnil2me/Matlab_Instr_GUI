function myGUI
close all;clc
global S
myPath = pwd;
addpath(([myPath,'/GuiFunc']))
addpath(([myPath,'/InstruObj']))
if exist('conf_past/pastConf.mat','file') == 2
    addpath(([myPath,'/conf_past']))
    S = createUI_hist();
else
    if exist('conf_past','dir') ~= 7
        mkdir('conf_past')
        addpath(([myPath,'/conf_past']))
    end
    S = createUI();
end
if exist('rawdata','dir') ~= 7
    mkdir('rawdata')
    addpath(([myPath,'/rawdata']))
else
    addpath(([myPath,'/rawdata']))
end
set(S.btnStart, 'Callback',{@creatsweep,S});

    function creatsweep(varargin)
        
        currConf.Arv = [str2double(get(S.VgDCStart, 'String')) str2double(get(S.VgDCSteps, 'String')) str2double(get(S.VgDCEnd, 'String'));
            str2double(get(S.VgACStart, 'String')) str2double(get(S.VgACSteps, 'String')) str2double(get(S.VgACEnd, 'String'));
            str2double(get(S.VsACStart, 'String')) str2double(get(S.VsACSteps, 'String')) str2double(get(S.VsACEnd, 'String'));
            str2double(get(S.sF, 'String')) str2double(get(S.stepF, 'String')) str2double(get(S.eF, 'String'));
            str2double(get(S.mixF, 'String')) str2double(get(S.VgACAttn, 'String')) str2double(get(S.VsACAttn, 'String'))];
        currConf.IpS = {(get(S.VgDCInstAdr, 'String')),(get(S.VgACInstAdr, 'String')),(get(S.VsACInstAdr, 'String'))...
            ,(get(S.LIAInstAdr, 'String'))};
        pastConf = currConf;
        save([myPath,'/conf_past/pastConf.mat'],'pastConf');
        %         clear all;
        load 'pastConf.mat' pastConf;
        paraS = pastConf.Arv;
        
        %%
        RmpN= 200;
        ps = 0.005;
        LIA = SRS830(str2double(pastConf.IpS{1}),paraS(5,1));
        RVgAC=SMA100A(pastConf.IpS{2},pastConf.Arv(4,1),pastConf.Arv(4,3),pastConf.Arv(4,2),RmpN,ps);
        RVsAC=SMA100A(pastConf.IpS{3},pastConf.Arv(4,1),pastConf.Arv(4,3),pastConf.Arv(4,2),RmpN,ps);
        if pastConf.IpS{1} == pastConf.IpS{4}
            RVgDC =LIA; %% if LIA Aux Out is Used as VgDC
        else
            RVgDC=SMA100A(pastConf.IpS{4},pastConf.Arv(4,1),pastConf.Arv(4,3),pastConf.Arv(4,2),RmpN,ps);
        end
        %% voltage step check
        if abs(paraS(2,1)-paraS(2,3))<=paraS(2,2)
            paraS(2,2) = 100;
        end
        if abs(paraS(3,1)-paraS(3,3))<=paraS(3,2)
            paraS(3,2) = 100;
        end
        %% voltage ranges
        VgDC = paraS(1,1):paraS(1,2):paraS(1,3);
        VgAC = paraS(2,1):paraS(2,2):paraS(2,3);
        VsAC = paraS(3,1):paraS(3,2):paraS(3,3);
        
        for i = 1:length(VgDC)
            
            RVgDC.rampVaux(1,VgDC(i),RmpN,ps)
            
            for j = 1:length(VgAC)
                
                RVgAC.rampV(VgAC(j))
                VgACd = sgen2dev(VgAC(j),paraS(5,2));
                
                for k = 1:length(VsAC)
                    set(S.btnStop, 'Callback',{@stopsweep,RVgAC,RVsAC,RVgDC,LIA});
                    RVsAC.rampV(VsAC(k))
                    VsdACd = sgen2dev(VsAC(k),paraS(5,3));
                    
                    dataF=LIA.sweepandread(RVgAC,RVsAC,1);
                    TF = struct2table(dataF);
                    FF = ['rawdata/',num2str(VgDC(i),'%2.2f'),'V_VgDC_',num2str(VgACd,'%2.2f'),'mV_VgAC_',num2str(VsdACd,'%2.2f')...
                        ,'mV_VsdAC_FWD_',num2str(paraS(4,1)),'_',num2str(paraS(4,3)),'_MHZ.csv'];
                    writetable(TF,FF);
                    
                    dataB=LIA.sweepandread(RVgAC,RVsAC,-1);
                    TB = struct2table(dataB);
                    FB = ['rawdata/',num2str(VgDC(i),'%2.2f'),'V_VgDC_',num2str(VgACd,'%2.2f'),'mV_VgAC_',num2str(VsdACd,'%2.2f')...
                        ,'mV_VsdAC_BKW_',num2str(paraS(4,3)),'_',num2str(paraS(4,1)),'_MHZ.csv'];
                    writetable(TB,FB);
                    clf(figure(2))
                    
                end
            end
        end
        
        %% Ramp Down
        RVgAC.rampV(0)
        RVsAC.rampV(0)
        RVgDC.rampVaux(1,0,RmpN,ps)
        %% Close Connection
        
        RVgAC.close()
        RVsAC.close()
        LIA.close()
        RVgDC.close()
        function stopsweep(varargin)
            %% Ramp Down
            RVgAC.rampV(0)
            RVsAC.rampV(0)
            RVgDC.rampVaux(1,0,RmpN,ps)   
            %%
%             RVgAC.close()
%             RVsAC.close()
%             LIA.close()
%             RVgDC.close()
        end
        
    end


end