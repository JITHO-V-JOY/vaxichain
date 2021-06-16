pragma solidity ^0.6.2;
contract VaxiChain{
    
    mapping(uint => Manufacture) public manufacture;
    mapping(uint => Doctor) public doctor;
    mapping(string => Vaccine) public vaccine;
    mapping(uint => Distributor) public distributor;
    mapping(uint => VaccineCenter) public vaccineCenter;
    mapping(uint => Beneficiary) public beneficiary;
    mapping(string => Rules ) public rules;
    mapping(string => Violation ) public violation;
    
    uint256 public manufactureCount = 0;
    uint256 public distributorCount = 0;
    uint256 public vaccineCenterCount = 0;
    uint256 public beneficiaryCount = 0;
    uint256 public doctorCount = 0;
    
    struct Manufacture{
        string licenceNO;
        string name;
        string location;
       
    }
    
    struct Rules{
        string vaccine_id;
        uint min_temp;
        uint max_temp;
        uint doses;
        string manuactureDate;
        
    }
    
    struct Violation{
        string vaccine_id;
        bool violated;
    }
    
    struct SideEffects{
        string vaccine_id;
        uint beneficiary_id;
        string sideEffect;
    }
    
    struct Vaccine{
        string vaccine_id;
        string name;
        uint vails;
        string expdate;
        uint manufactureId;
        string arrived_dateDistributor;
        uint distributorId;
        string arrived_dateVaccineCenter;
        uint vaccineCenterId;
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
        string email;
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
        
    function AddBeneficiary(string memory name, string memory email, string memory gender, string memory  AdharID, uint doctorID, string memory vaccinated_date,  string memory vaccine_center, bool vaccinated ) public{
        beneficiaryCount++;
        beneficiary[beneficiaryCount] = Beneficiary(name, email, gender, AdharID, doctorID, vaccinated_date,vaccine_center,vaccinated);
   }   
   
   function AddDoctor(string memory licenseNo, string memory name, string memory phone)public{
       doctorCount++;
       doctor[doctorCount] = Doctor(licenseNo, name, phone);
   }
   
   function ManuFacturedVaccine(string memory id, string memory name, uint manfacturer, uint dist, uint vaccine_center )public{
       vaccine[id] = Vaccine(id, name, manfacturer, dist, vaccine_center);
   }
   
   function tracking(string memory vaccine_id, uint temp)public{
       if(temp < rules[vaccine_id].max_temp && temp > rules[vaccine_id].min_temp){
           violation[vaccine_id].violated = true;
       }else{
           violation[vaccine_id].violated = false;
       }
   }
   
   
        
}
