pragma solidity ^0.4.6;

import './Structures.sol';

contract EthereumCV {
    address owner;
    mapping (string => string) basic_data;

    Structures.Project[] public projects;
    Structures.Education[] public educations;
    Structures.Skill[] public skills;
    Structures.Publication[] public publications;


    // === MODIFIERS ===
    modifier onlyOwner() {
        if (msg.sender != owner) { throw; }
        _; // Will be replaced with function body
    }

    // ==== CONSTRUCTOR ====
    function EthereumCV() {
        owner = msg.sender;
    }

    //returns Length of input array
    function getSize(string arg) constant returns (uint) {
        if (sha3(arg) == sha3("projects")) { return projects.length; }
        if (sha3(arg) == sha3("educations")) { return educations.length; }
        if (sha3(arg) == sha3("publications")) { return quotes.length; }
        if (sha3(arg) == sha3("skills")) { return skills.length; }
        throw;
    }

    //edit projects array
    function editProject (bool operation, string name, string link, string description) onlyOwner() {
        if (operation) {
            projects.push(Structures.Project(name, link, description));
        } else {
            delete projects[projects.length - 1];
        }
    }

    //edit educations array
    function editEducation (bool operation,
      string name,
      string speciality,
      string year_start,
      string year_finish) onlyOwner() {
        if (operation) {
            educations.push(Structures.Education(name, speciality, year_start, year_finish));
        } else {
            delete educations[educations.length - 1];
        }
    }

    //edit skills array
    function editSkill (bool operation, string name, string level) onlyOwner() {
        if (operation) {
            skills.push(Structures.Skill(name, level));
        } else {
            delete skills[skills.length - 1];
        }
    }

    //edit publications array
    function editPublication (bool operation, string name, string link, string language) onlyOwner() {
        if (operation) {
            publications.push(Structures.Publication(name, link, language));
        } else {
            delete publications[publications.length - 1];
        }
    }


    // == SETTERS ===
    function setBasicData (string key, string value) onlyOwner{
        basic_data[key] = value;
    }

    // === GETTERS ===
    function getBasicData (string arg) constant returns (string) {
      return basic_data[arg];
    }
}
