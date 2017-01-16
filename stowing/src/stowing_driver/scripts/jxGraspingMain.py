'''
Created on 5 Oct 2016

@author: Khoo Jie Xiong
'''
import timeit
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

def grasp_Main (itemID, pickorstow, x, y, z, roll, pitch, yaw, bannedstrat1, bannedstrat2): #include banned strategy later on
    
    """
    This function takes in the position and orientation of the item and outputs 
    the position and orientation of the gripper to be able to pick the object up
    """
    
    global starttime, name, dimensions, strat, strategyIDchosen, pickStatus, stratNotBlocked, stratsConsidered, obj_Left, obj_Right, obj_Top, obj_Front, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw
    global obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw
    
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
    
    obj_x = x
    obj_y = y
    obj_z = z
    obj_roll = roll
    obj_pitch = pitch
    obj_yaw = yaw
    
    #Start timer    
    starttime = timeit.default_timer();
    
    #get item data from jxItemLibrary.py
    name, dimensions, strat = getItemData(itemID)     
    
    #Set confidence values of banned strategies to 0
    strat[bannedstrat1] = 0
    strat[bannedstrat2] = 0
    
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
        return pickStatus, strategyIDchosen, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw
    
    else:
        print "No possible strategy"
        #Will return error message to Motion Control (which is currently set to 0)
        return 0

#############################################################################################################################

def get_Next_Best_Strat():
    global starttime, name, dimensions, strat, strategyIDchosen, pickStatus, stratNotBlocked, stratsConsidered, obj_Left, obj_Right, obj_Top, obj_Front, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw, ee_plane, ee_normal
    global obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw

    #Finding highest confidence strategy
    strategyIDchosen = strat.index(max(strat))
    print "Trying strategy: " + str(strategyIDchosen)
    #Checking if within space constraint
    pickStatus, ee_x, ee_y, ee_z, ee_roll, ee_pitch, ee_yaw, obj_Top, obj_Right, obj_Left, obj_Front, ee_plane, ee_normal = grasp_Generate(obj_x, obj_y, obj_z, obj_roll, obj_pitch, obj_yaw, dimensions, strategyIDchosen)
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
        print "E-e (x, y, z, yaw, pitch, roll): " + str(ee_x) + " " + str(ee_y) + " " + str(ee_z) + " " + str(ee_yaw)  + " " + str(ee_pitch)  + " " + str(ee_roll) + " "

        print "Time taken: " + str(timetaken) + "\n"
    else:
        print "Error: No pickstatus!"
    print " "

#############################################################################################################################

    
#This is what Johan will output to grasping module
#itemID, pickorstow, x, y, z, roll, pitch, yaw, bannedstrat1, bannedstrat2

itemID      = 1
pickorstow  = 0
x           = 0.142
y           = 0.1
z           = 0.08
roll        = 0
pitch       = 0
yaw         = 0
bannedstrat1= 0
bannedstrat2= 0

grasp_Main(itemID, pickorstow, x, y, z, roll, pitch, yaw, bannedstrat1, bannedstrat2) 