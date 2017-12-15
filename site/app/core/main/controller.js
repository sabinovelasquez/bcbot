export default ngModule => {
  ngModule.controller('MainCtrl', function MainCtrl(surbtcAPIService, $timeout) {
    this.surbtcAPIService = surbtcAPIService;
    this.loading = true;
    this.update = () => {
      this.surbtcAPIService.getBTC().then(response => {
        const surbtc = response.data.botcoin;
        this.bitcoin = surbtc.btc_clp;
        this.ether = surbtc.eth_clp;
        this.last_check = surbtc.time;
        this.loading = false;
      });
    };
    $timeout(this.update(), 60000);
  });
};
