from surbtc import SURBTC

api_key = '2ba8169a472b94dca1fd9b046dcd3bd9'
api_secret = 'OF0RYuOHDu0bx2N27I9cGV0aTjdkSPtxDBqL0h73'
surbtc = SURBTC(api_key,api_secret,test)
surbtc.balance('BTC')