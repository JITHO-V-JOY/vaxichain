pragma solidity ^0.6.2;
contract VaxiChain{
    
    mapping(uint => Manufacturer) public manufacture;
    mapping(uint => Doctor) public doctor;
    mapping(uint => Vaccine) public vaccine;
    mapping(uint => Distributor) public distributor;
    mapping(uint => VaccineCenter) public vaccineCenter;
    mapping(uint => Customer) public customer;
    
    uint256 public manufacturerCount = 0;
    uint256 public distributerCount = 0;
    uint256 public VaccineCenter = 0;
    struct Manufacturer{
        string licenceNO;
        string name;
        
        string location;
    }
    
    struct Vaccine{
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
        string name;
        string licenceNO;
        string address;
        string phone;
        string location;

    }
    
    struct Doctor{
        string name;
        string licenceNO;
        string phone;
    }
    
    struct Customer{
        string name;
        uint doctorID;
        string AdharID;
        bool vaccinated;
        string vaccinated_date;
        string vaccine_center;
    }
    
    function AddDistributer(string memory licenceNo, string memory name, string memory location) public{
        distributerCount++;
        distributer[distributerCount] = Distributer(licenceNo, name, location);
    }
    function AddManufacturer(string memory licenceNo, string memory name, string memory location) public{
        manufacturerCount++;
        manufacturer[manufacturerCount] = Manufacturer(licenceNo, name, location);
  }
    function AddVaccineCenter(string memory licenceNo, string memory name, string memory address, string memory phone  string memory location) public{
        VaccineCenterCount++;
        vaccineCenter[vaccineCenterCount] = VaccineCenter(licenceNo, name,address, phone, location);
        }
