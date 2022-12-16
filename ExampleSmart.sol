pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";

// ERC-20 token contract
contract SampleToken is SafeERC20 {
    using SafeMath for uint256;

    // The name of the token
    string public name;

    // The symbol of the token
    string public symbol;

    // The number of decimals for the token
    uint8 public decimals;

    // The total supply of the token
    uint256 public totalSupply;

    // Mapping from addresses to their token balances
    mapping(address => uint256) public balanceOf;

    // Mapping from addresses to the allowances they have granted
    mapping(address => mapping(address => uint256)) public allowance;

    // Event for when tokens are transferred
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    // Event for when allowances are changed
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // Constructor function that is called when the contract is deployed
    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    // Function to transfer tokens from one address to another
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value && _value > 0, "Insufficient balance");
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Function to allow another address to transfer tokens from the caller's account
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Function to transfer tokens from one address to another using an allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value && allowance[_from][msg.sender] >= _value && _value > 0, "Insufficient balance or allowance");
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    // Function to get the balance of an address
    function getBalance(address _owner) public view returns (uint256 balance) {
        return balanceOf[_owner];
    }
}
		