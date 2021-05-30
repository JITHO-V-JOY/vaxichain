pragma solidity ^0.6.2;
contract VaxiChain{
    
    mapping(uint => Manufacture) public manufacture;
    mapping(uint => Doctor) public doctor;
    mapping(uint => Vaccine) public vaccine;
    mapping(uint => Distributor) public distributor;
    mapping(uint => VaccineCenter) public vaccineCenter;
    mapping(uint => Beneficiary) public beneficiary;
    
    uint256 public manufactureCount = 0;
    uint256 public distributorCount = 0;
    uint256 public vaccineCenterCount = 0;
    uint256 public beneficiaryCount = 0;
    
    struct Manufacture{
        string licenceNO;
        string name;
        string location;
       
    }
    struct Vaccine{
        string name;
        
        uint manufacturID;
        uint distribututorID;
        uint vaccineceterID;
        
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
        string gender;
        string adharID;
        uint doctorID;
        string vaccinated_date;
        string vaccine_center;
        bool vaccinated;
        
    }
   
    
    function AddManufacture(string memory licenceNo, string memory name, string memory location) public{
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
        
    function AddBeneficiary(string memory name, string memory age, string memory gender, string memory  AdharID, string memory doctorID, string memory vaccinated_date,  string memory vaccine_center, string memory vaccinated ) public{
        beneficiaryCount++;
        beneficiary[beneficiary] = Beneficiary(name,age, gender,   AdharID, doctorID, vaccinated_date,vaccine_center,vaccinated);
   }   
        
}
