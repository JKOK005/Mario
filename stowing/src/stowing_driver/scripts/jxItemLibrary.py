'''
Created on 11 Oct 2016

@author: Khoo Jie Xiong
'''

#Static Constants (m)
bin_x = 0.4
bin_y = 0.2
bin_z = 0.41

tote_x = 0.54377
tote_y = 0.35153
tote_z = 0.19812 #Not required?

spaceReq_TopSuction = 0.095
spaceReq_LeftSuction = 0.095
spaceReq_RightSuction = 0.095
spaceReq_Gripper = 0.10

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
        dimensions[0] = 0.01; #xx
        dimensions[1] = 0.02; #xy
        dimensions[2] = 0.03; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.3 #right suction
        strat[3] = 0.3 #left suction
        strat[4] = 0.4 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper

        
    if itemID == 2:
        name = "item2"
        dimensions[0] = 0.05; #xx
        dimensions[1] = 0.02; #xy
        dimensions[2] = 0.09; #zx
    
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