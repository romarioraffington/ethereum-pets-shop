pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // Address of contract to be teted
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // petId for testing
  uint expectedPetId = 10;

  // Expected owner
  address expectedAdopter = address(this);

  // Testing a user can adopt a pet
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);
    Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expectedPetId);
    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
  }
}