pragma solidity ^0.5.0;

contract Adoption {
  // TODO: factory to allow size of `adopters` to be variable
  address[16] public adopters;

  function adopt(uint pet_id) public returns (uint) {
    // TODO: these are magic numbers; write a generic `require valid array index`
    // TODO: provide an error message for require
    require(pet_id >= 0 && pet_id <= 15);

    adopters[pet_id] = msg.sender;

    return pet_id;
  }

  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }
}
