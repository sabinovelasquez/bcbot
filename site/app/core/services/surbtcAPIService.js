export default ngModule => {
  ngModule.service('surbtcAPIService', ($http) => {
    const service = {
      getBTC: () => {
        return $http({
          method: 'get',
          url: `https://www.surbtc.com/api/v2/markets/btc-clp/ticker.json`,
        });
      },
    };
    return service;
  });
};
