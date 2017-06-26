import re
import numpy as np


with open('0.txt') as file:
	data = re.split(' |\n', file.read())
	data = filter(lambda x: x != '', data)
	data = map(float, data)
	data = data[0:len(data) / 300 * 300]
	data = np.reshape(data, (len(data) / 300,1,100,3))
	print data