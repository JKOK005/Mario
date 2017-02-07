'''
Created on 5 Oct 2016

@author: Khoo Jie Xiong
'''
import timeit
from math import pi
from jxItemLibrary import *
from jxGenerateGrasp import *

"""
Add in class later

import GraspingModule
grasping_onbj = GraspingModule()
grasping_obj.Grasp_this_object()

class GraspingModule():
    def __init__(self)
"""

#########################################################################################################################

def grasp_Main(itemID, pickorstow, position, RPY, bannedstrats,  newObjDim=None): #include banned strategy later on
    
    """    
    This function takes in the position and orientation of an item and outputs 
    the position and orientation of the gripper to be able to pick the object up

    Args:
        itemID (int):            Item ID. 0 if new item
        pickorstow (binary):     0 if picking, 1 if stowing
        position (list):         Cartesian coordinates of volumetric center of object, in [x,y,z]
        RPY (list):              Orientation of object in Euler angles [roll, pitch, yaw]
        newObjDim (list):        Dimensions of new object if there is a new object, in [width, depth, height]
        bannedstrats (list):     Strategies that are to be banned when generating a grasping strategy
        
    Returns:
        pickStatus (binary):     1 if success in finding a grasping strategy, 0 if unsuccessful
        strategyIDchosen (int):  ID of strategy chosen
        ee_position (list):      5 rows of possible e-e points in [x,y,z] format
        ee_YPR (list):           Orientation of e-e in [yaw, pitch, roll] format
    """
    
    
    global starttime, name, dimensions, strat, strategyIDchosen, pickStatus, stratNotBlocked, stratsConsidered, obj_Left, obj_Right, obj_Top, obj_Front, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw
    global obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw, ee_position
    
#     Initializing variables, constant within the same pick / stow job
    starttime = 0
    name = " "
    dimensions = [0]*3
    strat = [0]*20
    strategyIDchosen = 0
    pickStatus = 0
    stratNotBlocked = 0
    stratsConsidered = 0
    maxNumStrats = 8
    
    obj_x = position[0]
    obj_y = position[1]
    obj_z = position[2]
    obj_roll    = RPY[0]
    obj_pitch   = RPY[1]
    obj_yaw     = RPY[2]
    
    #Start timer    
    starttime = timeit.default_timer();
    
    #get item data from jxItemLibrary.py
    name, dimensions, strat = getItemData(itemID)  
    
    #If object is new,
    if itemID == 0:
        if (newObjDim[0] == 0 or newObjDim[1] == 0 or newObjDim[2] == 0):
            print width
            print "Error - New item no dimensions input!"
            return 0
        else:
            dimensions[0] = newObjDim[0]
            dimensions[1] = newObjDim[1]
            dimensions[2] = newObjDim[2]
    
    #Set confidence values of banned strategies to 06
    strat[bannedstrats[0]] = 0
    strat[bannedstrats[1]] = 0
    strat[bannedstrats[2]] = 0
    strat[bannedstrats[3]] = 0
    strat[bannedstrats[4]] = 0
    strat[bannedstrats[5]] = 0
    
    #If picking, ban top gripper
    if pickorstow == 0:
        strat[6] = 0
        
    #If stowing, only allow top suction and top gripper
    if pickorstow == 1:
        strat[2] = 0
        strat[3] = 0
        strat[4] = 0
        strat[5] = 0
    
    
    get_Next_Best_Strat()
    
    #If strategy is constrained by space, get next best strategy
    while pickStatus == 0 and stratsConsidered < maxNumStrats:
        stratsConsidered = 1 + stratsConsidered
        print "Re-trying... attempt" + str(stratsConsidered)
        strat[strategyIDchosen] = 0 #Ban this strategy
        get_Next_Best_Strat()

    if pickStatus == 1:
        print "Success! Strategy found!"
        #Will return these parameters to Motion Control
        ee_position_YPR = [list(ee_YPR) +i for i in ee_position]
        
        return strategyIDchosen, ee_position_YPR
    
    else:
        raise Exception("No possible grasping strategies found")
#############################################################################################################################

def get_Next_Best_Strat():
    global starttime, name, dimensions, strat, strategyIDchosen, pickStatus, stratNotBlocked, stratsConsidered, obj_Left, obj_Right, obj_Top, obj_Front, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw, ee_YPR, ee_plane, ee_normal
    global obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw, ee_position
    
#     ee_position = [[]*3]*5
    
    #Finding highest confidence strategy
    strategyIDchosen = strat.index(max(strat))
    print "Trying strategy: " + str(strategyIDchosen)
    #Checking if within space constraint
    pickStatus, ee_position, ee_YPR, obj_Top, obj_Right, obj_Left, obj_Front, ee_normal = grasp_Generate(obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw, dimensions, strategyIDchosen)
#     ee_position, ee_YPR = grasp_Generate(obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw, dimensions, strategyIDchosen)
    
    #Print out result of that particular strategy
    report_Strat_Result()


def report_Strat_Result():
    timetaken = timeit.default_timer() - starttime 
    
    if pickStatus == 0:
        print "Pick status: Error - Space constraint!"
    
    elif pickStatus == 1:
        
        print "Object location (x, y, z): " + str(obj_x), str(obj_y), str(obj_z)
        print "Object boundary (Left, Right, Top, Front): " + str(obj_Left), str(obj_Right), str(obj_Top), str(obj_Front)

        for i in range(0,int(100*bin_x)):
            if i < (obj_Left*100) or (i > obj_Right*100):
                print "_",
            elif i >= obj_Left*100 and i <= obj_Right*100:
                print "O",
    
        print "\nName: " + name + "\nStrat chosen: " + str(strategyIDchosen)
        print "Pick status: Possible pick!"
        print "Confidence: " + str(strat[strategyIDchosen]*100) + "%"
        
        numpoints, pointsmap = ee_position_numpoints(ee_position)
        print "Number of possible ee points found (max 5): " + str(numpoints)
        for i in range (0,5):
            if pointsmap[i] == 1:
                print "E-e (x, y, z): " + str(ee_position[i])
        
        print "E-e YPR: " + str(ee_YPR)
        
#         print "E-e (x, y, z, yaw, pitch, roll): " + str(ee_x) + " " + str(ee_y) + " " + str(ee_z) + " " + str(ee_yaw)  + " " + str(ee_pitch)  + " " + str(ee_roll) + " "

        print "Time taken: " + str(timetaken)
    else:
        print "Error: No pickstatus!"
    print " "

def ee_position_numpoints(ee_position):
    
    numpoints = 0
    pointsmap = [0]*5
    
    for i in range(0,5):
        if ee_position[i] != [0,0,0]:
            pointsmap[i] = 1
            numpoints = numpoints + 1
    
    return numpoints, pointsmap
#############################################################################################################################

    
#This is what Johan will output to grasping module
#itemID, pickorstow, x, y, z, roll, pitch, yaw, bannedstrat1, bannedstrat2

if __name__ == "__main__":
    itemID      = 8 #0 if new item
    pickorstow  = 0
    position    = [0.06,0.08,0.015] # x,y,z
    RPY         = [0,0,pi/2] # Roll, pitch, yaw
    newObjDim   = [0.11,0.22,0.9] #width, depth, height   
    bannedstrats= [0,2,3,4,5,6]

    grasp_Main(itemID, pickorstow, position, RPY, newObjDim, bannedstrats)