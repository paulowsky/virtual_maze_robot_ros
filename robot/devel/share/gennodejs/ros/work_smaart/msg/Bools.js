// Auto-generated. Do not edit!

// (in-package work_smaart.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Bools {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.isWeak = null;
    }
    else {
      if (initObj.hasOwnProperty('isWeak')) {
        this.isWeak = initObj.isWeak
      }
      else {
        this.isWeak = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bools
    // Serialize message field [isWeak]
    bufferOffset = _serializer.bool(obj.isWeak, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bools
    let len;
    let data = new Bools(null);
    // Deserialize message field [isWeak]
    data.isWeak = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'work_smaart/Bools';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '902658ae4fcb9d45c767db4811cab8bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool isWeak
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Bools(null);
    if (msg.isWeak !== undefined) {
      resolved.isWeak = msg.isWeak;
    }
    else {
      resolved.isWeak = false
    }

    return resolved;
    }
};

module.exports = Bools;
