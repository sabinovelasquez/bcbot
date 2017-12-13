export default ngModule => {
  ngModule.controller('MainCtrl', function MainCtrl(surbtcAPIService) {
    surbtcAPIService.getBTC().then(response => {
      this.surbtc = response.data.ticker;
    });
  });
};
