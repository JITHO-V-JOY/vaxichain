pragma solidity ^0.6.2;
contract VaxiChain{
    mapping(uint => Manufacturer) public manufacture;
    mapping(uint => Distributor) public distributor;
    mapping(uint => VaccineCenter) public vaccineCenter;
    mapping(uint => Customer) public customer;
    uint256 public requestCount = 0;
    
    struct Manufacturer{
        string name;
        string address;
        string phone;
        string location;
    }
    struct Distributor{
        string name;
        string address;
        string phone;
        string location;

    }
    struct VaccineCenter{
        string name;
        string address;
        string phone;
        string location;

    }
    struct Customer{
        string name;
        string address;
        string phone;
        string location;
        bool vaccinated;
        string vaccinated_date;
        string vaccine_center;
    }
    
    event RequestCreated(
        address payable author,
        string requestHash,
        uint256 amount,
        bool fullfilled
    );

    event Verified(
        uint id,
        uint256 collectedAmount,
        uint valid
    );



    function makeRequest(string memory _rHash, uint256 _amount) public{
        requestCount++;
        request[requestCount] = Request(msg.sender, _rHash, _amount, false);
        verify[requestCount] = Verification(requestCount, 0, 0);
        emit RequestCreated(msg.sender, _rHash, _amount, false);
    }



    function sendMoney(uint _id, uint256 _money )public{
        verify[_id].collectedAmount += _money;
        verify[_id].valid += 1;
        uint256 amt = request[_id].amount - verify[_id].collectedAmount;
        if(amt == 0){
            request[_id].fullfilled = true;
        }
        else if(amt < 0){
            request[_id].amount = 0;
            request[_id].fullfilled = true;

        }
        emit Verified(_id, _money, 1);
        }
  }
