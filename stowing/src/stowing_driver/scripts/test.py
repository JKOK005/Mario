import rospy
import smach
import smach_ros

class Scan_and_capture_vision(smach.State):
	# Scans and captures image
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_PCL_segmentation_vision'], input_keys=['input'], output_keys=['output'])
		self.count 	=0

	def execute(self, userdata):
		rospy.loginfo("Mario -> Scanning tote and generating point cloud data")
		self.count += userdata.input
		print(self.count)
		return 'goto_PCL_segmentation_vision'

class PCL_segmentation_vision(smach.State):
	# Recreates point cloud data
	def __init__(self):
		smach.State.__init__(self, outcomes=['goto_Compare_rgb_vision'], input_keys=['input'], output_keys=['output'])
		self.count 	=0
	def execute(self, userdata):
		rospy.loginfo("Mario -> PCL segmentation")
		self.count -= userdata.input
		print(self.count)
		return 'goto_Compare_rgb_vision'

if __name__ == "__main__":
	rospy.init_node('Mario_stowing')

	child_Main_vision		= smach.StateMachine(outcomes=['goto_Main_grasping','goto_Reattempt_vision'])
	child_Main_vision.userdata.data_field = 50
	with child_Main_vision:
		smach.StateMachine.add('Scan_and_capture_vision', Scan_and_capture_vision(), 
								transitions	= {
												'goto_PCL_segmentation_vision' 	: 'PCL_segmentation_vision'
												},
								remapping	= {
												'input'			: 'data_field',
												'output' 		: 'data_field',
												})

		smach.StateMachine.add('PCL_segmentation_vision', PCL_segmentation_vision(), 
								transitions	= {
												'goto_Compare_rgb_vision' 	: 'Scan_and_capture_vision'
												},
								remapping	= {
												'input'			: 'data_field',
												'output' 		: 'data_field',
												})

	child_Main_vision.execute()