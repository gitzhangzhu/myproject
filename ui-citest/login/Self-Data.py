# coding=utf-8

_all_=['couponValue','datenum','limitcash','limitnum','couponnum','memo','beforeDaySendCoupon','startvalue','endvalue','queueTime','queueNum','allLotteryNum','everyLotteryNum','everydayLotteryNum','everyLotteryOnedayNum','everyLotteryMaxNum','winProbability','Lotteryname','Lotterynum','offnum','offvalue','goodnum','singleoffvalue','startstore','endstore','consumevalue','fulltime','maxnum','mysqlname','connectparams']

#优惠券
couponValue = '5.55'
datenum = '3'
limitcash = '10'
limitnum = '2'
couponnum = '1000'

#说明、描述
memo = u'这是一个说明'

#生日营销
beforeDaySendCoupon = '1'       #提前发券时间

#消费满额方案
#消费金额区间
startvalue = ['1','10','20']
endvalue = ['10','20','100']

#排队营销方案
#排队时长与次数
queueTime = ['1','2','3']
queueNum = ['1','2','3']

#抽奖营销方案
allLotteryNum = '10'
everyLotteryNum = '8'
everydayLotteryNum = '3'
everyLotteryOnedayNum = '3'
everyLotteryMaxNum = '3'
winProbability = '50'
Lotteryname = u'一等奖'
Lotterynum = '1'

#限时特价
offnum = '10'
offvalue = '5.5'

#新品推广
goodnum = '1'
singleoffvalue = '5.5'

#储值赠券方案
#储值金额区间
startstore = ['1','10','20']
endstore = ['10','20','100']

#消费总金额激励
consumevalue = ['1','10','20']

#消费频次激励
fulltime = ['1','5','10']

#分享营销
maxnum = '1'

#数据库操作
mysqlname = 'pymysql'
connectparams = "database='calm_marketing_ci', user='ci_calm_mkt', password='0zFIu9ulIhs8pfW', host='ci.rdsmaster.cnhz.shishike.com', port=3306, charset='utf8'"