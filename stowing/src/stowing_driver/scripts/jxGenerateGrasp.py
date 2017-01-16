'''
Created on 14 Oct 2016

@author: Khoo Jie Xiong
'''
from jxMathManipulation import * #Need this for mathematical manipulations
from jxItemLibrary import * #Need this import for constants

def grasp_Generate(x, y, z, roll, pitch, yaw, dimensions, strategyIDchosen):
    
    xx = dimensions[0]
    xy = dimensions[1]
    xz = dimensions[2]
    
    ee_x = 0
    ee_y = 0
    ee_z = 0
    
    point = []*4
    value = []*4 #Currently not in use, but will need for later versions
    
    #Getting points of 8 corners of the smallest arbituary cube encasing the object, center of object is reference
    points = [[]*3]*8
    points[0] = [-(xx/2),-(xy/2),-(xz/2)]
    points[1] = [(xx/2),-(xy/2),-(xz/2)]
    points[2] = [(xx/2),(xy/2),-(xz/2)]
    points[3] = [-(xx/2),(xy/2),-(xz/2)]
    points[4] = [-(xx/2),-(xy/2),(xz/2)]
    points[5] = [(xx/2),-(xy/2),(xz/2)]
    points[6] = [(xx/2),(xy/2),(xz/2)]
    points[7] = [-(xx/2),(xy/2),(xz/2)]
    

    #Rotating the 8 points, center is reference
    for i in range(0,8):
        points[i] = rotate(points[i][0],points[i][1],points[i][2],roll,pitch,yaw)
    
    stratNotBlocked = 0
    pickStatus = 0
    
    #Getting max boundary points of object
    obj_Top = obj("Top", points) + z
    obj_Right = obj("Right", points) + x
    obj_Left = obj("Left", points) + x
    obj_Front = y + obj("Front", points)
        
    ##################################Checking space constraint#########################################
        
    #if Top suction
    if strategyIDchosen in [1]: 
        spaceRequired_Top = spaceReq_SideSuction + safetyClearance
        spaceRequired_Left = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Right = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Bottom = 0
    
        ee_x = x
        ee_y = y
        ee_z = obj_Top
        
        if (spaceRequired_Top<(bin_z - obj_Top) and spaceRequired_Left<(ee_x) and spaceRequired_Right<(bin_x-ee_x) and spaceRequired_Bottom<(ee_z)): 
            #if there is enough space,
            stratNotBlocked = 1
            point, value = find_Max_4(2, points)

            #finding alternate points
        else:
            stratNotBlocked = 0
    
    #if Right suction
    elif strategyIDchosen in [2]: 
        spaceRequired_Top = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Left = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Right = spaceReq_SideSuction + safetyClearance
        spaceRequired_Bottom = spaceReq_GripperThickness/2 + safetyClearance

        ee_x = obj_Right
        ee_y = y
        ee_z = z
    
        if (spaceRequired_Top<(bin_z - ee_z) and spaceRequired_Left<(ee_x) and spaceRequired_Right<(bin_x-obj_Right) and spaceRequired_Bottom<(ee_z)):
            #if there is enough space,
            stratNotBlocked = 1
            point, value = find_Max_4(0, points)
            
        else:
            stratNotBlocked = 0
    
    #if Left suction
    elif strategyIDchosen in [3]:
        spaceRequired_Top = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Left = spaceReq_SideSuction + safetyClearance
        spaceRequired_Right = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Bottom = spaceReq_GripperThickness/2 + safetyClearance
        
        ee_x = obj_Left
        ee_y = y
        ee_z = z
        
        if (spaceRequired_Top<(bin_z - ee_z) and spaceRequired_Left<(obj_Left) and spaceRequired_Right<(bin_x-ee_x) and spaceRequired_Bottom<(ee_z)):
            #if there is enough space,
            stratNotBlocked = 1
            
            point, value = find_Min_4(0, points)
            print point
        else:
            stratNotBlocked = 0
    
    #if Front suction
    elif strategyIDchosen in [4]:
        spaceRequired_Top = spaceReq_FrontSuction_Top + safetyClearance
        spaceRequired_Left = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Right = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Bottom = spaceReq_FrontSuction_Bottom + safetyClearance

        ee_x = x
        ee_y = obj_Front
        ee_z = z
        
        if (spaceRequired_Top<(bin_z-ee_z) and spaceRequired_Left<(ee_x) and spaceRequired_Right<(bin_x-ee_x) and spaceRequired_Bottom<(ee_z)):
            stratNotBlocked = 1
            point, value = find_Min_4(1, points)
            
        else:
            stratNotBlocked = 0
    
    #if Front gripper
    elif strategyIDchosen in [5]:
        spaceRequired_Top = spaceReq_FrontSuction_Top + safetyClearance
        spaceRequired_Left = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Right = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Bottom = spaceReq_FrontSuction_Bottom + safetyClearance
        
        ee_x = x
        ee_y = obj_Front
        ee_z = z
        
        if (spaceRequired_Top<(bin_z-ee_z) and spaceRequired_Left<(ee_x) and spaceRequired_Right<(bin_x-ee_x) and spaceRequired_Bottom<(ee_z)):
            stratNotBlocked = 1
            
            point, value = find_Min_4(1, points)
            
        else:
            stratNotBlocked = 0
            
    #if Top gripper
    elif strategyIDchosen in [6]:
        spaceRequired_Top = spaceReq_SideSuction + safetyClearance
        spaceRequired_Left = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Right = spaceReq_GripperThickness/2 + safetyClearance
        spaceRequired_Bottom = 0
    
        ee_x = x
        ee_y = y
        ee_z = obj_Top
        
        if (spaceRequired_Top<(bin_z - obj_Top) and spaceRequired_Left<(ee_x) and spaceRequired_Right<(bin_x-ee_x) and spaceRequired_Bottom<(ee_z)): 
            stratNotBlocked = 1
            point, value = find_Max_4(2, points)
            
        else:
            stratNotBlocked = 0

############################################################################## 

    if stratNotBlocked == 1:
        pickStatus = 1
    
    else:   
        pickStatus = 0    
    
    #Taking 3 out of the 4 points to find the plane and the normal to the plane
    
    if (pickStatus == 1):
        print points[point[0]]
        ee_plane, ee_normal = find_Plane_and_Normal(strategyIDchosen, points[point[0]], points[point[1]], points[point[2]])
        print "Normal: " + str(ee_normal)
        #Finding the RPY to allow e-e to face the normal of the plane
        ee_yaw, ee_pitch, ee_roll = find_ee_YPR(ee_normal)
        return pickStatus, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw, obj_Top, obj_Right, obj_Left, obj_Front, ee_plane, ee_normal
    
    else:
        return pickStatus,0,0,0,0,0,0,0,0,0,0,0,0



