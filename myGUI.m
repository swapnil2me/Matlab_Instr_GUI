function S = myGUI
close all;clc
myPath = pwd;
addpath(([myPath,'/GuiFunc']))
if exist('conf_past/pastConf.mat','file') == 2
    addpath(([myPath,'/conf_past']))
    S = createUI_hist();
else
    mkdir('conf_past')
    addpath(([myPath,'/conf_past']))
    S = createUI();
end

set(S.btn, 'Callback',{@createtable,S});
    function createtable(varargin)
        currConf.Arv = [str2double(get(S.VgDCStart, 'String')) str2double(get(S.VgDCSteps, 'String')) str2double(get(S.VgDCEnd, 'String'));
            str2double(get(S.VgACStart, 'String')) str2double(get(S.VgACSteps, 'String')) str2double(get(S.VgACEnd, 'String'));
            str2double(get(S.VsACStart, 'String')) str2double(get(S.VsACSteps, 'String')) str2double(get(S.VsACEnd, 'String'));
            str2double(get(S.sF, 'String')) str2double(get(S.stepF, 'String')) str2double(get(S.eF, 'String'))];
        currConf.mixF = str2double(get(S.mixF, 'String'));
        currConf.IpS = {(get(S.VgDCInstAdr, 'String')),(get(S.VgACInstAdr, 'String')),(get(S.VsACInstAdr, 'String'))...
            ,(get(S.LIAInstAdr, 'String'))};
        pastConf = currConf;
        save([myPath,'/conf_past/pastConf.mat'],'pastConf');
        rowSize = str2num(get(S.VgDCStart, 'String'))
        val = S.VgDCStart.String
        colSize = str2num(get(S.VgDCStart, 'String'))
        initdata = zeros(rowSize,colSize);
        instR = get(S.LIAInst, 'value')
        %         S.table = uitable('Parent',S.f, 'Data', initdata, ...
        %             'Units','normalized', 'Position',[0.4 0.2 0.4 0.2], ...
        %             'ColumnEditable',logical(ones(1,colSize)));
    end
end