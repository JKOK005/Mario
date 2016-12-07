import socket
import time
import rospy
import os

class Ur5SocketConnection(object):
	def __init__(self, *args, **kwargs):
		self.host 			= "192.168.0.100"
		self.port 			= 30003
		super(Ur5SocketConnection, self).__init__(*args, **kwargs)

	def get_host(self):
		return self.host

	def get_port(self):
		return self.port

	def get_connection(self):
		