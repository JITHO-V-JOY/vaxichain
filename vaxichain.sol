// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

contract VaxiChain{
    
    mapping(uint => Manufacture) public manufacture;
    mapping(uint => Vaccine) public vaccine;
    mapping(uint => Distributor) public distributor;
    mapping(uint => VaccineCenter) public vaccineCenter;
    mapping(uint => Doctor) public doctor;
    mapping(uint => Beneficiary) public beneficiary;
    
    uint256 public manufactureCount = 0;
    uint256 public distributorCount = 0;
    uint256 public vaccineCenterCount = 0;
    uint256 public beneficiaryCount = 0;
    
    struct Manufacture{
        string licenceNO;
        string name;
        string location;
        string validity;
       
    }
    struct Vaccine{
        uint lotnumber;
        string name;
        string expdate;
        uint price;
        string templimit;
        address owner;
        bool purchased;
        
        
   }
    struct Distributor{
        string licenceNO;
        string name;
        string location;
        
   }
    struct VaccineCenter{
        string licenceNO;
        string name;       
        string phone;
        string location;

   }
    struct Doctor{
        string licenceNO;
        string name;     
        string phone;
   }    
    struct Beneficiary{
        string name;
        string age;
        string adharID;
        string doctorID;
        string vaccinated_date;
        string vaccine_center;
        bool vaccinated;
        
    }
   
    
    function AddManufacture(string memory licenceNo, string memory name, string memory location, string memory validity) public{
        manufactureCount++;
       manufacture[manufactureCount] = Manufacture(licenceNo, name, location);
   }
  
   function AddDistributer(string memory licenceNo, string memory name, string memory location) public{
        distributorCount++;
        distributor[distributorCount] = Distributor(licenceNo, name, location);
    }
  
    function AddVaccineCenter(string memory licenceNo, string memory name,  string memory phone,  string memory location) public{
        vaccineCenterCount++;
        vaccineCenter[vaccineCenterCount] = VaccineCenter(licenceNo, name, phone, location);
   }
        
    function AddBeneficiary(string memory name, string memory age, string memory  AdharID, string memory doctorID, string memory vaccinated_date,  string memory vaccine_center, bool vaccinated ) public{
        beneficiaryCount++;
        beneficiary[beneficiaryCount] = Beneficiary(name,age, AdharID, doctorID, vaccinated_date,vaccine_center,vaccinated);
   }   
        
}
