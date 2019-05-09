import imageio
import sys

if len(sys.argv) != 2:
	print('Usage: {} path/to/maze/image'.format(sys.argv[0]))
	exit(1)

im = imageio.imread(sys.argv[1])

for y in xrange(im.shape[0]):
	string = ''
	for x in xrange(im.shape[1]):
		if x == 0 and y == 0:
			string += 'W'
		elif x == 1 and y == 0:
			string += 'T'
		elif x == 2 and y == 0:
			string += 'Z'
		elif y == 0 and im[x][y] == 255:
			string += '3'
		elif y == im.shape[0]-1 and im[x][y] == 255:
			string += '3'
		elif x == 0 and im[x][y] == 255:
			string += '3'
		elif x == im.shape[1]-1 and im[x][y] == 255:
			string += '3'
		elif im[x][y] == 255:
			string += 'T'
		else:
			string += 'X'
	print(string)