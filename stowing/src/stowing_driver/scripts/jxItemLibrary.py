'''
Created on 11 Oct 2016

@author: Khoo Jie Xiong
'''

#Static Constants (m)
#These are the old APC 2016 bin measurements. Height of the table beside the bins are 74.5cm
bin_x = 0.25
bin_y = 0.20
bin_z = 0.19

tote_x = 0.54377
tote_y = 0.35153
tote_z = 0.19812 #Not required?

spaceReq_SideSuction = 0.095 #Same for top and side suctions
spaceReq_FrontSuction_Top = 0.07
spaceReq_FrontSuction_Bottom = 0.025
spaceReq_GripperThickness = 0.10

safetyClearance = 0.005


def getItemData (itemID):
    """
    This function takes in the itemID and returns the item name, and all data of the item
    """
    strat = [0]*20
    dimensions = [0]*3
    name = " "
    
    if itemID == 1:
        name = "item1"
        dimensions[0] = 0.228; #xx
        dimensions[1] = 0.06; #xy
        dimensions[2] = 0.16; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper

        
    if itemID == 2:
        name = "item2"
        dimensions[0] = 0.11; #xx
        dimensions[1] = 0.145; #xy
        dimensions[2] = 0.095; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.3 #right suction
        strat[3] = 0.3 #left suction
        strat[4] = 0.4 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper

    
    if itemID == 3:
        name = "item3"
        dimensions[0] = 0.15; #xx
        dimensions[1] = 0.02; #xy
        dimensions[2] = 0.09; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.3 #right suction
        strat[3] = 0.3 #left suction
        strat[4] = 0.4 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
    
    return name, dimensions, strat