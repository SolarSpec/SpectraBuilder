LinData = table();
LogData = table();
BackgroundLvl = table();

count = 0;

% Heirarchy of wanted channels
chanFinal = ["final A-B","A-Test  dOD"]; %What about A-Test processed??
chanRaw = ["B-Test  raw", "A-Test  raw"];

mix = [chanRaw,chanFinal];

for FileIndex = 1:1:size(FolderContent,1)
    
    if endsWith(FolderContent(FileIndex).name, '.tdms') == 1
        if endsWith(FolderContent(FileIndex).name, 'nm.tdms') == 1
            tamOn = 0;
        else
            tamOn = 1;
            Position = extractAfter(FolderContent(FileIndex).name,'nm');
        end

        count = count + 1;
        Wavelength = extractBefore(FolderContent(FileIndex).name,'nm.tdms');
            
        display(['Now running: ',[FolderPath, '\', FolderContent(FileIndex).name]])
        TDMScontent = TDMS_readTDMSFile([FolderPath, '\', FolderContent(FileIndex).name]);

        % Find all useful data in CH0 - only look at A-B trace or just A trace
        CH0GroupIndex = strcmp(TDMScontent.groupNames,'CH0'); % CH0 index is always 2??
        ChannelIndices = TDMScontent.chanNames{1,CH0GroupIndex};

        if count == 1
            logical = contains(ChannelIndices,mix);
            options = ChannelIndices(logical);

            opts = options;
            % opts{1,end+1} = 'Cancel';
    
            name = uiconfirm(app.SpectrabuilderUIFigure,"Please choose a data column: ","AbsChanIndex","Options",opts);
        end

        if contains(name,chanFinal)
            selectedChans = chanFinal;
            app.KinPlot.YLabel.String = "ΔOD or %Abs";
            app.SpecPlot.YLabel.String = "ΔOD or %Abs";
        else
            selectedChans = chanRaw;
            app.KinPlot.YLabel.String = "Voltage (V)";
            app.SpecPlot.YLabel.String = "Voltage (V)";
        end

        % Maybe instead do check if contains first, might be faster then find
        % index always. Just do inside the if statemnt if possible??
        AbsChanIndex = strcmp(ChannelIndices,name);

        % This block only runs after first file, what if others don't have the selected name?
        %%ALSO NEED TO CHECK IF THE FIRST AND LAST FIVE ELEMENTS ARE ZERO THAT
        %%WE KNOW ITS AN EMPTY ARRAY AND THEN CONTINUE TO NEXT HEIERARCHY

        if ~any(AbsChanIndex)
            given = contains(ChannelIndices,selectedChans);
            NewOpts = ChannelIndices(given);
            
            AbsChanIndex = strcmp(ChannelIndices,NewOpts{1,1});
            app.Channels = [app.Channels;string(NewOpts{1,1})];
            app.RedGreen = [app.RedGreen;0];
        else
            app.Channels = [app.Channels;string(name)];
            app.RedGreen = [app.RedGreen;1];
        end

        AbsDataIndex = TDMScontent.chanIndices{1,CH0GroupIndex}(AbsChanIndex);

        if ~any(TDMScontent.data{1,AbsDataIndex}(1:5)) == 1 && ~any(TDMScontent.data{1,AbsDataIndex}(end-4:end)) == 1 
            app.Channels(end) = [];
            app.RedGreen(ends) = [];
            continue % DO NOT ADD IF COLUMN IS FULL OF ZEROS
        end
        
        Abs = transpose(TDMScontent.data{1,AbsDataIndex});
        
        BkgGroupIndex = strcmp(TDMScontent.groupNames,'Background level');
        BkgChanIndex = strcmp(TDMScontent.chanNames{1,BkgGroupIndex},'Avg bkg level (V)');
        BkgDataIndex = TDMScontent.chanIndices{1,BkgGroupIndex}(BkgChanIndex);
        
        Bkg = TDMScontent.data{1,BkgDataIndex};
        
        LinData = addvars(LinData,Abs,'NewVariableNames',matlab.lang.makeValidName(Wavelength));
        BackgroundLvl = addvars(BackgroundLvl, Bkg, 'NewVariableNames', matlab.lang.makeValidName(Wavelength));
    end
end

TimeGroupIndex = strcmp(TDMScontent.groupNames,'Time');
TimeDataIndex = TDMScontent.chanIndices{1,TimeGroupIndex};

%Check the first 10 index differences to get a delta double array
delta = TDMScontent.data{1,TimeDataIndex}(2:11) - TDMScontent.data{1,TimeDataIndex}(1:10);
int_delta = int16(delta);

%Check if the double array has equal integer values to distinguish time format
if delta == int_delta
    Time = transpose(TDMScontent.data{1,TimeDataIndex} * 4e-9);
else
    Time = transpose(TDMScontent.data{1,TimeDataIndex});
end

%Set up proper type variables for log and lin data
TimeNew = array2table(Time);
LinData = [TimeNew,LinData];
LinArray = table2array(LinData);

%Log-Spacing
[LogTimeArray,LogAbsArray] = lin2log_TAS(LinArray(:,1),LinArray(:,2:end));

%Log Data Table to Array
LogArray = [LogTimeArray,LogAbsArray];
LogData = array2table(LogArray);
LogData.Properties.VariableNames = LinData.Properties.VariableNames;