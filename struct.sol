// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract StructType
{
    struct Car 
    {
        string modle;
        uint year;
        address owner;
    }

    Car[] public cars;

    function carmodle() external 
    {
        // 3 ways to initialize a struct
        Car memory Thar = Car("Thar",2016,msg.sender);
        // this is the first way to intialize struct
        Car memory BMW = Car(
            {
                model:"BMW",
                year:1995,
                owner:msg.sender
            }
        );
        // this is second way to intialize struct
        Car memory Honda;
        Honda.model = "Honda";
        Honda.year = 1949;
        Honda.owner = msg.sender;
        // This is third way to initialize struct
        // push to array
        cars.push(Thar);
        cars.push(BMW);
        cars.push(Honda);
        // we are adding the cars to car[]

        cars.push(Car("Maruthi Suzuki",2000,msg.sender));
        //using single line also we can push the car into the array.

        //Get refrence to Car struct stored in the  arrayb cars at index 0
        Car storage car = cars[0];
        //update
        car.year = 2000;

    }
    function registration(string memory _model,uint _year) external 
    {
        cars.push(Car(
            {
                model: _model,
                year:_year,
                owner:msg.sender
            }));
    }
    function get(uint _index) external view returns ( string memory model,uint year,address owmer)
    {
        Car storage car = cars[_index];
        return (car.model,car.year,car.owner);
    }
    function transfer(uint _index,address _owner) external 
    {
        cars[_index].owmer = _owner;
    }
}