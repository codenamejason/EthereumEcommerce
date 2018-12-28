var Migrations = artifacts.require('./Migrations.sol')
var EcommerceStore = artifacts.require('./EcommerceStore.sol')

module.exports = function (deployer) {
  deployer.deploy(Migrations)
  deployer.deploy(EcommerceStore)
}
