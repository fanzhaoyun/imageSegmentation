clear;
clc;

load img_list.mat

DBpath = 'D:\ImageSource\Weizmann_Seg_DB_1obj\';
for j = 1:length(fls)
    filepath = strcat(DBpath,fls(j).name,'\human_seg\');
    hum1 = strcat(DBpath,fls(j).name,'\hum1\');
    hum2 = strcat(DBpath,fls(j).name,'\hum2\');
    hum3 = strcat(DBpath,fls(j).name,'\hum3\');
    if ~exist(hum1)
        mkdir(hum1);
    end
    if ~exist(hum2)
        mkdir(hum2);
    end
    if ~exist(hum3)
        mkdir(hum3);
    end
    l=dir(filepath);
    fileindex = 0;
    for k=1:length(l)
        if (l(k).isdir)
            continue;
        end;
        fileindex = fileindex + 1;
        im=strcat(filepath,l(k).name);
        if fileindex == 1
            copyfile(im,hum1);
        elseif fileindex == 2
            copyfile(im,hum2);
        elseif fileindex == 3
            copyfile(im,hum3);
        end
    end;
    
end