pragma solidity ^0.5.0;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/Adoption.sol';

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expected_pet_id = 8;

  //The expected owner of adopted pet is this contract
  address expected_adopter = address(this);

  function testUserCanAdoptPet() public {
    uint returned_id = adoption.adopt(expected_pet_id);

    Assert.equal(returned_id, expected_pet_id, '`#adopt(pet_id)` should return the same pet id that was passed');
  }

  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expected_pet_id);

    Assert.equal(adopter, expected_adopter, 'After `#adopt(pet_id)`, the owner should be set to the current address');
  }

  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expected_pet_id], expected_adopter, 'After `#adopt(pet_id)`, `#getAdopters()` should include the new owner');
  }
}
