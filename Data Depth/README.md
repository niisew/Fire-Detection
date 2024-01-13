In this directory, you will find files related to data depth.

# Background
Data Depth allows us to see whether or not an image may or may not be on fire. It works by comparing the image to all other images and assigning it a "depth" relative to other images. 

## DDalpha.R

The data_depth.R file is meant to be used with the "PD_vectorization_and_fire_index_Example.ipynb" python notebook.

In this file you will find a varietly of data depth functions that can be run.

## Extremal Data Depth

Extremal Depth is a newer depth function that is meant to be able to execute faster with large amounts of data. 

Similar to the data depth functions found in the data_depth.R file, you will need your data to be in the form of a numpy array. 

In the Extremal_Depth_Example notebook, you will add your data in "S = []".

Example: S = [np.array([0.00000000e+00, 0.00000000e+00, 2.20226974e-03, 2.55981458e-05,
       0.00000000e+00, 4.04072202e-04, 2.44819312e-03, 5.71364980e-05,
       1.47914876e-02, 2.69711764e-02]), np.array([0.00099335, 0.00380378, 0.03290286, 0.01621584, 0.0440664 ,
       0.11532577, 0.15169396, 0.1701804 , 0.1134536 , 0.0567268 ]), np.array([0.00052189, 0.        , 0.00593567, 0.03206406, 0.03795193,
       0.02266538, 0.01411279, 0.01232315, 0.02350452, 0.01435631]), np.array([0.        , 0.00561437, 0.00025134, 0.        , 0.0023962 ,
       0.0584972 , 0.09760083, 0.11967495, 0.08229564, 0.04114782]), np.array([0.        , 0.        , 0.00495507, 0.00060599, 0.        ,
       0.00281534, 0.00055654, 0.02627647, 0.05126242, 0.02271137])]

Output from Example:

![image](https://github.com/niisew/Fire-Detection/assets/153964217/1038bc94-4f95-4f05-89d3-0242dddb4f95)
