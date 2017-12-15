export default ngModule => {
  ngModule.controller('MainCtrl', function MainCtrl(surbtcAPIService, $timeout) {
    this.surbtcAPIService = surbtcAPIService;
    this.update = () => {
      $timeout(this.update, 9000);
      this.coin = {};
      this.surbtcAPIService.getBTC().then(response => {
        const surbtc = response.data.botcoin;
        this.coin.bitcoin = surbtc.btc_clp;
        this.coin.ether = surbtc.eth_clp;
        this.coin.last_check = surbtc.time;
      });
    };
    this.update();
  });
};
