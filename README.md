# 3DMMS

This program implements the 3DMMS algorithm proposed in [*3DMMS: Robust 3D Membrane Morphological Segmentation of C.elegans Embryo*](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-2720-x), Jianfeng Cao, Ming-Kin Wong, Zhongying Zhao, Hong Yan. 

## Usage

- **Platform dependency** 

  This program is developed in Matlab 2017b. For computational efficiency, parallel computing is adopted in 3DMMS.

- **Structure of folders**

  ```
  3DMMS is used to segment C.elegans embryo imaged with fluorescent microscopy
  3DMMS/:
    |--data/: nucleus information file from AceTree and raw membrane images
  	  |--aceNuc/
  		  |--170704plc1p2/: nucleus location file (refer to AceTree)
  		  |--colorMap.mat: color map used for labelling result (*_rgb.tif)
  		|--membrane/170704plc1p2/: raw membrane image 
  	|--Evaluation/: data for experimental evaluation in BMC Bio 3DMMS paper
  	|--getNucFromacetree/: codes for get nucleus location in *.csv file
  		|--transformed/: index map between label <--> cell name
  		|--***
  	|--MINS-1.3/: external library for fast computation
  	|--results/:
  		|--resultWithMerge/: results with two daughter cells possiblely merged.
  			|--informationForMerge/: intermediate results in parallel computation
  			|--merged_memebraen/: *.mat is prefered. *.tif is used for visualization.
  			|--mergedResults/: stastial results of the final segmentations.
  	|--TiffSave/: library for saving tif images.
    |--tinevez-matlab-tree-3d13d15/: library for constructing cell division tree.
    |--**      
  ```

- **Parameters settting**

  If you want to analyze your own dataset, you might need to change parameters according to your own dataset. `I3DMMS.m` function includs all the parameters you need to tune. They are listed as following:

| **Parameter name** | **Meaning**                            |
| -----------------: | :------------------------------------- |
|          data_name | membrane image dataset name            |
|           max_Time | maximal time point of the embryo stack |
|           prescale | downsample ratio on each slice         |
|        reduceRatio | downsample ratio on the whole embryo   |
|      xy_resolution | resolution on each slice               |
|       z_resolution | distance of each slices                |

- **Experiment**

  Suppse `3DMMS` as the root folder, 

  1. run `startup.m` first to generate `colorMap.mat` and add root path;
  2. Then run `I3DMMS.m` to  get results as that in `results` folder.

- **Note**

1. [ImageJ](https://fiji.sc/) can be used to view `*.tif` files, `Plugins-->Process-->Show Color Surfaces`.
2. Nulcues location file is necessary which can be obtained by using [AceTree and StarryNite](https://www.nature.com/articles/nprot.2006.222).
3. 3DMMS aims to segment cells in 3D, where cells closely contact to each other. Raw membrane stack images can come from *C. elegans*,  *Arabidopsis thaliana* and *Drosophila*, but not individual cells, like cells in the blood. 

## **Correspondence**

Please contact to jfcao3-c@my.cityu.edu.hk



  
