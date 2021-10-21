// Auto-generated. Do not edit!

// (in-package work_smaart.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class BatCalcRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dist = null;
      this.numeroMovements = null;
    }
    else {
      if (initObj.hasOwnProperty('dist')) {
        this.dist = initObj.dist
      }
      else {
        this.dist = 0;
      }
      if (initObj.hasOwnProperty('numeroMovements')) {
        this.numeroMovements = initObj.numeroMovements
      }
      else {
        this.numeroMovements = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BatCalcRequest
    // Serialize message field [dist]
    bufferOffset = _serializer.int64(obj.dist, buffer, bufferOffset);
    // Serialize message field [numeroMovements]
    bufferOffset = _serializer.int64(obj.numeroMovements, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatCalcRequest
    let len;
    let data = new BatCalcRequest(null);
    // Deserialize message field [dist]
    data.dist = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [numeroMovements]
    data.numeroMovements = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'work_smaart/BatCalcRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c157b98caee8dfc6a742f5eed59fbc1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 dist
    int64 numeroMovements
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BatCalcRequest(null);
    if (msg.dist !== undefined) {
      resolved.dist = msg.dist;
    }
    else {
      resolved.dist = 0
    }

    if (msg.numeroMovements !== undefined) {
      resolved.numeroMovements = msg.numeroMovements;
    }
    else {
      resolved.numeroMovements = 0
    }

    return resolved;
    }
};

class BatCalcResponse {
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
    // Serializes a message object of type BatCalcResponse
    // Serialize message field [isWeak]
    bufferOffset = _serializer.bool(obj.isWeak, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatCalcResponse
    let len;
    let data = new BatCalcResponse(null);
    // Deserialize message field [isWeak]
    data.isWeak = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'work_smaart/BatCalcResponse';
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
    const resolved = new BatCalcResponse(null);
    if (msg.isWeak !== undefined) {
      resolved.isWeak = msg.isWeak;
    }
    else {
      resolved.isWeak = false
    }

    return resolved;
    }
};

module.exports = {
  Request: BatCalcRequest,
  Response: BatCalcResponse,
  md5sum() { return '2827f36d9d76178675d17a203abff3a2'; },
  datatype() { return 'work_smaart/BatCalc'; }
};
