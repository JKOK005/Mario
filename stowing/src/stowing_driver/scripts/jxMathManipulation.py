'''
Created on 25 Dec 2016

@author: Khoo Jie Xiong
'''
import math
from math import atan, atan2, pi, sqrt

def rotate(x,y,z,roll,pitch,yaw):  
    #Rotation order: Yaw, Pitch, Roll
    #Note: All angles are in Radians, rotations are counter-clockwise by convention
    #Rotation matrix source: http://msl.cs.uiuc.edu/planning/node102.html
    
    x_new = x*(math.cos(yaw)*math.cos(pitch)) + y*(math.cos(yaw)*math.sin(pitch)*math.sin(roll) - math.sin(yaw)*math.cos(roll)) + z*(math.cos(yaw)*math.sin(pitch)*math.cos(roll) + math.sin(yaw)*math.sin(roll))   
    y_new = x*(math.sin(yaw)*math.cos(pitch)) + y*(math.sin(yaw)*math.sin(pitch)*math.sin(roll) + math.cos(yaw)*math.cos(roll)) + z*(math.sin(yaw)*math.sin(pitch)*math.cos(roll) - math.cos(yaw)*math.sin(roll))
    z_new = x*(-math.sin(pitch)) + y*(math.cos(pitch)*math.sin(roll)) + z*(math.cos(pitch)*math.cos(roll))
    
    if x_new < 0.0001:
        x_new = 0.0
    if y_new < 0.0001:
        y_new = 0.0
    if z_new < 0.0001:
        z_new = 0.0
    
    return x_new, y_new, z_new

def obj (boundary, points):
    """
    Input: boundary (top, left, right, front), points (all the 8 points of the smallest cube surrounding the object)
    Output: The value of the maximum / minimum point relating to that boundary (eg. largest Z value for the TOP boundary. eg. smallest X value for the LEFT boundary.)
    """
    value = 0
    if boundary == "Top":
        for i in range(0,8):
            if value < points[i][2]:
                value = points[i][2]
    elif boundary == "Right":
        for i in range(0,8):
            if value < points[i][0]:
                value = points[i][0]
    elif boundary == "Left":
        value = points[0][0]
        for i in range(0,8):
            if value > points[i][0]:
                value = points[i][0]
    elif boundary == "Front":
        value = points[0][1]
        for i in range(0,8):
            if value > points[i][1]:
                value = points[i][1]    
    return value

def find_Plane_and_Normal (strategyIDchosen, p1, p2, p3):
    # Source: http://www.had2know.com/academics/equation-plane-through-3-points.html
    """
    Input: 3 points, each being an array of 3 values, p1, p2, p3.
    Output: Array of 4: coefficients of equation of plane + Array of 3: Normal vector to plane
    """
#     p1 = [1,2,3]
#     p2 = [4,6,9]
#     p3 = [12,11,9]
    vector1 = [p3[0] - p1[0],
               p3[1] - p1[1],
               p3[2] - p1[2]]
    
#     print vector1
    
    vector2 = [p2[0] - p1[0],
               p2[1] - p1[1],
               p2[2] - p1[2]]
    
#     print vector2
    
    cross_product = [vector1[1] * vector2[2] - vector1[2] * vector2[1],
                     -1 * (vector1[0] * vector2[2] - vector1[2] * vector2[0]),
                     vector1[0] * vector2[1] - vector1[1] * vector2[0]]
    
    a = cross_product[0]
    b = cross_product[1]
    c = cross_product[2]
    d = cross_product[0] * p1[0] + cross_product[1] * p1[1] + cross_product[2] * p1[2]
    
    if (strategyIDchosen == 1 or strategyIDchosen == 6): #if top suction / gripper, z has to be -ve
        if (c >= 0):
            return [-a, -b, -c, -d], [-a, -b, -c]
        else:
            return [a, b, c, d], [a, b, c]
            
    elif (strategyIDchosen == 2): #if right suction, x has to be +ve
        if (a <= 0):
            return [-a, -b, -c, -d], [-a, -b, -c]
        else: 
            return [a, b, c, d], [a, b, c]
    elif (strategyIDchosen == 3): #if left suction, x has to be -ve
        if (a >= 0):
            return [-a, -b, -c, -d], [-a, -b, -c]
        else: return [a, b, c, d], [a, b, c]
    elif (strategyIDchosen == 4 or strategyIDchosen == 5): #if front suction / gripper, y has to be +ve
        if (b <= 0):
            return [-a, -b, -c, -d], [-a, -b, -c]
        else:
            return [a, b, c, d], [a, b, c]
    
    else:
    
#     print ("Equation is ax + by + cz = d")
#     print ("a = " + str(a) + ", b = " + str(b) + ", c = " + str(c) + ", d = " + str(d))
#     print ("Normal vector: " + str([a, b, c]))
    
        return [a, b, c, d], [a, b, c] #plane, normal

def find_Max_4 (axis, points):
    """
    Input:    Axis (x - 0, y - 1, z - 2), an array of 8 points, representing a 3D rectangular block
    Output: 2 arrays. Array point contains the index number of 4 points with maximum value in the chosen axis,
            and Array value contains the value in the chosen axis of the 4 points.
    """
    global diction, index, point, value
    point = [0,1,2,3]
    value = [0,0,0,0]
    
    index = value.index(min(value))
    
    for j in range(0,8):
#         print "looking at points " + str(j)
        for k in range(0,4):
#             print "looking at col " + str(k)
            if points[j][axis] > value[k]:
                index = value.index(min(value))
                point[index] = j
                value[index] = points[j][axis]
                break
    return point, value

def find_Min_4 (axis, points):
#     max4 = [[0]*4]*2  
    global diction, index, point, value
    point = [0,1,2,3]
    value = [99,99,99,99]
    
    index = value.index(max(value))
    
    for j in range(0,8):
#         print "looking at points " + str(j)
        for k in range(0,4):
#             print "looking at col " + str(k)
            if points[j][axis] < value[k]:
                index = value.index(max(value))
                point[index] = j
                value[index] = points[j][axis]
                break
    return point, value

def find_ee_YPR(ee_normal):
    """    
    Input: Normal vector of plane
    Output: RPY rotation of e-e to face that normal vector (from the original position 
    of facing [0,1,0], which is facing directly into the bin)
    """
    print ee_normal
    x = float(ee_normal[0])
    y = float(ee_normal[1])
    z = float(ee_normal[2])
    
#     ee_yaw_by_atan2 = atan2(-x,y) /pi*180
    ee_pitch = 0.0

    if(x>=0 and y>=0 and z>=0):     
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = 0
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = -pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = 0
            ee_roll = atan(z/y)
        elif(y==0): #if on xz plane
            ee_yaw = -atan(x/z)
            ee_roll = pi/2
        elif(z==0): #if on xy plane
            ee_yaw = -atan(x/y)    
            ee_roll = 0
        else:
            ee_yaw = -atan(x/y)
            ee_roll = atan(z/y)
        
    elif(x<0 and y>=0 and z>=0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = 0
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = 0
            ee_roll = atan(z/y)
        elif(y==0): #if on xz plane
            ee_yaw = atan(-x/z)
            ee_roll = pi/2
        elif(z==0): #if on xy plane
            ee_yaw = atan(-x/y)    
            ee_roll = 0
        else:
            ee_yaw = atan(-x/y)
            ee_roll = atan(z/y)
            
    elif(x<0 and y<0 and z>=0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = pi
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = pi
            ee_roll = -atan(z/y)
        elif(y==0): #if on xz plane
            ee_yaw = atan(-x/z)
            ee_roll = pi/2
        elif(z==0): #if on xy plane
            ee_yaw = atan(-y/-x) + pi/2    
            ee_roll = 0
        else:
            ee_yaw = atan(-y/-x) + pi/2
            ee_roll = -atan(z/-y)
         
    elif(x<0 and y<0 and z<0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = -pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = pi
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = pi
            ee_roll = atan(-z/-y)
        elif(y==0): #if on xz plane
            ee_yaw = atan(-x/-z)
            ee_roll = -pi/2
        elif(z==0): #if on xy plane
            ee_yaw = atan(-y/-x) + pi/2    
            ee_roll = 0
        else:
            ee_yaw = atan(-y/-x) + pi/2
            ee_roll = atan(-z/-y)
     
    elif(x>=0 and y<0 and z>=0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = pi
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = -pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = pi
            ee_roll = -atan(z/-y)
        elif(y==0): #if on xz plane
            ee_yaw = -atan(x/z)
            ee_roll = pi/2
        elif(z==0): #if on xy plane
            ee_yaw = -atan(-y/x) - (pi/2)    
            ee_roll = 0
        else:
            ee_yaw = -atan(-y/x) - (pi/2)
            ee_roll = -atan(z/-y)
                 
    elif(x>=0 and y<0 and z<0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = -pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = pi
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = -pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = pi
            ee_roll = atan(-z/-y)
        elif(y==0): #if on xz plane
            ee_yaw = -atan(x/-z)
            ee_roll = -pi/2
        elif(z==0): #if on xy plane
            ee_yaw = -atan(-y/x) - (pi/2)    
            ee_roll = 0
        else:
            ee_yaw = -atan(-y/x) - (pi/2)
            ee_roll = atan(-z/-y)
        
    elif(x>=0 and y>=0 and z<0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = -pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = 0
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = -pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = 0
            ee_roll = -atan(-z/y)
        elif(y==0): #if on xz plane
            ee_yaw = -atan(x/-z)
            ee_roll = -pi/2
        elif(z==0): #if on xy plane
            ee_yaw = -atan(x/y)    
            ee_roll = 0
        else:
            ee_yaw = -atan(x/y)
            ee_roll = -atan(-z/y)
    
    elif(x<0 and y>=0 and z<0):
        if(y==0 and x==0): #if on z axis
            ee_yaw = 0
            ee_roll = -pi/2
        elif(z==0 and x==0): #if on y axis
            ee_yaw = 0
            ee_roll = 0
        elif(z==0 and y==0): #if on x axis
            ee_yaw = pi/2
            ee_roll = 0
        elif(x==0): #if on yz plane
            ee_yaw = 0
            ee_roll = -atan(-z/y)
        elif(y==0): #if on xz plane
            ee_yaw = atan(-x/-z)
            ee_roll = -pi/2
        elif(z==0): #if on xy plane
            ee_yaw = atan(-x/y)    
            ee_roll = 0
        else:
            ee_yaw = atan(-x/y)
            ee_roll = -atan(-z/y)
    
#     print "E_e Yaw, Pitch, Roll in degrees:" + str(ee_yaw /pi*180) + ", " + str(ee_pitch /pi*180) + ", " + str(ee_roll/pi*180)
    return ee_yaw, ee_pitch, ee_roll