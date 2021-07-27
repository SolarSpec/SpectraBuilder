FolderPath = uigetdir;

FolderContent = dir(FolderPath);

LinData = table();
LogData = table();

for FileIndex = 1:1:size(FolderContent,1)
    
    if endsWith(FolderContent(FileIndex).name, 'nm.tdms') == 1
        
        Wavelength = extractBefore(FolderContent(FileIndex).name,'nm.tdms');
        
        display(['Now running: ',[FolderPath, '\', FolderContent(FileIndex).name]])
        TDMScontent = TDMS_readTDMSFile([FolderPath, '\', FolderContent(FileIndex).name]);
        
        CH0GroupIndex = find(strcmp(TDMScontent.groupNames,'CH0'));
        AbsChanIndex = find(strcmp(TDMScontent.chanNames{1,CH0GroupIndex},'final A-B'));
        AbsDataIndex = TDMScontent.chanIndices{1,CH0GroupIndex}(AbsChanIndex);
        
        Abs = transpose(TDMScontent.data{1,AbsDataIndex});
        
        LinData = addvars(LinData,Abs,'NewVariableNames',matlab.lang.makeValidName(Wavelength));
    else
        ...
            
    end
end

TimeGroupIndex = find(strcmp(TDMScontent.groupNames,'Time'));
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

LogABS = real(log10(Abs(Time>0)));
LogTime = log10(Time(>0));

Time = array2table(Time);

LinData = [Time,LinData];

LinArray = table2array(LinData);

[LogTimeArray,LogAbsArray] = lin2log_TAS(LinArray(:,1),LinArray(:,2:end));
LogArray = [LogTimeArray,LogAbsArray];

LogData = array2table(LogArray);
LogData.Properties.VariableNames = LinData.Properties.VariableNames;
