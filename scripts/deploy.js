async function main() {
  // We get the contract to deploy
  const Greeter = await ethers.getContractFactory("GMITeamNFTs");
  const greeter = await Greeter.deploy();

  await greeter.deployed();

  console.log("Contract deployed to:", greeter.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
