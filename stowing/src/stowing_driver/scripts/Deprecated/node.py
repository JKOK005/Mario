import rospy
from control_msgs.msg import *

def __robot_joint_state_callback(data):
	print(data.actual.positions)

rospy.init_node('node', anonymous=True)
rospy.Subscriber('/arm_controller/state', JointTrajectoryControllerState, __robot_joint_state_callback)
rospy.spin()