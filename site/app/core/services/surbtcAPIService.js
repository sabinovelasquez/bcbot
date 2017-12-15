export default ngModule => {
  ngModule.service('surbtcAPIService', ($http) => {
    const service = {
      getBTC: () => {
        return $http({
          method: 'get',
          url: `http://sabino.cl/botcoin/bitcoin.json`,
        });
      },
    };
    return service;
  });
};
