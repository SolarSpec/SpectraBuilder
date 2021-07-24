%Import the CH0 %Abs directly from a TDMS file.

%% Point to the file.

[FileTDMS, PathTDMS] = uigetfile('D:\TAM data\Robert\*.tdms');

ImportTDMS = TDMS_readTDMSFile([PathTDMS, FileTDMS]);

%% Find where the time data is and import it.

TimeGroupIndex = find(strcmp(ImportTDMS.groupNames,'Time'));
TimeDataIndex = ImportTDMS.chanIndices{1,TimeGroupIndex};

Time = transpose(ImportTDMS.data{1,TimeDataIndex} * 4E-9);

%% Find and import the final A-B abs data for CH0.

CH0GroupIndex = find(strcmp(ImportTDMS.groupNames,'CH0'));
AbsChanIndex = find(strcmp(ImportTDMS.chanNames{1,CH0GroupIndex},'final A-B'));
AbsDataIndex = ImportTDMS.chanIndices{1,CH0GroupIndex}(AbsChanIndex);

Abs = transpose(ImportTDMS.data{1,AbsDataIndex});