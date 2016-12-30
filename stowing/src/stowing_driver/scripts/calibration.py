""" 
Coordinate calibration of the bottom left markings of each bin relative to the robot. 
Reference taken from stowing_driver -> ur5.launch file which defines the full APC setup

All coordinates are in meters and taken relative to the base frame of the robot.
The base frame of the robot is elevated by a support structure (yellow) that gives the robot additional height.

The robot's base coordinate frame is defined in Gazebo, with X (red) pointing straight towards the self, Y (green) pointing to the left 
and Z (blue) following the right hand rule. 
"""

coordinate_bin_A 	= [0.850, 0.613, 0.495]
coordinate_bin_B 	= [0.850, 0.200, 0.495]
coordinate_bin_C 	= [0.850, -0.213, 0.495]
coordinate_bin_D 	= [0.850, 0.613, 0.080]
coordinate_bin_E 	= [0.850, 0.200, 0.080]
coordinate_bin_F 	= [0.850, -0.213, 0.080]
coordinate_bin_G 	= [0.850, 0.613, -0.367]
coordinate_bin_H 	= [0.850, 0.200, -0.367]
coordinate_bin_I 	= [0.850, -0.213, -0.367]


# Shelf is now 0.85 m in front of robot
# Robot's base height decreases to 1.34m