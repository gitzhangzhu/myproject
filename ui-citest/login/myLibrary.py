#coding:utf-8

import random
import string
import time
import datetime
#from selenium import webdriver

class myLibrary():
    def RanStr(self,couponname):
        '''
        (优惠券名称+6位随机数)
        :param couponname:
        :return:
        '''
        Str = ''.join(random.sample(string.ascii_letters + string.digits,6))
        return couponname+Str

    def StaDate(self,staDate):
        staDate = time.strftime('%Y-%m-%d', time.localtime(time.time()))  # 这里格式是‘%Y-%m-%d’
        return staDate

    def EndDate(self,endDate):
        endDate = time.strftime('%Y-%m-%d', time.localtime(time.time()))  # 这里格式是‘%Y-%m-%d’
        return endDate

    def NextDay(self, nextDay):
        today = datetime.date.today()
        nextDay = today.replace(day = today.day + 1).strftime("%Y-%m-%d")
        return nextDay