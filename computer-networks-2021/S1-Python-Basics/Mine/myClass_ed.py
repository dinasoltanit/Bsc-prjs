# -*- coding: utf-8 -*-
"""
Created on Fri Apr  2 11:09:37 2021
@author: Diamond
"""
"""
Class
"""
class rect:
    def __init__(self, a, b):
        print("init")
        self.x = a
        self.y = b
        
    def area(self):
        return self.x * self.y
    
    def add(self):
        pass
    
    def circum(self,a,b):
        return 2*(self.x + self.y)