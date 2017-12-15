#!/bin/bash

price=`curl 'https://www.surbtc.com/api/v2/markets/btc-clp/ticker.json' | jq '.["ticker"]["last_price"][0]'`;
price_eth=`curl 'https://www.surbtc.com/api/v2/markets/eth-clp/ticker.json' | jq '.["ticker"]["last_price"][0]'`;
price_buy=10500000;
price_consider=11500000;
price_low=7000000;
price_high=35000000;
price_eth_sell=700000;
price_temp=${price%.*};
price_temp=${price#'"'};
price_temp=${price_temp%'"'};
price_int=${price_temp%.*}

price_eth_temp=${price_eth%.*};
price_eth_temp=${price_eth#'"'};
price_eth_temp=${price_eth_temp%'"'};
price_eth_int=${price_eth_temp%.*}

if [ "$price_eth_int" -ge "$price_eth_sell" ]
then
  file="sell_eth.check"
  if [ -f "$file" ]
  then
    echo "$file found."
  else

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56968406912' \
    --data-urlencode message='Vende ETH! Está actualmente en: '$price_eth_int \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    cat > sell_eth.check
  fi
fi

if [ "$price_int" -le "$price_buy" ]
then
  file="buy.check"
  if [ -f "$file" ]
  then
    echo "$file found."
  else

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56984134906' \
    --data-urlencode message='COMPRA Bitcoins CTM! La moneda está actualmente en: '$price_int \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56988193592' \
    --data-urlencode message='COMPRA Bitcoins CTM! La moneda está actualmente en: '$price_int \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    cat > buy.check
  fi
fi

if [ "$price_int" -le "$price_consider" ]
then
  file="consider.check"
  if [ -f "$file" ]
  then
    echo "$file found."
  else

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56984134906' \
    --data-urlencode message='Considera comprar, el precio está en: '$price_int \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56988193592' \
    --data-urlencode message='Considera comprar, el precio está en: '$price_int \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    cat > consider.check
  fi
fi

if [ "$price_int" -ge "$price_high" ]
then
  file="out.check"
  if [ -f "$file" ]
  then
    echo "$file found."
  else

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56984134906' \
    --data-urlencode message='Salte AHORA! Ganaste. La moneda está actualmente en: '$price_int'. No perdai plata wn.' \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56988193592' \
    --data-urlencode message='Salte AHORA! Ganaste. La moneda está actualmente en: '$price_int'. No perdai plata wn.' \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    cat > out.check
  fi
fi

if [ "$price_int" -le "$price_low" ]
then
  file="sell.check"
  if [ -f "$file" ]
  then
    echo "$file found."
  else

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56984134906' \
    --data-urlencode message='Salte AHORA! La moneda está actualmente en: '$price_int'. Puede seguir bajando!' \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    curl -X POST https://textbelt.com/text \
    --data-urlencode phone='+56988193592' \
    --data-urlencode message='Salte AHORA! La moneda está actualmente en: '$price_int'. Puede seguir bajando!' \
    -d key=62e3e2959d4f4905ab5035df2f6e17672c84386cNqcZCYuIWnL7GlGRd2RYMACl3

    cat > sell.check
  fi
fi

now=$(date +"%T")
cat <<EOF >/var/www/sabino.cl/public_html/botcoin/bitcoin.json
{
  "botcoin": {
    "btc_clp": $price_int,
    "eth_clp": $price_eth_int,
    "time": "$now"
  }
}
EOF

echo "end of bot"