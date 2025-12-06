[file, path] = uigetfile({'*.bmp';'*.jpg';'*.jpeg';'*.png';'*.tif'}, 'Select an image file');
if isequal(file, 0)
    disp('User selected Cancel');
else
    image = fullfile(path, file);
    img = imread(image);
    [imdeblur] = test(img);
subplot(1, 2, 1);
imshow(img);
title('Blurred Image');
subplot(1, 2, 2);
imshow(imdeblur);
title('Deblurred Image');
answer = questdlg('Do you want to save the processed image?', ...
                 'Save Image', ...
                 'Yes', 'No', 'Cancel', ...
                 'Yes');
switch answer
    case 'Yes'
        [filename, pathname] = uiputfile({'*.bmp';'*.jpg';'*.jpeg';'*.png';'*.tif'}, 'Save As');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('User selected Cancel');
        else
            fullpath = fullfile(pathname, filename);
            imwrite(imdeblur, fullpath);
            disp(['Image saved to ', fullpath]);
        end
    case 'No'
        disp('User chose not to save the image.');
    case 'Cancel'
        disp('User cancelled the operation.');
end
end