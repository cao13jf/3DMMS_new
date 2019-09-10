
%% set embryo parameters
slice_num = 68;
max_time = 3;
data_name = '181211plc1p3';
save_folder = strcat('.\data\membrane\',data_name);
if ~exist(save_folder, 'dir')
    mkdir(save_folder)
end
    %specify raw slice-membrane data path.
raw_data_path = 'D:\ProjectData\OriginMembData12\181211plc1p3\tifR';
    %supposed to be '*.tif', remains to be changed.
image_list = dir(strcat(raw_data_path, '\*.tif')); 

%% read images and combine them into separate stacks
for time_point = 3:max_time
    embryo = [];
    for slice = 1:slice_num
        image_name = image_list((time_point-1)*slice_num + slice);
        slice_matrix = imread(strcat(image_name.folder, '\', image_name.name));
        slice_resized = imresize(slice_matrix, 0.5, 'bilinear');
        embryo = cat(3, embryo, slice_resized);
    end
    [sr, sc, sz] = size(embryo);
    embryo = imresize3(embryo, [sr, sc, uint8(sz * 0.43/0.09)]);
    embryo = permute(embryo, [3,2,1]);
    nL = 3-length(num2str(time_point));
    
    saveTif('tem1.tif', uint8(embryo))
%     save_path = strcat(save_folder, '\membt',repmat('0', 1,nL),num2str(time_point),'.mat');
%     save(save_path, 'embryo');
end



