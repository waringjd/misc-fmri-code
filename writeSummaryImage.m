function writeSummaryImage(cellVols, outName, expr)
% FORMAT writeSummaryImage(cellVols, outName, expr)
% Calls spm_imcalc to perform calculations (e.g. sum, mean, std) on a cell
% array of nifti images to output one summary image.
%
% cellVols: Cell array of images upon which calculations will be performed.
% outName:  The name (with full path) of the image to be written. String.
% expr:     The calculation to be performed upon the images in cellVols.
%           String. Possible values: sum(X), mean(X), std(X), maybe others.

for iVol = 1:length(cellVols)
    Vi(iVol) = spm_vol(cellVols{iVol});
end
Vo = Vi(1);
Vo.fname = outName;

spm_imcalc(Vi, Vo, expr, {1, 0, 0});
end
