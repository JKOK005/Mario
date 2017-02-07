'''
Created on 11 Oct 2016

@author: Khoo Jie Xiong
'''

#Static Constants (m)
#These are the old APC 2016 bin measurements. Height of the table beside the bins are 74.5cm
bin_x = 0.361
bin_y = 0.26
bin_z = 0.43

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
    
    if itemID == 0: #If new item
        name = "New Item"
        dimensions[0] = 0
        dimensions[1] = 0
        dimensions[2] = 0
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.4 #right suction
        strat[3] = 0.4 #left suction
        strat[4] = 0.7 #front suction
        
        #Gripping
        strat[5] = 0.5 #front gripper
        strat[6] = 0.5 #top gripper
    
    elif itemID == 1:
        name = "Crayola Crayons"
        dimensions[0] = 0.071; #xx
        dimensions[1] = 0.08; #xy
        dimensions[2] = 0.098; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper

        
    elif itemID == 2:
        name = "School Glue"
        dimensions[0] = 0.06; #xx
        dimensions[1] = 0.03; #xy
        dimensions[2] = 0.14; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
        
    elif itemID == 3:
        name = "DrBrown's Bottle Brush"
        dimensions[0] = 0.305; #xx
        dimensions[1] = 0.108; #xy
        dimensions[2] = 0.055; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
    
    elif itemID == 4:
        name = "Outward hound Squeakin' Animals"
        dimensions[0] = 0.18; #xx
        dimensions[1] = 0.14; #xy
        dimensions[2] = 0.065; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper

        
    elif itemID == 5:
        name = "Kleenex Cool Touch"
        dimensions[0] = 0.112; #xx
        dimensions[1] = 0.13; #xy
        dimensions[2] = 0.115; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
        
    elif itemID == 6:
        name = "Dove Dry Oil"
        dimensions[0] = 0.093; #xx
        dimensions[1] = 0.063; #xy
        dimensions[2] = 0.071; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
        
    elif itemID == 7:
        name = "Rolodex Pencil Holder"
        dimensions[0] = 0.11; #xx
        dimensions[1] = 0.11; #xy
        dimensions[2] = 0.137; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper

        
    elif itemID == 8:
        name = "Creativity Street Jumbo Stems"
        dimensions[0] = 0.32; #xx
        dimensions[1] = 0.11; #xy
        dimensions[2] = 0.03; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
        
    elif itemID == 9:
        name = "Fiskars Scissors"
        dimensions[0] = 0.095; #xx
        dimensions[1] = 0.183; #xy
        dimensions[2] = 0.016; #zx
    
        #Suction
        strat[1] = 0.9 #top suction    
        strat[2] = 0.5 #right suction
        strat[3] = 0.6 #left suction
        strat[4] = 0.6 #front suction
        
        #Gripping
        strat[5] = 0.4 #front gripper
        strat[6] = 0.4 #top gripper
    
    return name, dimensions, strat