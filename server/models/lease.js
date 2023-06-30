export class Lease {
    constructor(
        id,
        userId,
        nationalId,
        dateOfBirth,
        occupation,
        periodEmployedInMonths,
        employerName,
        salary,
        businessAddress,
        phoneNumber,
        currentHomeAddress,
        homePhoneNumber,
        familySize,
        nextOfKin,
        nextOfKinPhoneNumber,
        nextOfKinAddress,
        signature
    ){
        this.id = id;
        this.userId = userId;
        this.nationalId = nationalId;
        this.dateOfBirth = dateOfBirth;
        this.occupation = occupation;
        this.periodEmployedInMonths = periodEmployedInMonths;
        this.employerName = employerName;
        this.salary = salary;
        this.businessAddress = businessAddress;
        this.phoneNumber = phoneNumber;
        this.currentHomeAddress = currentHomeAddress;
        this.homePhoneNumber = homePhoneNumber;
        this.familySize = familySize;
        this.nextOfKin = nextOfKin;
        this.nextOfKinPhoneNumber = nextOfKinPhoneNumber;
        this.nextOfKinAddress = nextOfKinAddress;
        this.signature = signature;
    }
}