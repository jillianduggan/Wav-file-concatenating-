
# Concatenate wav files into one 

msgbox("Enter files to concatenate. Sample rate must be the same.")
[file,path] = uigetfile("*.wav","Multiselect","on");

if strcmp(typeinfo(file),"sq_string")
          file_temp = file;
          file = cell(1,1);
          file{1,1} = file_temp;
endif

y = [];
for i = 1:length(file)
          [ytemp,fs] = audioread([path file{1,i}]);
          y = [y; ytemp];
endfor

name = input("\nEnter file name:\n");

audiowrite([name ".wav"], y, fs);
