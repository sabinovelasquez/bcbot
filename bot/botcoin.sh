#!/bin/bash

price=`curl 'https://www.surbtc.com/api/v2/markets/btc-clp/ticker.json' | jq '.["ticker"]["last_price"][0]'`;
price_buy=10000000;
price_low=7000000;
price_high=35000000;
price_temp=${price%.*};
price_temp=${price#'"'};
price_temp=${price_temp%'"'};
price_int=${price_temp%.*}

if [ "$price_int" -le "$price_buy" ]
then
  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56968406912' \
  --data-urlencode message='COMPRA Bitcoins CTM! La moneda está actualmente en: '$price_int \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56984134906' \
  --data-urlencode message='COMPRA Bitcoins CTM! La moneda está actualmente en: '$price_int \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56988193592' \
  --data-urlencode message='COMPRA Bitcoins CTM! La moneda está actualmente en: '$price_int \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3
fi

if [ "$price_int" -ge "$price_high" ]
then
  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56968406912' \
  --data-urlencode message='Salte AHORA! Ganaste. La moneda está actualmente en: '$price_int'. No perdai plata wn.' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56984134906' \
  --data-urlencode message='Salte AHORA! Ganaste. La moneda está actualmente en: '$price_int'. No perdai plata wn.' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56988193592' \
  --data-urlencode message='Salte AHORA! Ganaste. La moneda está actualmente en: '$price_int'. No perdai plata wn.' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3
fi

if [ "$price_int" -le "$price_low" ]
then
  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56968406912' \
  --data-urlencode message='Salte AHORA! La moneda está actualmente en: '$price_int'. Puede seguir bajando!' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56984134906' \
  --data-urlencode message='Salte AHORA! La moneda está actualmente en: '$price_int'. Puede seguir bajando!' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

  curl -X POST https://textbelt.com/text \
  --data-urlencode phone='+56988193592' \
  --data-urlencode message='Salte AHORA! La moneda está actualmente en: '$price_int'. Puede seguir bajando!' \
  -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3
fi

now=$(date +"%T")
cat <<EOF >bitcoin.json
{
  "botcoin": {
    "CLP": $price_int,
    "time": "$now"
  }
}
EOF