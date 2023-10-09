// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface IERC20 {
    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Functions
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    }

contract erc20Token is IERC20 { 

    uint public totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function name() external pure returns (string memory) {
        return "Degen";
    }
    function symbol() external pure returns (string memory) {
        return "DGN";
    }
        
    function balanceOf(address account) external view returns (uint256) {
         return balances[account];
    }
        
    function transfer(address recipient , uint256 value) external returns (bool) {
        require(balances[msg.sender] >= value, "You don't have enough DGN");
        balances[msg.sender] -= value;
        balances[recipient]+= value;
        emit Transfer(msg.sender, recipient, value);
        return true;
    }


    function allowance(address _owner, address spender) external view returns (uint256) {
        return allowances[_owner][spender]; 
        
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowances[msg.sender][spender] = value; 
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 value) external returns (bool){
        require(allowances[sender][msg.sender] >= value, "the user has not permitted you to spend these amount of DGN");
        require(balances[sender] >= value, "the address does not have enough DGN");
        balances[sender] -= value;
        balances[recipient] += value;
        allowances[sender][msg.sender] -= value;
        emit Transfer(sender, recipient, value);
        return true;
    }



    function mint(address beneficiary, uint amount) public {
        require(msg.sender == owner, "you are not the owner");
        balances[beneficiary] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) public {
        require(balances[msg.sender] >= amount, "your balance is insufficient");
        balances[msg.sender] -=amount;
        totalSupply -=amount;
    
    }  
}

contract Degen is erc20Token {

    storeItem[] storeItems;

    mapping(address => mapping(uint => uint)) ownership;

    struct  storeItem {
        string name;
        uint price;
    }

    function buyStoreItem(uint _id) public {
        require(balances[msg.sender] >= storeItems[_id].price, " you don't have enough DGN");
        ownership[msg.sender][_id] += 1;
        balances[msg.sender] -= storeItems[_id].price;
        balances[owner] += storeItems[_id].price;
        emit Transfer(msg.sender, owner, storeItems[_id].price);
    }

    function windowShopping() public view returns (storeItem[] memory) {
        return storeItems;
    }

    function checkOwnership(address owner, uint itemId) public view returns (uint) {
        return ownership[owner][itemId];
    }

    constructor() {
        storeItems.push(storeItem("Steph Curry's Jersey", 100));
        storeItems.push(storeItem("Lebron James' Jersey", 200));
    }
}
