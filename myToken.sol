// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // Public variables to store the details about the token
    string public tokenName = "MyToken";
    string public tokenAbbrv = "MTK";
    uint public totalSupply = 0;

    // Mapping from address to uint to store the balances of each address
    mapping(address => uint) public balances;

    // Mint function to create new tokens
    function mint(address _to, uint _value) public {
        // Increase the total supply by the amount of tokens to be minted
        totalSupply += _value;
        // Increase the balance of the specified address by the minted amount
        balances[_to] += _value;
    }

    // Burn function to destroy tokens
    function burn(address _from, uint _value) public {
        // Ensure the account has enough balance to burn the specified amount of tokens
        require(balances[_from] >= _value, "Not enough balance to burn");

        // Decrease the total supply by the amount of tokens to be burned
        totalSupply -= _value;
        // Decrease the balance of the specified address by the burned amount
        balances[_from] -= _value;
    }
}
