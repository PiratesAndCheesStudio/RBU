#This script generates translation xmls

#==============================#
#			CONFIG			   #
#==============================#


#==============================#
#			DONT TOUCH		   #
#==============================#

from xml.etree.ElementTree import Element, SubElement, Comment, tostring
from xml.etree import ElementTree
from xml.dom import minidom
import sys

def main():

	top = Element('top')

	comment = Comment('Generated for PyMOTW')
	top.append(comment)

	child = SubElement(top, 'child')
	child.text = 'This child contains text.'

	child_with_tail = SubElement(top, 'child_with_tail')
	child_with_tail.text = 'This child has regular text.'
	child_with_tail.tail = 'And "tail" text.'

	child_with_entity_ref = SubElement(top, 'child_with_entity_ref')
	child_with_entity_ref.text = 'This & that'

	tree = ET.ElementTree(prettify(top))
	tree.write("filename.xml")

def prettify(elem):
	
	rough_string = ElementTree.tostring(elem, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")	
	
if __name__ == "__main__":
    sys.exit(main())