pragma solidity ^0.5.0;

contract Adoption {   
    address[16] public adopters;

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
      require(petId >= 0 && petId <=16);

      adopters[petId] = msg.sender;
      return petId;
    }

    // Retrive all the adopters
    function getAdopters() public view returns (address[16] memory) {
      return adopters;
    }

}